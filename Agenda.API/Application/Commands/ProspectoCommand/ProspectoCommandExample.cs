using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Swashbuckle.AspNetCore.Filters;
using System;

namespace Agenda.API.Application.Commands.ProspectoCommand
{
    public class RequestCrearProspectoCommandExample : IExamplesProvider<CrearProspectoCommand>
    {
        public CrearProspectoCommand GetExamples()
        {
            AuditRequest auditRequest = new AuditRequest();
            CrearProspectoCommand crearProspectoCommand = new CrearProspectoCommand();
            ProspectoAdnRentaCommand prospectoAdnRentaCommand = new ProspectoAdnRentaCommand();

            //Campos Auditoria
            auditRequest.idTransaccion = "123456789";
            auditRequest.nombreAplicacion = "PortAD";
            auditRequest.usuarioAplicacion = "rmiranda";

            //Seccion 1 Adn Express
            crearProspectoCommand.CodigoTipoDocumento = 1;
            crearProspectoCommand.NumeroDocumento = "46712539";
            crearProspectoCommand.Nombres = "Robert Eduardo";
            crearProspectoCommand.ApellidoPaterno = "Arango";
            crearProspectoCommand.ApellidoMaterno = "Ramos";
            crearProspectoCommand.FechaNacimiento = DateTime.Parse("1990/04/04");
            crearProspectoCommand.CodigoSexo = 1;
            crearProspectoCommand.CodigoFuente = 3;
            crearProspectoCommand.CodigoEtapa = 1;
            crearProspectoCommand.CodigoEstado = 1;
            crearProspectoCommand.Empresa = "Seguro Pacifico";
            crearProspectoCommand.CodigoCargo = 8;
            crearProspectoCommand.OtroCargo = "Otro cargo";
            crearProspectoCommand.FlagHijo = true;
            crearProspectoCommand.TelefonoCelular = "957290129";
            crearProspectoCommand.TelefonoFijo = "01 3636564";
            crearProspectoCommand.CorreoElectronico1 = "robertarangoramos@gmail.com";    
            crearProspectoCommand.AuditoriaFechaCreacion = DateTime.Now;
            crearProspectoCommand.AuditoriaUsuarioCreacion = "rmiranda";

            prospectoAdnRentaCommand.MonedaPatrimonioAfp = 0;
            prospectoAdnRentaCommand.MontoPatrimonioAfp = decimal.Parse("1000.00");
            prospectoAdnRentaCommand.PorcentajeAvance = 20;
            prospectoAdnRentaCommand.PorcentajeAvanceCompleto = 0;
            prospectoAdnRentaCommand.AuditoriaFechaCreacion = DateTime.Now;
            prospectoAdnRentaCommand.AuditoriaUsuarioCreacion = "rmiranda";

            crearProspectoCommand.ProspectoAdnRentaCommand = prospectoAdnRentaCommand;

            return crearProspectoCommand;
        }
    }

