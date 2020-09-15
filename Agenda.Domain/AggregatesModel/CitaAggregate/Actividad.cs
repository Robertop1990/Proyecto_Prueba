namespace Agenda.Domain.AggregatesModel.CitaAggregate
{
    public class Actividad
    {
        public int IdActividad { get; set; }
        public short CodigoEtapa { get; set; }
        public int NumeroCita { get; set; }
        public short CodigoLineaNegocio { get; set; }
        public string Etiqueta { get; set; }
    }
}
