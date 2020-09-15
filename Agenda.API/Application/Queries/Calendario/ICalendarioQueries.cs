
using Agenda.API.Application.Auditoria;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Calendario
{
    public interface ICalendarioQueries
    {
        Task<ResponseModel<List<SemanaCalendario>>> ObtenerSemanaCalendario(string fechaactual, int codigointermediario);
        Task<ResponseModel<List<ActividadReporte>>> ObtenerReporteActividadSemanal(string fechaactual, string codigointermediarios);
        Task<ResponseModel<List<Intermediario>>> ObtenerAsesoresPorSupervisor(int codigointermediario);
    }
}
