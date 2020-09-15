
using Agenda.API.Application.Auditoria;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Cita
{
    public interface ICitaQueries
    {
        Task<ResponseModel<AgendaCita>> ObtenerNumeroCita(string idProspecto, int codigoIntermediario);
        Task<ResponseModel<AgendaCita>> ValidarFechaHorarioAgendamiento(int codigoIntermediario, string fechaCita, string horaInicio, string horaFin);
    }
}
