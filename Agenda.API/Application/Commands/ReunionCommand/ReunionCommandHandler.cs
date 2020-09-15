using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Agenda.Domain.AggregatesModel.ReunionAggegate;
using AutoMapper;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Agenda.API.Application.Commands.ReunionCommand
{
    public class ReunionCommandHandler : IRequestHandler<CrearReunionCommand, ResponseModel<EntidadDto>>,
                                         IRequestHandler<ActualizarReunionCommand, ResponseModel<EntidadDto>>                                     
    {
        private readonly IReunionRepository _reunionRepository;
        private readonly IMapper _mapper;

        public ReunionCommandHandler(IReunionRepository reunionRepository, IMapper mapper)
        {
            _reunionRepository = reunionRepository;
            _mapper = mapper;
        }

        public async Task<ResponseModel<EntidadDto>> Handle(CrearReunionCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();

            try
            {
                var reunion = _mapper.Map<Reunion>(request);
                _reunionRepository.Agregar(reunion);
                await _reunionRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = reunion.IdReunion, Mensaje = "Se registró correctamente la reunión" };

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

        public async Task<ResponseModel<EntidadDto>> Handle(ActualizarReunionCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();

            try
            {
                var reunion = _mapper.Map<Reunion>(request);

                if (string.IsNullOrEmpty(request.Accion))
                    _reunionRepository.Actualizar(reunion);                
                else
                    _reunionRepository.Eliminar(reunion);

                await _reunionRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = reunion.IdReunion, Mensaje = string.IsNullOrEmpty(request.Accion) ? "Se actualizó correctamente la reunión"
                                                                            : "Se elimino correctamente la reunion"};

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
