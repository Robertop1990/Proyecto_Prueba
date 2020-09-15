using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.AggregatesModel.ReunionAggegate;
using Agenda.Infrastucture.Repositories;
using Autofac;

namespace Agenda.API.Infrastructure.AutofacModules
{
    public class RepositoryModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<ProspectoRepository>().As<IProspectoRepository>().InstancePerLifetimeScope();
            builder.RegisterType<CitaRepository>().As<ICitaRepository>().InstancePerLifetimeScope();
            builder.RegisterType<ReunionRepository>().As<IReunionRepository>().InstancePerLifetimeScope();
            builder.RegisterType<RecordatorioLlamadaRepository>().As<IRecordatorioLlamadaRepository>().InstancePerLifetimeScope();
        }
    }
}
