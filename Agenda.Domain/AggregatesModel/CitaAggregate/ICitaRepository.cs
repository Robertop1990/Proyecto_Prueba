
using Agenda.Domain.SeedWork;

namespace Agenda.Domain.AggregatesModel.CitaAggregate
{
    public interface ICitaRepository : IRepository<Cita>
    {
        void Agregar(Cita cita);
        void Actualizar(Cita cita);
        void Calificar(Cita cita);
        Cita ObtenerCitaPorId(int idcita);
        void ActualizarReagendado(Cita cita);
        void CalificarMultipleCitaNoConcretada(int idprospecto, string mensajenoconcretada);
    }
}
