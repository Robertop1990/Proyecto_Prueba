using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Agenda.API.Application.Commands.ProspectoCommand
{
    public class CrearProspectoCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdConsolidadoIntermediario { get; set; }
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
        public short? CodigoFuente { get; set; }
        public short? CodigoSubFuente { get; set; }
        public string Referenciador { get; set; }
        public string CorreoElectronico1 { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public short CodigoEstado { get; set; }
        public short CodigoEtapa { get; set; }
        public short? CodigoRangoFondo { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }

        #endregion

        #region Relacion
        public ProspectoAdnRentaCommand ProspectoAdnRentaCommand { get; set; }
        public ProspectoDireccionCommand ProspectoDireccionCommand { get; set; }
        #endregion

        #region Auxiliares
        [JsonIgnore]
        [IgnoreDataMember]
        public int CodigoIntermediario { get; set; }
        #endregion
    }

    public class ProspectoAdnRentaCommand
    {
        #region Propiedades
        public int IdProspecto { get; set; }
        public decimal TipoCambio { get; set; }
        public short? MonedaPatrimonioAfp { get; set; }
        public decimal? MontoPatrimonioAfp { get; set; }
        public int? PorcentajeAvance { get; set; }
        public int? PorcentajeAvanceCompleto { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion
    }

    public class ProspectoDireccionCommand
    {
        #region Propiedades
        public int IdDireccion { get; set; }
        public int IdProspecto { get; set; }
        public string Direccion { get; set; }
        public short Departamento_Id { get; set; }
        public short Provincia_Id { get; set; }
        public short Distrito_Id { get; set; }
        public bool? FlagActivo { get; set; }
        public short? TipoDireccion { get; set; }
        public DateTime AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }

        #endregion
    }
}
