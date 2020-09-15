using Agenda.Infrastucture.Logging;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace Agenda.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var configuration = GetConfiguration();
            var host = CreateHostBuilder(configuration, args);
            host.Run();
        }

        private static IWebHost CreateHostBuilder(IConfiguration configuration, string[] args) =>
            WebHost.CreateDefaultBuilder(args)
            .UseStartup<Startup>()
            .UseConfiguration(configuration)
            .UseCustomLoggerProvider()
            .Build();

        private static IConfiguration GetConfiguration()
        {
            return new ConfigurationBuilder().Build();
        }
    }
}
