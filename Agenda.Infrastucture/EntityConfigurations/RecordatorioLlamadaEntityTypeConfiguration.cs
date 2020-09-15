
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class RecordatorioLlamadaEntityTypeConfiguration : IEntityTypeConfiguration<RecordatorioLlamada>
    {
        public void Configure(EntityTypeBuilder<RecordatorioLlamada> builder)
        {
            builder.ToTable("RECORDATORIO_LLAMADA", AgendaContext.PROSPECTO_SCHEMA);
            builder.HasKey(x => x.IdRecordatorioLlamada);
        }
    }
}
