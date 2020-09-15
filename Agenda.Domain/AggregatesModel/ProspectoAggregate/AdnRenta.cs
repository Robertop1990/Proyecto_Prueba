using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class AdnRenta : IAggregateRoot
    {
        #region Propiedades
        public int IdProspecto { get; set; }
        public decimal TipoCambio { get; set; }
        public int? NumeroHijosDependiente { get; set; }
        public short? MonedaPatrimonioAfp { get; set; }
        public decimal? MontoPatrimonioAfp { get; set; }
        public int? PorcentajeAvance { get; set; }
        public int? PorcentajeAvanceCompleto { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }
        #endregion

        #region Relaciones
        public Prospecto Prospecto { get; set; }
        #endregion
    }
}
