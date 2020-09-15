using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.RecordatorioLlamadaCommand
{
    public class CrearRecordatorioLlamadaCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdRecordatorioLlamada { get; set; }
        public int IdProspecto { get; set; }
        public int? IdCita { get; set; }
        public int IdRecordatorioLlamadaDispositivo { get; set; }
        public DateTime FechaRecordatorio { get; set; }
        public bool? FlagActivo { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Descripcion { get; set; }
        public short? AlertaMinutosAntes { get; set; }
        public short? CodigoLineaNegocio { get; set; }
        public DateTime AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }

        #endregion

        #region Relaciones
        public RecordatorioLlamadaProspectoCommand RecordatorioLlamadaProspectoCommand { get; set; }
        #endregion
    }

    public class RecordatorioLlamadaProspectoCommand
    {
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
    }
}
