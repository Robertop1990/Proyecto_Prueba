
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class RangoEdadEntityTypeConfiguration : IEntityTypeConfiguration<RangoEdad>
    {
        public void Configure(EntityTypeBuilder<RangoEdad> builder)
        {
            builder.ToTable("RANGO_EDAD", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.CodigoRangoEdad);
        }
    }
}
