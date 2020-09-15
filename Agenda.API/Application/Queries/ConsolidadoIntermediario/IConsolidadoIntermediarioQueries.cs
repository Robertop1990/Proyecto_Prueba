using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.ConsolidadoIntermediario
{
    public interface IConsolidadoIntermediarioQueries
    {
        Task<int> ObtenerIdConsolidadoIntermediario(int codigointermediario);
    }
}
