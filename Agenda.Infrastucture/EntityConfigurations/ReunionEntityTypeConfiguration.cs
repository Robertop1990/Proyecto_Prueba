using Agenda.Domain.AggregatesModel.ReunionAggegate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ReunionEntityTypeConfiguration : IEntityTypeConfiguration<Reunion>
    {
        public void Configure(EntityTypeBuilder<Reunion> builder)
        {
            builder.ToTable("REUNION", AgendaContext.PROSPECTO_SCHEMA);
            builder.HasKey(x => x.IdReunion);
        }
    }
}
