using Agenda.API.Application.Commands.ProspectoCommand;
using FluentValidation;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace Agenda.API.Application.Validations
{
    public class CrearProspectoCommandValidator : AbstractValidator<CrearProspectoCommand>
    {
        public CrearProspectoCommandValidator(ILogger<CrearProspectoCommandValidator> logger)
        {
            RuleFor(command => command.NumeroDocumento).MaximumLength(12);
            RuleFor(command => command.Nombres).NotEmpty().WithMessage("El nombre no tiene el formato correcto").MaximumLength(50);
            RuleFor(command => command.ApellidoPaterno).NotEmpty().MaximumLength(40);
            RuleFor(command => command.ApellidoMaterno).MaximumLength(40);
            RuleFor(command => command.CodigoFuente).NotEmpty();
            RuleFor(command => command.Empresa).MaximumLength(50);
            RuleFor(command => command.OtroCargo).MaximumLength(50);
            RuleFor(command => command.TelefonoFijo).MaximumLength(15);
            RuleFor(command => command.TelefonoCelular).MaximumLength(15);
            RuleFor(command => command.CorreoElectronico1).MaximumLength(60);
            RuleFor(command => command.AuditoriaFechaCreacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioCreacion).NotEmpty();
            RuleFor(command => command.CodigoIntermediario).NotEmpty().WithMessage("No se esta enviando el codigo intermediario desde el header"); 


            When(command => command.ProspectoAdnRentaCommand != null, () => {
                RuleFor(command => command.ProspectoAdnRentaCommand.PorcentajeAvance).NotEmpty();
                RuleFor(command => command.ProspectoAdnRentaCommand.PorcentajeAvanceCompleto).NotEmpty();
                RuleFor(command => command.ProspectoAdnRentaCommand.AuditoriaFechaCreacion).NotEmpty();
                RuleFor(command => command.ProspectoAdnRentaCommand.AuditoriaUsuarioCreacion).NotEmpty();
            });

            When(command => command.ProspectoDireccionCommand != null, () => {
                RuleFor(command => command.ProspectoDireccionCommand.Direccion).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Departamento_Id).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Provincia_Id).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Distrito_Id).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.FlagActivo).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.AuditoriaFechaCreacion).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.AuditoriaUsuarioCreacion).NotEmpty();
            });
        }
    }

    public class ActualizarProspectoCommandValidator : AbstractValidator<ActualizarProspectoCommand>
    {
        public ActualizarProspectoCommandValidator(ILogger<ActualizarProspectoCommandValidator> logger)
        {
            RuleFor(command => command.IdProspecto).NotEmpty();
            RuleFor(command => command.NumeroDocumento).MaximumLength(12);
            RuleFor(command => command.Nombres).NotEmpty().MaximumLength(50);
            RuleFor(command => command.ApellidoPaterno).NotEmpty().MaximumLength(40);
            RuleFor(command => command.ApellidoMaterno).MaximumLength(40);
            RuleFor(command => command.CodigoFuente).NotEmpty();
            RuleFor(command => command.Empresa).MaximumLength(50);
            RuleFor(command => command.OtroCargo).MaximumLength(50);
            RuleFor(command => command.TelefonoFijo).MaximumLength(15);
            RuleFor(command => command.TelefonoCelular).MaximumLength(15);
            RuleFor(command => command.CorreoElectronico1).MaximumLength(60);
            RuleFor(command => command.AuditoriaFechaModificacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioModificacion).NotEmpty();


            When(command => command.ProspectoAdnRentaCommand != null, () => {
                RuleFor(command => command.ProspectoAdnRentaCommand.PorcentajeAvance).NotEmpty();
                RuleFor(command => command.ProspectoAdnRentaCommand.PorcentajeAvanceCompleto).NotEmpty();
                RuleFor(command => command.ProspectoAdnRentaCommand.AuditoriaFechaModificacion).NotEmpty();
                RuleFor(command => command.ProspectoAdnRentaCommand.AuditoriaUsuarioModificacion).NotEmpty();
            });

            When(command => command.ProspectoDireccionCommand != null, () => {
                RuleFor(command => command.ProspectoDireccionCommand.IdProspecto).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Direccion).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Departamento_Id).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Provincia_Id).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.Distrito_Id).NotEmpty();
                RuleFor(command => command.ProspectoDireccionCommand.TipoDireccion).NotEmpty()
                .Must(x => (new List<short> { 1,2 }).Contains(x.Value));

                When(command => command.ProspectoDireccionCommand.IdDireccion == 0, () => {
                    RuleFor(command => command.ProspectoDireccionCommand.AuditoriaFechaCreacion).NotEmpty();
                    RuleFor(command => command.ProspectoDireccionCommand.AuditoriaUsuarioCreacion).NotEmpty();
                    RuleFor(command => command.ProspectoDireccionCommand.FlagActivo).NotEmpty();
                });
            });
        }
    }

    public class DescartarProspectoCommandValidator : AbstractValidator<DescartarProspectoCommand>
    {
        public DescartarProspectoCommandValidator(ILogger<DescartarProspectoCommand> logger)
        {
            RuleFor(command => command.IdProspecto).NotEmpty();
            RuleFor(command => command.FlagDescarte).NotEmpty();
            When(command => command.CodigoMotivoUnoDescarte == 5, () =>
               {
                   RuleFor(command => command.CodigoMotivoDosDescarte)
                .NotEmpty().Must(x => (new List<short> { 11, 12,13 }).Contains(x.Value));
               });

            When(command => command.CodigoMotivoUnoDescarte == 7, () =>
            {
                RuleFor(command => command.CodigoMotivoDosDescarte)
                .NotEmpty().Must(x => (new List<short> { 14, 15 }).Contains(x.Value));
            });

            When(command => command.CodigoMotivoUnoDescarte == 8, () =>
            {
                RuleFor(command => command.CodigoMotivoDosDescarte)
                .NotEmpty().Must(x => (new List<short> { 16, 17,18,19 }).Contains(x.Value));
            });

            When(command => command.CodigoMotivoUnoDescarte == 9, () =>
            {
                RuleFor(command => command.CodigoMotivoDosDescarte)
                .NotEmpty().Must(x => (new List<short> { 20, 21, 22}).Contains(x.Value));
            });



        }
    }
}
