using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Agenda.API.Application.Commands.CitaCommand
{
    public class ActualizarCitaCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdCita { get; set; }
        public DateTime? FechaCita { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public short? CodigoMotivoReagendado { get; set; }
        public bool? FlagInvitadoGU { get; set; }
        public bool? FlagInvitadoGA { get; set; }
        public bool? FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion

        #region PropiedadesNoMostradas
        [JsonIgnore]
        [IgnoreDataMember]
        public int? CodigoIntermediarioModificacion { get; set; }
        #endregion

        #region Auxiliares
        public string Accion { get; set; }
        #endregion
    }
}
