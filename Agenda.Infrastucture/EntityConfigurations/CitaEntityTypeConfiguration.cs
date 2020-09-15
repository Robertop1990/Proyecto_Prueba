
using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class CitaEntityTypeConfiguration : IEntityTypeConfiguration<Cita>
    {
        public void Configure(EntityTypeBuilder<Cita> builder)
        {
            builder.ToTable("CITA", AgendaContext.PROSPECTO_SCHEMA);
            builder.HasKey(x => x.IdCita);
            builder.HasOne(a => a.RecordatorioLlamada)
                            .WithOne(b => b.Cita)
                            .HasForeignKey<RecordatorioLlamada>(b => b.IdCita);
        }
    }
}
