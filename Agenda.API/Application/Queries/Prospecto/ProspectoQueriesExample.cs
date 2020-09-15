using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Comun;
using Swashbuckle.AspNetCore.Filters;
using System;
using System.Collections.Generic;

namespace Agenda.API.Application.Queries.Prospecto
{
    public class ResponseObtenerProspectosQueryExample : IExamplesProvider<ResponseObtenerProspectosQueryExample>
    {
        public ResponseObtenerProspectosQueryExample() => responseModel = new ResponseModel<List<Prospecto>>();
        public ResponseModel<List<Prospecto>> responseModel { get; set; }
        public ResponseObtenerProspectosQueryExample GetExamples()
        {
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();
            List<Prospecto> prospectos = new List<Prospecto>();
            prospectos.Add(new Prospecto { NombresApellidos = "Robert Eduardo Arango Ramos", Fuente = "ADN", Edad = 30 });
            prospectos.Add(new Prospecto { NombresApellidos = "Eduardo Arango Ramos", Fuente = "Campaña - SISCO", Edad = 28 });
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseObtenerProspectosQueryExample()
            {
                responseModel = new ResponseModel<List<Prospecto>>()
                {
                    auditResponse = auditResponse,
                    Entity = prospectos
                }
            };
        }
    }

    public class ResponseObtenerProspectoDetalleQueryExample : IExamplesProvider<ResponseObtenerProspectoDetalleQueryExample>
    {
        public ResponseObtenerProspectoDetalleQueryExample() => responseModel = new ResponseModel<ActualizarProspectoCommand>();
        public ResponseModel<ActualizarProspectoCommand> responseModel { get; set; }

        public ResponseObtenerProspectoDetalleQueryExample GetExamples()
        {
            ActualizarProspectoCommand actualizarProspectoCommand = new ActualizarProspectoCommand();
            ProspectoAdnRentaCommand prospectoAdnRentaCommand = new ProspectoAdnRentaCommand();
            ProspectoDireccionCommand prospectoDireccionCommand = new ProspectoDireccionCommand();


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
            prospectoDireccionCommand.FlagActivo = true;

            actualizarProspectoCommand.ProspectoAdnRentaCommand = prospectoAdnRentaCommand;           
            string mensajeRespuesta = string.Empty;
            int status = 0;
            AuditResponse auditResponse = new AuditResponse();       
            auditResponse.idTransaccion = "123456789";
            auditResponse.codigoRespuesta = CodigoRespuestaServicio.Exito;
            new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status);
            auditResponse.mensajeRespuesta = mensajeRespuesta;
            return new ResponseObtenerProspectoDetalleQueryExample()
            {
                responseModel = new ResponseModel<ActualizarProspectoCommand>()
                {
                    auditResponse = auditResponse,
                    Entity = actualizarProspectoCommand
                }
            };
        }
    }

}
