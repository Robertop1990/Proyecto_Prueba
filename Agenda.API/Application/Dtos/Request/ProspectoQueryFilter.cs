using System;

namespace Agenda.API.Application.Dtos.Request
{
    public class ProspectoQueryFilter
    {
        public DateTime? fechacreacioninicio { get; set; }
        public DateTime? fechacreacionfin { get; set; }
        public string codigorangoedad { get; set; }
        public string codigosexo { get; set; }
        public string codigofuente { get; set; }
        public string codigosubfuente { get; set; }
        public string codigorangoingreso { get; set; }
        public string codigorangofondo { get; set; }
        public string codigoproducto { get; set; }
        public DateTime? fechaestimadacierreinicio { get; set; }
        public DateTime? fechaestimadacierrefin { get; set; }
        public string codigoporcentajeavanzada { get; set; }
        public DateTime? fechaultimaactividadinicio { get; set; }
        public DateTime? fechaultimaactividadfin { get; set; }
        public DateTime? fechacreacioncita { get; set; }
        public string parametro { get; set; }
        public string tab { get; set; }
        public int codigointermediario { get; set; }
    }
}
