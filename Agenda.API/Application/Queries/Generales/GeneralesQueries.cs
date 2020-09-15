
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Generales
{
    public class GeneralesQueries : IGeneralesQueries
    {
        private readonly string _connectionString;
        public GeneralesQueries(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Organizate");
        }

        public async Task<short> ObtenerCodigoRangoEdad(DateTime fechanacimiento,int codigointermediario)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                var result = (await connection.QueryAsync<short>(
                   @"DECLARE @Edad INT = (cast(datediff(dd,@fechanacimiento,GETDATE()) / 365.25 as int))
                     SELECT RE.CodigoRangoEdad FROM [Generales].[RANGO_EDAD] RE
                     JOIN  Generales.CONSOLIDADO_INTERMEDIARIO CI ON RE.CodigoCanal = CI.CodigoCanal and CI.CodigoIntermediario = @codigointermediario
                     WHERE  @Edad >=RE.RangoInicio AND @Edad <= RE.RangoFin"
                        , new { fechanacimiento,codigointermediario }
                    )).AsEnumerable().FirstOrDefault();

                return result;
            }
        }

        public  async Task<short> ObtenerCodigoRangoFondo(decimal monto, int codigointermediario)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                var result = (await connection.QueryAsync<short>(
                   @"SELECT RI.CodigoRangoFondo FROM [Generales].[RANGO_FONDO] RI
                     JOIN  Generales.CONSOLIDADO_INTERMEDIARIO CI ON RI.CodigoCanal = CI.CodigoCanal and CI.CodigoIntermediario = @codigointermediario
                     WHERE  @monto >=RI.RangoInicio AND @monto <= RI.RangoFin"
                        , new { monto,codigointermediario }
                    )).AsEnumerable().FirstOrDefault();

                return result;
            }
        }
    }
}
