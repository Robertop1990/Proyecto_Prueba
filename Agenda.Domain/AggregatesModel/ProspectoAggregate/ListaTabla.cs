
namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class ListaTabla
    {
        public int IdListaTabla { get; set; }
        public short IdTabla { get; set; }
        public short CodigoCampo { get; set; }
        public string ValorCadena { get; set; }
        public decimal ValorNumerico { get; set; }
        public short CodigoLineaNegocio { get; set; }
    }
}
