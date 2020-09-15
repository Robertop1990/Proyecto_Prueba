using Agenda.API.Application.Queries.Calendario;
using Agenda.API.Application.Queries.Cita;
using Agenda.API.Application.Queries.ConsolidadoIntermediario;
using Agenda.API.Application.Queries.Generales;
using Agenda.API.Application.Queries.Prospecto;
using Autofac;

namespace Agenda.API.Infrastructure.AutofacModules
{
    public class QueriesModule : Autofac.Module
    {
        public string _queriesConnectionString { get; }
        public QueriesModule(string queriesConnectionString)
        {
            _queriesConnectionString = queriesConnectionString;
        }
        protected override void Load(ContainerBuilder builder)
        {
            builder.Register(c => new ConsolidadoIntermediarioQueries(_queriesConnectionString)).As<IConsolidadoIntermediarioQueries>().InstancePerLifetimeScope();
            builder.RegisterType<CitaQueries>()
                .As<ICitaQueries>()
                .InstancePerLifetimeScope();
            builder.RegisterType<ProspectoQueries>()
                .As<IProspectoQueries>()
                .InstancePerLifetimeScope();
            builder.RegisterType<CalendarioQueries>()
                .As<ICalendarioQueries>()
                .InstancePerLifetimeScope();
            builder.RegisterType<GeneralesQueries>()
                .As<IGeneralesQueries>()
                .InstancePerLifetimeScope();
        }
    }
}
