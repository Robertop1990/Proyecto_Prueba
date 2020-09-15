
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;
using System.Runtime.Serialization;
using System.Text.Json.Serialization;

namespace Agenda.API.Application.Commands.CitaCommand
{
    public class CrearCitaCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdProspecto { get; set; }
        public int IdCitaDispositivo { get; set; }
        public int? IdGrupoProducto { get; set; }
        public int NumeroEntrevista { get; set; }
        public short CodigoEstado { get; set; }
        public short CodigoResultado { get; set; }
        public DateTime? FechaCita { get; set; }
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
        public short CodigoEtapaProspecto { get; set; }
        public short? CodigoMotivoDescarte { get; set; }
        public int? PorcentajeAvance { get; set; }
        public short CodigoLineaNegocio { get; set; }
        public bool? FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }

        #endregion

        #region Relaciones
        public CitaProspectoCommand CitaProspectoCommand { get; set; }
        #endregion

        #region Auxiliares
        [JsonIgnore]
        [IgnoreDataMember]
        public int CodigoIntermediarioCreacion { get; set; }
        #endregion
    }

    public class CitaProspectoCommand
    {
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
    }
}
