
namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class ConsolidadoIntermediario
    {
        public int IdConsolidadoIntermediario { get; set; }
        public int CodigoIntermediario { get; set; }
        public string NombreRazonSocial { get; set; }
        public int? CodigoIntermediarioGU { get; set; }
        public string NombreGU { get; set; }
        public string CorreoElectronicoGU { get; set; }
        public int? CodigoIntermediarioGA { get; set; }
        public string NombreGA { get; set; }
        public string CorreoElectronicoGA { get; set; }
    }
}
