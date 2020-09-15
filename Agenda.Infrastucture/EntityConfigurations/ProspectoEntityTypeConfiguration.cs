using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ProspectoEntityTypeConfiguration : IEntityTypeConfiguration<Prospecto>
    {
        public void Configure(EntityTypeBuilder<Prospecto> builder)
        {
            builder.ToTable("PROSPECTO", AgendaContext.PROSPECTO_SCHEMA);
            builder.HasKey(x => x.IdProspecto);
            builder.HasOne(a => a.AdnRenta)
                            .WithOne(b => b.Prospecto)
                            .HasForeignKey<AdnRenta>(b => b.IdProspecto);
            builder.HasOne(a => a.Cita)
                            .WithOne(b => b.Prospecto)
                            .HasForeignKey<Cita>(b => b.IdProspecto);
            builder.HasOne(a => a.RecordatorioLlamada)
                            .WithOne(b => b.Prospecto)
                            .HasForeignKey<RecordatorioLlamada>(b => b.IdProspecto);
            builder.HasOne(a => a.DireccionProspecto)
                            .WithOne(b => b.Prospecto)
                            .HasForeignKey<DireccionProspecto>(b => b.IdProspecto);
            builder.HasOne(p => p.Referido)
                            .WithOne(r => r.Prospecto)
                            .HasForeignKey<Referido>(r => r.IdProspecto);

        }
    }
}
