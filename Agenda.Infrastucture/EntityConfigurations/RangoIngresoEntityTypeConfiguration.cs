using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class RangoIngresoEntityTypeConfiguration : IEntityTypeConfiguration<RangoIngreso>
    {
        public void Configure(EntityTypeBuilder<RangoIngreso> builder)
        {
            builder.ToTable("RANGO_INGRESO", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.CodigoRangoIngreso);
        }
    }
}
