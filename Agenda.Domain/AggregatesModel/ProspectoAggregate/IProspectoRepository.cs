using Agenda.Domain.SeedWork;
using System.Threading.Tasks;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public interface IProspectoRepository : IRepository<Prospecto>
    {
        void Agregar(Prospecto prospecto);
        void Actualizar(Prospecto prospecto);
        void Descartar(Prospecto prospecto);
        void ActivarProspecto(Prospecto prospecto);
        Task<Prospecto> Obtener(int prospectoId);
    }
}
