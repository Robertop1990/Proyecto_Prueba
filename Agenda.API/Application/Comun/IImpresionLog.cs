namespace Agenda.API.Application.Comun
{
    public interface IImpresionLog
    {
        void InicioMetodo(string claselineacodigo, string idtransaccion, string correlationid, string nombremetodo);
        void FinMetodo(string claselineacodigo, string idtransaccion, string correlationid, string nombremetodo, string tiempo);
        void DatosInicioMetodo(string claselineacodigo, string idtransaccion, string correlationid, object requestmodel);
        void DatosFinMetodo(string claselineacodigo, string idtransaccion, string correlationid, object responseModel);
    }
}
