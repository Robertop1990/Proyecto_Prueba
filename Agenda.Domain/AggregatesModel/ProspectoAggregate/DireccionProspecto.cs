using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class DireccionProspecto : IAggregateRoot
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
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        #endregion

        #region Relaciones
        public Prospecto Prospecto { get; set; }
        #endregion
    }
}
