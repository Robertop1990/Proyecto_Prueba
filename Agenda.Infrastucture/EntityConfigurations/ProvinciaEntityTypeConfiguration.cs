using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ProvinciaEntityTypeConfiguration : IEntityTypeConfiguration<Provincia>
    {
        public void Configure(EntityTypeBuilder<Provincia> builder)
        {
            builder.ToTable("PROVINCIA", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.Provincia_Id);
            builder.HasKey(x => x.Departamento_Id);
            builder.HasOne(p => p.Departamento)
                                     .WithMany(de => de.Provincias)
                                     .HasForeignKey(p => p.Departamento_Id);
        }
    }
}
