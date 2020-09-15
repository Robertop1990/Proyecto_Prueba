using Agenda.Domain.AggregatesModel.CitaAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ActividadEntityTypeConfiguration : IEntityTypeConfiguration<Actividad>
    {
        public void Configure(EntityTypeBuilder<Actividad> builder)
        {
            builder.ToTable("ACTIVIDAD", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.IdActividad);
        }
    }
}
