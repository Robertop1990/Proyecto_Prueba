using Agenda.API.Application.Commands.ProspectoCommand;
using Autofac;
using MediatR;
using System.Reflection;

namespace Agenda.API.Infrastructure.AutofacModules
{
    public class CommandsModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(typeof(CrearProspectoCommand).GetTypeInfo().Assembly).AsClosedTypesOf(typeof(IRequestHandler<,>));
           
        }
    }
}
