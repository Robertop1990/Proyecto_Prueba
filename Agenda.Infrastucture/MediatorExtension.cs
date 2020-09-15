using Agenda.Domain.SeedWork;
using MediatR;
using System.Linq;
using System.Threading.Tasks;

namespace Agenda.Infrastucture
{
    static class MediatorExtension
    {
        public static async Task DispatchDomainEventsAsync(this IMediator mediator, AgendaContext context)
        {
            var domainEntities = context.ChangeTracker.Entries<Entity>()
                                                      .Where(x => x.Entity.DomainEvents.Any());

            var domainEvents = domainEntities.SelectMany(x => x.Entity.DomainEvents).ToList();

            domainEntities.ToList().ForEach(entity => entity.Entity.ClearDomainEvents());

            foreach (var domainEvent in domainEvents)
                await mediator.Publish(domainEvent);
        }
    }
}
