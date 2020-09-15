using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class Referido: IAggregateRoot
    {
        #region Propiedades
        public int IdReferido { get; set; }
        public int IdProspecto { get; set; }
        public int IdReferidoDispositivo { get; set; }
        public short CodigoTipoReferido { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Telefono { get; set; }
        public bool? FlagActivo { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }
        #endregion

        #region Relaciones
        public virtual Prospecto Prospecto { get; set; }
        #endregion
    }
}
