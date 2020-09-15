using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.ReunionCommand
{
    public class ActualizarReunionCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdReunion { get; set; }
        public DateTime FechaReunion { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public bool? FlagInvitadoGU { get; set; }
        public bool? FlagInvitadoGA { get; set; }
        public bool? FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion

        #region Auxiliares
        public string Accion { get; set; }
        #endregion
    }


}
