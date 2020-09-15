using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ReferidoEntityTypeConfiguration : IEntityTypeConfiguration<Referido>
    {
        public void Configure(EntityTypeBuilder<Referido> builder)
        {
            builder.ToTable("REFERIDO", AgendaContext.PROSPECTO_SCHEMA);
            builder.HasKey(x => x.IdReferido);
            
        }
    }
}
