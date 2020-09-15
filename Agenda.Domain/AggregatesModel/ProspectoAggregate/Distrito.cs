namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class Distrito
    {
        #region Propiedades
        public short Distrito_Id { get; set; }
        public short Provincia_Id { get; set; }
        public short Departamento_Id { get; set; }
        public string Nombre { get; set; }
        #endregion

        #region Relaciones
        public Departamento Departamento { get; set; }
        public Provincia Provincia { get; set; }
        #endregion
    }
}
