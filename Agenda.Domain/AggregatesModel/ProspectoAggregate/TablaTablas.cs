
namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class TablaTablas
    {
        public int IdTablaTablas { get; set; }
        public short IdTabla { get; set; }
        public short CodigoCampo { get; set; }
        public string ValorCadena { get; set; }
        public decimal? ValorNumerico { get; set; }
        public string ValorAuxiliarCadena { get; set; }
        public string ValorAuxiliarCadena2 { get; set; }
        public bool? FlagActivo { get; set; }
    }
}
