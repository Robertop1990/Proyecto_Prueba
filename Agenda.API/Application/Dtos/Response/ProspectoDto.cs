using System;

namespace Agenda.API.Application.Dtos.Response
{
    public class ProspectoDto
    {
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
        public short? MonedaFondo { get; set; }
        public decimal? MontoFondo { get; set; }
        public bool? FlagHijo { get; set; }
        public string Empresa { get; set; }
        public short? CodigoCargo { get; set; }
        public string OtroCargo { get; set; }
        public short? CodigoFuente { get; set; }
        public short? CodigoSubFuente { get; set; }
        public string CorreoElectronico1 { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public int? IdReferenciador { get; set; }
        public string Referenciador { get; set; }
        public bool? FlagDescarte { get; set; }
        public short? CodigoMotivoUnoDescarte { get; set; }
        public short? CodigoMotivoDosDescarte { get; set; }
        public short? CodigoMotivoTresDescarte { get; set; }
        public string TextoMontivoTresDescarte { get; set; }
        public short? CodigoRangoFondo { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
    }
}
