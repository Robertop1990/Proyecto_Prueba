using Agenda.API.Application.Auditoria;
using System;

namespace Agenda.API.Application.Comun
{
    public class ConfigurationHelper
    {
        public void ObtenerMensajeRespuestaServicio(string codigoRespuesta, ref string mensajeRespuesta, ref int status)
        {
            mensajeRespuesta = string.Empty;
            status = 0;

            switch (codigoRespuesta)
            {
                case CodigoRespuestaServicio.Exito:
                    mensajeRespuesta = "Operación con éxito";
                    status = StatusCode.Creado;
                    break;
                case CodigoRespuestaServicio.SinDatos:
                    mensajeRespuesta = "No se encontraron datos";
                    status = StatusCode.NoEncontrado;
                    break;
                case CodigoRespuestaServicio.TimeOutBD:
                    mensajeRespuesta = "Error de timeout en Base de Datos";
                    status = StatusCode.TimeOut;
                    break;
                case CodigoRespuestaServicio.DisponibilidadBD:
                    mensajeRespuesta = "Ocurrió un problema en la Base de Datos";
                    status = StatusCode.ServicioNoDisponible;
                    break;
                case CodigoRespuestaServicio.TimeOutServicio:
                    mensajeRespuesta = "Error de timeout en el servicio";
                    status = StatusCode.TimeOut;
                    break;
                case CodigoRespuestaServicio.DisponibilidadServicio:
                    mensajeRespuesta = "Error de disponibilidad del servicio";
                    status = StatusCode.ServicioNoDisponible;
                    break;
                case CodigoRespuestaServicio.ErrorInesperado:
                    mensajeRespuesta = "Ocurrió un error inesperado";
                    status = StatusCode.ErrorInterno;
                    break;
                case CodigoRespuestaServicio.SinParametros:
                    mensajeRespuesta = "Parámetros de entrada no soportado";
                    status = StatusCode.PeticionIncorrecta;
                    break;
            }
        }

        public void ObtenerMensajeRespuestaServicio(string codigoRespuesta, ref string mensajeRespuesta, ref object status)
        {
            throw new NotImplementedException();
        }

        public ResponseService ObtenerCodigoRespuestaServicio(string exNumber, string exMessage)
        {
            ResponseService responseService = new ResponseService();

            string codigoRespuesta = string.Empty;
            string mensajeRespuesta = string.Empty;
            int status = 0;

            if (exNumber != "-2")
            {
                codigoRespuesta = CodigoRespuestaServicio.DisponibilidadBD;
            }
            if (exNumber == "50000")
            {
                codigoRespuesta = CodigoRespuestaServicio.DisponibilidadBD;
            }
            if (exNumber == "-2")
            {
                codigoRespuesta = CodigoRespuestaServicio.TimeOutBD;
            }
            if (exNumber == CodigoRespuestaServicio.Exito)
            {
                codigoRespuesta = exNumber;
            }
            if (exNumber == CodigoRespuestaServicio.DisponibilidadServicio)
            {
                codigoRespuesta = exNumber;
            }
            if (exNumber == CodigoRespuestaServicio.SinDatos)
            {
                codigoRespuesta = exNumber;
            }
            if (exNumber == CodigoRespuestaServicio.ErrorInesperado)
            {
                codigoRespuesta = exNumber;
            }
            ObtenerMensajeRespuestaServicio(codigoRespuesta, ref mensajeRespuesta, ref status);

            if (exMessage != "")
                mensajeRespuesta = String.Concat(mensajeRespuesta, " / ", exMessage);

            responseService.codigoRespuesta = codigoRespuesta;
            responseService.mensajeRespuesta = mensajeRespuesta;
            responseService.status = status;

            return responseService;
        }
    }
}
