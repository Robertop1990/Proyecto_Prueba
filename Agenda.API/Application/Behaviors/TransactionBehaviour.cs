
using Agenda.Infrastucture;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Serilog.Context;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Agenda.API.Application.Behaviors
{
    public class TransactionBehaviour<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
    {
        private readonly AgendaContext _dbContext;

        public TransactionBehaviour(AgendaContext dbContext)
        {
            _dbContext = dbContext ?? throw new ArgumentException(nameof(AgendaContext));
        }

        public async Task<TResponse> Handle(TRequest request, CancellationToken cancellationToken, RequestHandlerDelegate<TResponse> next)
        {
            var response = default(TResponse);
            
            try
            {
                if (_dbContext.HasActiveTransaction)
                {
                    return await next();
                }

                var strategy = _dbContext.Database.CreateExecutionStrategy();

                await strategy.ExecuteAsync(async () =>
                {
                    using (var transaction = await _dbContext.BeginTransactionAsync())
                    using (LogContext.PushProperty("TransactionContext", transaction.TransactionId))
                    {
                        response = await next();
                        await _dbContext.CommitTransactionAsync(transaction);
                    }

                });

                return response;
            }
            catch (Exception)
            {                
                throw;
            }
        }
    }
}
