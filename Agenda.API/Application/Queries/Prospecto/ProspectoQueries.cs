using Agenda.API.Application.Auditoria;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Comun;
using Agenda.API.Application.Dtos.Request;
using Agenda.Infrastucture;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Agenda.API.Application.Queries.Prospecto
{
    public class ProspectoQueries : IProspectoQueries
    {
        private readonly AgendaContext _context;
		public ProspectoQueries(AgendaContext context) => _context = context;

        #region ImplementacionInterfaz
        public async Task<ResponseModel<List<Prospecto>>> ObtenerProspectoPorFiltro(ProspectoQueryFilter prospectoQueryFilter)
        {
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseService responseService;
            ResponseModel<List<Prospecto>> response = new ResponseModel<List<Prospecto>>();

            List<Prospecto> result = new List<Prospecto>();
            List<Referido> referidos;
			prospectoQueryFilter.parametro = prospectoQueryFilter.parametro ?? "";

			switch (prospectoQueryFilter.tab)
                {
                    case "Prospectos":
					if (prospectoQueryFilter.parametro=="")
					{
						//Obtenemos prospectos sin agendamiento(no incluye descartados) 
						result = await (ObtenerProspectosDelDia(prospectoQueryFilter).Where(x => !x.FlagDescarte.HasValue)).ToListAsync();
					}
					else
					{
						//Obtenemos prospectos sin agendamiento(incluye descartados) 
						result.AddRange(ObtenerProspectosDelDia(prospectoQueryFilter));

						//Obtenemos prospectos con agendamiento citas
						result.AddRange(ObtenerAgendadosCitas(prospectoQueryFilter));

						//Obtenemos prospectos con agendamientos citas calificadas
						result.AddRange(ObtenerCitaCalificada(prospectoQueryFilter));

						//Obtenemos prospectos con agendamientos rllamadas
						result.AddRange(ObtenerAgendadosRecordatorioLlamada(prospectoQueryFilter, result.Select(x => x.IdProspecto).ToList()));
					}
					break;

                    case "Agendados":
					if(prospectoQueryFilter.parametro=="")
					{
						//Obtenemos prospectos con agendamiento citas del dia 
						prospectoQueryFilter.fechacreacioncita = DateTime.Now;
						result = await (ObtenerAgendadosCitas(prospectoQueryFilter)).ToListAsync();
					}
					else
					{
						result.AddRange(ObtenerProspectosDelDia(prospectoQueryFilter));
						result.AddRange(ObtenerAgendadosCitas(prospectoQueryFilter));
						result.AddRange(ObtenerCitaCalificada(prospectoQueryFilter));
						result.AddRange(ObtenerAgendadosRecordatorioLlamada(prospectoQueryFilter, result.Select(x => x.IdProspecto).ToList()));
					}
					break;

                    case "RecordatorioLlamada":
					if(prospectoQueryFilter.parametro=="")
					{
						//Listamos los recordatorios llamadas activos
						List<int> idsprospecto = new List<int>(){ 0 };
						result = await (ObtenerAgendadosRecordatorioLlamada(prospectoQueryFilter, idsprospecto)).ToListAsync();
					}
					else
					{
						result.AddRange(ObtenerProspectosDelDia(prospectoQueryFilter));
						result.AddRange(ObtenerAgendadosCitas(prospectoQueryFilter));
						result.AddRange(ObtenerCitaCalificada(prospectoQueryFilter));
						result.AddRange(ObtenerAgendadosRecordatorioLlamada(prospectoQueryFilter, result.Select(x => x.IdProspecto).ToList()));
					}
					break;
                }


                referidos = result.Where(x => x.IdReferenciador != 0).Select(x => new Referido
                {
                    NombresApellidos = x.NombresApellidos,Nombres = x.Nombres,
                    CodigoTipoDocumento = x.CodigoTipoDocumento,
                    NumeroDocumento = x.NumeroDocumento,
                    ApellidoPaterno = x.ApellidoPaterno,
                    ApellidoMaterno = x.ApellidoMaterno,
                    Fuente = x.Fuente,CodigoFuente = x.CodigoFuente,CodigoSubFuente = x.CodigoSubFuente,
                    NombreFuente = x.NombreFuente,NombreSubFuente = x.NombreSubFuente,
                    Edad = x.Edad,
                    FechaNacimiento = x.FechaNacimiento,
                    IdProspecto = x.IdReferenciador,
                    TelefonoFijo = x.TelefonoFijo,
                    TelefonoCelular = x.TelefonoCelular,
                    Hijos = x.Hijos,
                    CodigoSexo = x.CodigoSexo,
                    Sexo = x.Sexo,
                    Direccion = x.Direccion,
                    Departamento_Id = x.Departamento_Id,Provincia_Id = x.Provincia_Id,Distrito_Id = x.Distrito_Id,
                    Departamento = x.Departamento,Provincia = x.Provincia,Distrito= x.Distrito,
                    Correo = x.Correo,
                    Empresa = x.Empresa,
                    CodigoCargo = x.CodigoCargo,NombreCargo = x.NombreCargo,OtroCargo = x.OtroCargo,
                    MonedaFondo = x.MonedaFondo,MontoFondo = x.MontoFondo,
                    IdReferenciador = x.IdReferenciador,
                    FlagDescarte = x.FlagDescarte,TextoMotivoDescarte = x.TextoMotivoDescarte,
                    VisibleDescarte = x.VisibleDescarte,VisibleAgendar = x.VisibleAgendar,
                    PorcentajeAvance = x.PorcentajeAvance,
                    DescripcionAvance = x.DescripcionAvance,
                    FechaEstimadaCierre = x.FechaEstimadaCierre,
                    FechaCreacion = x.FechaCreacion,
					FechaUltimaActividad = x.FechaUltimaActividad
                }).ToList();

                foreach (var prospecto in result)
                    prospecto.Referidos = referidos.Where(x => x.IdProspecto == prospecto.IdProspecto).ToList();

                responseService = result.Any() ? configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "")
                                               : configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.SinDatos, "");

                response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
                response.Entity = result.OrderByDescending(x => x.IdProspecto).OrderByDescending(x => x.CodigoFuente).ToList();

			return response;
		}
        public async Task<ResponseModel<ActualizarProspectoCommand>> ObtenerProspectoDetallePorIdProspecto(string idProspecto)
        {
            ResponseModel<ActualizarProspectoCommand> response = new ResponseModel<ActualizarProspectoCommand>();
            ActualizarProspectoCommand result;
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseService responseService;

			result = await ObtenerProspectoDetallePorId(int.Parse(idProspecto)).FirstOrDefaultAsync();

            responseService = result != null ? configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "")
                                               : configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.SinDatos, "");

            response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
            response.Entity = result;

            return response;
        }
        public async Task<ResponseModel<Prospecto>> ObtenerProspectoVistaPrevia(int idProspecto)
        {
            ResponseModel<Prospecto> response = new ResponseModel<Prospecto>();
            ConfigurationHelper configurationHelper = new ConfigurationHelper();
            ResponseService responseService;
			Prospecto result;

			result =  await ObtenerProspectoVistaPreviaPorId(idProspecto).FirstOrDefaultAsync();

			responseService = result != null ? configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.Exito, "")
										  : configurationHelper.ObtenerCodigoRespuestaServicio(CodigoRespuestaServicio.SinDatos, "");

			response.auditResponse = new AuditResponse { codigoRespuesta = responseService.codigoRespuesta, mensajeRespuesta = responseService.mensajeRespuesta };
			response.Entity = result;

			return  response;
        }
        #endregion

        #region MetodosProspecto
        public IQueryable<ActualizarProspectoCommand> ObtenerProspectoDetallePorId(int idProspecto)
		{
			var result = (from p in _context.Prospectos
					  join a in _context.AdnRentas on p.IdProspecto equals a.IdProspecto into ProspectoAdn
					  from pa in ProspectoAdn.DefaultIfEmpty()
					  join f in _context.ListaTablas on p.CodigoFuente equals f.CodigoCampo into ProspectoFuente
					  from pf in ProspectoFuente.DefaultIfEmpty()
					  join d in _context.DireccionProspectos on p.IdProspecto equals d.IdProspecto into ProspectoDireccion
					  from pd in ProspectoDireccion.DefaultIfEmpty()
					  join r in _context.Prospectos on p.IdReferenciador equals r.IdProspecto into ProspectoReferenciador
					  from pr in ProspectoReferenciador.DefaultIfEmpty()
					  where p.IdProspecto == idProspecto
					  select new
					  {
						  p,
						  pa,
						  pf,
						  pd,
						  pr
					  }).AsNoTracking().Select(x => new ActualizarProspectoCommand
					  {
						  IdProspecto = x.p.IdProspecto,
						  CodigoTipoDocumento = x.p.CodigoTipoDocumento,
						  NumeroDocumento = x.p.NumeroDocumento,
						  Nombres = x.p.Nombres,
						  ApellidoPaterno = x.p.ApellidoPaterno,
						  ApellidoMaterno = x.p.ApellidoMaterno,
						  FechaNacimiento = x.p.FechaNacimiento,
						  CodigoSexo = x.p.CodigoSexo,
						  FlagHijo = x.p.FlagHijo,
						  Empresa = x.p.Empresa,
						  CodigoCargo = x.p.CodigoCargo,
						  OtroCargo = x.p.OtroCargo,
						  Referenciador = x.p.Referenciador,
						  CodigoFuente = x.p.CodigoFuente,
						  CodigoSubFuente = x.p.CodigoSubFuente,
						  ProspectoReferenciador = x.p.IdReferenciador.HasValue ? string.Format("{0} {1} {2}", x.pr.Nombres, x.pr.ApellidoPaterno, x.pr.ApellidoMaterno)
																	   : "",
						  TelefonoFijo = x.p.TelefonoFijo,
						  TelefonoCelular = x.p.TelefonoCelular,
						  CorreoElectronico1 = x.p.CorreoElectronico1,
						  CodigoEtapa = x.p.CodigoEtapa,
						  CodigoEstado = x.p.CodigoEstado,
						  ProspectoDireccionCommand = new ProspectoDireccionCommand
						  {
							  IdDireccion = x.pd.IdDireccion,
							  IdProspecto = x.pd.IdProspecto,
							  Direccion = x.pd.Direccion,
							  Departamento_Id = x.pd.Departamento_Id,
							  Provincia_Id = x.pd.Provincia_Id,
							  Distrito_Id = x.pd.Distrito_Id,
							  FlagActivo = x.pd.FlagActivo,
							  TipoDireccion = x.pd.TipoDireccion
						  },
						  ProspectoAdnRentaCommand = new ProspectoAdnRentaCommand
						  {
							  MonedaPatrimonioAfp = x.pa.MonedaPatrimonioAfp,
							  MontoPatrimonioAfp = x.pa.MontoPatrimonioAfp,
							  PorcentajeAvance = x.pa.PorcentajeAvance,
							  PorcentajeAvanceCompleto = x.pa.PorcentajeAvanceCompleto
						  }

					  });
			return result;
		}

		public IQueryable<Prospecto> ObtenerProspectoVistaPreviaPorId(int idProspecto)
		{
			var result =  (from p in _context.Prospectos
						  join intermediario in _context.ConsolidadoIntermediarios on p.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
						  join adn in _context.AdnRentas on p.IdProspecto equals adn.IdProspecto into ProspectoAdn
						  from padn in ProspectoAdn.DefaultIfEmpty()
						  join fuente in _context.ListaTablas on new { p.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
															  equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
						  from pfuente in ProspectoFuente.DefaultIfEmpty()
						  join subfuente in _context.ListaTablas on new { p.CodigoSubFuente, idtablaSubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
															  equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablaSubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
						  from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
						  join referido in _context.Prospectos on p.IdReferenciador equals referido.IdProspecto into ProspectoReferido
						  from preferido in ProspectoReferido.DefaultIfEmpty()
						  join cargo in _context.TablaTablas on new { p.CodigoCargo, idtablacargo = TablaTabla.PersonaCargo }
															 equals new { CodigoCargo = (short?)cargo.CodigoCampo, idtablacargo = cargo.IdTabla } into ProspectoCargo
						  from pcargo in ProspectoCargo.DefaultIfEmpty()
						  join sexo in _context.TablaTablas on new { p.CodigoSexo, idtablasexo = TablaTabla.Sexo }
															equals new { CodigoSexo = (short?)sexo.CodigoCampo, idtablasexo = sexo.IdTabla } into ProspectoSexo
						  from psexo in ProspectoSexo.DefaultIfEmpty()
						  join direccion in _context.DireccionProspectos on p.IdProspecto equals direccion.IdProspecto into ProspectoDireccion
						  from pdireccion in ProspectoDireccion.DefaultIfEmpty()
						  join distrito in _context.Distritos on new { pdireccion.Departamento_Id, pdireccion.Provincia_Id, pdireccion.Distrito_Id }
															  equals new { distrito.Departamento_Id, distrito.Provincia_Id, distrito.Distrito_Id } into DireccionDistrito
						  from ddistrito in DireccionDistrito.DefaultIfEmpty()
						  join provincia in _context.Provincias on new { pdireccion.Provincia_Id, pdireccion.Departamento_Id }
																equals new { provincia.Provincia_Id, provincia.Departamento_Id } into DireccionProvincia
						  from dprovincia in DireccionProvincia.DefaultIfEmpty()
						  join departamento in _context.Departamentos on pdireccion.Departamento_Id equals departamento.Departamento_Id into DireccionDepartamento
						  from ddepartamento in DireccionDepartamento.DefaultIfEmpty()
						  where (p.IdProspecto == idProspecto)
						  select new
						  {
							  p,
							  padn,
							  pfuente,
							  psubfuente,
							  preferido,
							  psexo,
							  pcargo,
							  pdireccion,
							  ddistrito,
							  dprovincia,
							  ddepartamento

						  }).AsNoTracking().Select(x => new Prospecto
						  {
							  IdProspecto = x.p.IdProspecto,
							  NombresApellidos = string.Format("{0} {1} {2}", x.p.Nombres, x.p.ApellidoPaterno, x.p.ApellidoMaterno),
							  CodigoTipoDocumento = x.p.CodigoTipoDocumento.Value,
							  NumeroDocumento = x.p.NumeroDocumento,
							  Nombres = x.p.Nombres,
							  ApellidoPaterno = x.p.ApellidoPaterno,
							  ApellidoMaterno = x.p.ApellidoMaterno,
							  CodigoFuente = x.p.CodigoFuente.Value,
							  CodigoSubFuente = x.p.CodigoSubFuente.Value,
							  NombreFuente = x.pfuente.ValorCadena,
							  NombreSubFuente = x.psubfuente.ValorCadena,
							  TelefonoFijo = x.p.TelefonoFijo,
							  TelefonoCelular = x.p.TelefonoCelular,
							  FechaNacimiento = x.p.FechaNacimiento.Value,
							  Direccion = x.pdireccion.Direccion,
							  Departamento_Id = x.pdireccion.Departamento_Id,
							  Provincia_Id = x.pdireccion.Provincia_Id,
							  Distrito_Id = x.pdireccion.Distrito_Id,
							  Departamento = x.ddepartamento.Nombre,
							  Provincia = x.dprovincia.Nombre,
							  Distrito = x.ddistrito.Nombre,
							  Edad = DateTime.Now.Year - x.p.FechaNacimiento.Value.Year,
							  CodigoSexo = x.p.CodigoSexo.Value,
							  Sexo = x.psexo.ValorAuxiliarCadena,
							  Empresa = x.p.Empresa,
							  CodigoCargo = x.p.CodigoCargo.Value,
							  NombreCargo = x.pcargo.ValorCadena,
							  OtroCargo = x.p.OtroCargo,
							  Referenciador = x.p.Referenciador,
							  Hijos = x.padn.NumeroHijosDependiente.Value,
							  Correo = x.p.CorreoElectronico1,
							  MonedaFondo = x.padn.MonedaPatrimonioAfp.Value,
							  MontoFondo = x.padn.MontoPatrimonioAfp.Value,
							  Fuente = string.Format("{0}{1} {2}", x.pfuente.ValorCadena, string.IsNullOrEmpty(x.psubfuente.ValorCadena) ? "" : "-" + x.psubfuente.ValorCadena,
															  x.p.IdReferenciador.HasValue ? x.preferido.Nombres + " " + x.preferido.ApellidoPaterno + " " + x.preferido.ApellidoMaterno : x.p.Referenciador),
							  IdReferenciador = x.p.IdReferenciador.Value,
							  FlagDescarte = x.p.FlagDescarte,
							  VisibleDescarte = true,
							  VisibleAgendar = true,
							  FechaCreacion = x.p.AuditoriaFechaCreacion
						  });

			return result;
		}
        #endregion

        #region MetodosTabsProspecto
        public IQueryable<Prospecto> ObtenerProspectosDelDia(ProspectoQueryFilter prospectoQueryFilter)
        {
            #region Parametros Prospectos del Dia
            var listcodigorangosexo = prospectoQueryFilter.codigosexo!=null? prospectoQueryFilter.codigosexo.Split(',').Select(short.Parse).ToList():null;
			var listcodigorangoedad = prospectoQueryFilter.codigorangoedad!=null? prospectoQueryFilter.codigorangoedad.Split(',').Select(short.Parse).ToList():null;
			var listcodigorangofuente = prospectoQueryFilter.codigofuente!= null ? prospectoQueryFilter.codigofuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangosubfuente = prospectoQueryFilter.codigosubfuente != null ? prospectoQueryFilter.codigosubfuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoingreso = prospectoQueryFilter.codigorangoingreso != null ? prospectoQueryFilter.codigorangoingreso.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofondo = prospectoQueryFilter.codigorangofondo != null ? prospectoQueryFilter.codigorangofondo.Split(',').Select(short.Parse).ToList() : null;
			#endregion

			#region QueryProspectoDelDia

			//var prospectoDto = _context.Prospectos.ProjectTo<ProspectoDto>(_mapper.ConfigurationProvider);
			var result = (from p in _context.Prospectos
						        join intermediario in _context.ConsolidadoIntermediarios on p.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
								join adn in _context.AdnRentas on p.IdProspecto equals adn.IdProspecto into ProspectoAdn
								from padn in ProspectoAdn.DefaultIfEmpty()
								join fuente in _context.ListaTablas on new { p.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
								from pfuente in ProspectoFuente.DefaultIfEmpty()
								join subfuente in _context.ListaTablas on new {p.CodigoSubFuente, idtablaSubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta } 
								                                    equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablaSubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
								from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
								join motivounodescarte in _context.ListaTablas on new {p.CodigoMotivoUnoDescarte,idtablamotivodescarte = TablaTabla.MotivoDescarte}
								                                    equals new { CodigoMotivoUnoDescarte  = (short?)motivounodescarte.CodigoCampo, idtablamotivodescarte  = motivounodescarte.IdTabla} into ProspectoMotivoUnoDescarte
								from pmotivounodescarte in ProspectoMotivoUnoDescarte.DefaultIfEmpty()
								join motivodosdescarte in _context.ListaTablas on new { p.CodigoMotivoDosDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	equals new { CodigoMotivoDosDescarte = (short?)motivodosdescarte.CodigoCampo, idtablamotivodescarte = motivodosdescarte.IdTabla } into ProspectoMotivoDosDescarte
								from pmotivodosdescarte in ProspectoMotivoDosDescarte.DefaultIfEmpty()
								join referido in _context.Prospectos on p.IdReferenciador equals referido.IdProspecto into ProspectoReferido
								from preferido in ProspectoReferido.DefaultIfEmpty()
								join cargo in _context.TablaTablas on new {p.CodigoCargo,idtablacargo = TablaTabla.PersonaCargo}
								                                   equals new { CodigoCargo = (short?)cargo.CodigoCampo, idtablacargo = cargo.IdTabla} into ProspectoCargo
								from pcargo in ProspectoCargo.DefaultIfEmpty()
								join sexo in _context.TablaTablas on new {p.CodigoSexo,idtablasexo = TablaTabla.Sexo}
								                                  equals new { CodigoSexo  = (short?)sexo.CodigoCampo, idtablasexo = sexo.IdTabla} into ProspectoSexo
								from psexo in ProspectoSexo.DefaultIfEmpty()
								join direccion in _context.DireccionProspectos on p.IdProspecto equals direccion.IdProspecto into ProspectoDireccion
								from pdireccion in ProspectoDireccion.DefaultIfEmpty()
								join distrito in _context.Distritos on new {pdireccion.Departamento_Id,pdireccion.Provincia_Id,pdireccion.Distrito_Id}
								                                    equals new {distrito.Departamento_Id,distrito.Provincia_Id,distrito.Distrito_Id } into DireccionDistrito
							    from ddistrito in DireccionDistrito.DefaultIfEmpty()
								join provincia in _context.Provincias on new { pdireccion.Provincia_Id,pdireccion.Departamento_Id}
								                                      equals new {provincia.Provincia_Id,provincia.Departamento_Id} into DireccionProvincia
								from dprovincia in DireccionProvincia.DefaultIfEmpty()
								join departamento in _context.Departamentos on pdireccion.Departamento_Id equals departamento.Departamento_Id into DireccionDepartamento
								from ddepartamento in DireccionDepartamento.DefaultIfEmpty()
								where (intermediario.CodigoIntermediario == prospectoQueryFilter.codigointermediario) &&
									 (p.Nombres.Contains(prospectoQueryFilter.parametro) || p.ApellidoPaterno.Contains(prospectoQueryFilter.parametro) || 
									  p.ApellidoMaterno.Contains(prospectoQueryFilter.parametro) || ((p.Nombres + " " + p.ApellidoPaterno + " " + p.ApellidoMaterno).Contains(prospectoQueryFilter.parametro)) ||
									  p.Referenciador.Contains(prospectoQueryFilter.parametro) || p.NumeroDocumento.Contains(prospectoQueryFilter.parametro)) &&
									  ((p.AuditoriaFechaCreacion>=prospectoQueryFilter.fechacreacioninicio || prospectoQueryFilter.fechacreacioninicio==null) &&
									   (p.AuditoriaFechaCreacion<=prospectoQueryFilter.fechacreacionfin || prospectoQueryFilter.fechacreacionfin==null)) &&
									  (listcodigorangoedad.Contains(p.CodigoRangoEdad.Value) || listcodigorangoedad ==null) &&
									  (listcodigorangosexo.Contains(p.CodigoRangoEdad.Value) || listcodigorangosexo == null) &&
									  (listcodigorangofuente.Contains(p.CodigoRangoEdad.Value) || listcodigorangofuente == null) &&
									  (listcodigorangosubfuente.Contains(p.CodigoRangoEdad.Value) || listcodigorangosubfuente == null) &&
									  (listcodigorangoingreso.Contains(p.CodigoRangoEdad.Value) || listcodigorangoingreso == null) &&
									  (listcodigorangofondo.Contains(p.CodigoRangoEdad.Value) || listcodigorangofondo == null) &&
									  (!_context.Citas.Where(x => x.IdProspecto == p.IdProspecto).Select(x => x.IdProspecto).Contains(p.IdProspecto)) &&
									  (!_context.RecordatorioLlamadas.Where(x => x.IdProspecto == p.IdProspecto).Select(x =>x.IdProspecto).Contains(p.IdProspecto))

								select new
								{
									p,
									padn,
									pfuente,
									psubfuente,
									preferido,
									psexo,
									pcargo,
									pdireccion,
									ddistrito,
									dprovincia,
									ddepartamento,
									pmotivounodescarte,
									pmotivodosdescarte
									
								}).AsNoTracking().Select(x => new Prospecto
								{
									IdProspecto = x.p.IdProspecto,
									NombresApellidos = string.Format("{0} {1} {2}", x.p.Nombres, x.p.ApellidoPaterno, x.p.ApellidoMaterno),
									CodigoTipoDocumento = x.p.CodigoTipoDocumento.Value,
									NumeroDocumento = x.p.NumeroDocumento,
									Nombres = x.p.Nombres,
									ApellidoPaterno = x.p.ApellidoPaterno,
									ApellidoMaterno = x.p.ApellidoMaterno,
									CodigoFuente = x.p.CodigoFuente.Value,
									CodigoSubFuente = x.p.CodigoSubFuente.Value,
									NombreFuente = x.pfuente.ValorCadena,
									NombreSubFuente = x.psubfuente.ValorCadena,
									TelefonoFijo = x.p.TelefonoFijo,
									TelefonoCelular = x.p.TelefonoCelular,
									FechaNacimiento = x.p.FechaNacimiento.Value,
									Direccion = x.pdireccion.Direccion,
									Departamento_Id = x.pdireccion.Departamento_Id,
									Provincia_Id = x.pdireccion.Provincia_Id,
									Distrito_Id = x.pdireccion.Distrito_Id,
									Departamento = x.ddepartamento.Nombre,
									Provincia = x.dprovincia.Nombre,
									Distrito = x.ddistrito.Nombre,
									Edad =  DateTime.Now.Year - x.p.FechaNacimiento.Value.Year,
									CodigoSexo = x.p.CodigoSexo.Value,
									Sexo = x.psexo.ValorAuxiliarCadena,
									Empresa = x.p.Empresa,
									CodigoCargo = x.p.CodigoCargo.Value,
									NombreCargo = x.pcargo.ValorCadena,
									OtroCargo = x.p.OtroCargo,
									Referenciador = x.p.Referenciador,
									Hijos = x.padn.NumeroHijosDependiente.Value,
									Correo = x.p.CorreoElectronico1,
									MonedaFondo = x.padn.MonedaPatrimonioAfp.Value,
									MontoFondo = x.padn.MontoPatrimonioAfp.Value,									
									Fuente = string.Format("{0}{1} {2}", x.pfuente.ValorCadena, string.IsNullOrEmpty(x.psubfuente.ValorCadena) ? "" : "-" + x.psubfuente.ValorCadena,
																	x.p.IdReferenciador.HasValue ? x.preferido.Nombres + " " + x.preferido.ApellidoPaterno + " " + x.preferido.ApellidoMaterno : x.p.Referenciador),
									IdReferenciador = x.p.IdReferenciador.Value,
									FlagDescarte = x.p.FlagDescarte,
									TextoMotivoDescarte = string.IsNullOrEmpty(x.pmotivodosdescarte.ValorCadena) ? x.pmotivounodescarte.ValorCadena
									                                      : string.Format("{0}-{1}", x.pmotivounodescarte.ValorCadena, x.pmotivodosdescarte.ValorCadena),
									VisibleDescarte = x.p.FlagDescarte == true ? false : true,
									VisibleAgendar = true,
									FechaCreacion = x.p.AuditoriaFechaCreacion
								});
            #endregion
            return result;
		}

        public IQueryable<Prospecto> ObtenerCitaCalificada(ProspectoQueryFilter prospectoQueryFilter)
        {
            var listcodigorangosexo = prospectoQueryFilter.codigosexo != null ? prospectoQueryFilter.codigosexo.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoedad = prospectoQueryFilter.codigorangoedad != null ? prospectoQueryFilter.codigorangoedad.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofuente = prospectoQueryFilter.codigofuente != null ? prospectoQueryFilter.codigofuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangosubfuente = prospectoQueryFilter.codigosubfuente != null ? prospectoQueryFilter.codigosubfuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoingreso = prospectoQueryFilter.codigorangoingreso != null ? prospectoQueryFilter.codigorangoingreso.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofondo = prospectoQueryFilter.codigorangofondo != null ? prospectoQueryFilter.codigorangofondo.Split(',').Select(short.Parse).ToList() : null;			

			#region QueryProspectosCitaCalificada
			var result =        (from c in _context.Citas
								join p in _context.Prospectos on c.IdProspecto equals p.IdProspecto
								join intermediario in _context.ConsolidadoIntermediarios on p.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
								join adn in _context.AdnRentas on p.IdProspecto equals adn.IdProspecto into ProspectoAdn
								from padn in ProspectoAdn.DefaultIfEmpty()
								join fuente in _context.ListaTablas on new { p.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
								from pfuente in ProspectoFuente.DefaultIfEmpty()
								join subfuente in _context.ListaTablas on new { p.CodigoSubFuente, idtablaSubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablaSubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
								from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
								join motivounodescarte in _context.ListaTablas on new { p.CodigoMotivoUnoDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	equals new { CodigoMotivoUnoDescarte = (short?)motivounodescarte.CodigoCampo, idtablamotivodescarte = motivounodescarte.IdTabla } into ProspectoMotivoUnoDescarte
								from pmotivounodescarte in ProspectoMotivoUnoDescarte.DefaultIfEmpty()
								join motivodosdescarte in _context.ListaTablas on new { p.CodigoMotivoDosDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	equals new { CodigoMotivoDosDescarte = (short?)motivodosdescarte.CodigoCampo, idtablamotivodescarte = motivodosdescarte.IdTabla } into ProspectoMotivoDosDescarte
								from pmotivodosdescarte in ProspectoMotivoDosDescarte.DefaultIfEmpty()
								join referido in _context.Prospectos on p.IdReferenciador equals referido.IdProspecto into ProspectoReferido
								from preferido in ProspectoReferido.DefaultIfEmpty()
								join cargo in _context.TablaTablas on new { p.CodigoCargo, idtablacargo = TablaTabla.PersonaCargo }
																   equals new { CodigoCargo = (short?)cargo.CodigoCampo, idtablacargo = cargo.IdTabla } into ProspectoCargo
								from pcargo in ProspectoCargo.DefaultIfEmpty()
								join sexo in _context.TablaTablas on new { p.CodigoSexo, idtablasexo = TablaTabla.Sexo }
																  equals new { CodigoSexo = (short?)sexo.CodigoCampo, idtablasexo = sexo.IdTabla } into ProspectoSexo
								from psexo in ProspectoSexo.DefaultIfEmpty()
								join direccion in _context.DireccionProspectos on p.IdProspecto equals direccion.IdProspecto into ProspectoDireccion
								from pdireccion in ProspectoDireccion.DefaultIfEmpty()
								join distrito in _context.Distritos on new { pdireccion.Departamento_Id, pdireccion.Provincia_Id, pdireccion.Distrito_Id }
																	equals new { distrito.Departamento_Id, distrito.Provincia_Id, distrito.Distrito_Id } into DireccionDistrito
								from ddistrito in DireccionDistrito.DefaultIfEmpty()
								join provincia in _context.Provincias on new { pdireccion.Provincia_Id, pdireccion.Departamento_Id }
																	  equals new { provincia.Provincia_Id, provincia.Departamento_Id } into DireccionProvincia
								from dprovincia in DireccionProvincia.DefaultIfEmpty()
								join departamento in _context.Departamentos on pdireccion.Departamento_Id equals departamento.Departamento_Id into DireccionDepartamento
								from ddepartamento in DireccionDepartamento.DefaultIfEmpty()
								join lineanegocio in _context.TablaTablas on new { c.CodigoLineaNegocio, idtablalineanegocio = TablaTabla.LineaNegocio }
																  equals new { CodigoLineaNegocio = (short?)lineanegocio.CodigoCampo, idtablalineanegocio = lineanegocio.IdTabla } into ProspectoLineaNegocio
								from plineanegocio in ProspectoLineaNegocio.DefaultIfEmpty()
								join porcentajeavance in _context.TablaTablas on new { c.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
																  equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaPorcentaje
								from cporcentajeavance in CitaPorcentaje.DefaultIfEmpty()
								where (intermediario.CodigoIntermediario == prospectoQueryFilter.codigointermediario) &&
									  (c.FlagCalificacion.Value) &&
									  (p.Nombres.Contains(prospectoQueryFilter.parametro) || p.ApellidoPaterno.Contains(prospectoQueryFilter.parametro) ||
									  p.ApellidoMaterno.Contains(prospectoQueryFilter.parametro) || ((p.Nombres + " " + p.ApellidoPaterno + " " + p.ApellidoMaterno).Contains(prospectoQueryFilter.parametro)) ||
									  p.Referenciador.Contains(prospectoQueryFilter.parametro) || p.NumeroDocumento.Contains(prospectoQueryFilter.parametro)) &&
									  ((p.AuditoriaFechaCreacion >= prospectoQueryFilter.fechacreacioninicio || prospectoQueryFilter.fechacreacioninicio == null) &&
									   (p.AuditoriaFechaCreacion <= prospectoQueryFilter.fechacreacionfin || prospectoQueryFilter.fechacreacionfin == null)) &&
									   ((c.FechaEstimadaCierre >= prospectoQueryFilter.fechaestimadacierreinicio || prospectoQueryFilter.fechaestimadacierreinicio == null) &&
									   (c.FechaEstimadaCierre <= prospectoQueryFilter.fechaestimadacierrefin || prospectoQueryFilter.fechaestimadacierrefin == null)) &&
									   ((c.AuditoriaFechaCreacion >= prospectoQueryFilter.fechaultimaactividadinicio || prospectoQueryFilter.fechaultimaactividadinicio == null) &&
									   (c.AuditoriaFechaCreacion <= prospectoQueryFilter.fechaultimaactividadfin || prospectoQueryFilter.fechaultimaactividadfin == null)) &&
									   (listcodigorangoedad.Contains(p.CodigoRangoEdad.Value) || listcodigorangoedad == null) &&
									  (listcodigorangosexo.Contains(p.CodigoSexo.Value) || listcodigorangosexo == null) &&
									  (listcodigorangofuente.Contains(p.CodigoFuente.Value) || listcodigorangofuente == null) &&
									  (listcodigorangosubfuente.Contains(p.CodigoSubFuente.Value) || listcodigorangosubfuente == null) &&
									  (listcodigorangoingreso.Contains(p.CodigoRangoIngreso.Value) || listcodigorangoingreso == null) &&
									  (listcodigorangofondo.Contains(p.CodigoRangoFondo.Value) || listcodigorangofondo == null) &&
									  (!_context.Citas.Where(x => x.IdProspecto == p.IdProspecto && x.FlagCalificacion == null).Select(x => x.IdProspecto).Contains(p.IdProspecto))
									  //(!_context.RecordatorioLlamadas.Where(x => x.IdProspecto == p.IdProspecto && x.FechaRecordatorio > c.FechaCita).Select(x => x.IdProspecto).Contains(p.IdProspecto))

								select new
								{
									p,
									c,
									padn,
									preferido,
									pfuente,
									psubfuente,
									psexo,
									pcargo,
									pdireccion,
									ddistrito,
									dprovincia,
									ddepartamento,
									pmotivounodescarte,
									pmotivodosdescarte,
									plineanegocio,
									cporcentajeavance

								}).GroupBy(x => new {x.p.IdProspecto,x.p.Nombres,x.p.ApellidoPaterno,x.p.ApellidoMaterno,
								x.p.CodigoTipoDocumento,x.p.NumeroDocumento,x.p.CodigoFuente,x.p.CodigoSubFuente,NombreFuente=x.pfuente.ValorCadena,
								NombreSubfuente =x.psubfuente.ValorCadena,x.p.TelefonoFijo,x.p.TelefonoCelular,x.p.FechaNacimiento,
								x.pdireccion.Direccion,x.pdireccion.Departamento_Id,x.pdireccion.Provincia_Id,x.pdireccion.Distrito_Id,
								Departamento =x.ddepartamento.Nombre,Provincia = x.dprovincia.Nombre,Distrito= x.ddistrito.Nombre,
								NombreReferido = x.preferido.Nombres,ApellidoPaternoReferido = x.preferido.ApellidoPaterno, ApellidoMaternoReferido = x.preferido.ApellidoMaterno,
								x.p.CodigoSexo,Sexo =x.psexo.ValorAuxiliarCadena,x.p.Empresa,x.p.CodigoCargo,NombreCargo =x.pcargo.ValorCadena,x.p.OtroCargo,x.p.Referenciador,
								x.padn.NumeroHijosDependiente,x.p.CorreoElectronico1,x.p.MonedaFondo,x.p.MontoFondo,x.p.IdReferenciador,
								x.p.FlagDescarte,MotivoDescarteUno = x.pmotivodosdescarte.ValorCadena,MotivoDescarteDos =x.pmotivounodescarte.ValorCadena,
								Producto =x.plineanegocio.ValorCadena,x.padn.MonedaPatrimonioAfp,x.padn.MontoPatrimonioAfp
								}).Select(y => new Prospecto() 
								{
									IdProspecto = y.Key.IdProspecto,
									Nombres = y.Key.Nombres,
									ApellidoPaterno = y.Key.ApellidoPaterno,
									ApellidoMaterno = y.Key.ApellidoMaterno,
									NombresApellidos = string.Format("{0} {1} {2}", y.Key.Nombres, y.Key.ApellidoPaterno, y.Key.ApellidoMaterno),
									CodigoTipoDocumento = y.Key.CodigoTipoDocumento.Value,
									NumeroDocumento = y.Key.NumeroDocumento,
									CodigoFuente = y.Key.CodigoFuente.Value,
									CodigoSubFuente = y.Key.CodigoSubFuente.Value,
									NombreFuente = y.Key.NombreFuente,
									NombreSubFuente = y.Key.NombreSubfuente,
									TelefonoFijo = y.Key.TelefonoFijo,
									TelefonoCelular = y.Key.TelefonoCelular,
									FechaNacimiento = y.Key.FechaNacimiento.Value,
									Direccion = y.Key.Direccion,
									Departamento_Id = y.Key.Departamento_Id,
									Provincia_Id = y.Key.Provincia_Id,
									Distrito_Id = y.Key.Distrito_Id,
									Departamento = y.Key.Departamento,
									Provincia = y.Key.Provincia,
									Distrito = y.Key.Distrito,
									Edad = DateTime.Now.Year - y.Key.FechaNacimiento.Value.Year,
									CodigoSexo = y.Key.CodigoSexo.Value,
									Sexo = y.Key.Sexo,
									Empresa = y.Key.Empresa,
									CodigoCargo = y.Key.CodigoCargo.Value,
									NombreCargo = y.Key.NombreCargo,
									OtroCargo = y.Key.OtroCargo,
									Referenciador = y.Key.Referenciador,
									Hijos = y.Key.NumeroHijosDependiente.Value,
									Correo = y.Key.CorreoElectronico1,
									MonedaFondo = y.Key.MonedaPatrimonioAfp.Value,
									MontoFondo = y.Key.MontoPatrimonioAfp.Value,																
									Fuente = string.Format("{0}{1} {2}", y.Key.NombreFuente, string.IsNullOrEmpty(y.Key.NombreSubfuente) ? "" : "-" + y.Key.NombreSubfuente,
																	y.Key.IdReferenciador.HasValue ? y.Key.NombreReferido + " " + y.Key.ApellidoPaternoReferido + " " + y.Key.ApellidoMaternoReferido : y.Key.Referenciador),
									IdReferenciador = y.Key.IdReferenciador.Value,
									FlagDescarte = y.Key.FlagDescarte,
									TextoMotivoDescarte = string.IsNullOrEmpty(y.Key.MotivoDescarteDos) ? y.Key.MotivoDescarteUno
																		  : string.Format("{0}-{1}", y.Key.MotivoDescarteUno, y.Key.MotivoDescarteDos),
									PorcentajeAvance = (int)y.Max(x => x.cporcentajeavance.ValorNumerico),
									DescripcionAvance = y.Max(x => x.cporcentajeavance.ValorNumerico) == 100 ? "Cierre" : 
									                    y.Max(x => x.cporcentajeavance.ValorNumerico) == 80 ? "Probable Cierre" :
														y.Max(x => x.cporcentajeavance.ValorNumerico) == 60 ? "Entrevista" :
														y.Max(x => x.cporcentajeavance.ValorNumerico) == 40 ? "Cita":
														y.Max(x => x.cporcentajeavance.ValorNumerico) == 20 ? "Contactado" :
														y.Max(x => x.cporcentajeavance.ValorNumerico) == 0 ? "No Contactado" : "",
									PorcentajeAvanceAnterior = (int)(((from citamax in _context.Citas
																	   join porcentajeavance in _context.TablaTablas on new { citamax.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
																	   equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaMaxPorcentaje
																	   from citamaxporcentajeavance in CitaMaxPorcentaje.DefaultIfEmpty()
																	   where citamax.IdProspecto == y.Key.IdProspecto
																	   select new { citamax, citamaxporcentajeavance }
																		).GroupBy(x => new { x.citamax.IdProspecto })
																		.Select(y => new {
																			PorcentajeMaximo = y.Max(x => x.citamaxporcentajeavance.ValorNumerico.Value)
																		})).First().PorcentajeMaximo),
									VisibleDescarte = (y.Key.FlagDescarte.Value || y.Max(x => x.cporcentajeavance.ValorNumerico) == 100) ? false : true,
									VisibleAgendar = y.Max(x => x.cporcentajeavance.ValorNumerico) == 100 ? false : true,
									FechaCreacion = y.Max(x => x.p.AuditoriaFechaCreacion),
									FechaEstimadaCierre = y.Max(x => x.c.FechaEstimadaCierre),
									FechaUltimaActividad = y.Max(x => x.c.AuditoriaFechaCreacion),
									Producto = y.Key.Producto			

								});
            #endregion
            return result;
		}

		public IQueryable<Prospecto> ObtenerAgendadosCitas(ProspectoQueryFilter prospectoQueryFilter)
		{
			var listcodigorangosexo = prospectoQueryFilter.codigosexo != null ? prospectoQueryFilter.codigosexo.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoedad = prospectoQueryFilter.codigorangoedad != null ? prospectoQueryFilter.codigorangoedad.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofuente = prospectoQueryFilter.codigofuente != null ? prospectoQueryFilter.codigofuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangosubfuente = prospectoQueryFilter.codigosubfuente != null ? prospectoQueryFilter.codigosubfuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoingreso = prospectoQueryFilter.codigorangoingreso != null ? prospectoQueryFilter.codigorangoingreso.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofondo = prospectoQueryFilter.codigorangofondo != null ? prospectoQueryFilter.codigorangofondo.Split(',').Select(short.Parse).ToList() : null;

            #region QueryObtenerProspectosAgendadoCita
            var result =        (from c in _context.Citas
								 join p in _context.Prospectos on c.IdProspecto equals p.IdProspecto
								 join intermediario in _context.ConsolidadoIntermediarios on p.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
								 join adn in _context.AdnRentas on p.IdProspecto equals adn.IdProspecto into ProspectoAdn
								 from padn in ProspectoAdn.DefaultIfEmpty()
								 join fuente in _context.ListaTablas on new { p.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	 equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
								 from pfuente in ProspectoFuente.DefaultIfEmpty()
								 join subfuente in _context.ListaTablas on new { p.CodigoSubFuente, idtablaSubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	 equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablaSubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
								 from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
								 join motivounodescarte in _context.ListaTablas on new { p.CodigoMotivoUnoDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	 equals new { CodigoMotivoUnoDescarte = (short?)motivounodescarte.CodigoCampo, idtablamotivodescarte = motivounodescarte.IdTabla } into ProspectoMotivoUnoDescarte
								 from pmotivounodescarte in ProspectoMotivoUnoDescarte.DefaultIfEmpty()
								 join motivodosdescarte in _context.ListaTablas on new { p.CodigoMotivoDosDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	 equals new { CodigoMotivoDosDescarte = (short?)motivodosdescarte.CodigoCampo, idtablamotivodescarte = motivodosdescarte.IdTabla } into ProspectoMotivoDosDescarte
								 from pmotivodosdescarte in ProspectoMotivoDosDescarte.DefaultIfEmpty()
								 join referido in _context.Prospectos on p.IdReferenciador equals referido.IdProspecto into ProspectoReferido
								 from preferido in ProspectoReferido.DefaultIfEmpty()
								 join cargo in _context.TablaTablas on new { p.CodigoCargo, idtablacargo = TablaTabla.PersonaCargo }
																	equals new { CodigoCargo = (short?)cargo.CodigoCampo, idtablacargo = cargo.IdTabla } into ProspectoCargo
								 from pcargo in ProspectoCargo.DefaultIfEmpty()
								 join sexo in _context.TablaTablas on new { p.CodigoSexo, idtablasexo = TablaTabla.Sexo }
																   equals new { CodigoSexo = (short?)sexo.CodigoCampo, idtablasexo = sexo.IdTabla } into ProspectoSexo
								 from psexo in ProspectoSexo.DefaultIfEmpty()
								 join direccion in _context.DireccionProspectos on p.IdProspecto equals direccion.IdProspecto into ProspectoDireccion
								 from pdireccion in ProspectoDireccion.DefaultIfEmpty()
								 join distrito in _context.Distritos on new { pdireccion.Departamento_Id, pdireccion.Provincia_Id, pdireccion.Distrito_Id }
																	 equals new { distrito.Departamento_Id, distrito.Provincia_Id, distrito.Distrito_Id } into DireccionDistrito
								 from ddistrito in DireccionDistrito.DefaultIfEmpty()
								 join provincia in _context.Provincias on new { pdireccion.Provincia_Id, pdireccion.Departamento_Id }
																	   equals new { provincia.Provincia_Id, provincia.Departamento_Id } into DireccionProvincia
								 from dprovincia in DireccionProvincia.DefaultIfEmpty()
								 join departamento in _context.Departamentos on pdireccion.Departamento_Id equals departamento.Departamento_Id into DireccionDepartamento
								 from ddepartamento in DireccionDepartamento.DefaultIfEmpty()
								 join lineanegocio in _context.TablaTablas on new { c.CodigoLineaNegocio, idtablalineanegocio = TablaTabla.LineaNegocio }
																   equals new { CodigoLineaNegocio = (short?)lineanegocio.CodigoCampo, idtablalineanegocio = lineanegocio.IdTabla } into ProspectoLineaNegocio
								 from plineanegocio in ProspectoLineaNegocio.DefaultIfEmpty()
								 join porcentajeavance in _context.TablaTablas on new { c.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
																   equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaPorcentaje
								 from cporcentajeavance in CitaPorcentaje.DefaultIfEmpty()
								 where (intermediario.CodigoIntermediario == prospectoQueryFilter.codigointermediario) &&
									  (p.Nombres.Contains(prospectoQueryFilter.parametro) || p.ApellidoPaterno.Contains(prospectoQueryFilter.parametro) ||
									   p.ApellidoMaterno.Contains(prospectoQueryFilter.parametro) || ((p.Nombres + " " + p.ApellidoPaterno + " " + p.ApellidoMaterno).Contains(prospectoQueryFilter.parametro)) ||
									   p.Referenciador.Contains(prospectoQueryFilter.parametro) || p.NumeroDocumento.Contains(prospectoQueryFilter.parametro)) &&
									   ((p.AuditoriaFechaCreacion >= prospectoQueryFilter.fechacreacioninicio || prospectoQueryFilter.fechacreacioninicio == null) &&
										(p.AuditoriaFechaCreacion <= prospectoQueryFilter.fechacreacionfin || prospectoQueryFilter.fechacreacionfin == null)) &&
										((c.FechaEstimadaCierre >= prospectoQueryFilter.fechaestimadacierreinicio || prospectoQueryFilter.fechaestimadacierreinicio == null) &&
										(c.FechaEstimadaCierre <= prospectoQueryFilter.fechaestimadacierrefin || prospectoQueryFilter.fechaestimadacierrefin == null)) &&
									   //((c.AuditoriaFechaCreacion >= prospectoQueryFilter.fechaultimaactividadinicio || prospectoQueryFilter.fechaultimaactividadinicio == null) &&
									   //(c.AuditoriaFechaCreacion <= prospectoQueryFilter.fechaultimaactividadfin || prospectoQueryFilter.fechaultimaactividadfin == null)) &&
									   ((prospectoQueryFilter.fechacreacioncita ==null) || (c.AuditoriaFechaCreacion.Value.Date == prospectoQueryFilter.fechacreacioncita.Value.Date)) &&
									   (c.FlagCalificacion == null) && (c.CodigoMotivoReagendado == null || c.CodigoMotivoReagendado == 2 || c.CodigoMotivoReagendado == 4) &&
									   (listcodigorangoedad.Contains(p.CodigoRangoEdad.Value) || listcodigorangoedad == null) &&
									   (listcodigorangosexo.Contains(p.CodigoSexo.Value) || listcodigorangosexo == null) &&
									   (listcodigorangofuente.Contains(p.CodigoFuente.Value) || listcodigorangofuente == null) &&
									   (listcodigorangosubfuente.Contains(p.CodigoSubFuente.Value) || listcodigorangosubfuente == null) &&
									   (listcodigorangoingreso.Contains(p.CodigoRangoIngreso.Value) || listcodigorangoingreso == null) &&
									   (listcodigorangofondo.Contains(p.CodigoRangoFondo.Value) || listcodigorangofondo == null)


								 select new
								 {
									 p,
									 c,
									 padn,
									 preferido,
									 pfuente,
									 psubfuente,
									 psexo,
									 pcargo,
									 pdireccion,
									 ddistrito,
									 dprovincia,
									 ddepartamento,
									 pmotivounodescarte,
									 pmotivodosdescarte,
									 plineanegocio,
									 cporcentajeavance

								 }).AsNoTracking().GroupBy(x => new {x.p.IdProspecto,x.p.Nombres,x.p.ApellidoPaterno,x.p.ApellidoMaterno,
								x.p.CodigoTipoDocumento,x.p.NumeroDocumento,x.p.CodigoFuente,x.p.CodigoSubFuente,NombreFuente=x.pfuente.ValorCadena,
								NombreSubfuente =x.psubfuente.ValorCadena,x.p.TelefonoFijo,x.p.TelefonoCelular,x.p.FechaNacimiento,
								NombreReferido = x.preferido.Nombres,ApellidoPaternoReferido = x.preferido.ApellidoPaterno, ApellidoMaternoReferido = x.preferido.ApellidoMaterno,
							    x.pdireccion.Direccion,x.pdireccion.Departamento_Id,x.pdireccion.Provincia_Id,x.pdireccion.Distrito_Id,
								Departamento =x.ddepartamento.Nombre,Provincia = x.dprovincia.Nombre,Distrito= x.ddistrito.Nombre,
								x.p.CodigoSexo,Sexo =x.psexo.ValorAuxiliarCadena,x.p.Empresa,x.p.CodigoCargo,NombreCargo =x.pcargo.ValorCadena,x.p.OtroCargo,x.p.Referenciador,
								x.padn.NumeroHijosDependiente,x.p.CorreoElectronico1,x.p.MonedaFondo,x.p.MontoFondo,x.p.IdReferenciador,
								x.p.FlagDescarte,MotivoDescarteUno = x.pmotivodosdescarte.ValorCadena,MotivoDescarteDos =x.pmotivounodescarte.ValorCadena,
								Producto =x.plineanegocio.ValorCadena,x.padn.MonedaPatrimonioAfp,x.padn.MontoPatrimonioAfp }).Select(y => new Prospecto()
								 {
									IdProspecto = y.Key.IdProspecto,
									Nombres = y.Key.Nombres,
									ApellidoPaterno = y.Key.ApellidoPaterno,
									ApellidoMaterno = y.Key.ApellidoMaterno,
									NombresApellidos = string.Format("{0} {1} {2}", y.Key.Nombres, y.Key.ApellidoPaterno, y.Key.ApellidoMaterno),
									CodigoTipoDocumento = y.Key.CodigoTipoDocumento.Value,
									NumeroDocumento = y.Key.NumeroDocumento,
									CodigoFuente = y.Key.CodigoFuente.Value,
									CodigoSubFuente = y.Key.CodigoSubFuente.Value,
									NombreFuente = y.Key.NombreFuente,
									NombreSubFuente = y.Key.NombreSubfuente,
									TelefonoFijo = y.Key.TelefonoFijo,
									TelefonoCelular = y.Key.TelefonoCelular,
									FechaNacimiento = y.Key.FechaNacimiento.Value,
									Direccion = y.Key.Direccion,
									Departamento_Id = y.Key.Departamento_Id,
									Provincia_Id = y.Key.Provincia_Id,
									Distrito_Id = y.Key.Distrito_Id,
									Departamento = y.Key.Departamento,
									Provincia = y.Key.Provincia,
									Distrito = y.Key.Distrito,
									Edad = DateTime.Now.Year - y.Key.FechaNacimiento.Value.Year,
									CodigoSexo = y.Key.CodigoSexo.Value,
									Sexo = y.Key.Sexo,
									Empresa = y.Key.Empresa,
									CodigoCargo = y.Key.CodigoCargo.Value,
									NombreCargo = y.Key.NombreCargo,
									OtroCargo = y.Key.OtroCargo,
									Referenciador = y.Key.Referenciador,
									Hijos = y.Key.NumeroHijosDependiente.Value,
									Correo = y.Key.CorreoElectronico1,
									MonedaFondo = y.Key.MonedaPatrimonioAfp.Value,
									MontoFondo = y.Key.MontoPatrimonioAfp.Value,
									Fuente = string.Format("{0}{1} {2}", y.Key.NombreFuente, string.IsNullOrEmpty(y.Key.NombreSubfuente) ? "" : "-" + y.Key.NombreSubfuente,
																	y.Key.IdReferenciador.HasValue ? y.Key.NombreReferido + " " + y.Key.ApellidoPaternoReferido + " " + y.Key.ApellidoMaternoReferido : y.Key.Referenciador),
									IdReferenciador = y.Key.IdReferenciador.Value,
									FlagDescarte = y.Key.FlagDescarte,
									PorcentajeAvanceAnterior  = (int)(((from citamax in _context.Citas
																								  join porcentajeavance in _context.TablaTablas on new { citamax.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
																								  equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaMaxPorcentaje
																								  from citamaxporcentajeavance in CitaMaxPorcentaje.DefaultIfEmpty()
																								  where citamax.IdProspecto == y.Key.IdProspecto
																								  select new { citamax, citamaxporcentajeavance }
																		).GroupBy(x => new { x.citamax.IdProspecto })
																		.Select(y => new {
																			PorcentajeMaximo = y.Max(x => x.citamaxporcentajeavance.ValorNumerico.Value)
																		})).First().PorcentajeMaximo),
									TextoMotivoDescarte = string.IsNullOrEmpty(y.Key.MotivoDescarteDos) ? y.Key.MotivoDescarteUno
																		  : string.Format("{0}-{1}", y.Key.MotivoDescarteUno, y.Key.MotivoDescarteDos),
									VisibleDescarte = y.Key.FlagDescarte.Value ? false : true,
									VisibleAgendar = (y.Key.FlagDescarte.Value || prospectoQueryFilter.tab == "RecordatorioLlamada") ? true : false,
									FechaCreacion = y.Max(x => x.p.AuditoriaFechaCreacion),
									FechaUltimaActividad = y.Max(x => x.c.AuditoriaFechaCreacion),
									Producto = y.Key.Producto
								});
            #endregion

            return result;
		}

		public IQueryable<Prospecto> ObtenerAgendadosRecordatorioLlamada(ProspectoQueryFilter prospectoQueryFilter, List<int> idsprospecto)
		{
			var listcodigorangosexo = prospectoQueryFilter.codigosexo != null ? prospectoQueryFilter.codigosexo.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoedad = prospectoQueryFilter.codigorangoedad != null ? prospectoQueryFilter.codigorangoedad.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofuente = prospectoQueryFilter.codigofuente != null ? prospectoQueryFilter.codigofuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangosubfuente = prospectoQueryFilter.codigosubfuente != null ? prospectoQueryFilter.codigosubfuente.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangoingreso = prospectoQueryFilter.codigorangoingreso != null ? prospectoQueryFilter.codigorangoingreso.Split(',').Select(short.Parse).ToList() : null;
			var listcodigorangofondo = prospectoQueryFilter.codigorangofondo != null ? prospectoQueryFilter.codigorangofondo.Split(',').Select(short.Parse).ToList() : null;

            #region QueryObtenerProspectosRecordatorioLlamada
            var result =        (
								from r in _context.RecordatorioLlamadas
								join p in _context.Prospectos on r.IdProspecto equals p.IdProspecto
								join intermediario in _context.ConsolidadoIntermediarios on p.IdConsolidadoIntermediario equals intermediario.IdConsolidadoIntermediario
								join adn in _context.AdnRentas on p.IdProspecto equals adn.IdProspecto into ProspectoAdn
								from padn in ProspectoAdn.DefaultIfEmpty()
								join fuente in _context.ListaTablas on new { p.CodigoFuente, idtablafuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	equals new { CodigoFuente = (short?)fuente.CodigoCampo, idtablafuente = fuente.IdTabla, lnegocio = fuente.CodigoLineaNegocio } into ProspectoFuente
								from pfuente in ProspectoFuente.DefaultIfEmpty()
								join subfuente in _context.ListaTablas on new { p.CodigoSubFuente, idtablaSubfuente = TablaTabla.FuenteProspecto, lnegocio = LineaNegocio.Renta }
																	equals new { CodigoSubFuente = (short?)subfuente.CodigoCampo, idtablaSubfuente = subfuente.IdTabla, lnegocio = subfuente.CodigoLineaNegocio } into ProspectoSubFuente
								from psubfuente in ProspectoSubFuente.DefaultIfEmpty()
								join motivounodescarte in _context.ListaTablas on new { p.CodigoMotivoUnoDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	equals new { CodigoMotivoUnoDescarte = (short?)motivounodescarte.CodigoCampo, idtablamotivodescarte = motivounodescarte.IdTabla } into ProspectoMotivoUnoDescarte
								from pmotivounodescarte in ProspectoMotivoUnoDescarte.DefaultIfEmpty()
								join motivodosdescarte in _context.ListaTablas on new { p.CodigoMotivoDosDescarte, idtablamotivodescarte = TablaTabla.MotivoDescarte }
																	equals new { CodigoMotivoDosDescarte = (short?)motivodosdescarte.CodigoCampo, idtablamotivodescarte = motivodosdescarte.IdTabla } into ProspectoMotivoDosDescarte
								from pmotivodosdescarte in ProspectoMotivoDosDescarte.DefaultIfEmpty()
								join referido in _context.Prospectos on p.IdReferenciador equals referido.IdProspecto into ProspectoReferido
								from preferido in ProspectoReferido.DefaultIfEmpty()
								join cargo in _context.TablaTablas on new { p.CodigoCargo, idtablacargo = TablaTabla.PersonaCargo }
																   equals new { CodigoCargo = (short?)cargo.CodigoCampo, idtablacargo = cargo.IdTabla } into ProspectoCargo
								from pcargo in ProspectoCargo.DefaultIfEmpty()
								join sexo in _context.TablaTablas on new { p.CodigoSexo, idtablasexo = TablaTabla.Sexo }
																  equals new { CodigoSexo = (short?)sexo.CodigoCampo, idtablasexo = sexo.IdTabla } into ProspectoSexo
								from psexo in ProspectoSexo.DefaultIfEmpty()
								join direccion in _context.DireccionProspectos on p.IdProspecto equals direccion.IdProspecto into ProspectoDireccion
								from pdireccion in ProspectoDireccion.DefaultIfEmpty()
								join distrito in _context.Distritos on new { pdireccion.Departamento_Id, pdireccion.Provincia_Id, pdireccion.Distrito_Id }
																	equals new { distrito.Departamento_Id, distrito.Provincia_Id, distrito.Distrito_Id } into DireccionDistrito
								from ddistrito in DireccionDistrito.DefaultIfEmpty()
								join provincia in _context.Provincias on new { pdireccion.Provincia_Id, pdireccion.Departamento_Id }
																	  equals new { provincia.Provincia_Id, provincia.Departamento_Id } into DireccionProvincia
								from dprovincia in DireccionProvincia.DefaultIfEmpty()
								join departamento in _context.Departamentos on pdireccion.Departamento_Id equals departamento.Departamento_Id into DireccionDepartamento
								from ddepartamento in DireccionDepartamento.DefaultIfEmpty()
								join lineanegocio in _context.TablaTablas on new { r.CodigoLineaNegocio, idtablalineanegocio = TablaTabla.LineaNegocio }
																  equals new { CodigoLineaNegocio = (short?)lineanegocio.CodigoCampo, idtablalineanegocio = lineanegocio.IdTabla } into ProspectoLineaNegocio
								from plineanegocio in ProspectoLineaNegocio.DefaultIfEmpty()
								where (intermediario.CodigoIntermediario == prospectoQueryFilter.codigointermediario) &&
									 (p.Nombres.Contains(prospectoQueryFilter.parametro) || p.ApellidoPaterno.Contains(prospectoQueryFilter.parametro) ||
									  p.ApellidoMaterno.Contains(prospectoQueryFilter.parametro) || ((p.Nombres + " " + p.ApellidoPaterno + " " + p.ApellidoMaterno).Contains(prospectoQueryFilter.parametro)) ||
									  p.Referenciador.Contains(prospectoQueryFilter.parametro) || p.NumeroDocumento.Contains(prospectoQueryFilter.parametro)) &&
									  ((p.AuditoriaFechaCreacion >= prospectoQueryFilter.fechacreacioninicio || prospectoQueryFilter.fechacreacioninicio == null) &&
									   (p.AuditoriaFechaCreacion <= prospectoQueryFilter.fechacreacionfin || prospectoQueryFilter.fechacreacionfin == null)) &&
									   //((c.FechaEstimadaCierre >= prospectoQueryFilter.fechaestimadacierreinicio || prospectoQueryFilter.fechaestimadacierreinicio == null) &&
									   //(c.FechaEstimadaCierre <= prospectoQueryFilter.fechaestimadacierrefin || prospectoQueryFilter.fechaestimadacierrefin == null)) &&
									  //((c.AuditoriaFechaCreacion >= prospectoQueryFilter.fechaultimaactividadinicio || prospectoQueryFilter.fechaultimaactividadinicio == null) &&
									  //(c.AuditoriaFechaCreacion <= prospectoQueryFilter.fechaultimaactividadfin || prospectoQueryFilter.fechaultimaactividadfin == null)) &&
									  (r.AuditoriaFechaCreacion.Value.Date == DateTime.Now.Date) &&
									  (r.FlagActivo.Value) &&
									  !idsprospecto.Contains(p.IdProspecto) &&
									  (listcodigorangoedad.Contains(p.CodigoRangoEdad.Value) || listcodigorangoedad == null) &&
									  (listcodigorangosexo.Contains(p.CodigoSexo.Value) || listcodigorangosexo == null) &&
									  (listcodigorangofuente.Contains(p.CodigoFuente.Value) || listcodigorangofuente == null) &&
									  (listcodigorangosubfuente.Contains(p.CodigoSubFuente.Value) || listcodigorangosubfuente == null) &&
									  (listcodigorangoingreso.Contains(p.CodigoRangoIngreso.Value) || listcodigorangoingreso == null) &&
									  (listcodigorangofondo.Contains(p.CodigoRangoFondo.Value) || listcodigorangofondo == null)


								select new
								{
									p,
									r,
									padn,
									preferido,
									pfuente,
									psubfuente,
									psexo,
									pcargo,
									pdireccion,
									ddistrito,
									dprovincia,
									ddepartamento,
									pmotivounodescarte,
									pmotivodosdescarte,
									plineanegocio

								}).AsNoTracking().Select(x => new Prospecto
								{
									IdProspecto = x.p.IdProspecto,
									NombresApellidos = string.Format("{0} {1} {2}", x.p.Nombres, x.p.ApellidoPaterno, x.p.ApellidoMaterno),
									CodigoTipoDocumento = x.p.CodigoTipoDocumento.Value,
									NumeroDocumento = x.p.NumeroDocumento,
									Nombres = x.p.Nombres,
									ApellidoPaterno = x.p.ApellidoPaterno,
									ApellidoMaterno = x.p.ApellidoMaterno,
									CodigoFuente = x.p.CodigoFuente.Value,
									CodigoSubFuente = x.p.CodigoSubFuente.Value,
									NombreFuente = x.pfuente.ValorCadena,
									NombreSubFuente = x.psubfuente.ValorCadena,
									TelefonoFijo = x.p.TelefonoFijo,
									TelefonoCelular = x.p.TelefonoCelular,
									FechaNacimiento = x.p.FechaNacimiento.Value,
									Direccion = x.pdireccion.Direccion,
									Departamento_Id = x.pdireccion.Departamento_Id,
									Provincia_Id = x.pdireccion.Provincia_Id,
									Distrito_Id = x.pdireccion.Distrito_Id,
									Departamento = x.ddepartamento.Nombre,
									Provincia = x.dprovincia.Nombre,
									Distrito = x.ddistrito.Nombre,
									Edad = DateTime.Now.Year - x.p.FechaNacimiento.Value.Year,
									CodigoSexo = x.p.CodigoSexo.Value,
									Sexo = x.psexo.ValorAuxiliarCadena,
									Empresa = x.p.Empresa,
									CodigoCargo = x.p.CodigoCargo.Value,
									NombreCargo = x.pcargo.ValorCadena,
									OtroCargo = x.p.OtroCargo,
									Referenciador = x.p.Referenciador,
									Hijos = x.padn.NumeroHijosDependiente.Value,
									Correo = x.p.CorreoElectronico1,
									PorcentajeAvanceAnterior  = (int)(((from citamax in _context.Citas
																								  join porcentajeavance in _context.TablaTablas on new { citamax.CodigoPorcentajeAvanceCalificacion, idtablaporcentajeavance = TablaTabla.PorcentajeAvanceCalificacion }
																								  equals new { CodigoPorcentajeAvanceCalificacion = (short?)porcentajeavance.CodigoCampo, idtablaporcentajeavance = porcentajeavance.IdTabla } into CitaMaxPorcentaje
																								  from citamaxporcentajeavance in CitaMaxPorcentaje.DefaultIfEmpty()
																								  where citamax.IdProspecto == x.p.IdProspecto
																								  select new { citamax, citamaxporcentajeavance }
																		).GroupBy(x => new { x.citamax.IdProspecto })
																		.Select(y => new {
																			PorcentajeMaximo = y.Max(x => x.citamaxporcentajeavance.ValorNumerico.Value)
																		})).First().PorcentajeMaximo),
									MonedaFondo = x.padn.MonedaPatrimonioAfp.Value,
									MontoFondo = x.padn.MontoPatrimonioAfp.Value,
									Fuente = string.Format("{0}{1} {2}", x.pfuente.ValorCadena, string.IsNullOrEmpty(x.psubfuente.ValorCadena) ? "" : "-" + x.psubfuente.ValorCadena,
																	x.p.IdReferenciador.HasValue ? x.preferido.Nombres + " " + x.preferido.ApellidoPaterno + " " + x.preferido.ApellidoMaterno : x.p.Referenciador),
									IdReferenciador = x.p.IdReferenciador.Value,
									FlagDescarte = x.p.FlagDescarte,
									TextoMotivoDescarte = string.IsNullOrEmpty(x.pmotivodosdescarte.ValorCadena) ? x.pmotivounodescarte.ValorCadena
																		  : string.Format("{0}-{1}", x.pmotivounodescarte.ValorCadena, x.pmotivodosdescarte.ValorCadena),
									VisibleDescarte = x.p.FlagDescarte == true ? false : true,
									VisibleAgendar = true,
									FechaCreacion = x.p.AuditoriaFechaCreacion,
									FechaUltimaActividad = x.r.AuditoriaFechaCreacion,
									Producto = x.plineanegocio.ValorCadena,

								});
            #endregion

            return result;
		}
        #endregion
    }
}
