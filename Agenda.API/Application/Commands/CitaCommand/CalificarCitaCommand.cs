using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Dtos.Response;
using MediatR;
using System;

namespace Agenda.API.Application.Commands.CitaCommand
{
    public class CalificarCitaCommand : IRequest<ResponseModel<EntidadDto>>
    {
        #region Propiedades
        public int IdCita { get; set; }
        public int IdProspecto { get; set; }
        public bool? FlagCalificacion { get; set; }
        public short? CodigoTipoCalificacion { get; set; }
        public short? CodigoTipoExperienciaCalificacion { get; set; }
        public short? CodigoMotivoCitaNoConcretada { get; set; }
        public short? CodigoPorcentajeAvanceCalificacion { get; set; }
        public DateTime? FechaEstimadaCierre { get; set; }
        public string ComentarioCalificacion { get; set; }
        public short CodigoEstado { get; set; }
        public short CodigoResultado { get; set; }
        public bool FlagDescarte { get; set; }
        public short? CodigoMotivoUnoDescarte { get; set; }
        public short? CodigoMotivoDosDescarte { get; set; }
        public short? CodigoMotivoTresDescarte { get; set; }
        public string TextoMontivoTresDescarte { get; set; }
        public bool? FlagRealizadoAdnExpress { get; set; }
        public bool? FlagPresentaAlgunaPropuestaSolucion { get; set; }
        public bool? FlagConcretoVenta { get; set; }
        public int? ProbabilidadCierre { get; set; }
        public short? MonedaPrima { get; set; }
        public decimal? MontoPrima { get; set; }
        public DateTime? FechaMotivoTresDescarte { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }

        #endregion
    }
}
