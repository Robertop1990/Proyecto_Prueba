using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Commands.CitaCommand;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Swashbuckle.AspNetCore.Filters;
using System;

namespace Agenda.API.Application.Commands.RecordatorioLlamadaCommand
{
    public class RecordatorioLlamadaCommandExample
    {
    }

    public class RequestCrearRecordatorioLlamadaCommandExample : IExamplesProvider<CrearRecordatorioLlamadaCommand>
    {
        public CrearRecordatorioLlamadaCommand GetExamples()
        {
            AuditRequest auditRequest = new AuditRequest();
            CrearRecordatorioLlamadaCommand crearRecordatorioLlamadaCommand = new CrearRecordatorioLlamadaCommand();
            RecordatorioLlamadaProspectoCommand recordatorioLlamadaProspectoCommand = new RecordatorioLlamadaProspectoCommand();

            //Campos Auditoria
            auditRequest.idTransaccion = "123456789";
            auditRequest.nombreAplicacion = "PortAD";
            auditRequest.usuarioAplicacion = "rmiranda";

            //Campos Recordatorio Llamada
            crearRecordatorioLlamadaCommand.CodigoLineaNegocio = 81;
            crearRecordatorioLlamadaCommand.FechaRecordatorio = DateTime.Now;
            crearRecordatorioLlamadaCommand.IdRecordatorioLlamadaDispositivo = 0;
            crearRecordatorioLlamadaCommand.FlagActivo = true;
            crearRecordatorioLlamadaCommand.HoraInicio = "08:00";
            crearRecordatorioLlamadaCommand.HoraFin = "08:30";
            crearRecordatorioLlamadaCommand.AlertaMinutosAntes = 15;
            crearRecordatorioLlamadaCommand.Descripcion = "Sin descripcion";
            crearRecordatorioLlamadaCommand.AuditoriaFechaCreacion = DateTime.Now;
            crearRecordatorioLlamadaCommand.AuditoriaUsuarioCreacion = "rarango";

            //Campos Prospecto
            recordatorioLlamadaProspectoCommand.TelefonoCelular = "957290129";
            recordatorioLlamadaProspectoCommand.TelefonoFijo = "3636567";

            crearRecordatorioLlamadaCommand.RecordatorioLlamadaProspectoCommand = recordatorioLlamadaProspectoCommand;

            return crearRecordatorioLlamadaCommand;
        }
    }

    public class ResponseCrearRecordatorioLlamadaCommandExample : IExamplesProvider<ResponseCrearRecordatorioLlamadaCommandExample>
    {
        public ResponseCrearRecordatorioLlamadaCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseCrearRecordatorioLlamadaCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto recordatorioLlamadaDto = new EntidadDto();
            recordatorioLlamadaDto.Id = 18;
            recordatorioLlamadaDto.Mensaje = "Se registro correctamente el recordatorio llamada";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseCrearRecordatorioLlamadaCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = recordatorioLlamadaDto
                }
            };
        }
    }


    public class RequestActualizarRecordatorioLlamadaCommandExample : IExamplesProvider<ActualizarRecordatorioLlamadaCommand>
    {
        public ActualizarRecordatorioLlamadaCommand GetExamples()
        {
            ActualizarRecordatorioLlamadaCommand actualizarRecordatorioLlamadaCommand = new ActualizarRecordatorioLlamadaCommand();

            actualizarRecordatorioLlamadaCommand.FechaRecordatorio = DateTime.Now;
            actualizarRecordatorioLlamadaCommand.HoraInicio = "08:00";
            actualizarRecordatorioLlamadaCommand.HoraFin = "08:30";
            actualizarRecordatorioLlamadaCommand.Descripcion = "Sin descripcion";
            actualizarRecordatorioLlamadaCommand.AlertaMinutosAntes = 15;
            actualizarRecordatorioLlamadaCommand.AuditoriaFechaModificacion = DateTime.Now;
            actualizarRecordatorioLlamadaCommand.AuditoriaUsuarioModificacion = "rarango";
            return actualizarRecordatorioLlamadaCommand;
        }
    }

    public class ResponseActualizarRecordatorioLlamadaCommandExample : IExamplesProvider<ResponseActualizarRecordatorioLlamadaCommandExample>
    {
        public ResponseActualizarRecordatorioLlamadaCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseActualizarRecordatorioLlamadaCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se actualizo correctamente el recordatorio llamada";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseActualizarRecordatorioLlamadaCommandExample()
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
