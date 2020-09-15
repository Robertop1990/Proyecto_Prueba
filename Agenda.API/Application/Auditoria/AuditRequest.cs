namespace Agenda.API.Application.Auditoria
{
    public class AuditRequest
    {
        public string idTransaccion { get; set; }
        public string nombreAplicacion { get; set; }
        public string usuarioAplicacion { get; set; }

        public AuditRequest()
        {
            idTransaccion = string.Empty;
            nombreAplicacion = string.Empty;
            usuarioAplicacion = string.Empty;
        }
    }
}
