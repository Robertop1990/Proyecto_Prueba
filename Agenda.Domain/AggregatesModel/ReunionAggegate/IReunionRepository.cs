using Agenda.Domain.SeedWork;

namespace Agenda.Domain.AggregatesModel.ReunionAggegate
{
    public interface IReunionRepository : IRepository<Reunion>
    {
        Reunion Agregar(Reunion reunion);
        int Actualizar(Reunion reunion);
        int Eliminar(Reunion reunion);
    }
}
