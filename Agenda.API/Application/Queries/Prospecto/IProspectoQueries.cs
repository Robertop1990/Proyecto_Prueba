using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Dtos.Request;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Prospecto
{
    public interface IProspectoQueries
    {
        Task<ResponseModel<List<Prospecto>>> ObtenerProspectoPorFiltro(ProspectoQueryFilter prospectoQueryFilter);
        Task<ResponseModel<ActualizarProspectoCommand>> ObtenerProspectoDetallePorIdProspecto(string idProspecto);
        Task<ResponseModel<Prospecto>> ObtenerProspectoVistaPrevia(int idProspecto);
    }
}
