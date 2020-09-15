namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class RangoIngreso
    {
        public short CodigoRangoIngreso { get; set; }
        public short CodigoCanal { get; set; }
        public string Descripcion { get; set; }
        public int RangoInicio { get; set; }
        public int RangoFin { get; set; }
        public bool FlagActivo { get; set; }
    }
}
