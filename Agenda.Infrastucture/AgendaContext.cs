
using Agenda.Domain.AggregatesModel.CitaAggregate;
using Agenda.Domain.AggregatesModel.ProspectoAggregate;
using Agenda.Domain.AggregatesModel.RecordatorioLlamadaAggregate;
using Agenda.Domain.AggregatesModel.ReunionAggegate;
using Agenda.Domain.SeedWork;
using Agenda.Infrastucture.EntityConfigurations;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Data;
using System.Threading;
using System.Threading.Tasks;

namespace Agenda.Infrastucture
{
    public class AgendaContext : DbContext, IUnitOfWork
    {
        public const string PROSPECTO_SCHEMA = "Prospecto";
        public const string GENERALES_SCHEMA = "Generales";
        public const string RENTAS_SHEMA = "Rentas";
        public DbSet<ConsolidadoIntermediario> ConsolidadoIntermediarios { get; set; }
        public DbSet<Prospecto> Prospectos { get; set; }
        public DbSet<RangoEdad> RangoEdads { get; set; }
        public DbSet<RangoIngreso> RangoIngresos { get; set; }
        public DbSet<Referido> Referidos { get; set; }
        public DbSet<DireccionProspecto> DireccionProspectos { get; set; }
        public DbSet<Departamento> Departamentos { get; set; }
        public DbSet<Provincia> Provincias { get; set; }
        public DbSet<Distrito> Distritos { get; set; }
        public DbSet<AdnRenta> AdnRentas { get; set; }
        public DbSet<Cita> Citas { get; set; }
        public DbSet<Reunion> Reunions { get; set; }
        public DbSet<RecordatorioLlamada> RecordatorioLlamadas { get; set; }
        public DbSet<ListaTabla> ListaTablas { get; set; }
        public DbSet<TablaTablas> TablaTablas { get; set; }
        public DbSet<Actividad> Actividads { get; set; }

        private readonly IMediator _mediator;
        private IDbContextTransaction _currentTransaction;

        public AgendaContext(DbContextOptions<AgendaContext> options) : base(options) { }
        public IDbContextTransaction GetCurrentTransaction() => _currentTransaction;
        public bool HasActiveTransaction => _currentTransaction != null;

        public AgendaContext(DbContextOptions<AgendaContext> options, IMediator mediator) : base(options)
        {
            _mediator = mediator ?? throw new ArgumentNullException(nameof(mediator));
            System.Diagnostics.Debug.WriteLine("AgendaContext::ctor ->" + this.GetHashCode());
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new ConsolidadoIntermediarioEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ProspectoEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new DireccionEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new DepartamentoEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ProvinciaEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new DistritoEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new AdnRentaEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new CitaEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new RecordatorioLlamadaEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ReunionEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ListaTablaEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ReferidoEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new RangoEdadEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new RangoIngresoEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new TablaTablasEntityTypeConfiguration());
            modelBuilder.ApplyConfiguration(new ActividadEntityTypeConfiguration());
        }
        public async Task<bool> SaveEntitiesAsync(CancellationToken cancellationToken = default(CancellationToken))
        {
            await _mediator.DispatchDomainEventsAsync(this);

            var result = await base.SaveChangesAsync(cancellationToken);

            return true;
        }
        public async Task<IDbContextTransaction> BeginTransactionAsync()
        {
            if (_currentTransaction != null) return null;

            _currentTransaction = await Database.BeginTransactionAsync(IsolationLevel.ReadCommitted);

            return _currentTransaction;
        }
        public async Task CommitTransactionAsync(IDbContextTransaction transaction)
        {
            if (transaction == null) throw new ArgumentNullException(nameof(transaction));
            if (transaction != _currentTransaction) throw new InvalidOperationException($"Transacción {transaction.TransactionId} no es actual");

            try
            {
                await SaveChangesAsync();
                transaction.Commit();
            }
            catch
            {
                RollbackTransaction();
                throw;
            }
            finally
            {
                if(_currentTransaction != null)
                {
                    _currentTransaction.Dispose();
                    _currentTransaction = null;
                }
            }
        }

        public void RollbackTransaction()
        {
            try
            {
                _currentTransaction?.Rollback();
            }
            finally
            {
                if(_currentTransaction != null)
                {
                    _currentTransaction.Dispose();
                    _currentTransaction = null;
                }
            }
        }
    }
}
