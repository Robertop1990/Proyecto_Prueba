
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ConsolidadoIntermediarioEntityTypeConfiguration : IEntityTypeConfiguration<ConsolidadoIntermediario>
    {
        public void Configure(EntityTypeBuilder<ConsolidadoIntermediario> builder)
        {
            builder.ToTable("CONSOLIDADO_INTERMEDIARIO", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.IdConsolidadoIntermediario);
        }
    }
}
