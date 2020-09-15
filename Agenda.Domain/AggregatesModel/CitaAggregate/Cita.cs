
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.CitaAggregate
{
    public class Cita : IAggregateRoot
    {
        #region Propiedades
        public int IdCita { get; set; }
        public int IdProspecto { get; set; }
        public int IdCitaDispositivo { get; set; }
        public int? IdGrupoProducto { get; set; }
        public int NumeroEntrevista { get; set; }
        public short CodigoEstado { get; set; }
        public short? CodigoResultado { get; set; }
        public DateTime? FechaCita { get; set; }
        public TimeSpan? HoraInicio { get; set; }
        public TimeSpan? HoraFin { get; set; }
        public string Ubicacion { get; set; }
        public short? CodigoDepartamento { get; set; }
        public short? CodigoProvincia { get; set; }
        public short? CodigoDistrito { get; set; }
        public string ReferenciaUbicacion { get; set; }
        public bool? FlagInvitadoGU { get; set; }
        public bool? FlagInvitadoGA { get; set; }
        public short? AlertaMinutosAntes { get; set; }
        public int CodigoIntermediarioCreacion { get; set; }
        public int? CodigoIntermediarioModificacion { get; set; }
        public short CodigoEtapaProspecto { get; set; }
        public short? CodigoMotivoReagendado { get; set; }
        public short? CodigoMotivoDescarte { get; set; }   
        public short? CodigoLineaNegocio { get; set; }
        public string Descripcion { get; set; }
        public bool? FlagCalificacion { get; set; }
        public short? CodigoTipoCalificacion { get; set; }
        public short? CodigoTipoExperienciaCalificacion { get; set; }
        public short? CodigoMotivoCitaNoConcretada { get; set; }
        public short? CodigoPorcentajeAvanceCalificacion { get; set; }
        public bool? FlagUrlTeams { get; set; }
        public string UrlTeams { get; set; }
        public DateTime? FechaEstimadaCierre { get; set; }
        public string ComentarioCalificacion { get; set; }
        public bool? FlagRealizadoAdnExpress { get; set; }
        public bool? FlagPresentaAlgunaPropuestaSolucion { get; set; }
        public bool? FlagConcretoVenta { get; set; }
        public int? ProbabilidadCierre { get; set; }
        public short? MonedaPrima { get; set; }
        public decimal? MontoPrima { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }


        #endregion

        #region Relaciones
        public Prospecto Prospecto { get; set; }
        public RecordatorioLlamada RecordatorioLlamada { get; set; }
        #endregion
    }
}
