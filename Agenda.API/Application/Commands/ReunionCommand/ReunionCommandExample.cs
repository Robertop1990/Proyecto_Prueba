using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Swashbuckle.AspNetCore.Filters;
using System;

namespace Agenda.API.Application.Commands.ReunionCommand
{

    public class RequestCrearReunionCommandExample : IExamplesProvider<CrearReunionCommand>
    {
        public CrearReunionCommand GetExamples()
        {
            CrearReunionCommand crearReunionCommand = new CrearReunionCommand();
            crearReunionCommand.CodigoTipoReunion = 1;
            crearReunionCommand.FechaReunion = DateTime.Now;
            crearReunionCommand.HoraInicio = "08:00";
            crearReunionCommand.HoraFin = "09:00";
            crearReunionCommand.Ubicacion = "Sin ubicacion";
            crearReunionCommand.CodigoDepartamento = 1;
            crearReunionCommand.CodigoProvincia = 1;
            crearReunionCommand.CodigoDistrito = 1;
            crearReunionCommand.ReferenciaUbicacion = "Sin referencia ubicacion";
            crearReunionCommand.FlagInvitadoGA = true;
            crearReunionCommand.FlagInvitadoGU = true;
            crearReunionCommand.Descripcion = "Sin descripcion";
            crearReunionCommand.AlertaMinutosAntes = 15;
            crearReunionCommand.AuditoriaFechaCreacion = DateTime.Now;
            crearReunionCommand.AuditoriaUsuarioCreacion = "rarango";

            return crearReunionCommand;
        }
    }

    public class ResponseCrearReunionCommandExample : IExamplesProvider<ResponseCrearReunionCommandExample>
    {
        public ResponseCrearReunionCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseCrearReunionCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto reunionDto = new EntidadDto();
            reunionDto.Id = 18;
            reunionDto.Mensaje = "Se registro correctamente la reunion";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseCrearReunionCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = reunionDto
                }
            };
        }
    }


    public class RequestActualizarReunionCommandExample : IExamplesProvider<ActualizarReunionCommand>
    {
        public ActualizarReunionCommand GetExamples()
        {
            ActualizarReunionCommand actualizarReunionCommand = new ActualizarReunionCommand();

            actualizarReunionCommand.FechaReunion = DateTime.Now;
            actualizarReunionCommand.HoraInicio = "08:00";
            actualizarReunionCommand.HoraFin = "08:30";
            actualizarReunionCommand.AuditoriaFechaModificacion = DateTime.Now;
            actualizarReunionCommand.AuditoriaUsuarioModificacion = "rarango";
            return actualizarReunionCommand;
        }
    }

    public class ResponseActualizarReunionCommandExample : IExamplesProvider<ResponseActualizarReunionCommandExample>
    {
        public ResponseActualizarReunionCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseActualizarReunionCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se actualizo correctamente la reunion";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseActualizarReunionCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = entidadDto
                }
            };
        }
    }
}
