using System.Collections.Generic;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class Provincia
    {
        #region Propiedades
        public short Provincia_Id { get; set; }
        public short Departamento_Id { get; set; }
        public string Nombre { get; set; }
        #endregion

        #region Relaciones
        public ICollection<Distrito> Distritos { get; set; }
        public Departamento Departamento { get; set; }
        #endregion
    }
}
