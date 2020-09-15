
using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Comun;
using Agenda.API.Application.Queries.Calendario;
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

namespace Agenda.API.Controllers
{
    [ApiController]
    public class CalendarioController : ControllerBase
    {
        private readonly ILogger<CalendarioController> _logger;
        private readonly ICalendarioQueries _calendarioQueries;
        private readonly IImpresionLog _impresionLog;
        private readonly IHeaderConfiguration _headerConfiguration;

        public CalendarioController(ILogger<CalendarioController> logger,
                                   ICalendarioQueries calendarioQueries,
                                   IImpresionLog impresionLog,
                                   IHeaderConfiguration headerConfiguration)
        {
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
            _calendarioQueries = calendarioQueries ?? throw new ArgumentNullException(nameof(calendarioQueries));
            _impresionLog = impresionLog ?? throw new ArgumentNullException(nameof(impresionLog));
            _headerConfiguration = headerConfiguration ?? throw new ArgumentNullException(nameof(headerConfiguration));
        }

        [HttpGet]
        [Route("api/calendarios/{fechaactual}")]
        [SwaggerOperation(Summary = "Obtener Calendario", Description = "Obtener Calendario")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<List<SemanaCalendario>>))]
        //[SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerNumeroCitaQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<List<SemanaCalendario>>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<List<SemanaCalendario>>>> ObtenerSemanaCalendario(string fechaactual)
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            int intermediario = string.IsNullOrEmpty(_headerConfiguration.CodigoIntermediario) ? _headerConfiguration.idIntermediario : int.Parse(_headerConfiguration.CodigoIntermediario);

            _impresionLog.InicioMetodo("CalendarioController:53", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerSemanaCalendario");
            _logger.LogInformation("{cadena}", "CalendarioController:54 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented) + "fechaactual" + fechaactual + "codigointermediario" + _headerConfiguration.idIntermediario + "codigointermediarioasesor" + _headerConfiguration.CodigoIntermediario);

            var result = await _calendarioQueries.ObtenerSemanaCalendario(fechaactual, intermediario);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CalendarioController:61", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CalendarioController:62", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerSemanaCalendario", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }

        [HttpGet]
        [Route("api/actividades/{fechaactual}")]
        [SwaggerOperation(Summary = "Obtener Reporte Actividades", Description = "Obtener Reporte Actividades")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<List<SemanaCalendario>>))]
        //[SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerNumeroCitaQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<List<SemanaCalendario>>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<List<ActividadReporte>>>> ObtenerReporteActividadSemanal(string fechaactual)
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();
            string intermediario = string.IsNullOrEmpty(_headerConfiguration.CodigoIntermediario)  ? _headerConfiguration.idIntermediario.ToString() : _headerConfiguration.CodigoIntermediario;

            _impresionLog.InicioMetodo("CalendarioController:81", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerSemanaCalendario");
            _logger.LogInformation("{cadena}", "CalendarioController:82 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented) + "fechaactual" + fechaactual + "codigointermediario" + _headerConfiguration.idIntermediario);

            var result = await _calendarioQueries.ObtenerReporteActividadSemanal(fechaactual, intermediario);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CalendarioController:89", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CalendarioController:90", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerSemanaCalendario", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }

        [HttpGet]
        [Route("api/intermediarios")]
        [SwaggerOperation(Summary = "Obtener Asesores por Supervisor", Description = "Obtener Asesores por Supervisor")]
        [SwaggerResponse(StatusCodes.Status200OK, type: typeof(ResponseModel<List<SemanaCalendario>>))]
        //[SwaggerResponseExample(StatusCodes.Status200OK, typeof(ResponseObtenerNumeroCitaQueryExample))]
        [SwaggerResponse(StatusCodes.Status500InternalServerError, type: typeof(ResponseModel<List<Intermediario>>))]
        [SwaggerResponseExample(StatusCodes.Status500InternalServerError, typeof(ResponseInternalServerModelExample))]

        public async Task<ActionResult<ResponseModel<List<Intermediario>>>> ObtenerAsesoresPorSupervisor()
        {
            Stopwatch timeMeasure = new Stopwatch();
            timeMeasure.Start();

            _impresionLog.InicioMetodo("CalendarioController:108", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerAsesoresPorSupervisor");
            _logger.LogInformation("{cadena}", "CalendarioController:109 - " + "[idTx=" + _headerConfiguration.idTransaccion + " cltId=" + _headerConfiguration.correlationId + "]" + " Datos de entrada: " +
                     JsonConvert.SerializeObject(_headerConfiguration.auditRequest, Formatting.Indented) + "codigointermediario" + _headerConfiguration.idIntermediario);

            var result = await _calendarioQueries.ObtenerAsesoresPorSupervisor(_headerConfiguration.idIntermediario);
            result.auditResponse.idTransaccion = _headerConfiguration.idTransaccion;

            timeMeasure.Stop();
            _impresionLog.DatosFinMetodo("CalendarioController:116", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, result);
            _impresionLog.FinMetodo("CalendarioController:117", _headerConfiguration.idTransaccion, _headerConfiguration.correlationId, "ObtenerAsesoresPorSupervisor", timeMeasure.Elapsed.TotalMilliseconds.ToString());

            return Ok(result);
        }
    }
}