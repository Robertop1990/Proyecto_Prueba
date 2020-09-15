using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.ProspectoCommand
{
    public class ActualizarProspectoCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdProspecto { get; set; }
        public short? CodigoTipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public short? CodigoRangoEdad { get; set; }
        public short? CodigoRangoIngreso { get; set; }
        public short? CodigoSexo { get; set; }
        public bool? FlagHijo { get; set; }
        public string Empresa { get; set; }
        public short? CodigoCargo { get; set; }
        public string OtroCargo { get; set; }
        public string Referenciador { get; set; }
        public short? CodigoFuente { get; set; }
        public short? CodigoSubFuente { get; set; }
        public string CorreoElectronico1 { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public short CodigoEstado { get; set; }
        public short CodigoEtapa { get; set; }
        public short? CodigoRangoFondo { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion

        #region Relacion
        public ProspectoAdnRentaCommand ProspectoAdnRentaCommand { get; set; }
        public ProspectoDireccionCommand ProspectoDireccionCommand { get; set; }
        #endregion

        #region Auxiliares
        public string ProspectoReferenciador { get; set; }
        #endregion
    }
}
