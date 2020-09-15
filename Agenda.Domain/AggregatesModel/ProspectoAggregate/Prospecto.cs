using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.SeedWork;
using System;

namespace Agenda.Domain.AggregatesModel.ProspectoAggregate
{
    public class Prospecto : IAggregateRoot
    {
        #region Propiedades
        public int IdConsolidadoIntermediario { get; set; }
        public int IdProspecto { get; set; }
        public short? CodigoTipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public short? CodigoRangoEdad { get; set; }
        public short? CodigoRangoIngreso { get; set; }
        public short? CodigoSexo { get; set; }
        public short? MonedaFondo { get; set; }
        public decimal? MontoFondo { get; set; }
        public bool? FlagHijo { get; set; }
        public string Empresa { get; set; }
        public short? CodigoCargo { get; set; }
        public string OtroCargo { get; set; }
        public short? CodigoFuente { get; set; }
        public short? CodigoSubFuente { get; set; }
        public string CorreoElectronico1 { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public short CodigoEstado { get; set; }
        public short CodigoEtapa { get; set; }
        public int? IdReferenciador { get; set; }
        public string Referenciador { get; set; }
        public bool? FlagDescarte { get; set; }
        public short? CodigoMotivoUnoDescarte { get; set; }
        public short? CodigoMotivoDosDescarte { get; set; }
        public short? CodigoMotivoTresDescarte { get; set; }
        public string TextoMontivoTresDescarte { get; set; }
        public short? CodigoRangoFondo { get; set; }
        public DateTime? FechaMotivoTresDescarte { get; set; }
        public DateTime? AuditoriaFechaCreacion { get; set; }
        public string AuditoriaUsuarioCreacion { get; set; }
        public DateTime? AuditoriaFechaModificacion { get; set; }
        public string AuditoriaUsuarioModificacion { get; set; }     

        #endregion


        #region Relaciones
        public AdnRenta AdnRenta { get; set; }
        public Cita Cita { get; set; }
        public RecordatorioLlamada RecordatorioLlamada { get; set; }
        public DireccionProspecto DireccionProspecto { get; set; }
        public Referido Referido { get; set; }
        #endregion

        #region Constructores

        public Prospecto()
        {
              
        }

        //Constructor Descartar Prospecto
        public Prospecto(int IdProspecto, bool? FlagDescarte, short? CodigoMotivoUnoDescarte,short? CodigoMotivoDosDescarte,short? CodigoMotivoTresDescarte,
                         string TextoMontivoTresDescarte,DateTime? FechaMotivoTresDescarte,DateTime? AuditoriaFechaModificacion, string AuditoriaUsuarioModificacion
                         )
        {
            this.IdProspecto = IdProspecto;
            this.FlagDescarte = FlagDescarte;
            this.CodigoMotivoUnoDescarte = CodigoMotivoUnoDescarte;
            this.CodigoMotivoDosDescarte = CodigoMotivoDosDescarte;
            this.CodigoMotivoTresDescarte = CodigoMotivoTresDescarte;
            this.TextoMontivoTresDescarte = TextoMontivoTresDescarte;
            this.FechaMotivoTresDescarte = FechaMotivoTresDescarte;
            this.AuditoriaUsuarioModificacion = AuditoriaUsuarioModificacion;
            this.AuditoriaFechaModificacion = AuditoriaFechaModificacion;
        }

        public Prospecto(int IdProspecto,string TelefonoCelular,string TelefonoFijo,DateTime? AuditoriaFechaModificacion, string AuditoriaUsuarioModificacion)
        {
            this.IdProspecto = IdProspecto;
            this.TelefonoCelular = TelefonoCelular;
            this.TelefonoFijo = TelefonoFijo;
            this.AuditoriaUsuarioModificacion = AuditoriaUsuarioModificacion;
            this.AuditoriaFechaModificacion = AuditoriaFechaModificacion;
        }
        #endregion
    }
}
