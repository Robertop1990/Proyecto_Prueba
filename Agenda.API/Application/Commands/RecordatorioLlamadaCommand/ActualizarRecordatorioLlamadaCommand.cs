using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.RecordatorioLlamadaCommand
{
    public class ActualizarRecordatorioLlamadaCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdRecordatorioLlamada { get; set; }
        public DateTime FechaRecordatorio { get; set; }
        public bool? FlagActivo { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Descripcion { get; set; }
        public short? AlertaMinutosAntes { get; set; }
        public short? CodigoLineaNegocio { get; set; }
        public DateTime AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion

        #region Auxiliares
        public string Accion { get; set; }
        #endregion
    }
}
