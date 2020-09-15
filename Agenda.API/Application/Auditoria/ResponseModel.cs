namespace Agenda.API.Application.Auditoria
{
    public class ResponseModel<T> where T : class
    {
        public ResponseModel() => auditResponse = new AuditResponse();
        public AuditResponse auditResponse { get; set; }
        public T Entity { get; set; }
    }
}
