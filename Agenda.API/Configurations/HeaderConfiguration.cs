using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;

namespace Agenda.API.Configurations
{
    public class HeaderConfiguration : IHeaderConfiguration
    {
        public string idTransaccion { get; set; }
        public string nombreAplicacion { get; set; }
        public string usuarioAplicacion { get; set; }
        public int idIntermediario { get; set; }
        public string CodigoIntermediario { get; set; }
        public string correlationId { get; set; }
        public AuditRequest auditRequest { get; set; }
    }
}
