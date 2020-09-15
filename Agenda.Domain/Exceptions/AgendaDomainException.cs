using System;

namespace Agenda.Domain.Exceptions
{
    public class AgendaDomainException : Exception
    {
        public AgendaDomainException()
        { }

        public AgendaDomainException(string message)
            : base(message)
        { }

        public AgendaDomainException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }
}
