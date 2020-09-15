using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using AutoMapper;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;
using Agenda.Domain.AggregatesModel.CitaAggregate;

namespace Agenda.API.Application.Commands.ProspectoCommand
{
    public class ProspectoCommandHandler : IRequestHandler<CrearProspectoCommand, ResponseModel<EntidadDto>>,
                                                IRequestHandler<ActualizarProspectoCommand,ResponseModel<EntidadDto>>,
                                                IRequestHandler<DescartarProspectoCommand,ResponseModel<EntidadDto>>
    {
        private readonly IProspectoRepository _prospectoRepository;
        private readonly ICitaRepository _citaRepository;
        private readonly IMapper _mapper;

        public ProspectoCommandHandler(IProspectoRepository prospectoRepository,ICitaRepository citaRepository, IMapper mapper)
        {
            _prospectoRepository = prospectoRepository;
            _citaRepository = citaRepository;
            _mapper = mapper;
        }

        public async Task<ResponseModel<EntidadDto>> Handle(CrearProspectoCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();
          
            if (request.IdConsolidadoIntermediario == 0)
            {
                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.SinDatos, string.Format("No se encontro el codigo intermediario : {0}", request.CodigoIntermediario.ToString()));
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                return response;
            }

            try
            {  
                var prospecto = _mapper.Map<Prospecto>(request);
                _prospectoRepository.Agregar(prospecto);
                await _prospectoRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = prospecto.IdProspecto, Mensaje = "Se registro correctamente el prospecto"};

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

        public async Task<ResponseModel<EntidadDto>> Handle(ActualizarProspectoCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();
            try
            {
                var prospecto = _mapper.Map<Prospecto>(request);
                _prospectoRepository.Actualizar(prospecto);
                await _prospectoRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = prospecto.IdProspecto, Mensaje = "Se actualizo correctamente el prospecto" };

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

        public async Task<ResponseModel<EntidadDto>> Handle(DescartarProspectoCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();
            try
            {
                var prospecto = _mapper.Map<Prospecto>(request);
                _prospectoRepository.Descartar(prospecto);

                //Calificamos citas agendadas de proximos dias como no concretadas 
                _citaRepository.CalificarMultipleCitaNoConcretada(request.IdProspecto, request.TextoMontivoTresDescarte);
                
                await _prospectoRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = prospecto.IdProspecto, Mensaje = "Se descarto correctamente el prospecto" };

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
