using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Comun;
using Agenda.Infrastucture;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Calendario
{
    public class CalendarioQueries : ICalendarioQueries
    {
        private readonly string _connectionString;
        private readonly AgendaContext _context;
        public CalendarioQueries(IConfiguration configuration, AgendaContext context)
        {
            _connectionString = configuration.GetConnectionString("Organizate");
            _context = context;
        }
        public async Task<ResponseModel<List<SemanaCalendario>>> ObtenerSemanaCalendario(string fechaactual, int codigointermediario)
        {
            ResponseService responseService;
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseModel<List<SemanaCalendario>> response = new ResponseModel<List<SemanaCalendario>>();
            List<SemanaCalendario> semanaCalendarios = new List<SemanaCalendario>();
            List<DiaCalendario> diaCalendarios = new List<DiaCalendario>();
            List<CumpleaniosCalendario> cumpleañosCalendarios;
            List<CitaCalendario> citaCalendarios;
            List<RecordatorioLlamadaCalendario> recordatorioLlamadaCalendarios;
            List<ReunionCalendario> reunionCalendarios;
            List<EtapaCalendario> etapaCalendarios;

            DateTime factual = DateTime.Parse(fechaactual);
            DateTime fsemanamenosuno = factual.AddDays(-7), fsemanamenosdos = factual.AddDays(-14),
                     fsemanamasuno = factual.AddDays(7), fsemanamasdos = factual.AddDays(14);
            DateTime finicio, ffin;

            List<DateTime> fsemanas = new List<DateTime>() { factual, fsemanamenosuno, fsemanamenosdos, fsemanamasuno, fsemanamasdos };

            foreach (var fecha in fsemanas)
            {
                semanaCalendarios.Add(new SemanaCalendario
                {
                    Año = fecha.Year,
                    Mes = fecha.ToString("MMMM"),
                    FechaInicio = fecha.AddDays(-ObtenerNumeroDiaSemana(fecha.DayOfWeek.ToString())),
                    FechaFin = fecha.AddDays(-ObtenerNumeroDiaSemana(fecha.DayOfWeek.ToString())).AddDays(6)
                });
            }

            finicio = fsemanamenosdos.AddDays(-ObtenerNumeroDiaSemana(fsemanamenosdos.DayOfWeek.ToString()));
            ffin = fsemanamasdos.AddDays(-ObtenerNumeroDiaSemana(fsemanamasdos.DayOfWeek.ToString())).AddDays(7);



            for (DateTime inicio = finicio; inicio < ffin; inicio = inicio.AddDays(1.0))
            {
                diaCalendarios.Add(new DiaCalendario { FechaDia = inicio, Dia = inicio.ToString("dddd") });
            }

            using (var connection = new SqlConnection(_connectionString))
            {
                cumpleañosCalendarios = (await connection.QueryAsync<CumpleaniosCalendario>(

                        @"SELECT
                                P.IdProspecto, 
                                P.Nombres +  ' ' + P.ApellidoPaterno + ' ' + ISNULL(P.ApellidoMaterno,'') Nombres,
                                P.TelefonoFijo,
                                P.TelefonoCelular,
                                CONVERT(varchar,YEAR(@finicio)) + '-' + CONVERT(varchar,FORMAT(P.FechaNacimiento,'MM-dd')) FechaCumple
                                FROM PROSPECTO.PROSPECTO P 
                                JOIN GENERALES.CONSOLIDADO_INTERMEDIARIO CI ON P.IdConsolidadoIntermediario = CI.IdConsolidadoIntermediario
                                WHERE    CI.CodigoIntermediario = @codigoIntermediario
                                     AND FORMAT(P.FechaNacimiento,'MM-dd') BETWEEN FORMAT(@finicio,'MM-dd') AND FORMAT(@ffin,'MM-dd')"
                            , new { codigointermediario, finicio, ffin })).ToList();

                citaCalendarios = await ObtenerCitaCalendario(codigointermediario, finicio, ffin).ToListAsync();
                recordatorioLlamadaCalendarios = await ObtenerRecordatorioLlamadaCalendario(codigointermediario, finicio, ffin).ToListAsync();
                reunionCalendarios = await ObtenerReunionCalendario(codigointermediario, finicio, ffin).ToListAsync();
            }

            etapaCalendarios = citaCalendarios.GroupBy(x => new { x.Etapa, x.Fecha }).Select(y => new EtapaCalendario()
            {
                NombreEtapa = y.Key.Etapa,
                Fecha = y.Key.Fecha,
                CantidadCita = y.Count(),
                CantidadEntrevista = y.Count(x => x.TieneCalificacion && x.CodigoTipoCalificacion==TablaTipoCalificacion.Concretado)
            }).ToList();

            foreach(var dia in diaCalendarios)
            {
                dia.CumpleaniosCalendarios = cumpleañosCalendarios.Where(x => x.FechaCumple == dia.FechaDia).ToList();
                dia.CitaCalendarios = citaCalendarios.Where(x => x.Fecha == dia.FechaDia).ToList();
                dia.RecordatorioLlamadaCalendarios = recordatorioLlamadaCalendarios.Where(x => x.Fecha == dia.FechaDia).ToList();
                dia.ReunionCalendarios = reunionCalendarios.Where(x => x.Fecha == dia.FechaDia).ToList();
            }

            foreach(var semana in semanaCalendarios)
            {
                semana.DiaCalendarios = diaCalendarios.Where(x => x.FechaDia >= semana.FechaInicio && x.FechaDia <= semana.FechaFin).ToList();               
                semana.EtapaCalendarios = etapaCalendarios.
                                          Where(x => x.Fecha >= semana.FechaInicio && x.Fecha <= semana.FechaFin)
                                          .GroupBy(x => new { x.NombreEtapa}).Select(y => new EtapaCalendario()
                                          {
                                              NombreEtapa = y.Key.NombreEtapa,
                                              CantidadCita = y.Sum(x => x.CantidadCita),
                                              CantidadEntrevista = y.Sum(x => x.CantidadEntrevista)
                                          })
                                         .ToList();
            }

            responseService = configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
            response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
            response.Entity = semanaCalendarios;

            return response;
        }

        public async Task<ResponseModel<List<ActividadReporte>>> ObtenerReporteActividadSemanal(string fechaactual, string codigointermediarios)
        {
            ResponseService responseService;
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseModel<List<ActividadReporte>> response = new ResponseModel<List<ActividadReporte>>();

            var listcodigointermediario = codigointermediarios.Split(',').Select(int.Parse).ToList();
            DateTime factual = DateTime.Parse(fechaactual);
            DateTime finiciosemana, ffinsemana, finiciomes, ffinmes;
            finiciosemana = factual.AddDays(-ObtenerNumeroDiaSemana(factual.DayOfWeek.ToString()));
            ffinsemana = factual.AddDays(-ObtenerNumeroDiaSemana(factual.DayOfWeek.ToString())).AddDays(6);

            finiciomes = new DateTime(factual.Year, factual.Month, 1);
            ffinmes = finiciomes.AddMonths(1).AddDays(-1);

            List<ProspectoReporte> listProspectoCitasPorSemana = null;
            List<ProspectoReporte> listProspectoEntrevistaPorSemana = null;
            List<ProspectoReporte> listProspectoCitasPorMes = null;
            List<ProspectoReporte> listProspectoEntrevistaPorMes = null;
            List<ActividadReporte> listaReporteSemanal = new List<ActividadReporte>();

            //Inicializamos todos los Objetos para el Reporte Semanal
            List<ActividadReporte> listaReporteSemanalInicial = new List<ActividadReporte>();
            listaReporteSemanalInicial.Add(new ActividadReporte { Subcategoria = "ADN Registrados" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Prospección", Subcategoria = "Leads" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Prospección", Subcategoria = "Referidos" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Prospección", Subcategoria = "Observaciones" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Citas", Subcategoria = "Primera Etapa" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Citas", Subcategoria = "Segunda Etapa" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Citas", Subcategoria = "Etapa Adicional" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Entrevistas", Subcategoria = "Primera Etapa" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Entrevistas", Subcategoria = "Segunda Etapa" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Entrevistas", Subcategoria = "Etapa Adicional" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Producción", Subcategoria = "Solicitudes" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Producción", Subcategoria = "Primas" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Entrevistas Conjuntas", Subcategoria = "Primera Etapa" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Entrevistas Conjuntas", Subcategoria = "Segunda Etapa" });
            listaReporteSemanalInicial.Add(new ActividadReporte { Category = "Entrevistas Conjuntas", Subcategoria = "Etapa Adicional" });

            //Obtenemos ProspectosCitas por mes
            var listProspectoPorMes = await ObtenerProspectoPorMes(listcodigointermediario, finiciomes, ffinmes).ToListAsync();
            var listProspectosAdnsPorMes = await ObtenerProspectoAdnPorMes(listcodigointermediario, finiciomes, ffinmes).ToListAsync();
            var listcitaspormes = await ObtenerCitasPorMes(listcodigointermediario, finiciomes, ffinmes).ToListAsync();

            #region TratamientoDatos

            #region ProspectosAdns
            //Obtenemos prospectos por semana
            var listprospectoporsemana = listProspectoPorMes.Where(x => x.Fecha >= finiciosemana && x.Fecha <= ffinsemana).GroupBy(x => new { x.Fecha, x.Categoria, x.Subcategoria })
                                         .Select(y => new ProspectoReporte()
                                         {
                                             Categoria = y.Key.Categoria,
                                             Subcategoria = y.Key.Subcategoria,
                                             CantidadProspecto = y.Count(),
                                             Fecha = y.Key.Fecha
                                         }).ToList();

            //Obtenemos cantidad de Prospectos segun su fuente por mes
            listProspectoPorMes = listProspectoPorMes.GroupBy(x => new { x.Fecha, x.Categoria, x.Subcategoria })
                                         .Select(y => new ProspectoReporte()
                                         {
                                             Categoria = y.Key.Categoria,
                                             Subcategoria = y.Key.Subcategoria,
                                             CantidadProspecto = y.Count(),
                                             Fecha = y.Key.Fecha
                                         }).ToList();

            //Obtenemos adns por semana
            var listprospectoadnporsemana = listProspectosAdnsPorMes.Where(x => x.Fecha >= finiciosemana && x.Fecha <= ffinsemana);
            #endregion

            #region Citas
            if (listcitaspormes.Count() > 0) //Validamos si existen citas
            {
                 //Obtenemos citas por mes
                 listProspectoCitasPorMes = listcitaspormes.GroupBy(x => new { x.Fecha, x.Subcategoria })
                                         .Select(y => new ProspectoReporte()
                                         {
                                             Categoria = "Citas",
                                             Subcategoria = y.Key.Subcategoria,
                                             CantidadProspecto = y.Sum(x => x.CantidadCita),
                                             Fecha = y.Key.Fecha
                                         }).ToList();

                 //Obtenemos Entrevistas por mes
                 listProspectoEntrevistaPorMes = listcitaspormes.Where(x => x.Calificacion && x.CodigoTipoCalificacion == TablaTipoCalificacion.Concretado).GroupBy(x => new { x.Fecha, x.Subcategoria })
                                               .Select(y => new ProspectoReporte()
                                               {
                                                   Categoria = "Entrevistas",
                                                   Subcategoria = y.Key.Subcategoria,
                                                   CantidadProspecto = y.Sum(X => X.CantidadCita),
                                                   Fecha = y.Key.Fecha
                                               }).ToList();

                 //Filtramos Citas o Entrevistas por semana
                 listProspectoCitasPorSemana = listProspectoCitasPorMes.Where(x => x.Fecha >= finiciosemana && x.Fecha <= ffinsemana).ToList();
                 listProspectoEntrevistaPorSemana = listProspectoEntrevistaPorMes.Where(x => x.Fecha >= finiciosemana && x.Fecha <= ffinsemana).ToList();
             }
            #endregion

            #endregion

            #region Asignamos los resultados a objeto padre listaactividadreporte
            if (listprospectoadnporsemana?.Any() == true)
                {
                //Agregamos los prospectos con ADNs a la listaactividad
                listaReporteSemanal.Add(listprospectoadnporsemana.GroupBy(x => new { x.Subcategoria }).
                                          Select(y => new ActividadReporte()
                                          {
                                              Subcategoria = y.Key.Subcategoria,
                                              Lunes = y.Where(x => (byte)x.Fecha.DayOfWeek == 1).Sum(x => x.CantidadProspecto),
                                              Martes = y.Where(x => (byte)x.Fecha.DayOfWeek == 2).Sum(x => x.CantidadProspecto),
                                              Miercoles = y.Where(x => (byte)x.Fecha.DayOfWeek == 3).Sum(x => x.CantidadProspecto),
                                              Jueves = y.Where(x => (byte)x.Fecha.DayOfWeek == 4).Sum(x => x.CantidadProspecto),
                                              Viernes = y.Where(x => (byte)x.Fecha.DayOfWeek == 5).Sum(x => x.CantidadProspecto),
                                              Sabado = y.Where(x => (byte)x.Fecha.DayOfWeek == 6).Sum(x => x.CantidadProspecto),
                                              Domingo = y.Where(x => (byte)x.Fecha.DayOfWeek == 0).Sum(x => x.CantidadProspecto),
                                              TotalSemana = y.Sum(x => x.CantidadProspecto),
                                              TotalMes = listProspectosAdnsPorMes.Sum(x => x.CantidadProspecto)
                                          }).FirstOrDefault());
                }

                if (listprospectoporsemana?.Any() == true)
                {
                //Agregamos los prospectos segun su fuente a la lista de reportes
                listaReporteSemanal.AddRange(AgruparProspectoCita(listprospectoporsemana, listProspectoPorMes));
                }

                if (listProspectoCitasPorSemana?.Any() == true)
                {
                //Agregamos citas sin calificar y calificadas concretadas a la lista de reportes
                listaReporteSemanal.AddRange(AgruparProspectoCita(listProspectoCitasPorSemana, listProspectoCitasPorMes));                     
                }

                if (listProspectoEntrevistaPorSemana?.Any() == true)
                {
                //Agregamos entrevistas a la lista de reportes
                listaReporteSemanal.AddRange(AgruparProspectoCita(listProspectoEntrevistaPorSemana, listProspectoEntrevistaPorMes));
                }
            #endregion

            if (listaReporteSemanal.Count>0)
            {
                foreach (var actividad in listaReporteSemanalInicial)
                {

                    var respuestaactividad = listaReporteSemanal.Where(x => x.Category == actividad.Category && x.Subcategoria.ToUpper() == actividad.Subcategoria.ToUpper()).FirstOrDefault();
                    
                    if (respuestaactividad != null)
                    {
                        actividad.Lunes = respuestaactividad.Lunes;
                        actividad.Martes = respuestaactividad.Martes;
                        actividad.Miercoles = respuestaactividad.Miercoles;
                        actividad.Jueves = respuestaactividad.Jueves;
                        actividad.Viernes = respuestaactividad.Viernes;
                        actividad.Sabado = respuestaactividad.Sabado;
                        actividad.Domingo = respuestaactividad.Domingo;
                        actividad.TotalSemana = respuestaactividad.TotalSemana;
                        actividad.TotalMes = respuestaactividad.TotalMes;
                    }
                }
            }
            else
            {
                List<ProspectoReporte> total = new List<ProspectoReporte>();
                if (listProspectoEntrevistaPorMes?.Any() == true) total.AddRange(listProspectoEntrevistaPorMes);
                if (listProspectoPorMes?.Any() == true) total.AddRange(listProspectoPorMes);
                if (listProspectoCitasPorMes?.Any() == true) total.AddRange(listProspectoCitasPorMes);
                if (listProspectoEntrevistaPorMes?.Any() == true) total.AddRange(listProspectoEntrevistaPorMes);

                foreach (var actividad in listaReporteSemanalInicial)
                {
                 actividad.TotalMes = total?.Any() == true ? total.Where(x => x.Categoria == actividad.Category && x.Subcategoria.ToUpper() == actividad.Subcategoria.ToUpper()).Sum(x => x.CantidadProspecto) : 0;
                }
            }
            responseService = configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
            response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
            response.Entity = listaReporteSemanalInicial;

            return response;
        }
        public async Task<ResponseModel<List<Intermediario>>> ObtenerAsesoresPorSupervisor(int codigointermediario)
        {
            ResponseService responseService;
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseModel<List<Intermediario>> response = new ResponseModel<List<Intermediario>>();

            var result = await (from intermediario in _context.ConsolidadoIntermediarios
                                  where intermediario.CodigoIntermediarioGA == codigointermediario ||
                                        intermediario.CodigoIntermediarioGU == codigointermediario
                                  select new
                                  {
                                      intermediario
                                  }).Select(x => new Intermediario()
                                  {
                                      Nombres = x.intermediario.NombreRazonSocial,
                                      CodigoIntermediario = x.intermediario.CodigoIntermediario
                                  }).ToListAsync();

            responseService = configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "");
            response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
            response.Entity = result;

            return response;
        }


        #region MetodosCalendarios
        public int ObtenerNumeroDiaSemana(string diasemana)
        {
            int numerodia = 0;
            switch (diasemana)
            {
                case "Monday":
                    numerodia = 0;
                    break;
                case "Tuesday":
                    numerodia = 1;
                    break;
                case "Wednesday":
                    numerodia = 2;
                    break;
                case "Thursday":
                    numerodia = 3;
                    break;
                case "Friday":
                    numerodia = 4;
                    break;
                case "Saturday":
                    numerodia = 5;
                    break;
                case "Sunday":
                    numerodia = 6;
                    break;
                default:
                    numerodia = -1;
                    break;

            }

            return numerodia;       
        }
        public IQueryable<CitaCalendario> ObtenerCitaCalendario(int codigoIntermediario,DateTime fechaInicio,DateTime fechaFin)
        {
            var result =             (from c in _context.Citas
                                     join prospecto in _context.Prospectos on c.IdProspecto equals prospecto.IdProspecto
                                     join intermediario in _context.ConsolidadoIntermediarios on prospecto.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
                                     join adn in _context.AdnRentas on prospecto.IdProspecto equals adn.IdProspecto into ProspectoAdn
                                     from padn in ProspectoAdn.DefaultIfEmpty()
                                     join referido in _context.Prospectos on prospecto.IdReferenciador equals referido.IdProspecto into ProspectoReferido
                                     from preferido in ProspectoReferido.DefaultIfEmpty()
                                     join actividad in _context.Actividads on new { c.NumeroEntrevista, lnegocio = LineaNegocio.Renta }
                                                                equals new { NumeroEntrevista = actividad.NumeroCita, lnegocio = actividad.CodigoLineaNegocio } into CitaActividad
                                     from cactividad in CitaActividad.DefaultIfEmpty()
                                     join etapa in _context.TablaTablas on new { cactividad.CodigoEtapa, idtablaetapa = TablaTabla.EtapaActivad }
                                                                equals new { CodigoEtapa = etapa.CodigoCampo, idtablaetapa = etapa.IdTabla } into ActividadEtapa
                                     from actividadetapa in ActividadEtapa.DefaultIfEmpty()
                                     join motivounodescarte in _context.ListaTablas on new { prospecto.CodigoMotivoUnoDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
                                                                 equals new { CodigoMotivoUnoDescarte = (short?)motivounodescarte.CodigoCampo, idtablamotivodescarte = motivounodescarte.IdTabla } into ProspectoMotivoUnoDescarte
                                     from pmotivounodescarte in ProspectoMotivoUnoDescarte.DefaultIfEmpty()
                                     join motivodosdescarte in _context.ListaTablas on new { prospecto.CodigoMotivoDosDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
                                                                         equals new { CodigoMotivoDosDescarte = (short?)motivodosdescarte.CodigoCampo, idtablamotivodescarte = motivodosdescarte.IdTabla } into ProspectoMotivoDosDescarte
                                     from pmotivodosdescarte in ProspectoMotivoDosDescarte.DefaultIfEmpty()
                                     join fuente in _context.ListaTablas on new { prospecto.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
                                                                 equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
                                     from pfuente in ProspectoFuente.DefaultIfEmpty()
                                     join subfuente in _context.ListaTablas on new { prospecto.CodigoSubFuente, idtablasubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
                                                                         equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablasubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
                                     from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
                                     join tipocalificacion in _context.TablaTablas on new { c.CodigoTipoCalificacion, idtablatipocalificacion = TablaTabla.TipoCalificacion }
                                                                         equals new { CodigoTipoCalificacion = (short?)tipocalificacion.CodigoCampo, idtablatipocalificacion = tipocalificacion.IdTabla } into CitaTipoCalificacion
                                     from ctipocalificacion in CitaTipoCalificacion.DefaultIfEmpty()
                                     join experienciacalificacion in _context.TablaTablas on new { c.CodigoTipoExperienciaCalificacion, idtablaexperienciacalificacion = TablaTabla.ExperienciaCalificacion }
                                                                         equals new { CodigoTipoExperienciaCalificacion = (short?)experienciacalificacion.CodigoCampo, idtablaexperienciacalificacion = experienciacalificacion.IdTabla } into CitaExperienciaCalificacion
                                     from cexperienciacalificacion in CitaExperienciaCalificacion.DefaultIfEmpty()
                                     join porcentajeavance in _context.TablaTablas on new { c.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
                                                               equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaPorcentaje
                                     from cporcentajeavance in CitaPorcentaje.DefaultIfEmpty()
                                     join motivonoconcretada in _context.TablaTablas on new { c.CodigoMotivoCitaNoConcretada, idtablamotivonoconcretada = TablaTabla.MotivoCitaNoConcretada }
                                                               equals new { CodigoMotivoCitaNoConcretada = (short?)motivonoconcretada.CodigoCampo, idtablamotivonoconcretada = motivonoconcretada.IdTabla } into CitaMotivoNoConcretada
                                     from cmotivonoconcretada in CitaMotivoNoConcretada.DefaultIfEmpty()

                                     join motivoreagendada in _context.TablaTablas on new { c.CodigoMotivoReagendado, idtablamotivoreagendada = TablaTabla.MotivoReagendada }
                                                               equals new { CodigoMotivoReagendado = (short?)motivoreagendada.CodigoCampo, idtablamotivoreagendada = motivoreagendada.IdTabla } into CitaMotivoReagendada
                                     from cmotivoreagendada in CitaMotivoReagendada.DefaultIfEmpty()
                                     join distrito in _context.Distritos on new { c.CodigoDepartamento, c.CodigoProvincia, c.CodigoDistrito }
                                                                 equals new { CodigoDepartamento = (short?)distrito.Departamento_Id, CodigoProvincia = (short?)distrito.Provincia_Id, CodigoDistrito = (short?)distrito.Distrito_Id } into CitaDistrito
                                     from cdistrito in CitaDistrito.DefaultIfEmpty()
                                     join provincia in _context.Provincias on new { c.CodigoProvincia, c.CodigoDepartamento }
                                                                           equals new { CodigoProvincia = (short?)provincia.Provincia_Id, CodigoDepartamento = (short?)provincia.Departamento_Id } into DireccionProvincia
                                     from cprovincia in DireccionProvincia.DefaultIfEmpty()
                                     join departamento in _context.Departamentos on c.CodigoDepartamento equals departamento.Departamento_Id into DireccionDepartamento
                                     from cdepartamento in DireccionDepartamento.DefaultIfEmpty()
                                     where intermediario.CodigoIntermediario == codigoIntermediario &&
                                           (c.FechaCita >= fechaInicio && c.FechaCita <= fechaFin)
                                     select new
                                     {
                                         c,prospecto,intermediario,padn,preferido,pfuente,actividadetapa,psubfuente,cdistrito,cprovincia,cdepartamento,cactividad,
                                         ctipocalificacion,cporcentajeavance,cexperienciacalificacion,cmotivoreagendada,cmotivonoconcretada,pmotivounodescarte,
                                         pmotivodosdescarte,

                                     }
                                        ).AsNoTracking().Select(x => new CitaCalendario
                                        {
                                            IdCita = x.c.IdCita,
                                            IdProspecto = x.prospecto.IdProspecto,
                                            Nombres = string.Format("{0} {1} {2}", x.prospecto.Nombres, x.prospecto.ApellidoPaterno, x.prospecto.ApellidoMaterno),
                                            TelefonoFijo = x.prospecto.TelefonoFijo,
                                            TelefonoCelular = x.prospecto.TelefonoCelular,                                           
                                            Fuente = string.Format("{0}{1} {2}",x.pfuente.ValorCadena,string.IsNullOrEmpty(x.psubfuente.ValorCadena) ? "" : "-" + x.psubfuente.ValorCadena, 
                                                                    x.prospecto.IdReferenciador.HasValue ? x.preferido.Nombres + " " + x.preferido.ApellidoPaterno + " " + x.preferido.ApellidoMaterno : x.prospecto.Referenciador),
                                            Descartado = x.prospecto.FlagDescarte.Value,
                                            TextoMotivoDescarte = string.IsNullOrEmpty(x.pmotivodosdescarte.ValorCadena) ? x.pmotivounodescarte.ValorCadena
                                                                          : string.Format("{0}-{1}", x.pmotivounodescarte.ValorCadena, x.pmotivodosdescarte.ValorCadena),
                                            FechaDescarte = x.prospecto.FechaMotivoTresDescarte.Value,

                                            Etapa = string.IsNullOrEmpty(x.actividadetapa.ValorCadena) ? "Etapa adicional" : x.actividadetapa.ValorCadena,
                                            FechaCita = x.c.FechaCita.Value,
                                            NumeroEntrevista = x.c.NumeroEntrevista,
                                            HoraInicio = x.c.HoraInicio.Value.ToString(@"hh\:mm"),
                                            HoraFin = x.c.HoraFin.Value.ToString(@"hh\:mm"),
                                            Ubicacion = x.c.Ubicacion,
                                            CodigoDepartamento = x.c.CodigoDepartamento,
                                            CodigoProvincia = x.c.CodigoProvincia,
                                            CodigoDistrito = x.c.CodigoDistrito,
                                            Departamento = x.cdepartamento.Nombre,
                                            Provincia = x.cprovincia.Nombre,
                                            Distrito = x.cdistrito.Nombre,
                                            CorreoElectronicoGA = x.c.FlagInvitadoGA.Value ? x.intermediario.CorreoElectronicoGA : "",
                                            NombreGA = x.c.FlagInvitadoGA.Value ? x.intermediario.NombreGA : "",
                                            CorreoElectronicoGU = x.c.FlagInvitadoGU.Value ? x.intermediario.CorreoElectronicoGU : "",
                                            NombreGU = x.c.FlagInvitadoGU.Value ? x.intermediario.NombreGU : "",
                                            Descripcion = x.c.Descripcion,
                                            Recordatorio = x.c.AlertaMinutosAntes.Value,
                                            Fecha = x.c.FechaCita.Value,
                                            EtiquetaColor = string.IsNullOrEmpty(x.cactividad.Etiqueta) ? "Morado" : x.cactividad.Etiqueta,
                                            TieneCalificacion = x.c.FlagCalificacion.Value,
                                            TipoCalificacion = x.ctipocalificacion.ValorCadena,
                                            CodigoTipoCalificacion = x.ctipocalificacion.CodigoCampo,
                                            CalificacionCita = x.cexperienciacalificacion.ValorCadena,
                                            ComentarioCalificacion = x.c.ComentarioCalificacion,
                                            ProbabilidadCierre = x.cporcentajeavance.ValorCadena,
                                            PorcentajeAvance = (int)x.cporcentajeavance.ValorNumerico,
                                            PorcentajeAvanceAnterior = (int)(((from citamax in _context.Citas
                                                                        join porcentajeavance in _context.TablaTablas on new { citamax.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
                                                                        equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaMaxPorcentaje
                                                                        from citamaxporcentajeavance in CitaMaxPorcentaje.DefaultIfEmpty()
                                                                        where citamax.IdProspecto == x.c.IdProspecto
                                                                        select new { citamax,citamaxporcentajeavance}
                                                                        ).GroupBy(x => new { x.citamax.IdProspecto})
                                                                        .Select(y => new { 
                                                                            PorcentajeMaximo = y.Max(x => x.citamaxporcentajeavance.ValorNumerico.Value)
                                                                        })).First().PorcentajeMaximo),                                                                     
                                            MotivoNoConcretada = x.cmotivonoconcretada.ValorCadena,
                                            FechaEstimadaCierre = x.c.FechaEstimadaCierre.Value,
                                            Cancelada = (x.c.CodigoMotivoReagendado == 1 || x.c.CodigoMotivoReagendado == 3),
                                            MotivoCancelada = x.cmotivoreagendada.ValorCadena,
                                            FlagUrlTeams = x.c.FlagUrlTeams.Value,
                                            UrlTeams = x.c.UrlTeams,
                                            PorcentajeAvanceAdn = x.padn.PorcentajeAvance,
                                            PorcentajeProbabilidadCierre = x.c.ProbabilidadCierre,
                                            MonedaPrima = x.c.MonedaPrima == 0 ? "SOLES" : x.c.MonedaPrima == 1 ? "DOLARES" : "",
                                            MontoPrima = x.c.MontoPrima
                                        });

            return result;
        }
        public  IQueryable<RecordatorioLlamadaCalendario> ObtenerRecordatorioLlamadaCalendario(int codigoIntermediario, DateTime fechaInicio, DateTime fechaFin)
        {
            var result =        (from r in _context.RecordatorioLlamadas
                                join prospecto in _context.Prospectos on r.IdProspecto equals prospecto.IdProspecto
                                join intermediario in _context.ConsolidadoIntermediarios on prospecto.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
                                join referido in _context.Prospectos on prospecto.IdReferenciador equals referido.IdProspecto into ProspectoReferido
                                from preferido in ProspectoReferido.DefaultIfEmpty()
                                join motivounodescarte in _context.ListaTablas on new { prospecto.CodigoMotivoUnoDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
                                                            equals new { CodigoMotivoUnoDescarte = (short?)motivounodescarte.CodigoCampo, idtablamotivodescarte = motivounodescarte.IdTabla } into ProspectoMotivoUnoDescarte
                                from pmotivounodescarte in ProspectoMotivoUnoDescarte.DefaultIfEmpty()
                                join motivodosdescarte in _context.ListaTablas on new { prospecto.CodigoMotivoDosDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
                                                                    equals new { CodigoMotivoDosDescarte = (short?)motivodosdescarte.CodigoCampo, idtablamotivodescarte = motivodosdescarte.IdTabla } into ProspectoMotivoDosDescarte
                                from pmotivodosdescarte in ProspectoMotivoDosDescarte.DefaultIfEmpty()
                                join fuente in _context.ListaTablas on new { prospecto.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
                                                            equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
                                from pfuente in ProspectoFuente.DefaultIfEmpty()
                                join subfuente in _context.ListaTablas on new { prospecto.CodigoSubFuente, idtablasubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
                                                                    equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablasubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
                                from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
                                join lineanegocio in _context.TablaTablas on new { r.CodigoLineaNegocio, idtablalineanegocio = TablaTabla.LineaNegocio }
                                                                  equals new { CodigoLineaNegocio = (short?)lineanegocio.CodigoCampo, idtablalineanegocio = lineanegocio.IdTabla } into ProspectoLineaNegocio
                                from plineanegocio in ProspectoLineaNegocio.DefaultIfEmpty()
                                where intermediario.CodigoIntermediario == codigoIntermediario &&
                                      (r.FechaRecordatorio.Date >= fechaInicio && r.FechaRecordatorio.Date <= fechaFin)
                                select new
                                {
                                    r,
                                    prospecto,
                                    preferido,
                                    intermediario,
                                    pfuente,
                                    psubfuente,
                                    plineanegocio,
                                    pmotivounodescarte,
                                    pmotivodosdescarte,

                                }
                                        ).AsNoTracking().Select(x => new RecordatorioLlamadaCalendario
                                        {
                                            IdRecordatorioLlamada = x.r.IdRecordatorioLlamada,
                                            IdProspecto = x.prospecto.IdProspecto,
                                            Nombres = string.Format("{0} {1} {2}", x.prospecto.Nombres, x.prospecto.ApellidoPaterno, x.prospecto.ApellidoMaterno),
                                            TelefonoFijo = x.prospecto.TelefonoFijo,
                                            TelefonoCelular = x.prospecto.TelefonoCelular,                                     
                                            Fuente = string.Format("{0}{1}",x.pfuente.ValorCadena,string.IsNullOrEmpty(x.psubfuente.ValorCadena) ? "" : "-" + x.psubfuente.ValorCadena),
                                            Referenciador = string.IsNullOrEmpty(x.prospecto.Referenciador) 
                                                            ?  string.Format("{0} {1} {2}", x.preferido.Nombres,x.preferido.ApellidoPaterno,x.preferido.ApellidoMaterno) : x.prospecto.Referenciador,
                                            HoraInicio = x.r.HoraInicio.Value.ToString(@"hh\:mm"),
                                            HoraFin = x.r.HoraFin.Value.ToString(@"hh\:mm"),
                                            Fecha = x.r.FechaRecordatorio.Date,
                                            Descripcion = x.r.Descripcion,
                                            Producto = x.plineanegocio.ValorCadena,
                                            Descartado = x.prospecto.FlagDescarte.Value,
                                            TextoMotivoDescarte = string.IsNullOrEmpty(x.pmotivodosdescarte.ValorCadena) ? x.pmotivounodescarte.ValorCadena
                                                                          : string.Format("{0}-{1}", x.pmotivounodescarte.ValorCadena, x.pmotivodosdescarte.ValorCadena),
                                            FechaDescarte = x.prospecto.FechaMotivoTresDescarte.Value,
                                            Activo = x.r.FlagActivo.Value
                                        });
            return result;
        }   
        public IQueryable<ReunionCalendario> ObtenerReunionCalendario(int codigoIntermediario, DateTime fechaInicio, DateTime fechaFin)
        {
            var result =        (from r in _context.Reunions
                                join intermediario in _context.ConsolidadoIntermediarios on r.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
                                join tiporeunion in _context.TablaTablas on new { r.CodigoTipoReunion, idtablatiporeunion = TablaTabla.TipoReunion }
                                                                    equals new { CodigoTipoReunion = (short?)tiporeunion.CodigoCampo, idtablatiporeunion = tiporeunion.IdTabla } into ReunionTipoReunion
                                from rtiporeunion in ReunionTipoReunion.DefaultIfEmpty()
                                join distrito in _context.Distritos on new { r.CodigoDepartamento, r.CodigoProvincia, r.CodigoDistrito }
                                                                 equals new { CodigoDepartamento = (short?)distrito.Departamento_Id, CodigoProvincia = (short?)distrito.Provincia_Id, CodigoDistrito = (short?)distrito.Distrito_Id } into ReunionDistrito
                                from rdistrito in ReunionDistrito.DefaultIfEmpty()
                                join provincia in _context.Provincias on new { r.CodigoProvincia, r.CodigoDepartamento }
                                                                      equals new { CodigoProvincia = (short?)provincia.Provincia_Id, CodigoDepartamento = (short?)provincia.Departamento_Id } into ReunionProvincia
                                from rprovincia in ReunionProvincia.DefaultIfEmpty()
                                join departamento in _context.Departamentos on r.CodigoDepartamento equals departamento.Departamento_Id into ReunionDepartamento
                                from rdepartamento in ReunionDepartamento.DefaultIfEmpty()
                                where intermediario.CodigoIntermediario == codigoIntermediario &&
                                      (r.FechaReunion >= fechaInicio && r.FechaReunion <= fechaFin)
                                select new
                                {
                                    r,
                                    intermediario,
                                    rtiporeunion,
                                    rdepartamento,
                                    rprovincia,
                                    rdistrito

                                }
                                        ).AsNoTracking().Select(x => new ReunionCalendario
                                        {
                                            IdReunion = x.r.IdReunion,
                                            TipoReunion = x.rtiporeunion.ValorCadena,
                                            FechaReunion = x.r.FechaReunion,
                                            Ubicacion = x.r.Ubicacion,
                                            Departamento = x.rdepartamento.Nombre,
                                            Provincia = x.rprovincia.Nombre,
                                            Distrito = x.rdistrito.Nombre,
                                            CorreoElectronicoGA = x.r.FlagInvitadoGA.Value ? x.intermediario.CorreoElectronicoGA : "",
                                            NombreGA = x.r.FlagInvitadoGA.Value ? x.intermediario.NombreGA : "",
                                            CorreoElectronicoGU = x.r.FlagInvitadoGU.Value ? x.intermediario.CorreoElectronicoGU : "",
                                            NombreGU = x.r.FlagInvitadoGU.Value ? x.intermediario.NombreGU : "",
                                            Fecha = x.r.FechaReunion,
                                            HoraInicio = x.r.HoraInicio.ToString(@"hh\:mm"),
                                            HoraFin = x.r.HoraFin.ToString(@"hh\:mm"),
                                            Descripcion = x.r.Descripcion,
                                            AlertaMinutosAntes = (int)x.r.AlertaMinutosAntes,
                                            FlagUrlTeams = x.r.FlagUrlTeams.Value,
                                            EtiquetaColor = "Plomo"
                                        });
            return result;
        }
        #endregion

        #region MetodosReporteria
        public IQueryable<ProspectoReporte> ObtenerProspectoPorMes(List<int> listCodigoIntermediario,DateTime fechaInicio,DateTime fechaFin)
        {
            var result = (from prospecto in _context.Prospectos
                                       join intermediario in _context.ConsolidadoIntermediarios on prospecto.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
                                       join fuente in _context.ListaTablas on new { prospecto.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto }
                                                                           equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla }
                                       where listCodigoIntermediario.Contains(intermediario.CodigoIntermediario) &&
                                       prospecto.CodigoFuente != Fuente.CentroInfluencia &&
                                       (prospecto.AuditoriaFechaCreacion.Value.Date >= fechaInicio.Date && prospecto.AuditoriaFechaCreacion.Value.Date <= fechaFin.Date)
                                       select new
                                       {
                                           prospecto,
                                           fuente
                                       }
                                    ).AsNoTracking().GroupBy(x => new { x.prospecto.AuditoriaFechaCreacion.Value.Date, x.fuente.ValorCadena, x.prospecto.IdProspecto })
                                     .Select(y => new ProspectoReporte()
                                     {
                                         Categoria = "Prospección",
                                         Subcategoria = y.Key.ValorCadena == "Leads" || y.Key.ValorCadena == "Campaña" ? "Leads" :
                                                     y.Key.ValorCadena == "Referido" || y.Key.ValorCadena == "ADN" ? "Referidos" :
                                                     y.Key.ValorCadena == "OP/Intro" || y.Key.ValorCadena == "Centro de influencia" ? "Observaciones" : "",
                                         CantidadProspecto = y.Count(),
                                         Fecha = y.Key.Date,
                                         IdProspecto = y.Key.IdProspecto
                                     });
            return result;
        }
        public IQueryable<ProspectoReporte> ObtenerProspectoAdnPorMes(List<int> listCodigoIntermediario, DateTime fechaInicio, DateTime fechaFin)
        {
            var result = (from prospecto in _context.Prospectos
                                            join intermediario in _context.ConsolidadoIntermediarios on prospecto.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
                                            join adn in _context.AdnRentas on prospecto.IdProspecto equals adn.IdProspecto
                                            where listCodigoIntermediario.Contains(intermediario.CodigoIntermediario) &&
                                            prospecto.CodigoFuente != Fuente.CentroInfluencia &&
                                            (adn.PorcentajeAvance > 20) &&   //Porcentaje de avance mayor a 20
                                            (prospecto.AuditoriaFechaCreacion.Value.Date >= fechaInicio.Date && prospecto.AuditoriaFechaCreacion.Value.Date <= fechaFin.Date)
                                            select new 
                                            { 
                                                prospecto 
                                            }
                                            ).AsNoTracking().GroupBy(x => new { x.prospecto.AuditoriaFechaCreacion.Value.Date })
                                    .Select(y => new ProspectoReporte()
                                    {
                                        Subcategoria = "ADN Registrados",
                                        CantidadProspecto = y.Count(),
                                        Fecha = y.Key.Date
                                    });
            return result;
        }
        public IQueryable<CitaReporte> ObtenerCitasPorMes(List<int> listCodigoIntermediario, DateTime fechaInicio, DateTime fechaFin)
        {
            var result = (from cita in _context.Citas
                          join actividad in _context.Actividads on new { cita.NumeroEntrevista, lnegocio = LineaNegocio.Renta }
                                                       equals new { NumeroEntrevista = actividad.NumeroCita, lnegocio = actividad.CodigoLineaNegocio } into CitaActividad
                          from cactividad in CitaActividad.DefaultIfEmpty()
                          join etapa in _context.TablaTablas on new { cactividad.CodigoEtapa, idtablaetapa = TablaTabla.EtapaActivad }
                                                     equals new { CodigoEtapa = etapa.CodigoCampo, idtablaetapa = etapa.IdTabla } into ActividadEtapa
                          from actividadetapa in ActividadEtapa.DefaultIfEmpty()
                          where listCodigoIntermediario.Contains(cita.CodigoIntermediarioCreacion) &&
                          (cita.FechaCita.Value.Date >= fechaInicio.Date && cita.FechaCita.Value.Date <= fechaFin.Date)
                          select new
                          {
                                       cita,
                                       actividadetapa
                                   }).AsNoTracking().GroupBy(x => new {
                                       x.cita.FechaCita.Value.Date,
                                       x.actividadetapa.ValorCadena,
                                       x.cita.FlagCalificacion,
                                       x.cita.CodigoTipoCalificacion,
                                       x.cita.CodigoMotivoReagendado
                                   })
                                    .Select(y => new CitaReporte()
                                    {
                                        CantidadCita = y.Count(),
                                        Subcategoria = string.IsNullOrEmpty(y.Key.ValorCadena) ? "Etapa adicional" : y.Key.ValorCadena,
                                        Calificacion = y.Key.FlagCalificacion.Value,
                                        CodigoTipoCalificacion = y.Key.CodigoTipoCalificacion.Value,
                                        CodigoMotivoReagendado = y.Key.CodigoMotivoReagendado.Value,
                                        Fecha = y.Key.Date
                                    });
            return result;
        }

        public List<ActividadReporte> AgruparProspectoCita(List<ProspectoReporte> prospectoPorSemana,List<ProspectoReporte> prospectoPorMes)
        {
            var result = prospectoPorSemana.GroupBy(x => new { x.Categoria, x.Subcategoria }).
                                  Select(y => new ActividadReporte()
                                  {
                                      Category = y.Key.Categoria,
                                      Subcategoria = y.Key.Subcategoria,
                                      Lunes = y.Where(x => (byte)x.Fecha.DayOfWeek == 1).Sum(x => x.CantidadProspecto),
                                      Martes = y.Where(x => (byte)x.Fecha.DayOfWeek == 2).Sum(x => x.CantidadProspecto),
                                      Miercoles = y.Where(x => (byte)x.Fecha.DayOfWeek == 3).Sum(x => x.CantidadProspecto),
                                      Jueves = y.Where(x => (byte)x.Fecha.DayOfWeek == 4).Sum(x => x.CantidadProspecto),
                                      Viernes = y.Where(x => (byte)x.Fecha.DayOfWeek == 5).Sum(x => x.CantidadProspecto),
                                      Sabado = y.Where(x => (byte)x.Fecha.DayOfWeek == 6).Sum(x => x.CantidadProspecto),
                                      Domingo = y.Where(x => (byte)x.Fecha.DayOfWeek == 0).Sum(x => x.CantidadProspecto),
                                      TotalSemana = y.Sum(x => x.CantidadProspecto),
                                      TotalMes = prospectoPorMes.Where(x => x.Subcategoria == y.Key.Subcategoria).Sum(x => x.CantidadProspecto)
                                  }).ToList();
            return result;
        }
        #endregion
    }
}
