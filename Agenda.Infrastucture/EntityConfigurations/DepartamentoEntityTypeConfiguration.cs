using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class DepartamentoEntityTypeConfiguration : IEntityTypeConfiguration<Departamento>
    {
        public void Configure(EntityTypeBuilder<Departamento> builder)
        {
            builder.ToTable("DEPARTAMENTO", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.Departamento_Id);
        }
    }
}
