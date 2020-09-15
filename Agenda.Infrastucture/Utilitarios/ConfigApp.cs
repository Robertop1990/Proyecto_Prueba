using Microsoft.Extensions.Configuration;
using System.IO;
using System.Reflection;

namespace Agenda.Infrastucture.Utilitarios
{
    public class ConfigApp
    {

        #region Propiedades Privadas        
        private long _TamanoMaximoLog = 0;
        private string _RutaArchivoLog = string.Empty;
        #endregion

        public long TamanoMaximoLog { get => _TamanoMaximoLog; }
        public string RutaArchivoLog { get => _RutaArchivoLog; }

        public ConfigApp()
        {
            LeerParametrosDesdeArchivo();
        }

        private void LeerParametrosDesdeArchivo()
        {
            var configurationBuilder = new ConfigurationBuilder()
            .SetBasePath(Path.GetDirectoryName(Assembly.GetEntryAssembly().Location))
            .AddJsonFile("appsettings.json");

            IConfigurationRoot root = configurationBuilder.Build();
            IConfigurationSection properties = root.GetSection("Properties");

            _TamanoMaximoLog = properties.GetValue<long>("TamanoMaximoLog");
            _RutaArchivoLog = properties.GetValue<string>("NombreArchivoLog");
        }
    }
}
