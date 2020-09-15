using Agenda.API.Infrastructure.Middlewares;
using Microsoft.AspNetCore.Builder;

namespace Agenda.API.Extensions
{
    public static class HeaderConfigurationExtension
    {
        public static IApplicationBuilder UseHeaderConfiguration(this IApplicationBuilder applicationBuilder)
        {
            return applicationBuilder.UseMiddleware<HeaderConfigurationMiddleware>();
        }
    }
}
