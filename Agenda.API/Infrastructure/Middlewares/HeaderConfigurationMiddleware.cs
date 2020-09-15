using Agenda.API.Abstractions;
using Agenda.API.Application.Auditoria;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace Agenda.API.Infrastructure.Middlewares
{
    class HeaderConfigurationMiddleware
    {
        private readonly RequestDelegate _next;
        public HeaderConfigurationMiddleware(RequestDelegate next) => _next = next;

        public async Task InvokeAsync(HttpContext httpContext, IHeaderConfiguration headerConfiguration)
        {
            headerConfiguration.idTransaccion = httpContext.Request.Headers["idTransaccion"].ToString();
            headerConfiguration.correlationId = httpContext.Request.Headers["correlationId"].ToString();
            headerConfiguration.nombreAplicacion = httpContext.Request.Headers["nombreAplicacion"].ToString();
            headerConfiguration.usuarioAplicacion = httpContext.Request.Headers["usuarioAplicacion"].ToString();
            headerConfiguration.idIntermediario = string.IsNullOrEmpty(httpContext.Request.Headers["idIntermediario"].ToString()) ?0:
                                                           int.Parse(httpContext.Request.Headers["idIntermediario"].ToString());
            headerConfiguration.CodigoIntermediario = httpContext.Request.Headers["CodigoIntermediario"].ToString();

            headerConfiguration.auditRequest = new AuditRequest
            {
                idTransaccion = headerConfiguration.idTransaccion,
                nombreAplicacion = headerConfiguration.nombreAplicacion,
                usuarioAplicacion = headerConfiguration.usuarioAplicacion
            };
            //Move to next delegate/middleware in the pipleline
            await _next.Invoke(httpContext);
        }
    }

}
