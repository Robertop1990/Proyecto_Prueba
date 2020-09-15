using System.Collections.Generic;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class Departamento
    {
        #region Propiedades
        public short Departamento_Id { get; set; }
        public string Nombre { get; set; }
        #endregion

        #region Relaciones
        public ICollection<Provincia> Provincias { get; set; }
        public ICollection<Distrito> Distritos { get; set; }
        #endregion
    }
}
