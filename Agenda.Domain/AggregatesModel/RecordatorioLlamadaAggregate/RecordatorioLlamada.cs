using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate
{
    public class RecordatorioLlamada : IAggregateRoot
    {
        #region Propiedades
        public int IdRecordatorioLlamada { get; set; }
        public int IdProspecto { get; set; }
        public int? IdCita { get; set; }
        public int IdRecordatorioLlamadaDispositivo { get; set; }
        public DateTime FechaRecordatorio { get; set; }
        public bool? FlagActivo { get; set; }
        public TimeSpan? HoraInicio { get; set; }
        public TimeSpan? HoraFin { get; set; }
        public string Descripcion { get; set; }
        public short? AlertaMinutosAntes { get; set; }
        public short? CodigoLineaNegocio { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion

        #region Relaciones
        public Prospecto Prospecto { get; set; }
        public Cita Cita { get; set; }
        #endregion
    }
}
