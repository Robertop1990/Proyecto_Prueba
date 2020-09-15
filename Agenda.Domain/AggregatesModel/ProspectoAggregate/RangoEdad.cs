
namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class RangoEdad
    {
        public short CodigoRangoEdad { get; set; }
        public short CodigoCanal { get; set; }
        public string Descripcion { get; set; }
        public short RangoInicio { get; set; }
        public short RangoFin { get; set; }
        public bool FlagActivo { get; set; }
    }
}
