using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.SeedWork;
using System;
using System.Linq;

namespace Agenda.Infrastucture.Repositories
{
    public class CitaRepository : ICitaRepository
    {
        private readonly AgendaContext _context;
        public IUnitOfWork UnitOfWork { get { return _context; } }
        public CitaRepository(AgendaContext context) => _context = context ?? throw new ArgumentNullException(nameof(context));
        public void Agregar(Cita cita)
        {
            cita.AuditoriaFechaCreacion = DateTime.Now;
            cita.Prospecto = null;
            _context.Citas.Add(cita);
        }
        public void Actualizar(Cita cita)
        {
            var response = _context.Citas.Where(x => x.IdCita == cita.IdCita).FirstOrDefault();

            if(response != null)
            {
                response.Ubicacion = cita.Ubicacion;
                response.CodigoDepartamento = cita.CodigoDepartamento;
                response.CodigoProvincia = cita.CodigoProvincia;
                response.CodigoDistrito = cita.CodigoDistrito;
                response.FechaCita = cita.FechaCita;
                response.HoraInicio = cita.HoraInicio;
                response.HoraFin = cita.HoraFin;              
                response.CodigoMotivoReagendado = cita.CodigoMotivoReagendado;
                response.FlagInvitadoGA = cita.FlagInvitadoGA;
                response.FlagInvitadoGU = cita.FlagInvitadoGU;
                response.FlagUrlTeams = cita.FlagUrlTeams;
                response.UrlTeams = cita.UrlTeams;
                response.AuditoriaFechaModificacion = DateTime.Now;
                response.AuditoriaUsuarioModificacion = cita.AuditoriaUsuarioModificacion;
            }
        }

        public void ActualizarReagendado(Cita cita)
        {
            var response = ObtenerCitaPorId(cita.IdCita);
            if(response != null)
            {
                //Agregamos la nueva cita
                response.CodigoMotivoReagendado = null;
                response.FechaCita = cita.FechaCita;
                response.HoraInicio = cita.HoraInicio;
                response.HoraFin = cita.HoraFin;
                response.Ubicacion = !string.IsNullOrEmpty(cita.Ubicacion) ? cita.Ubicacion : response.Ubicacion;
                response.CodigoDepartamento = cita.CodigoDepartamento.HasValue ? cita.CodigoDepartamento: response.CodigoDepartamento;
                response.CodigoProvincia = cita.CodigoProvincia.HasValue ?cita.CodigoProvincia: response.CodigoProvincia;
                response.CodigoDistrito = cita.CodigoDistrito.HasValue ? cita.CodigoDistrito: response.CodigoDistrito;
                response.FlagUrlTeams = cita.FlagUrlTeams;
                response.UrlTeams = cita.UrlTeams;
                response.AuditoriaFechaCreacion = DateTime.Now;
                response.AuditoriaUsuarioCreacion = cita.AuditoriaUsuarioModificacion;
                response.AuditoriaFechaModificacion = null;
                response.AuditoriaUsuarioModificacion = null;
                _context.Citas.Add(response);

                //Actualizamos la cita anterior
                Cita actualizarcitaanterior = new Cita();
                actualizarcitaanterior.IdCita = cita.IdCita;
                actualizarcitaanterior.AuditoriaFechaModificacion = DateTime.Now;
                actualizarcitaanterior.AuditoriaUsuarioModificacion = cita.AuditoriaUsuarioModificacion;
                actualizarcitaanterior.CodigoMotivoReagendado = cita.CodigoMotivoReagendado;
                var entry = _context.Citas.Attach(actualizarcitaanterior);
                entry.Property(x => x.AuditoriaFechaModificacion).IsModified = true;
                entry.Property(x => x.AuditoriaUsuarioModificacion).IsModified = true;
                entry.Property(x => x.CodigoMotivoReagendado).IsModified = true;
            }
        }
        public void Calificar(Cita cita)
        {
            var response = _context.Citas.Where(x => x.IdCita == cita.IdCita).FirstOrDefault();

            if(response != null)
            {
                response.FlagCalificacion = cita.FlagCalificacion;
                response.CodigoTipoCalificacion = cita.CodigoTipoCalificacion;
                response.FlagRealizadoAdnExpress = cita.FlagRealizadoAdnExpress;
                response.FlagPresentaAlgunaPropuestaSolucion = cita.FlagPresentaAlgunaPropuestaSolucion;
                response.FlagConcretoVenta = cita.FlagConcretoVenta;
                response.ProbabilidadCierre = cita.ProbabilidadCierre;
                response.MonedaPrima = cita.MonedaPrima;
                response.MontoPrima = cita.MontoPrima;
                //response.CodigoTipoExperienciaCalificacion = cita.CodigoTipoExperienciaCalificacion;
                response.CodigoMotivoCitaNoConcretada = cita.CodigoMotivoCitaNoConcretada;
                //response.CodigoPorcentajeAvanceCalificacion = cita.CodigoPorcentajeAvanceCalificacion;
                response.FechaEstimadaCierre = cita.FechaEstimadaCierre;
                response.ComentarioCalificacion = cita.ComentarioCalificacion;
                response.AuditoriaFechaModificacion = DateTime.Now;
                response.AuditoriaUsuarioModificacion = cita.AuditoriaUsuarioModificacion;
            }
        }

        public void CalificarMultipleCitaNoConcretada(int idprospecto, string mensajenoconcretada)
        {
            var response = _context.Citas.Where(x => x.IdProspecto == idprospecto && !x.FlagCalificacion.HasValue
                                                 && (x.CodigoMotivoReagendado == null || x.CodigoMotivoReagendado == 2 || x.CodigoMotivoReagendado == 4));
            if (response.Any())
            {
                foreach (var cita in response)
                {
                    cita.FlagCalificacion = true;
                    cita.CodigoTipoCalificacion = 2;
                    cita.CodigoMotivoCitaNoConcretada = 4;
                    cita.ComentarioCalificacion = mensajenoconcretada;
                    cita.AuditoriaFechaModificacion = DateTime.Now;
                }
            }
        }
        public Cita ObtenerCitaPorId(int idcita)
        {
            return _context.Citas.Where(x => x.IdCita == idcita)
                .Select(x => new Cita 
                { IdProspecto = x.IdProspecto,
                  IdCitaDispositivo = 0,
                  NumeroEntrevista = x.NumeroEntrevista,
                  CodigoEstado = x.CodigoEstado,
                  CodigoResultado = x.CodigoResultado.Value,
                  CodigoEtapaProspecto = x.CodigoEtapaProspecto,
                  ReferenciaUbicacion = x.ReferenciaUbicacion,
                  FlagInvitadoGA = x.FlagInvitadoGA,
                  FlagInvitadoGU = x.FlagInvitadoGU,
                  CodigoIntermediarioCreacion = x.CodigoIntermediarioCreacion,
                  CodigoLineaNegocio = x.CodigoLineaNegocio.Value,
                  Descripcion = x.Descripcion,
                  AlertaMinutosAntes = x.AlertaMinutosAntes
                }).FirstOrDefault();
        }
    }
}
