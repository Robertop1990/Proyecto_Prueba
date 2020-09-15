using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Swashbuckle.AspNetCore.Filters;
using System.Collections.Generic;

namespace Agenda.API.Application.Comun
{
    public class ResponseInternalServerModelExample : IExamplesProvider<ResponseInternalServerModelExample>
    {
        public ResponseInternalServerModelExample() => responseModel = new ResponseModel<List<EntidadDto>>();
        public ResponseModel<List<EntidadDto>> responseModel { get; set; }
        public ResponseInternalServerModelExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            List<EntidadDto> adn = new List<EntidadDto>();
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.ErrorInesperado;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseInternalServerModelExample()
            {
                responseModel = new ResponseModel<List<EntidadDto>>()
                {
                    auditResponse = auditResponse,
                    Entity = adn
                }
            };
        }
    }
}
