using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Agenda.Infrastucture.EntityConfigurations
{
    class ListaTablaEntityTypeConfiguration : IEntityTypeConfiguration<ListaTabla>
    {
        public void Configure(EntityTypeBuilder<ListaTabla> builder)
        {
            builder.ToTable("LISTA_TABLA", AgendaContext.GENERALES_SCHEMA);
            builder.HasKey(x => x.IdListaTabla);
        }
    }
}
