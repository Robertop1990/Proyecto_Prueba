
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using Agenda.API.Application.Comun;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using AutoMapper;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Agenda.API.Application.Commands.RecordatorioLlamadaCommand
{
    public class RecordatorioLlamadaCommandHandler : IRequestHandler<CrearRecordatorioLlamadaCommand, ResponseModel<EntidadDto>>,
                                                     IRequestHandler<ActualizarRecordatorioLlamadaCommand,ResponseModel<EntidadDto>>
    {
        private readonly IRecordatorioLlamadaRepository _recordatorioLlamadaRepository;
        private readonly IMapper _mapper;

        public RecordatorioLlamadaCommandHandler(IRecordatorioLlamadaRepository recordatorioLlamadaRepository, IMapper mapper)
        {
            _recordatorioLlamadaRepository = recordatorioLlamadaRepository;
            _mapper = mapper;
        }
        public async Task<ResponseModel<EntidadDto>> Handle(CrearRecordatorioLlamadaCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();

            try
            {
                var recordatorioLlamada = _mapper.Map<RecordatorioLlamada>(request);
                _recordatorioLlamadaRepository.Agregar(recordatorioLlamada);
                await _recordatorioLlamadaRepository.UnitOfWork.SaveEntitiesAsync(cancellationToken);

                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = recordatorioLlamada.IdRecordatorioLlamada, Mensaje = "Se registro correctamente el recordatorio de llamada" };

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

        public async Task<ResponseModel<EntidadDto>> Handle(ActualizarRecordatorioLlamadaCommand request, CancellationToken cancellationToken)
        {
            ResponseModel<EntidadDto> response = new ResponseModel<EntidadDto>();
            ResponseService responseService;
            ConfigurationHelper configuration = new ConfigurationHelper();
            try
            {
                var recordatorioLlamada = _mapper.Map<RecordatorioLlamada>(request);
                if (!string.IsNullOrEmpty(request.Accion))
                    _recordatorioLlamadaRepository.ActualizarReagendado(recordatorioLlamada);
                else
                    _recordatorioLlamadaRepository.Actualizar(recordatorioLlamada);

                await _recordatorioLlamadaRepository.UnitOfWork.SaveChangesAsync(cancellationToken);
                responseService = configuration.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = new EntidadDto { Id = recordatorioLlamada.IdProspecto, Mensaje = "Se actualizo correctamente el recordatorio llamada" };

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
