using Agenda.Domain.SeedWork;

namespace Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate
{
    public interface IRecordatorioLlamadaRepository : IRepository<RecordatorioLlamada>
    {
        void Agregar(RecordatorioLlamada recordatorioLlamada);
        void Actualizar(RecordatorioLlamada recordatorioLlamada);
        void ActualizarReagendado(RecordatorioLlamada recordatorioLlamada);
    }
}
