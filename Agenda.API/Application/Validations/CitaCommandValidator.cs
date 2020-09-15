
using Agenda.API.Application.Commands.CitaCommand;
using FluentValidation;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Agenda.API.Application.Validations
{
    public class CrearCitaCommandValidator : AbstractValidator<CrearCitaCommand>
    {
        public CrearCitaCommandValidator(ILogger<CrearCitaCommandValidator> logger)
        {
            RuleFor(command => command.IdProspecto).NotEmpty();
            RuleFor(command => command.CodigoEstado).NotEmpty();
            RuleFor(command => command.CodigoLineaNegocio).NotEmpty();
            RuleFor(command => command.NumeroEntrevista).NotEmpty();
            RuleFor(command => command.FechaCita).NotEmpty().GreaterThanOrEqualTo(DateTime.Today);
            RuleFor(command => command.NumeroEntrevista).NotEmpty();
            RuleFor(command => command.CodigoEstado).NotEmpty().Must(x => x == 2)
            .WithMessage("Si el numero de entrevista es igual a uno, la cita debe ser registrada con codigo estado 1 - Agendada");

            When(command => command.NumeroEntrevista == 1, () => {
                RuleFor(command => command.CodigoResultado).Must(x => x == 0)
                .WithMessage("Si el numero de entrevista es igual a uno, la cita debe ser registrada con codigo resultado 0 - Pendiente");
            });

            When(command => command.NumeroEntrevista >= 2, () => {
                RuleFor(command => command.CodigoResultado).NotEmpty().Must(x => x == 2)
                .WithMessage("Si el numero de entrevista es igual o mayor a dos, la cita debe ser registrada con codigo resultado 2 - Siguiente Etapa");
            });
            RuleFor(command => command.HoraInicio).NotEmpty();
            RuleFor(command => command.HoraFin).NotEmpty().GreaterThan(command => command.HoraInicio);

            When(commmand => commmand.CitaProspectoCommand != null, () =>
            {
                RuleFor(command => command.CitaProspectoCommand.TelefonoCelular).NotEmpty()
                                                   .When(command => string.IsNullOrEmpty(command.CitaProspectoCommand.TelefonoFijo));
                RuleFor(command => command.CitaProspectoCommand.TelefonoFijo).NotEmpty()
                                                       .When(command => string.IsNullOrEmpty(command.CitaProspectoCommand.TelefonoCelular));
            });

            
            RuleFor(command => command.Ubicacion).MaximumLength(100);
            RuleFor(command => command.ReferenciaUbicacion).MaximumLength(100);
            RuleFor(command => command.Descripcion).MaximumLength(100);
            RuleFor(command => command.AuditoriaFechaCreacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioCreacion).NotEmpty();
            RuleFor(command => command.CodigoIntermediarioCreacion).NotEmpty().WithMessage("No se esta enviando el codigo intermediario desde el header");
        }
    }
    public class ActualizarCitaCommandValidator : AbstractValidator<ActualizarCitaCommand>
    {
        public ActualizarCitaCommandValidator(ILogger<ActualizarCitaCommandValidator> logger)
        {
            RuleFor(command => command.IdCita).NotEmpty();
            RuleFor(command => command.AuditoriaFechaModificacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioModificacion).NotEmpty();
            When(command => !string.IsNullOrEmpty(command.Accion), () =>
            {
                RuleFor(command => command.Accion).Equal("Reagendada").WithMessage("La accion disponible es : Reagendada");
                RuleFor(command => command.CodigoMotivoReagendado).NotEmpty()
                .Must(x => (new List<short> { 1,3}).Contains(x.Value))
                .WithMessage("Para realizar un reagendamiento el codigo de motivo reagendado debe ser 1 o 3");
            });
        }
    }

    public class CalificarCitaCommandValidator : AbstractValidator<CalificarCitaCommand>
    {
        public CalificarCitaCommandValidator(ILogger<CalificarCitaCommand> logger)
        {
            RuleFor(command => command.IdCita).NotEmpty();
            RuleFor(command => command.FlagCalificacion).NotEmpty();
            RuleFor(command => command.CodigoTipoCalificacion)
                .NotEmpty().Must(x => (new List<short> { 1, 2 }).Contains(x.Value))
                .WithMessage("El tipo de calificacion debe ser codigo 1 : Concretado o codigo 2 : No Concretado");
            

            When(command => command.CodigoTipoCalificacion == 1, () =>
            {
                RuleFor(command => command.FlagPresentaAlgunaPropuestaSolucion).NotEmpty();
                When(command => command.FlagPresentaAlgunaPropuestaSolucion == true,()=>{
                    RuleFor(command => command.FlagConcretoVenta).NotEmpty();
                    When(command => command.FlagConcretoVenta == true, () =>
                    {
                        RuleFor(command => command.ProbabilidadCierre).NotEmpty().
                        Must(x => (new List<int> { 100 }).Contains(x.Value))
                        .WithMessage("La probabilidad de cierre para una venta concretada es 100");
                    }).Otherwise(() => 
                    {
                        RuleFor(command => command.ProbabilidadCierre).NotEmpty().WithMessage("Debe ingresar la probabilidad de cierre").
                        Must(x => (new List<int> { 25, 50, 75, 100 }).Contains(x.Value))
                        .WithMessage("El porcentaje ingresado no es el correcto");
                        RuleFor(command => command.FechaEstimadaCierre).NotEmpty().WithMessage("Debe ingresar la fecha estimada de cierre");
                    });
                }).Otherwise(()=> {
                    RuleFor(command => command.ProbabilidadCierre).
                        Must(x => (new List<int> { 0 }).Contains(x.Value))
                        .WithMessage("La probabilidad de cierre para una no propuesta de solucion es 0");
                });

                RuleFor(command => command.CodigoMotivoCitaNoConcretada).Empty();
                RuleFor(command => command.CodigoEstado).NotEmpty().Must(x => x == 3)
                .WithMessage("Al concretar la cita se debe actualizar con el codigo estado 3 - Realizada");
                RuleFor(command => command.CodigoResultado).NotEmpty().Must(x => x == 1)
                .WithMessage("Al concretar la cita se debe actualizar con el codigo resultado 1 - Cierre Venta");
            });

            When(command => command.CodigoTipoCalificacion == 2, () =>
            {
                RuleFor(command => command.FechaEstimadaCierre).Empty();
                RuleFor(command => command.CodigoTipoExperienciaCalificacion).Empty();
                RuleFor(command => command.CodigoPorcentajeAvanceCalificacion).Empty();
                RuleFor(command => command.CodigoMotivoCitaNoConcretada)
                .NotEmpty().Must(x => (new List<short> { 1, 2, 3, 4 }).Contains(x.Value));
                RuleFor(command => command.CodigoEstado).NotEmpty().Must(x => x == 3)
                .WithMessage("Al no concretar la cita la cita se debe actualizar con el codigo estado 3 - Realizada");
                RuleFor(command => command.CodigoResultado).NotEmpty().Must(x => x == 3)
                .WithMessage("Al no concretar la cita la cita se debe actualizar con el codigo resultado 3 - No interesado");
            });
        
            RuleFor(command => command.ComentarioCalificacion).MaximumLength(500);
            RuleFor(command => command.AuditoriaFechaModificacion).NotEmpty();
            RuleFor(command => command.AuditoriaUsuarioModificacion).NotEmpty();
        }
    }
}
