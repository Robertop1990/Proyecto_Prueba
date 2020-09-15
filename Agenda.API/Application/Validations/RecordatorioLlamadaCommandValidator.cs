using Agenda.API.Application.Commands.RecordatorioLlamadaCommand;
using FluentValidation;
using Microsoft.Extensions.Logging;

namespace Agenda.API.Application.Validations
{
    public class CrearRecordatorioLlamadaCommandValidator : AbstractValidator<CrearRecordatorioLlamadaCommand>
    {
        public CrearRecordatorioLlamadaCommandValidator(ILogger<CrearRecordatorioLlamadaCommand> logger)
        {
            RuleFor(command => command.IdProspecto).NotEmpty();
            RuleFor(command => command.CodigoLineaNegocio).NotEmpty();
            RuleFor(command => command.FechaRecordatorio).NotEmpty();
            RuleFor(command => command.HoraInicio).NotEmpty();
            RuleFor(command => command.HoraFin).NotEmpty();
            RuleFor(command => command.RecordatorioLlamadaProspectoCommand.TelefonoFijo).MaximumLength(15);
            RuleFor(command => command.RecordatorioLlamadaProspectoCommand.TelefonoCelular).MaximumLength(15);
            RuleFor(command => command.Descripcion).MaximumLength(100);
            RuleFor(command => command.AuditoriaFechaCreacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioCreacion).NotEmpty();
            RuleFor(command => command.RecordatorioLlamadaProspectoCommand.TelefonoCelular).NotEmpty()
                                                   .When(command => string.IsNullOrEmpty(command.RecordatorioLlamadaProspectoCommand.TelefonoFijo));
            RuleFor(command => command.RecordatorioLlamadaProspectoCommand.TelefonoFijo).NotEmpty()
                                                   .When(command => string.IsNullOrEmpty(command.RecordatorioLlamadaProspectoCommand.TelefonoCelular));
        }       
    }

    public class ActualizarRecordatorioLlamadaCommandValidator : AbstractValidator<ActualizarRecordatorioLlamadaCommand>
    {
        public ActualizarRecordatorioLlamadaCommandValidator(ILogger<ActualizarRecordatorioLlamadaCommandValidator> logger)
        {
            RuleFor(command => command.IdRecordatorioLlamada).NotEmpty();
            RuleFor(command => command.AuditoriaFechaModificacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioModificacion).NotEmpty();
            When(command => !string.IsNullOrEmpty(command.Accion), () =>
            {
                RuleFor(command => command.Accion).Equal("Reagendada").WithMessage("La accion disponible es : Reagendada");
            });
        }
    }
}
