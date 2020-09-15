
using System;
using System.Collections.Generic;

namespace Agenda.API.Application.Queries.Calendario
{
    public class SemanaCalendario
    {
        public int Año { get; set; }
        public string Mes { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public List<EtapaCalendario> EtapaCalendarios { get; set; }
        public List<DiaCalendario> DiaCalendarios { get; set; }
    }
    public class DiaCalendario
    {
        public DateTime FechaDia { get; set; }
        public string Dia { get; set; }
        public List<CumpleaniosCalendario> CumpleaniosCalendarios { get; set; }
        public List<CitaCalendario>  CitaCalendarios { get; set; }
        public List<RecordatorioLlamadaCalendario> RecordatorioLlamadaCalendarios { get; set; }
        public List<ReunionCalendario> ReunionCalendarios { get; set; }
    }

    public class CumpleaniosCalendario
    {
        public int IdProspecto { get; set; }
        public string Nombres { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public DateTime FechaCumple { get; set; }
    }

    public class CitaCalendario
    {
        public int IdCita { get; set; }
        public int IdProspecto { get; set; }
        public string Etapa { get; set; }
        public string Nombres { get; set; }
        public DateTime FechaCita { get; set; }
        public int NumeroEntrevista { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public string Fuente { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public string Departamento { get; set; }
        public string Provincia { get; set; }
        public string Distrito { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public string CorreoElectronicoGU { get; set; }
        public string NombreGU { get; set; }
        public string CorreoElectronicoGA { get; set; }
        public string NombreGA { get; set; }
        public string Descripcion { get; set; }
        public int Recordatorio { get; set; }
        public bool TieneCalificacion { get; set; }
        public string TipoCalificacion { get; set; }
        public short CodigoTipoCalificacion { get; set; }
        public string CalificacionCita { get; set; }
        public string ProbabilidadCierre { get; set; }
        public string ComentarioCalificacion { get; set; }
        public int PorcentajeAvanceAnterior { get; set; }
        public int PorcentajeAvance { get; set; }
        public string MotivoNoConcretada { get; set; }
        public DateTime FechaEstimadaCierre { get; set; }
        public bool Cancelada { get; set; }
        public string MotivoCancelada { get; set; }
        public DateTime Fecha { get; set; }
        public string EtiquetaColor { get; set; }
        public bool Descartado { get; set; }
        public string TextoMotivoDescarte { get; set; }
        public DateTime FechaDescarte { get; set; }
        public bool FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public int? PorcentajeAvanceAdn { get; set; }
        public int? PorcentajeProbabilidadCierre { get; set; }
        public string MonedaPrima { get; set; }
        public decimal? MontoPrima { get; set; }
    }

    public class RecordatorioLlamadaCalendario
    {
        public int IdProspecto { get; set; }
        public int IdRecordatorioLlamada { get; set; }
        public string Producto { get; set; }
        public string Nombres { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Fuente { get; set; }
        public string Referenciador { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fecha { get; set; }
        public bool Descartado { get; set; }
        public string TextoMotivoDescarte { get; set; }
        public DateTime FechaDescarte { get; set; }
        public bool Activo { get; set; }
    }

    public class ReunionCalendario
    {
        public int IdReunion { get; set; }
        public string TipoReunion { get; set; }
        public DateTime FechaReunion { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public string Departamento { get; set; }
        public string Provincia { get; set; }
        public string Distrito { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public string CorreoElectronicoGU { get; set; }
        public string NombreGU { get; set; }
        public string CorreoElectronicoGA { get; set; }
        public string NombreGA { get; set; }
        public string Descripcion { get; set; }
        public int AlertaMinutosAntes { get; set; }
        public bool FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime Fecha { get; set; }
        public string EtiquetaColor { get; set; }
    }

    public class EtapaCalendario
    {
        public DateTime Fecha { get; set; }
        public string NombreEtapa { get; set; }
        public int CantidadCita { get; set; }
        public int CantidadEntrevista { get; set; }
    }

    public class Intermediario
    {
        public int CodigoIntermediario { get; set; }
        public string Nombres { get; set; }
    }
}
