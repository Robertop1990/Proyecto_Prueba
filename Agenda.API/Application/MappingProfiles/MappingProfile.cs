using Agenda.API.Application.Commands.CitaCommand;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Commands.RecordatorioLlamadaCommand;
using Agenda.API.Application.Commands.ReunionCommand;
using Agenda.API.Application.Dtos.Response;
using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.AggregatesModel.ReunionAggegate;
using AutoMapper;

namespace Agenda.API.Application.MappingProfiles
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            #region Prospecto

            CreateMap<ProspectoAdnRentaCommand, AdnRenta>();
            CreateMap<ProspectoDireccionCommand, DireccionProspecto>();
            CreateMap<CrearProspectoCommand, Prospecto>()
                .ForMember(destino => destino.AdnRenta, x => x.MapFrom(origen => origen.ProspectoAdnRentaCommand))
                .ForMember(destino => destino.DireccionProspecto, x => x.MapFrom(origen => origen.ProspectoDireccionCommand));
            CreateMap<ActualizarProspectoCommand, Prospecto>()
                .ForMember(destino => destino.AdnRenta, x => x.MapFrom(origen => origen.ProspectoAdnRentaCommand))
                .ForMember(destino => destino.DireccionProspecto, x => x.MapFrom(origen => origen.ProspectoDireccionCommand));
            CreateMap<DescartarProspectoCommand, Prospecto>();

            CreateMap<Prospecto, ProspectoDto>();

            #endregion

            #region Cita
            CreateMap<CitaProspectoCommand, Prospecto>();
            CreateMap<CrearCitaCommand, Cita>()
                .ForMember(destino => destino.Prospecto, x => x.MapFrom(origen => origen.CitaProspectoCommand));

            CreateMap<ActualizarCitaCommand, Cita>();
            CreateMap<CalificarCitaCommand, Cita>();
            #endregion

            #region RecordatorioLlamada
            CreateMap<RecordatorioLlamadaProspectoCommand, Prospecto>();
            CreateMap<CrearRecordatorioLlamadaCommand, RecordatorioLlamada>()
                .ForMember(destino => destino.Prospecto, x => x.MapFrom(origen => origen.RecordatorioLlamadaProspectoCommand));
            
            CreateMap<ActualizarRecordatorioLlamadaCommand, RecordatorioLlamada>();
            #endregion

            #region Reunion
            CreateMap<CrearReunionCommand, Reunion>();
            CreateMap<ActualizarReunionCommand,Reunion>();
            #endregion

        }
    }
}
