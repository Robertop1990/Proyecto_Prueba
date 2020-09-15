using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class AdnRentaEntityTypeConfiguration : IEntityTypeConfiguration<AdnRenta>
    {
        public void Configure(EntityTypeBuilder<AdnRenta> builder)
        {
            builder.ToTable("ADN_RENTA",AgendaContext.PROSPECTO_SCHEMA);
            builder.HasKey(x => x.IdProspecto);
        }
    }
}
