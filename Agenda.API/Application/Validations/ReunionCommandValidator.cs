using Agenda.API.Application.Commands.ReunionCommand;
using FluentValidation;
using Microsoft.Extensions.Logging;

namespace Agenda.API.Application.Validations
{
    public class CrearReunionCommandValidator : AbstractValidator<CrearReunionCommand>
    {
        public CrearReunionCommandValidator(ILogger<CrearReunionCommandValidator> logger)
        {
            RuleFor(command => command.IdConsolidadoIntermediario).NotEmpty().WithMessage("No se esta enviando el codigo intermediario desde el header");
            RuleFor(command => command.CodigoTipoReunion).NotEmpty();
            RuleFor(command => command.FechaReunion).NotEmpty();
            RuleFor(command => command.HoraInicio).NotEmpty();
            RuleFor(command => command.HoraFin).NotEmpty().GreaterThan(command => command.HoraInicio);
            RuleFor(command => command.Ubicacion).MaximumLength(100);
            RuleFor(command => command.ReferenciaUbicacion).MaximumLength(100);
            RuleFor(command => command.AuditoriaFechaCreacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioCreacion).NotEmpty();
        }      
    }

    public class ActualizarReunionCommandValidator : AbstractValidator<ActualizarReunionCommand>
    {
        public ActualizarReunionCommandValidator(ILogger<ActualizarReunionCommand> logger)
        {
            RuleFor(command => command.IdReunion).NotEmpty();
            RuleFor(command => command.FechaReunion).NotEmpty();
            RuleFor(command => command.HoraInicio).NotEmpty();
            RuleFor(command => command.HoraFin).NotEmpty().GreaterThan(command => command.HoraInicio);
            RuleFor(command => command.AuditoriaFechaModificacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioModificacion).NotEmpty();
            When(command => !string.IsNullOrEmpty(command.Accion), () =>
            {
                RuleFor(command => command.Accion).Equal("Eliminar").WithMessage("La accion disponible es : Eliminar");
            });
        }
    }

}
