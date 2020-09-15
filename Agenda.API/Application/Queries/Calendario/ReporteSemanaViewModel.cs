using System;

namespace Agenda.API.Application.Queries.Calendario
{
    public class ActividadReporte
    {
        public string Category { get; set; }
        public string Subcategoria { get; set; }
        public int Lunes { get; set; }
        public int Martes { get; set; }
        public int Miercoles { get; set; }
        public int Jueves { get; set; }
        public int Viernes { get; set; }
        public int Sabado { get; set; }
        public int Domingo { get; set; }
        public int TotalSemana { get; set; }
        public int TotalMes { get; set; }
    }

    public class ProspectoReporte
    {
        public int IdProspecto { get; set; }
        public string Categoria { get; set; }
        public string Subcategoria { get; set; }
        public int CantidadProspecto { get; set; }
        public string Fuente { get; set; }
        public DateTime Fecha { get; set; }
    }

    public class CitaReporte
    {
        public string Categoria { get; set; }
        public string Subcategoria { get; set; }
        public int CantidadCita { get; set; }
        public bool Calificacion { get; set; }
        public string Etapa { get; set; }
        public short? CodigoTipoCalificacion { get; set; }
        public short? CodigoMotivoReagendado { get; set; }
        public DateTime Fecha { get; set; }
    }
}
