using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.SeedWork;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Agenda.Infrastucture.Repositories
{
    public class ProspectoRepository : IProspectoRepository
    {
        private readonly AgendaContext _context;
        public IUnitOfWork UnitOfWork { get { return _context; } }

        public ProspectoRepository(AgendaContext context) => _context = context ?? throw new ArgumentNullException(nameof(context));

        public void Agregar(Prospecto prospecto)
        {
            prospecto.AuditoriaFechaCreacion = DateTime.Now;
            _context.Prospectos.Add(prospecto);
        }

        public void Actualizar(Prospecto prospecto)
        {
            var response = _context.Prospectos.Where(x => x.IdProspecto == prospecto.IdProspecto)
                                              .Include(a => a.AdnRenta)
                                              .Include(d => d.DireccionProspecto).FirstOrDefault();
            if (response != null)
            {
                //Actualizamos Referido si el prospecto de fuente ADN
                if (prospecto.CodigoFuente == 2)
                {
                    var responsereferido = _context.Referidos.Where(x => x.IdProspecto == response.IdReferenciador
                                                   && x.Nombres == response.Nombres && x.ApellidoPaterno == response.ApellidoPaterno
                                                   && x.Telefono == response.TelefonoFijo).FirstOrDefault();

                    responsereferido.Nombres = prospecto.Nombres;
                    responsereferido.ApellidoPaterno = prospecto.ApellidoPaterno;
                    responsereferido.Telefono = prospecto.TelefonoFijo;
                }
                //Actualizamos Tabla Prospecto
                response.CodigoTipoDocumento = prospecto.CodigoTipoDocumento;
                response.NumeroDocumento = prospecto.NumeroDocumento;
                response.Nombres = prospecto.Nombres;
                response.ApellidoPaterno = prospecto.ApellidoPaterno;
                response.ApellidoMaterno = prospecto.ApellidoMaterno;
                response.FechaNacimiento = prospecto.FechaNacimiento;
                response.CodigoSexo = prospecto.CodigoSexo;
                response.CodigoFuente = prospecto.CodigoFuente;
                response.CodigoSubFuente = prospecto.CodigoSubFuente;
                response.Referenciador = prospecto.Referenciador;
                response.CodigoEtapa = prospecto.CodigoEtapa;
                response.CodigoEstado = prospecto.CodigoEstado;
                response.MonedaFondo = prospecto.MonedaFondo;
                response.CodigoRangoEdad = prospecto.CodigoRangoEdad;
                response.CodigoRangoFondo = prospecto.CodigoRangoFondo;
                response.MontoFondo = prospecto.MontoFondo;
                response.Empresa = prospecto.Empresa;
                response.CodigoCargo = prospecto.CodigoCargo;
                response.OtroCargo = prospecto.OtroCargo;
                response.FlagHijo = prospecto.FlagHijo;        
                response.TelefonoFijo = prospecto.TelefonoFijo;
                response.TelefonoCelular = prospecto.TelefonoCelular;
                response.CorreoElectronico1 = prospecto.CorreoElectronico1;
                response.AuditoriaFechaModificacion = DateTime.Now;
                response.AuditoriaUsuarioModificacion = prospecto.AuditoriaUsuarioModificacion;

                //Actualizar Direccion
                if (prospecto.DireccionProspecto != null)
                {
                    if (response.DireccionProspecto == null)
                        _context.DireccionProspectos.Add(prospecto.DireccionProspecto);
                    else
                    {
                        response.DireccionProspecto.Direccion = prospecto.DireccionProspecto.Direccion;
                        response.DireccionProspecto.Departamento_Id = prospecto.DireccionProspecto.Departamento_Id;
                        response.DireccionProspecto.Provincia_Id = prospecto.DireccionProspecto.Provincia_Id;
                        response.DireccionProspecto.Distrito_Id = prospecto.DireccionProspecto.Distrito_Id;
                    }
                }

                //Actualizamos Tabla ADN
                if (response.AdnRenta != null)
                {
                    response.AdnRenta.MonedaPatrimonioAfp = prospecto.AdnRenta.MonedaPatrimonioAfp;
                    response.AdnRenta.MontoPatrimonioAfp = prospecto.AdnRenta.MontoPatrimonioAfp;
                    response.AdnRenta.PorcentajeAvance = prospecto.AdnRenta.PorcentajeAvance;
                    response.AdnRenta.PorcentajeAvanceCompleto = prospecto.AdnRenta.PorcentajeAvanceCompleto;
                    response.AdnRenta.AuditoriaFechaModificacion = DateTime.Now;
                    response.AdnRenta.AuditoriaUsuarioModificacion = prospecto.AuditoriaUsuarioModificacion;
                }
                else
                {
                    _context.AdnRentas.Add(prospecto.AdnRenta);
                }
            }
        }

        public void Descartar(Prospecto prospecto)
        {
            var response = _context.Prospectos.Where(x => x.IdProspecto == prospecto.IdProspecto).FirstOrDefault();
            
            if(response !=null)
            {
                response.FlagDescarte = prospecto.FlagDescarte;
                response.CodigoMotivoUnoDescarte = prospecto.CodigoMotivoUnoDescarte;
                response.CodigoMotivoDosDescarte = prospecto.CodigoMotivoDosDescarte;
                response.CodigoMotivoTresDescarte = prospecto.CodigoMotivoTresDescarte;
                response.TextoMontivoTresDescarte = prospecto.TextoMontivoTresDescarte;
                response.FechaMotivoTresDescarte = prospecto.FechaMotivoTresDescarte;
                response.AuditoriaFechaModificacion = DateTime.Now;
                response.AuditoriaUsuarioModificacion = prospecto.AuditoriaUsuarioModificacion;
            }

            //Generar Recordatorio Llamada
            if(prospecto.FechaMotivoTresDescarte != null)
            {
                RecordatorioLlamada recordatorioLlamada = new RecordatorioLlamada();
                recordatorioLlamada.IdProspecto = prospecto.IdProspecto;
                recordatorioLlamada.FechaRecordatorio = prospecto.FechaMotivoTresDescarte.Value;
                recordatorioLlamada.IdRecordatorioLlamadaDispositivo = 0;
                recordatorioLlamada.FlagActivo = true;
                recordatorioLlamada.HoraInicio = TimeSpan.Parse("08:00");
                recordatorioLlamada.HoraFin = TimeSpan.Parse("08:30");
                recordatorioLlamada.CodigoLineaNegocio = 81;
                recordatorioLlamada.AuditoriaFechaCreacion = DateTime.Now;
                recordatorioLlamada.AuditoriaUsuarioCreacion = prospecto.AuditoriaUsuarioModificacion;

                _context.RecordatorioLlamadas.Add(recordatorioLlamada);
            }
        }

        public void ActivarProspecto(Prospecto prospecto)
        {
            var response = _context.Prospectos.Where(x => x.IdProspecto == prospecto.IdProspecto).FirstOrDefault();

            if (response != null)
            {
                response.TelefonoCelular = string.IsNullOrEmpty(prospecto.TelefonoCelular) ? response.TelefonoCelular : prospecto.TelefonoCelular;
                response.TelefonoFijo = string.IsNullOrEmpty(prospecto.TelefonoFijo) ? response.TelefonoFijo : prospecto.TelefonoFijo;
                response.FlagDescarte = null;
                response.CodigoMotivoUnoDescarte = null;
                response.CodigoMotivoDosDescarte = null;
                response.CodigoMotivoTresDescarte = null;
                response.TextoMontivoTresDescarte = null;
                response.FechaMotivoTresDescarte = null;
            }
        }
        public Task<Prospecto> Obtener(int prospectoId)
        {
            throw new NotImplementedException();
        }
    }

}