    public class ResponseCrearProspectoCommandExample : IExamplesProvider<ResponseCrearProspectoCommandExample>
    {
        public ResponseCrearProspectoCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseCrearProspectoCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se registro correctamente el prospecto";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseCrearProspectoCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = entidadDto
                }
            };
        }
    }

    public class RequestActualizarProspectoCommandExample : IExamplesProvider<ActualizarProspectoCommand>
    {
        public ActualizarProspectoCommand GetExamples()
        {
            AuditRequest auditRequest = new AuditRequest();
            ActualizarProspectoCommand actualizarProspectoCommand = new ActualizarProspectoCommand();
            ProspectoAdnRentaCommand prospectoAdnRentaCommand = new ProspectoAdnRentaCommand();
            ProspectoDireccionCommand prospectoDireccionCommand = new ProspectoDireccionCommand();

            //Campos Auditoria
            auditRequest.idTransaccion = "123456789";
            auditRequest.nombreAplicacion = "PortAD";
            auditRequest.usuarioAplicacion = "rmiranda";

            //Seccion 1 Adn Express
            actualizarProspectoCommand.CodigoTipoDocumento = 1;
            actualizarProspectoCommand.NumeroDocumento = "46712539";
            actualizarProspectoCommand.Nombres = "Robert Eduardo";
            actualizarProspectoCommand.ApellidoPaterno = "Arango";
            actualizarProspectoCommand.ApellidoMaterno = "Ramos";
            actualizarProspectoCommand.FechaNacimiento = DateTime.Parse("1990/04/04");
            actualizarProspectoCommand.CodigoSexo = 1;
            actualizarProspectoCommand.CodigoFuente = 1;
            actualizarProspectoCommand.CodigoEtapa = 1;
            actualizarProspectoCommand.CodigoEstado = 1;
            actualizarProspectoCommand.Empresa = "Seguro Pacifico";
            actualizarProspectoCommand.CodigoCargo = 8;
            actualizarProspectoCommand.OtroCargo = "Otro cargo";
            actualizarProspectoCommand.FlagHijo = true;
            actualizarProspectoCommand.TelefonoCelular = "957290129";
            actualizarProspectoCommand.TelefonoFijo = "01 3636564";
            actualizarProspectoCommand.CorreoElectronico1 = "robertarangoramos@gmail.com";
            actualizarProspectoCommand.AuditoriaFechaModificacion = DateTime.Now;
            actualizarProspectoCommand.AuditoriaUsuarioModificacion = "rmiranda";

            prospectoAdnRentaCommand.MonedaPatrimonioAfp = 0;
            prospectoAdnRentaCommand.MontoPatrimonioAfp = decimal.Parse("1000.00");
            prospectoAdnRentaCommand.PorcentajeAvance = 20;
            prospectoAdnRentaCommand.PorcentajeAvanceCompleto = 0;
            prospectoAdnRentaCommand.AuditoriaFechaModificacion = DateTime.Now;
            prospectoAdnRentaCommand.AuditoriaUsuarioModificacion = "rmiranda";

            prospectoDireccionCommand.Direccion = "Direccion Ejemplo";
            prospectoDireccionCommand.Departamento_Id = 1;
            prospectoDireccionCommand.Provincia_Id = 1;
            prospectoDireccionCommand.Distrito_Id = 1;
            prospectoDireccionCommand.TipoDireccion = 1;
            prospectoDireccionCommand.FlagActivo = true;
            prospectoDireccionCommand.AuditoriaFechaCreacion = DateTime.Now;
            prospectoDireccionCommand.AuditoriaUsuarioCreacion = "rarango";


            actualizarProspectoCommand.ProspectoAdnRentaCommand = prospectoAdnRentaCommand;
            actualizarProspectoCommand.ProspectoDireccionCommand = prospectoDireccionCommand;

            return actualizarProspectoCommand;
        }
    }

    public class ResponseActualizarProspectoCommandExample : IExamplesProvider<ResponseActualizarProspectoCommandExample>
    {
        public ResponseActualizarProspectoCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseActualizarProspectoCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se actualizo correctamente el prospecto";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseActualizarProspectoCommandExample()
            {
                responseModel = new ResponseModel<EntidadDto>()
                {
                    auditResponse = auditResponse,
                    Entity = entidadDto
                }
            };
        }
    }


    public class RequestDescartarProspectoCommandExample : IExamplesProvider<DescartarProspectoCommand>
    {
        public DescartarProspectoCommand GetExamples()
        {
            DescartarProspectoCommand descartarProspectoCommand = new DescartarProspectoCommand();

            descartarProspectoCommand.FlagDescarte = true;
            descartarProspectoCommand.CodigoMotivoUnoDescarte = 5;
            descartarProspectoCommand.CodigoMotivoDosDescarte = 11;
            descartarProspectoCommand.TextoMontivoTresDescarte = "Sin descarte";
            descartarProspectoCommand.AuditoriaFechaModificacion = DateTime.Now;
            descartarProspectoCommand.AuditoriaUsuarioModificacion = "rarango";
            
            return descartarProspectoCommand;
        }
    }

    public class ResponseDescartarProspectoCommandExample : IExamplesProvider<ResponseDescartarProspectoCommandExample>
    {
        public ResponseDescartarProspectoCommandExample() => responseModel = new ResponseModel<EntidadDto>();
        public ResponseModel<EntidadDto> responseModel { get; set; }
        public ResponseDescartarProspectoCommandExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            EntidadDto entidadDto = new EntidadDto();
            entidadDto.Id = 18;
            entidadDto.Mensaje = "Se descarto correctamente el prospecto";
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseDescartarProspectoCommandExample()
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
