using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace Agenda.API.Application.Comun
{
    public class ImpresionLog : IImpresionLog
    {
        private readonly ILogger<ImpresionLog> _logger;

        public ImpresionLog(ILogger<ImpresionLog> logger) => _logger = logger;


        public void InicioMetodo(string claselineacodigo, string idtransaccion, string correlationid, string nombremetodo)
        {
            string cadena = claselineacodigo + " - " + "[idTx=" + idtransaccion + " cltId=" + correlationid + "]" + " [INICIO " + nombremetodo + "]";

            //cadena = Clase:LineaCodigo - [idTx=123 cltId=123] [INICIO metodo]
            _logger.LogInformation("{cadena}", cadena);
        }

        public void FinMetodo(string claselineacodigo, string idtransaccion, string correlationid, string nombremetodo, string tiempo)
        {
            string cadena = claselineacodigo + " - " + "[idTx=" + idtransaccion + " cltId=" + correlationid + "]" + " [FIN " + nombremetodo + "]" + " Tiempo total del proceso de ejecución: " + tiempo + " ms";

            //cadena = Clase:LineaCodigo - [idTx=123 cltId=123] [FIN metodo] tiempototaldeejecucion
            _logger.LogInformation("{cadena}", cadena);
        }

        public void DatosInicioMetodo(string claselineacodigo, string idtransaccion, string correlationid, object requestmodel)
        {
            string cadena = claselineacodigo + " - " + "[idTx=" + idtransaccion + " cltId=" + correlationid + "]" + " Datos de entrada " + JsonConvert.SerializeObject(requestmodel, Formatting.Indented);

            //cadena = Clase:LineaCodigo - [idTx=123 cltId=123] Datos de entrada: objeto
            _logger.LogInformation("{cadena}", cadena);
        }

        public void DatosFinMetodo(string claselineacodigo, string idtransaccion, string correlationid, object responseModel)
        {
            string cadena = claselineacodigo + " - " + "[idTx=" + idtransaccion + " cltId=" + correlationid + "]" + " Datos de salida " + JsonConvert.SerializeObject(responseModel, Formatting.Indented);

            //cadena = Clase:LineaCodigo - [idTx=123 cltId=123] Datos de salida: objeto
            _logger.LogInformation("{cadena}", cadena);
        }
    }
}
