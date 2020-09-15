using Agenda.API.Application.Commands.CitaCommand;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Commands.RecordatorioLlamadaCommand;
using Agenda.API.Application.Commands.ReunionCommand;
using Agenda.API.Application.Validations;
using Autofac;
using FluentValidation;

namespace Agenda.API.Infrastructure.AutofacModules
{
    public class ValidatorModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            #region Prospecto
            builder.RegisterType<CrearProspectoCommandValidator>().As<AbstractValidator<CrearProspectoCommand>>().AsImplementedInterfaces();
            builder.RegisterType<ActualizarProspectoCommandValidator>().As<AbstractValidator<ActualizarProspectoCommand>>().AsImplementedInterfaces();
            builder.RegisterType<DescartarProspectoCommandValidator>().As<AbstractValidator<DescartarProspectoCommand>>().AsImplementedInterfaces();
            #endregion

            #region Cita
            builder.RegisterType<CrearCitaCommandValidator>().As<AbstractValidator<CrearCitaCommand>>().AsImplementedInterfaces();
            builder.RegisterType<CalificarCitaCommandValidator>().As<AbstractValidator<CalificarCitaCommand>>().AsImplementedInterfaces();
            builder.RegisterType<ActualizarCitaCommandValidator>().As<AbstractValidator<ActualizarCitaCommand>>().AsImplementedInterfaces();
            #endregion

            #region RecordatorioLlamada
            builder.RegisterType<CrearRecordatorioLlamadaCommandValidator>().As<AbstractValidator<CrearRecordatorioLlamadaCommand>>().AsImplementedInterfaces();
            builder.RegisterType<ActualizarRecordatorioLlamadaCommandValidator>().As<AbstractValidator<ActualizarRecordatorioLlamadaCommand>>().AsImplementedInterfaces();
            #endregion

            #region Reunion
            builder.RegisterType<CrearReunionCommandValidator>().As<AbstractValidator<CrearReunionCommand>>().AsImplementedInterfaces();
            builder.RegisterType<ActualizarReunionCommandValidator>().As<AbstractValidator<ActualizarReunionCommand>>().AsImplementedInterfaces();
            #endregion
        }
    }
}
