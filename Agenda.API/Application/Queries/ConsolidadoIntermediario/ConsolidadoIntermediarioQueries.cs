using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Linq;
using System.Threading.Tasks;


namespace Agenda.API.Application.Queries.ConsolidadoIntermediario
{
    public class ConsolidadoIntermediarioQueries : IConsolidadoIntermediarioQueries
    {
        private readonly string _connectionString;
        public ConsolidadoIntermediarioQueries(string constr)
        {
            _connectionString = !string.IsNullOrWhiteSpace(constr) ? constr : throw new ArgumentNullException(nameof(constr));
        }
        public async Task<int> ObtenerIdConsolidadoIntermediario(int codigointermediario)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                var result = (await connection.QueryAsync<int>(
                   @"select c.IdConsolidadoIntermediario                      
                        FROM Generales.CONSOLIDADO_INTERMEDIARIO c
                        WHERE c.CodigoIntermediario=@codigointermediario"
                        , new { codigointermediario }
                    )).AsEnumerable().FirstOrDefault();

                return result;
            }
        }
    }
}
