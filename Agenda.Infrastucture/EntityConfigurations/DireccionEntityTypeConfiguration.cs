
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class DireccionEntityTypeConfiguration : IEntityTypeConfiguration<DireccionProspecto>
    {
        public void Configure(EntityTypeBuilder<DireccionProspecto> builder)
        {
            builder.ToTable("DIRECCION_PROSPECTO", AgendaContext.RENTAS_SHEMA);
            builder.HasKey(x => x.IdDireccion);
        }
    }
}
