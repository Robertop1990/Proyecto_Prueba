using Agenda.Domain.AggregatesModel.ReunionAggegate;
using Agenda.Domain.SeedWork;
using System;
using System.Linq;

namespace Agenda.Infrastucture.Repositories
{
    public class ReunionRepository : IReunionRepository
    {
        private readonly AgendaContext _context;
        public IUnitOfWork UnitOfWork { get { return _context; } }

        public ReunionRepository(AgendaContext context) => _context = context ?? throw new ArgumentNullException(nameof(context));

        public Reunion Agregar(Reunion reunion)
        {
            reunion.AuditoriaFechaCreacion = DateTime.Now;
            return _context.Reunions.Add(reunion).Entity;
        }

        public int Actualizar(Reunion reunion)
        {
            var response = _context.Reunions.Where(x => x.IdReunion == reunion.IdReunion).FirstOrDefault();

            if (response != null)
            {
                response.FechaReunion = reunion.FechaReunion;
                response.HoraInicio = reunion.HoraInicio;
                response.HoraFin = reunion.HoraFin;
                response.Ubicacion = reunion.Ubicacion;
                response.CodigoDepartamento = reunion.CodigoDepartamento;
                response.CodigoProvincia = reunion.CodigoProvincia;
                response.CodigoDistrito = reunion.CodigoDistrito;
                response.FlagInvitadoGA = reunion.FlagInvitadoGA;
                response.FlagInvitadoGU = reunion.FlagInvitadoGU;
                response.FlagUrlTeams = reunion.FlagUrlTeams;
                response.UrlTeams = reunion.UrlTeams;
                response.AuditoriaFechaModificacion = DateTime.Now;
                response.AuditoriaUsuarioModificacion = reunion.AuditoriaUsuarioModificacion;
            }

            return response != null ? response.IdReunion : 0;
        }
        public int Eliminar(Reunion reunion)
        {
            _context.Reunions.Remove(reunion);

            return reunion.IdReunion;
        }
    }
}
