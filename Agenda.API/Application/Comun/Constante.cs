namespace Agenda.API.Application.Comun
{
    class Constante
    {
    }
    public struct Flag
    {
        public const int Activo = 1;
        public const int Inactivo = 0;
    }

    public struct MensajeLog
    {
        public const string TiempoProceso = "Tiempo total del proceso de ejecución:";
    }
    public struct CodigoRespuestaServicio
    {
        public const string Exito = "0";
        public const string SinParametros = "1";

        public const string SinDatos = "2";

        public const string TimeOutBD = "-1";
        public const string TimeOutServicio = "-3";

        public const string DisponibilidadBD = "-2";
        public const string DisponibilidadServicio = "-4";

        public const string ErrorInesperado = "-5";
    }

    public struct StatusCode
    {
        public const int Ok = 200;
        public const int Creado = 201;

        public const int NoEncontrado = 404;

        public const int TimeOut = 504;

        public const int ServicioNoDisponible = 503;

        public const int PeticionIncorrecta = 400;
        public const int NoAutorizado = 401;

        public const int ErrorInterno = 500;
    }

    public struct TablaTabla
    {
        public const short Sexo = 1;
        public const short FuenteProspecto = 7;
        public const short TipoReunion = 14;
        public const short MotivoReagendada = 21;
        public const short LineaNegocio = 38;
        public const short PersonaCargo = 88;
        public const short EtapaActivad = 101;
        public const short MotivoDescarte = 102;
        public const short TipoCalificacion = 103;
        public const short ExperienciaCalificacion = 104;
        public const short PorcentajeAvanceCalificacion = 105;
        public const short MotivoCitaNoConcretada = 106;
    }

    public struct TablaTipoCalificacion
    {
        public const short Concretado = 1;
        public const short NoConcretado = 2;
    }

    public struct TablaMotivoRegendada
    {
        public const short ProspectoSolicitoCambiarFecha = 1;
        public const short ErrorAgendarCita = 2;
        public const short NoAsistioHoraPactada = 3;
        public const short EntrevistaTomoMasTiempo = 4;
    }

    public struct TablaMotivoCitaNoConcretada
    {
        public const short CanceloCita = 1;
        public const short SeguirEvaluando = 2;
        public const short NoContextoLlamada = 3;
        public const short NoDeseaContinuar = 4;
    }

    public struct LineaNegocio
    {
        public const short Renta = 81;
    }

    public struct Fuente
    {
        public const short CentroInfluencia = 3;
    }

    public struct CategoriaIntermediario
    {
        public const short Supervisor = 53;
        public const short JefeZonal = 76;
        public const short JefeUnidad = 123;
        public const short JefeZonalProvincia = 125;     
    }

}
