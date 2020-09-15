using Agenda.Infrastucture.Utilitarios;
using Microsoft.AspNetCore.Hosting;
using Serilog;

namespace Agenda.Infrastucture.Logging
{
    public static class CustomLoggerProviderExtensions
    {
        public static IWebHostBuilder UseCustomLoggerProvider(this IWebHostBuilder builder)
        {
            ConfigApp configApp = new ConfigApp();

            long _FileSizeLimitBytes = configApp.TamanoMaximoLog * 1024 * 1024;
            string _FileLogName = configApp.RutaArchivoLog;

            Log.Logger = new LoggerConfiguration()
                .WriteTo.File(_FileLogName,
                    rollOnFileSizeLimit: true,
                    fileSizeLimitBytes: _FileSizeLimitBytes,
                    retainedFileCountLimit: 2,
                    buffered: false,
                    outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message}{NewLine}{Exception}")
                .CreateLogger();

            builder.UseSerilog();
            return builder;
        }
    }
}
