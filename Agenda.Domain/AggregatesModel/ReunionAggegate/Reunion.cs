using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.ReunionAggegate
{
    public class Reunion : IAggregateRoot
    {
        public int IdReunion { get; set; }
        public int IdConsolidadoIntermediario { get; set; }
        public int IdReunionDispositivo { get; set; }
        public short? CodigoTipoReunion { get; set; }
        public DateTime FechaReunion { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public string ReferenciaUbicacion { get; set; }
        public bool? FlagInvitadoGU { get; set; }
        public bool? FlagInvitadoGA { get; set; }
        public string Descripcion { get; set; }
        public short? AlertaMinutosAntes { get; set; }
        public bool? FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }
    }
}
