using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.SeedWork;
using System;
using System.Linq;

namespace Agenda.Infrastucture.Repositories
{
    public class RecordatorioLlamadaRepository : IRecordatorioLlamadaRepository
    {
        private readonly AgendaContext _context;
        public IUnitOfWork UnitOfWork { get { return _context; } }

        public RecordatorioLlamadaRepository(AgendaContext context) => _context = context ?? throw new ArgumentNullException(nameof(context));

        public void Agregar(RecordatorioLlamada recordatorioLlamada)
        {
            var prospecto = _context.Prospectos.Where(x => x.IdProspecto == recordatorioLlamada.IdProspecto).FirstOrDefault();

            if (prospecto != null)
            {
                prospecto.TelefonoCelular = recordatorioLlamada.Prospecto.TelefonoCelular;
                prospecto.TelefonoFijo = recordatorioLlamada.Prospecto.TelefonoFijo;
            }
            recordatorioLlamada.Prospecto = null;
            recordatorioLlamada.AuditoriaFechaCreacion = DateTime.Now;
            _context.RecordatorioLlamadas.Add(recordatorioLlamada);
        }

        public void Actualizar(RecordatorioLlamada recordatorioLlamada)
        {
            var response = _context.RecordatorioLlamadas.Where(x => x.IdRecordatorioLlamada == recordatorioLlamada.IdRecordatorioLlamada).FirstOrDefault();

            if (response != null)
            {
                response.AlertaMinutosAntes = recordatorioLlamada.AlertaMinutosAntes;
                response.Descripcion = recordatorioLlamada.Descripcion;
                response.AuditoriaFechaModificacion = DateTime.Now;
                response.AuditoriaUsuarioModificacion = recordatorioLlamada.AuditoriaUsuarioModificacion;
            }
        }

        public void ActualizarReagendado(RecordatorioLlamada recordatorioLlamada)
        {
            var response = ObtenerRecordatorioLlamadaPorId(recordatorioLlamada.IdRecordatorioLlamada);
            if (response != null)
            {
                //Agregamos el nuevo recordatorio llamada
                response.FechaRecordatorio = recordatorioLlamada.FechaRecordatorio;
                response.HoraInicio = recordatorioLlamada.HoraInicio;
                response.HoraFin = recordatorioLlamada.HoraFin;
                
                response.AlertaMinutosAntes = recordatorioLlamada.AlertaMinutosAntes;
                response.AuditoriaFechaCreacion = DateTime.Now;
                response.AuditoriaUsuarioCreacion = recordatorioLlamada.AuditoriaUsuarioModificacion;
                response.AuditoriaFechaModificacion = null;
                response.AuditoriaUsuarioModificacion = null;
                _context.RecordatorioLlamadas.Add(response);

                //Actualizamos el recordatorio llamada anterior
                RecordatorioLlamada recordatoriollamadaanterior = new RecordatorioLlamada();
                recordatoriollamadaanterior.IdRecordatorioLlamada = recordatorioLlamada.IdRecordatorioLlamada;
                recordatoriollamadaanterior.FlagActivo = false;
                recordatoriollamadaanterior.AuditoriaFechaModificacion = DateTime.Now;
                recordatoriollamadaanterior.AuditoriaUsuarioModificacion = recordatorioLlamada.AuditoriaUsuarioModificacion;
                var entry = _context.RecordatorioLlamadas.Attach(recordatoriollamadaanterior);
                entry.Property(x => x.AuditoriaFechaModificacion).IsModified = true;
                entry.Property(x => x.AuditoriaUsuarioModificacion).IsModified = true;
                entry.Property(x => x.FlagActivo).IsModified = true;
            }
        }

        public RecordatorioLlamada ObtenerRecordatorioLlamadaPorId(int idrecordatoriollamada)
        {
            return _context.RecordatorioLlamadas.Where(x => x.IdRecordatorioLlamada == idrecordatoriollamada)
                .Select(x => new RecordatorioLlamada
                {
                    IdProspecto = x.IdProspecto,
                    IdRecordatorioLlamadaDispositivo = x.IdRecordatorioLlamadaDispositivo,
                    CodigoLineaNegocio = x.CodigoLineaNegocio,
                    FlagActivo = x.FlagActivo,
                    Descripcion = x.Descripcion
                }).FirstOrDefault();
        }
    }
}
