namespace Agenda.API.Application.Auditoria
{
    public class RequestModel<T> where T : class
    {
        public RequestModel() => auditRequest = new AuditRequest();
        public AuditRequest auditRequest { get; set; }
        public T Entity { get; set; }
    }
}
