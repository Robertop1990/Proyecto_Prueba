
using System;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Generales
{
    public interface IGeneralesQueries
    {
        Task<short> ObtenerCodigoRangoFondo(decimal monto,int codigointermediario);
        Task<short> ObtenerCodigoRangoEdad(DateTime fechanacimiento,int codigointermediario);
    }
}
