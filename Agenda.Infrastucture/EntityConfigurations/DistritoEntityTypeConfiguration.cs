using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class DistritoEntityTypeConfiguration : IEntityTypeConfiguration<Distrito>
    {
        public void Configure(EntityTypeBuilder<Distrito> builder)
        {
            builder.ToTable("DISTRITO", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.Departamento_Id);
            builder.HasKey(x => x.Provincia_Id);
            builder.HasKey(x => x.Distrito_Id);
            builder.HasOne(d => d.Provincia)
                                     .WithMany(p => p.Distritos)
                                     .HasForeignKey(d => d.Provincia_Id);
            builder.HasOne(di => di.Departamento)
                                     .WithMany(de => de.Distritos)
                                     .HasForeignKey(di => di.Departamento_Id);
        }
    }
}
