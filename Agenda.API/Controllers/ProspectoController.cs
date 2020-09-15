using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Comun;
using Agenda.API.Application.Queries.ConsolidadoIntermediario;
using Agenda.API.Application.Queries.Prospecto;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;
using Swashbuckle.AspNetCore.Filters;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using Agenda.API.Application.Dtos.Request;
using Agenda.API.Application.Queries.Generales;

namespace Agenda.API.Controllers
{
    [ApiController]
    public class ProspectoController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<ProspectoController> _logger;
        private readonly IConsolidadoIntermediarioQueries  _consolidadoIntermediarioQueries;
        private readonly IProspectoQueries _prospectoQueries;
        private readonly IGeneralesQueries _generalesQueries;
        private readonly IImpresionLog _impresionLog;
        private readonly IHeaderConfiguration _headerConfiguration;

        public ProspectoController(IMediator mediator,
                                   IConsolidadoIntermediarioQueries consolidadoIntermediarioQueries,
                                   IProspectoQueries prospectoQueries,
                                   IGeneralesQueries generalesQueries,
                                   ILogger<ProspectoController> logger,
                                   IImpresionLog impresionLog, 
                                   IHeaderConfiguration headerConfiguration)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _consolidadoIntermediarioQueries = consolidadoIntermediarioQueries ?? throw new ArgumentNullException(nameof(consolidadoIntermediarioQueries));
            _prospectoQueries = prospectoQueries ?? throw new ArgumentNullException(nameof(prospectoQueries));
            _generalesQueries = generalesQueries ?? throw new ArgumentNullException(nameof(generalesQueries));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _impresionLog = impresionLog ?? throw new ArgumentNullException(nameof(impresionLog));
            _headerConfiguration = headerConfiguration ?? throw new ArgumentNullException(nameof(headerConfiguration));

        }

        [Route("api/prospectos")]
        [HttpPost]
        [SwaggerOperation(Summary = "Guardar Prospecto", Description = "Guardar Prospecto")]
        [SwaggerRequestExample(typeof(CrearProspectoCommand), typeof(RequestCrearProspectoCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseCrearProspectoCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<Prospecto>>> Registrar([FromBody] CrearProspectoCommand crearProspectoCommand)
        {
            crearProspectoCommand.CodigoIntermediario = _headerConfiguration.idIntermediario;
            RequestModel<CrearProspectoCommand> requestModel = new RequestModel<CrearProspectoCommand>() { Entity = crearProspectoCommand, auditRequest = _headerConfiguration.auditRequest};
            Stopwatch timeMeasure = new Stopwatch();
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            ResponseModel<Prospecto> prospecto = new ResponseModel<Prospecto>();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("ProspectoController:70", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar");
            _impresionLog.DatosInicioMetodo("ProspectoController:71", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            crearProspectoCommand.IdConsolidadoIntermediario = await _consolidadoIntermediarioQueries.ObtenerIdConsolidadoIntermediario(_headerConfiguration.idIntermediario);
            crearProspectoCommand.CodigoRangoEdad = crearProspectoCommand.FechaNacimiento.HasValue ?
                                                     await _generalesQueries.ObtenerCodigoRangoEdad(crearProspectoCommand.FechaNacimiento.Value, _headerConfiguration.idIntermediario): default(short?);
            crearProspectoCommand.CodigoRangoFondo = crearProspectoCommand.ProspectoAdnRentaCommand.MonedaPatrimonioAfp.HasValue ?
                                                      await _generalesQueries.ObtenerCodigoRangoFondo(crearProspectoCommand.ProspectoAdnRentaCommand.MonedaPatrimonioAfp.Value, _headerConfiguration.idIntermediario) : default(short?);

            try 
            { 
                result = await _mediator.Send(crearProspectoCommand);
                prospecto = await _prospectoQueries.ObtenerProspectoVistaPrevia(result.Entity.Id);
            }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }

            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;
            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ProspectoController:88", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ProspectoController:69", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return prospecto.Entity == null ? CreatedAtAction(nameof(Registrar), result) : CreatedAtAction(nameof(Registrar), prospecto);
        }

        [Route("api/prospectos")]
        [HttpPut]
        [SwaggerOperation(Summary = "Actualizar Prospecto", Description = "Actualizar Prospecto")]
        [SwaggerRequestExample(typeof(ActualizarProspectoCommand), typeof(RequestActualizarProspectoCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseActualizarProspectoCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<Prospecto>>> Actualizar([FromBody] ActualizarProspectoCommand actualizarProspectoCommand)
        {
            RequestModel<ActualizarProspectoCommand> requestModel = new RequestModel<ActualizarProspectoCommand>() { Entity = actualizarProspectoCommand, auditRequest = _headerConfiguration.auditRequest };
            Stopwatch timeMeasure = new Stopwatch();
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            ResponseModel<Prospecto> prospecto = new ResponseModel<Prospecto>();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("ProspectoController:110", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar");
            _impresionLog.DatosInicioMetodo("ProspectoController:11", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            actualizarProspectoCommand.CodigoRangoEdad = actualizarProspectoCommand.FechaNacimiento.HasValue ?
                                                     await _generalesQueries.ObtenerCodigoRangoEdad(actualizarProspectoCommand.FechaNacimiento.Value, _headerConfiguration.idIntermediario) : default(short?);
            actualizarProspectoCommand.CodigoRangoFondo = actualizarProspectoCommand.ProspectoAdnRentaCommand.MonedaPatrimonioAfp.HasValue ?
                                                      await _generalesQueries.ObtenerCodigoRangoFondo(actualizarProspectoCommand.ProspectoAdnRentaCommand.MonedaPatrimonioAfp.Value, _headerConfiguration.idIntermediario) : default(short?);

            try
            {
                result = await _mediator.Send(actualizarProspectoCommand);
                prospecto = await _prospectoQueries.ObtenerProspectoVistaPrevia(result.Entity.Id);
            }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }

            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ProspectoController:128", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ProspectoController:129", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return prospecto.Entity == null ? CreatedAtAction(nameof(Registrar), result) : CreatedAtAction(nameof(Registrar), prospecto);
        }

        [Route("api/prospectos/descartar")]
        [HttpPut]
        [SwaggerOperation(Summary = "Descartar Prospecto", Description = "Descartar Prospecto")]
        [SwaggerRequestExample(typeof(ActualizarProspectoCommand), typeof(RequestDescartarProspectoCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseDescartarProspectoCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Descartar([FromBody] DescartarProspectoCommand descartarProspectoCommand)
        {
            RequestModel<DescartarProspectoCommand> requestModel = new RequestModel<DescartarProspectoCommand>() { Entity = descartarProspectoCommand, auditRequest = _headerConfiguration.auditRequest };
            Stopwatch timeMeasure = new Stopwatch();
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("ProspectoController:149", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Descartar");
            _impresionLog.DatosInicioMetodo("ProspectoController:150", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            try { result = await _mediator.Send(descartarProspectoCommand); }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ProspectoController:157", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ProspectoController:158", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Descartar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }

        [HttpGet]
        [Route("api/prospectos/")]
        [SwaggerOperation(Summary = "Obtener prospecto por filtro", Description = "Obtener prospecto por filtro")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<List<Prospecto>>))]
        [SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerProspectosQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<List<Prospecto>>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<List<Prospecto>>>> ObtenerProspectoPorFiltro([FromQuery]ProspectoQueryFilter prospectoQueryFilter)
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();
            prospectoQueryFilter.codigointermediario = _headerConfiguration.idIntermediario;

            _impresionLog.InicioMetodo("ProspectoController:177", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerProspectoPorNombresONumeroDocumento");
            _logger.LogInformation("{cadena}", "ProspectoController:178 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented) + " prospectoQueryFilter:" + prospectoQueryFilter);

            var result = await _prospectoQueries.ObtenerProspectoPorFiltro(prospectoQueryFilter);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ProspectoController:185", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ProspectoController:186", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerProspectoPorNombresONumeroDocumento", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }

        [HttpGet]
        [Route("api/prospectos/{idprospecto}")]
        [SwaggerOperation(Summary = "Obtener Prospecto Detalle por IdProspecto", Description = "Obtener Prospecto Detalle por IdProspecto")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<List<Prospecto>>))]
        [SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerProspectoDetalleQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<ActualizarProspectoCommand>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<ActualizarProspectoCommand>>> ObtenerProspectoDetallePorIdProspecto(string idprospecto)
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("ProspectoController:204", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerProspectoDetallePorIdProspecto");
            _logger.LogInformation("{cadena}", "ProspectoController:205 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented) + " idprospecto:" + idprospecto);

            var result = await _prospectoQueries.ObtenerProspectoDetallePorIdProspecto(idprospecto);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ProspectoController:212", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ProspectoController:213", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerProspectoDetallePorIdProspecto", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }
    }
}