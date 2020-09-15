using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Swashbuckle.AspNetCore.Filters;
using System;

namespace Agenda.API.Application.Commands.CitaCommand
{
    public class RequestCrearCitaCommandExample : IExamplesProvider<CrearCitaCommand>
    {
        public CrearCitaCommand GetExamples()
        {
            AuditRequest auditRequest = new AuditRequest();
            CrearCitaCommand crearCitaCommand = new CrearCitaCommand();
            CitaProspectoCommand citaProspectoCommand = new CitaProspectoCommand();

            //Campos Auditoria
            auditRequest.idTransaccion = "123456789";
            auditRequest.nombreAplicacion = "PortAD";
            auditRequest.usuarioAplicacion = "rmiranda";

            //Campos Cita
            crearCitaCommand.IdCitaDispositivo = 0;
            crearCitaCommand.CodigoLineaNegocio = 81;
            crearCitaCommand.NumeroEntrevista = 1;
            crearCitaCommand.FechaCita = DateTime.Today;
            crearCitaCommand.HoraInicio = "08:00";
            crearCitaCommand.HoraFin = "08:30";
            crearCitaCommand.Ubicacion = "Sin Domicilio";
            crearCitaCommand.CodigoDepartamento = 1;
            crearCitaCommand.CodigoProvincia = 1;
            crearCitaCommand.CodigoDistrito = 1;
            crearCitaCommand.ReferenciaUbicacion = "Sin Domicilio";
            crearCitaCommand.FlagInvitadoGA = true;
            crearCitaCommand.FlagInvitadoGU = true;
            crearCitaCommand.Descripcion = "Sin Descripcion";
            crearCitaCommand.AlertaMinutosAntes = 15;
            crearCitaCommand.CodigoEstado = 2; //Agendada
            crearCitaCommand.CodigoResultado = 0; //Pendiente
            crearCitaCommand.CodigoEtapaProspecto = 1;
            crearCitaCommand.AuditoriaFechaCreacion = DateTime.Now;
            crearCitaCommand.AuditoriaUsuarioCreacion = "rarango";


            //Campos Prospecto
            citaProspectoCommand.TelefonoCelular = "957290129";
            citaProspectoCommand.TelefonoFijo = "3636567";


            crearCitaCommand.CitaProspectoCommand = citaProspectoCommand;
            return crearCitaCommand;
        }
    }

    public class ResponseCrearCitaCommandExample : IExamplesProvider<ResponseCrearCitaCommandExample>
    {
        public ResponseCrearCitaCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseCrearCitaCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto citaDto = new EntidadDto();
            citaDto.Id = 18;
            citaDto.Mensaje = "Se registro correctamente la cita";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseCrearCitaCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = citaDto
                }
            };
        }
    }

    public class RequestActualizarCitaCommandExample : IExamplesProvider<ActualizarCitaCommand>
    {
        public ActualizarCitaCommand GetExamples()
        {
            ActualizarCitaCommand actualizarCitaCommand = new ActualizarCitaCommand();

            actualizarCitaCommand.FechaCita = DateTime.Now;
            actualizarCitaCommand.HoraInicio = "08:00";
            actualizarCitaCommand.HoraFin = "08:30";
            actualizarCitaCommand.Ubicacion = "Sin Ubicacion";
            actualizarCitaCommand.CodigoDepartamento = 1;
            actualizarCitaCommand.CodigoProvincia = 1;
            actualizarCitaCommand.CodigoDistrito = 1;
            actualizarCitaCommand.CodigoMotivoReagendado = 1;
            actualizarCitaCommand.AuditoriaFechaModificacion = DateTime.Now;
            actualizarCitaCommand.AuditoriaUsuarioModificacion = "rarango";
            return actualizarCitaCommand;
        }
    }

    public class ResponseActualizarCitaCommandExample : IExamplesProvider<ResponseActualizarCitaCommandExample>
    {
        public ResponseActualizarCitaCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseActualizarCitaCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se actualizo correctamente la cita";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseActualizarCitaCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = entidadDto
                }
            };
        }
    }
    
    public class RequestCalificarCitaCommandExample : IExamplesProvider<CalificarCitaCommand>
    {
        public CalificarCitaCommand GetExamples()
        {
            CalificarCitaCommand calificarCitaCommand = new CalificarCitaCommand();

            calificarCitaCommand.FlagCalificacion = true;
            calificarCitaCommand.CodigoEstado = 3;
            calificarCitaCommand.CodigoResultado = 1;
            calificarCitaCommand.CodigoTipoCalificacion = 1;
            calificarCitaCommand.FlagPresentaAlgunaPropuestaSolucion = true;
            calificarCitaCommand.FlagConcretoVenta = false;
            calificarCitaCommand.ProbabilidadCierre = 25;
            calificarCitaCommand.FechaEstimadaCierre = DateTime.Now;
            calificarCitaCommand.ComentarioCalificacion = "Sin comentario";
            calificarCitaCommand.AuditoriaFechaModificacion = DateTime.Now;
            calificarCitaCommand.AuditoriaUsuarioModificacion = "rarango";

            return calificarCitaCommand;
        }
    }

    public class ResponseCalificarCitaCommandExample : IExamplesProvider<ResponseCalificarCitaCommandExample>
    {
        public ResponseCalificarCitaCommandExample() => responseModel = new ResponseModel<EntidadDto>(); 
        public ResponseModel<EntidadDto> responseModel { get; set; }

        public ResponseCalificarCitaCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se califico correctamente la cita";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseCalificarCitaCommandExample()
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
