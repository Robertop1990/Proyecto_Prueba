
using Agenda.API.Application.Auditoria;

namespace Agenda.API.Abstractions
{
    public interface IHeaderConfiguration
    {
        string idTransaccion { get; set; }
        string nombreAplicacion { get; set; }
        string usuarioAplicacion { get; set; }
        int idIntermediario { get; set; }
        string CodigoIntermediario { get; set; }
        string correlationId { get; set; }
        AuditRequest auditRequest { get; set; }
    }
}
