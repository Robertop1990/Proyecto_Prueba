using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Comun;
using Swashbuckle.AspNetCore.Filters;

namespace Agenda.API.Application.Queries.Cita
{
    public class ResponseObtenerNumeroCitaQueryExample : IExamplesProvider<ResponseObtenerNumeroCitaQueryExample>
    {
        public ResponseObtenerNumeroCitaQueryExample() => responseModel = new ResponseModel<AgendaCita>();
        public ResponseModel<AgendaCita> responseModel { get; set; }

        public ResponseObtenerNumeroCitaQueryExample GetExamples()
        {
            AgendaCita agendaCita = new AgendaCita();
            agendaCita.TieneAgendamiento = false;
            agendaCita.NumeroCita = 0;

            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseObtenerNumeroCitaQueryExample()
            {
                responseModel = new ResponseModel<AgendaCita>()
                {
                    auditResponse = auditResponse,
                    Entity = agendaCita
                }
            };

        }
    }
}
