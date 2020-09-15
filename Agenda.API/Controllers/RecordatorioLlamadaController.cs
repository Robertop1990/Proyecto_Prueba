
using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Commands.RecordatorioLlamadaCommand;
using Agenda.API.Application.Comun;
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
    public class RecordatorioLlamadaController : ControllerBase
    {
        private readonly IMediator _mediator;
        private readonly IImpresionLog _impresionLog;
        private readonly IHeaderConfiguration _headerConfiguration;

        public RecordatorioLlamadaController(IMediator mediator,
                                   IImpresionLog impresionLog,
                                   IHeaderConfiguration headerConfiguration)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            _impresionLog = impresionLog ?? throw new ArgumentNullException(nameof(impresionLog));
            _headerConfiguration = headerConfiguration ?? throw new ArgumentNullException(nameof(headerConfiguration));
        }

        [Route("api/recordatoriollamadas")]
        [HttpPost]
        [SwaggerOperation(Summary = "Guardar Recordatorio Llamada", Description = "Guardar Recordatorio Llamada")]
        [SwaggerRequestExample(typeof(CrearRecordatorioLlamadaCommand), typeof(RequestCrearRecordatorioLlamadaCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseCrearRecordatorioLlamadaCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Registrar([FromBody] CrearRecordatorioLlamadaCommand crearRecordatorioLlamadaCommand)
        {
            RequestModel<CrearRecordatorioLlamadaCommand> requestModel = new RequestModel<CrearRecordatorioLlamadaCommand>() { Entity = crearRecordatorioLlamadaCommand, auditRequest = _headerConfiguration.auditRequest };
            Stopwatch timeMeasure = new Stopwatch();
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("RecordatorioLlamadaController:49", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar");
            _impresionLog.DatosInicioMetodo("RecordatorioLlamadaController:50", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            try { result = await _mediator.Send(crearRecordatorioLlamadaCommand); }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("RecordatorioLlamadaController:57", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("RecordatorioLlamadaController:58", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Registrar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return CreatedAtAction(nameof(Registrar), result);
        }

        [Route("api/recordatoriollamadas")]
        [HttpPut]
        [SwaggerOperation(Summary = "Actualizar Recordatorio Llamada", Description = "Actualizar Recordatorio Llamada")]
        [SwaggerRequestExample(typeof(CrearRecordatorioLlamadaCommand), typeof(RequestActualizarRecordatorioLlamadaCommandExample))]
        [SwaggerResponse(StatusCodes.Status201Created, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status201Created, typeof(ResponseActualizarRecordatorioLlamadaCommandExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<EntidadDto>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]
        public async Task<ActionResult<ResponseModel<EntidadDto>>> Actualizar([FromBody] ActualizarRecordatorioLlamadaCommand actualizarRecordatorioLlamadaCommand)
        {
            RequestModel<ActualizarRecordatorioLlamadaCommand> requestModel = new RequestModel<ActualizarRecordatorioLlamadaCommand>() { Entity = actualizarRecordatorioLlamadaCommand, auditRequest = _headerConfiguration.auditRequest };
            Stopwatch timeMeasure = new Stopwatch();
            ResponseModel<EntidadDto> result = new ResponseModel<EntidadDto>();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("RecordatorioLlamadaController:78", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar");
            _impresionLog.DatosInicioMetodo("RecordatorioLlamadaController:79", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, requestModel);

            try { result = await _mediator.Send(actualizarRecordatorioLlamadaCommand); }
            catch (Exception e) { result.Entity = new EntidadDto { Mensaje = e.Message.ToString() }; }
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("RecordatorioLlamadaController:86", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("RecordatorioLlamadaController:87", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "Actualizar", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return CreatedAtAction(nameof(Registrar), result);
        }
    }
}