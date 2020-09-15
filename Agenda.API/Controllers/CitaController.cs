using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Commands.CitaCommand;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Agenda.API.Application.Queries.Cita;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Swashbuckle.AspNetCore.Annotations;
using Swashbuckle.AspNetCore.Filters;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Agenda.API.Controllers
{
    [ApiController]
    public class CitaController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly ILogger<CitaController> _logger;
        private readonly ICitaQueries _citaQueries;
        private readonly IImpresionLog _impresionLog;
        private readonly IHeaderConfiguration _headerConfiguration;

        public CitaController(IMediator mediator,
                                   ILogger<CitaController> logger,
                                   ICitaQueries citaQueries,
                                   IImpresionLog impresionLog,
                                   IHeaderConfiguration headerConfiguration)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _citaQueries = citaQueries ?? throw new ArgumentNullException(nameof(citaQueries));
            _impresionLog = impresionLog ?? throw new ArgumentNullException(nameof(impresionLog));
            _headerConfiguration = headerConfiguration ?? throw new ArgumentNullException(nameof(headerConfiguration));

        }

        [Route("api/citas")]
        [HttpPost]
        [SwaggerOperation(Summary = "Guardar Cita", Description = "Guardar Cita")]
        [SwaggerRequestExample(typeof(CrearCitaCommand), typeof(RequestCrearCitaCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseCrearCitaCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Registrar([FromBody] CrearCitaCommand crearCitaCommand)
        {
            crearCitaCommand.CodigoIntermediarioCreacion = _headerConfiguration.idIntermediario;
            RequestModel<CrearCitaCommand> requestModel = new RequestModel<CrearCitaCommand>() { Entity = crearCitaCommand, auditRequest = _headerConfiguration.auditRequest };
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("CitaController:59", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar");
            _impresionLog.DatosInicioMetodo("CitaController:60", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            try{result = await _mediator.Send(crearCitaCommand);}
            catch(Exception e){result.Entity = new EntidadDto { Mensaje = e.Message.ToString() };}

            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CitaController:68", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CitaController:69", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return CreatedAtAction(nameof(Registrar), result);
        }

        [Route("api/citas")]
        [HttpPut]
        [SwaggerOperation(Summary = "Actualizar Cita", Description = "Actualizar Cita")]
        [SwaggerRequestExample(typeof(ActualizarCitaCommand), typeof(RequestActualizarCitaCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseActualizarCitaCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Actualizar([FromBody] ActualizarCitaCommand actualizarCitaCommand)
        {
            RequestModel<ActualizarCitaCommand> requestModel = new RequestModel<ActualizarCitaCommand>() { Entity = actualizarCitaCommand, auditRequest = _headerConfiguration.auditRequest };
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("CitaController:89", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar");
            _impresionLog.DatosInicioMetodo("CitaController:90", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            try { result = await _mediator.Send(actualizarCitaCommand); }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CitaController:91", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CitaController:98", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }

        [Route("api/citas/calificar")]
        [HttpPut]
        [SwaggerOperation(Summary = "Calificar Cita", Description = "Calificar Cita")]
        [SwaggerRequestExample(typeof(CalificarCitaCommand), typeof(RequestCalificarCitaCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseCalificarCitaCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Calificar([FromBody] CalificarCitaCommand calificarCitaCommand)
        {
            RequestModel<CalificarCitaCommand> requestModel = new RequestModel<CalificarCitaCommand>() { Entity = calificarCitaCommand, auditRequest = _headerConfiguration.auditRequest };
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("CitaController:118", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Calificar");
            _impresionLog.DatosInicioMetodo("CitaController:119", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            try { result = await _mediator.Send(calificarCitaCommand); }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CitaController:126", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CitaController:127", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Calificar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }


        [HttpGet]
        [Route("api/citas/{idprospecto}")]
        [SwaggerOperation(Summary = "Obtener Numero Cita", Description = "Obtiene Numero Cita")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<AgendaCita>))]
        [SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerNumeroCitaQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<AgendaCita>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<AgendaCita>>> ObtenerNumeroCita(string idprospecto)
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("CitaController:146", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerNumeroCita");
            _logger.LogInformation("{cadena}", "CitaController:147 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented) + " idprospecto:" + idprospecto);

            var result = await _citaQueries.ObtenerNumeroCita(idprospecto,_headerConfiguration.idIntermediario);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CitaController:154", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CitaController:155", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerNumeroCita", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }

        [HttpGet]
        [Route("api/citas/{fechacita}/{horainicio}/{horafin}")]
        [SwaggerOperation(Summary = "Validad Fecha Horario Agendamiento", Description = "Validad Fecha Horario Agendamiento")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<AgendaCita>))]
        [SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerNumeroCitaQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<AgendaCita>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<AgendaCita>>> ValidarFechaHorarioCita(string fechacita, string horainicio, string horafin)
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("CitaController:173", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ValidarFechaHorarioCita");
            _logger.LogInformation("{cadena}", "CitaController:174 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented)+" fechacita:" + fechacita +"horainicio" + horainicio +" horafin" + horafin);

            var result = await _citaQueries.ValidarFechaHorarioAgendamiento(_headerConfiguration.idIntermediario,fechacita,horainicio,horafin);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CitaController:181", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CitaController:182", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ValidarFechaHorarioCita", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }
    }
}