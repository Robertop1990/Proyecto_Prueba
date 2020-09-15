using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.ReunionCommand
{
    public class CrearReunionCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdConsolidadoIntermediario { get; set; }
        public int IdReunionDispositivo { get; set; }
        public short? CodigoTipoReunion { get; set; }
        public DateTime FechaReunion { get; set; }
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public string ReferenciaUbicacion { get; set; }
        public bool? FlagInvitadoGU { get; set; }
        public bool? FlagInvitadoGA { get; set; }
        public string Descripcion { get; set; }
        public short? AlertaMinutosAntes { get; set; }
        public bool? FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }

        #endregion
    }
}
