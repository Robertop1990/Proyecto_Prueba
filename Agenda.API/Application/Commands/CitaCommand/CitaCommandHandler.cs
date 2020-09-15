using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Agenda.Domain.AggregatesModel.CitaAggregate;
using AutoMapper;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;

namespace Agenda.API.Application.Commands.CitaCommand
{
    public class CitaCommandHandler : IRequestHandler<CrearCitaCommand, ResponseModel<EntidadDto>>,
                                      IRequestHandler<ActualizarCitaCommand,ResponseModel<EntidadDto>>,
                                      IRequestHandler<CalificarCitaCommand,ResponseModel<EntidadDto>>
    {
        private readonly ICitaRepository _citaRepository;
        private readonly IProspectoRepository _prospectoRepository;
        private readonly IMapper _mapper;

        public CitaCommandHandler(ICitaRepository citaRepository, IMapper mapper,IProspectoRepository prospectoRepository)
        {
            _citaRepository = citaRepository;
            _prospectoRepository = prospectoRepository;
            _mapper = mapper;
        }

        public async Task<ResponseModel<EntidadDto>> Handle(CrearCitaCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();

            try
            { 
                var cita = _mapper.Map<Cita>(request);
                _citaRepository.Agregar(cita);

                //Activamos el prospecto si se encuentra descartado
                Prospecto prospecto = new Prospecto(request.IdProspecto,
                                                    request.CitaProspectoCommand != null ? request.CitaProspectoCommand.TelefonoCelular : "",
                                                    request.CitaProspectoCommand != null ? request.CitaProspectoCommand.TelefonoFijo : "",
                                                    request.AuditoriaFechaCreacion, request.AuditoriaUsuarioCreacion);
                _prospectoRepository.ActivarProspecto(prospecto);

                await _citaRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = cita.IdCita, Mensaje = "Se registro correctamente la cita" };

                return await Task.Run(() => {
                    return response;
                });
            }
            catch (Exception ex)
            {
                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.ErrorInesperado, ex.InnerException.Message.ToString());
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };

                return await Task.Run(() => {
                    return response;
                });
            }
        }
        public async Task<ResponseModel<EntidadDto>> Handle(ActualizarCitaCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();
            try
            {
                var cita = _mapper.Map<Cita>(request);
                if (!string.IsNullOrEmpty(request.Accion))
                    _citaRepository.ActualizarReagendado(cita);
                else
                    _citaRepository.Actualizar(cita);

                await _citaRepository.UnitOfWork.SaveChangesAsync(cancellationToken);
                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = cita.IdCita, Mensaje = "Se actualizo correctamente la cita"};

                return await Task.Run(() => {
                    return response;
                });
            }
            catch (Exception ex)
            {
                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.ErrorInesperado,ex.InnerException.Message.ToString());
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };

                return await Task.Run(() => {
                    return response;
                });
            }
        }

        public async Task<ResponseModel<EntidadDto>> Handle(CalificarCitaCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();
            try
            {
                var cita = _mapper.Map<Cita>(request);
                if (request.CodigoMotivoCitaNoConcretada == TablaMotivoCitaNoConcretada.NoDeseaContinuar)
                {
                    Prospecto prospecto = new Prospecto(request.IdProspecto,request.FlagDescarte,request.CodigoMotivoUnoDescarte, request.CodigoMotivoDosDescarte, request.CodigoMotivoTresDescarte,
                              request.TextoMontivoTresDescarte, request.FechaMotivoTresDescarte, request.AuditoriaFechaModificacion, request.AuditoriaUsuarioModificacion);

                    //Descartamos el prospecto
                    _prospectoRepository.Descartar(prospecto);
                }
                _citaRepository.Calificar(cita);
                await _citaRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = cita.IdCita, Mensaje = "Se califico correctamente la cita" };

                return await Task.Run(() => {
                    return response;
                });
            }
            catch (Exception ex)
            {
                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.ErrorInesperado, ex.InnerException.Message.ToString());
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };

                return await Task.Run(() => {
                    return response;
                });
            }
        }
    }
}
