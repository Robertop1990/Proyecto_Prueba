
using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Commands.ReunionCommand;
using Agenda.API.Application.Comun;
using Agenda.API.Application.Queries.ConsolidadoIntermediario;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using Swashbuckle.AspNetCore.Filters;
using System;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Agenda.API.Controllers
{
    [ApiController]
    public class ReunionController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IImpresionLog _impresionLog;
        private readonly IHeaderConfiguration _headerConfiguration;
        private readonly IConsolidadoIntermediarioQueries _consolidadoIntermediarioQueries;

        public ReunionController(IMediator mediator,
                                   IImpresionLog impresionLog,
                                   IHeaderConfiguration headerConfiguration,
                                   IConsolidadoIntermediarioQueries consolidadoIntermediarioQueries)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _impresionLog = impresionLog ?? throw new ArgumentNullException(nameof(impresionLog));
            _headerConfiguration = headerConfiguration ?? throw new ArgumentNullException(nameof(headerConfiguration));
            _consolidadoIntermediarioQueries = consolidadoIntermediarioQueries ?? throw new ArgumentNullException(nameof(consolidadoIntermediarioQueries));
        }

        [Route("api/reunions")]
        [HttpPost]
        [SwaggerOperation(Summary = "Guardar Reunion", Description = "Guardar Reunion")]
        [SwaggerRequestExample(typeof(CrearReunionCommand), typeof(RequestCrearReunionCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseCrearReunionCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Registrar([FromBody] CrearReunionCommand crearReunionCommand)
        {
            RequestModel<CrearReunionCommand> requestModel = new RequestModel<CrearReunionCommand>() { Entity = crearReunionCommand, auditRequest = _headerConfiguration.auditRequest };
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("ReunionController:52", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar");
            _impresionLog.DatosInicioMetodo("ReunionController:53", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            crearReunionCommand.IdConsolidadoIntermediario = await _consolidadoIntermediarioQueries.ObtenerIdConsolidadoIntermediario(_headerConfiguration.idIntermediario);
            var result = await _mediator.Send(crearReunionCommand);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ReunionController:60", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ReunionController:61", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return CreatedAtAction(nameof(Registrar), result);
        }

        [Route("api/reunions")]
        [HttpPut]
        [SwaggerOperation(Summary = "Actualizar Reunion", Description = "Actualizar Reunion")]
        [SwaggerRequestExample(typeof(ActualizarReunionCommand), typeof(RequestActualizarReunionCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseActualizarReunionCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Actualizar([FromBody] ActualizarReunionCommand actualizarReunionCommand)
        {
            RequestModel<ActualizarReunionCommand> requestModel = new RequestModel<ActualizarReunionCommand>() { Entity = actualizarReunionCommand, auditRequest = _headerConfiguration.auditRequest };
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("ReunionController:80", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar");
            _impresionLog.DatosInicioMetodo("ReunionController:81", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            var result = await _mediator.Send(actualizarReunionCommand);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("ReunionController:87", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("ReunionController:88", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return CreatedAtAction(nameof(Actualizar), result);
        }
    }
}