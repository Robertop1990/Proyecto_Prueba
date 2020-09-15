
using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Comun;
using Agenda.Infrastucture;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Cita
{
    public class CitaQueries : ICitaQueries
    {
        private readonly AgendaContext _context;
        public CitaQueries(AgendaContext context) => _context = context;

        public async Task<ResponseModel<AgendaCita>> ObtenerNumeroCita(string idProspecto, int codigoIntermediario)
        {
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseService responseService;
            ResponseModel<AgendaCita> response = new ResponseModel<AgendaCita>();
            bool tieneAgendamiento = false;
            bool tieneAgendamientoCalificado = false;
            string mensajeEntrevista = "Sin ningun agendamiento";
            
            int numeroEntrevista = 0;

            var cita = (_context.Citas.OrderByDescending(x => x.IdCita).Where(x => x.IdProspecto == int.Parse(idProspecto) && x.CodigoIntermediarioCreacion == codigoIntermediario));

            if (cita.Any())
            {
                if (cita.First().FlagCalificacion??false) 
                {
                    tieneAgendamiento = true;
                    tieneAgendamientoCalificado = true;
                    mensajeEntrevista = "Tiene agendamiento calificado";
                    numeroEntrevista = cita.First().CodigoTipoCalificacion == TablaTipoCalificacion.Concretado ? cita.First().NumeroEntrevista + 1
                                      : cita.First().NumeroEntrevista;
                }
                else
                {
                    tieneAgendamiento = true;
                    tieneAgendamientoCalificado = false;
                    mensajeEntrevista = "No tiene agendamiento calificado";
                    numeroEntrevista = cita.First().NumeroEntrevista;
                }               
            }
            
            responseService = numeroEntrevista != 0 ? configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "")
                                               : configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.SinDatos, "");

            response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
            response.Entity = new AgendaCita { TieneAgendamiento = tieneAgendamiento,
                                               TieneAgendamientoCalificado = tieneAgendamientoCalificado,
                                               Mensaje =mensajeEntrevista,
                                               NumeroCita = numeroEntrevista };

            return await Task.FromResult(response);         
        }

        public async Task<ResponseModel<AgendaCita>> ValidarFechaHorarioAgendamiento(int codigoIntermediario,string fechaCita,string horaInicio,string horaFin)
        {
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseService responseService;
            ResponseModel<AgendaCita> response = new ResponseModel<AgendaCita>();

            bool existeCita = _context.Citas.Where(x => x.CodigoIntermediarioCreacion == codigoIntermediario
                                         && x.FechaCita == DateTime.Parse(fechaCita) 
                                         && ((TimeSpan.Parse(horaInicio) >= x.HoraInicio && TimeSpan.Parse(horaFin) < x.HoraFin)
                                            || (x.HoraInicio >= TimeSpan.Parse(horaInicio) && x.HoraInicio <= TimeSpan.Parse(horaFin))
                                            || (TimeSpan.Parse(horaInicio) >= x.HoraInicio && TimeSpan.Parse(horaInicio) < x.HoraFin))).Any();

            bool existeRecordatorioLLamada = (from rl in _context.RecordatorioLlamadas
                                            join p in _context.Prospectos on rl.IdProspecto equals p.IdProspecto
                                            join ci in _context.ConsolidadoIntermediarios on p.IdConsolidadoIntermediario equals ci.IdConsolidadoIntermediario
                                            where ci.CodigoIntermediario == codigoIntermediario
                                            && ((TimeSpan.Parse(horaInicio) >= rl.HoraInicio && TimeSpan.Parse(horaFin) < rl.HoraFin)
                                           || (rl.HoraInicio >= TimeSpan.Parse(horaInicio) && rl.HoraInicio <= TimeSpan.Parse(horaFin))
                                           || (TimeSpan.Parse(horaInicio) >= rl.HoraInicio && TimeSpan.Parse(horaInicio) < rl.HoraFin))
                                           select new{rl}).Any();

            responseService = existeCita || existeRecordatorioLLamada ? configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "")
                                               : configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.SinDatos, "");

            response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
            response.Entity = new AgendaCita { Mensaje = existeCita || existeRecordatorioLLamada ? "Esta actividad entra en conflicto con otra actividad del calendario" : "" };

            return await Task.FromResult(response);
        }
    }
}
