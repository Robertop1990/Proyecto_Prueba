
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class TablaTablasEntityTypeConfiguration : IEntityTypeConfiguration<TablaTablas>
    {
        public void Configure(EntityTypeBuilder<TablaTablas> builder)
        {
            builder.ToTable("TABLA_TABLAS", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.IdTablaTablas);
        }
    }
}
