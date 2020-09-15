
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.ProspectoCommand
{
    public class DescartarProspectoCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdProspecto { get; set; }
        public bool FlagDescarte { get; set; }
        public short? CodigoMotivoUnoDescarte { get; set; }
        public short? CodigoMotivoDosDescarte { get; set; }
        public short? CodigoMotivoTresDescarte { get; set; }
        public string TextoMontivoTresDescarte { get; set; }
        public DateTime? FechaMotivoTresDescarte { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion
    }
}
