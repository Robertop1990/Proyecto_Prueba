using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.CitaAggregate
{
    public class CitaMovimientoEstado : IAggregateRoot
    {
        public int IdMovimiento { get; set; }
        public int IdCita { get; set; }
        public short CodigoEstado { get; set; }
        public short CodigoResultado { get; set; }
        public DateTime? AuditoriaFechaMovimientoEstado { get; set; }
        public string AuditoriaUsuarioMovimientoEstado { get; set; }
    }
}
