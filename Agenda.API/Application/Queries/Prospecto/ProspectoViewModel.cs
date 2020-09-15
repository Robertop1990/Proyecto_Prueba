
using System;
using System.Collections.Generic;

namespace Agenda.API.Application.Queries.Prospecto
{
    public class Prospecto
    {
        public int IdProspecto { get; set; }
        public string NombresApellidos { get; set; }
        public short CodigoTipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Fuente { get; set; }
        public short CodigoFuente { get; set; }
        public short CodigoSubFuente { get; set; }
        public string NombreFuente { get; set; }
        public string NombreSubFuente { get; set; }
        public string Producto { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }       
        public DateTime FechaNacimiento { get; set; }
        public decimal Edad { get; set; }
        public int Hijos { get; set; }
        public short CodigoSexo { get; set; }
        public string Sexo { get; set; }
        public string Direccion { get; set; }
        public short Departamento_Id { get; set; }
        public short Provincia_Id { get; set; }
        public short Distrito_Id { get; set; }
        public string Departamento { get; set; }
        public string Provincia { get; set; }
        public string Distrito { get; set; }
        public string Correo { get; set; }
        public short CodigoCargo { get; set; }
        public string Empresa { get; set; }
        public string NombreCargo { get; set; }
        public string OtroCargo { get; set; }
        public string Referenciador { get; set; }
        public short MonedaFondo { get; set; }
        public decimal MontoFondo { get; set; }   
        public int IdReferenciador { get; set; }
        public bool? FlagDescarte { get; set; }
        public string TextoMotivoDescarte { get; set; }
        public bool VisibleDescarte { get; set; }
        public bool VisibleAgendar { get; set; }
        public int PorcentajeAvance { get; set; }
        public int PorcentajeAvanceAnterior { get; set; }
        public string DescripcionAvance { get; set; }
        public DateTime? FechaEstimadaCierre { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaUltimaActividad { get; set; }
        public List<Referido> Referidos { get; set; }
    }

    public class ProspectoDetalle
    {
        public int IdProspecto { get; set; }
        public string NombresApellidos { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public string Fuente { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public decimal Edad { get; set; }
        public int Hijos { get; set; }
        public string Correo { get; set; }
        public string Empresa { get; set; }
        public string NombreCargo { get; set; }
        public string OtroCargo { get; set; }
        public short MonedaFondo { get; set; }
        public decimal MontoFondo { get; set; }
        public int IdReferenciador { get; set; }
    }

    public class Referido
    {
        public string NombresApellidos { get; set; }
        public short CodigoTipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string Nombres { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Fuente { get; set; }
        public short CodigoFuente { get; set; }
        public short CodigoSubFuente { get; set; }
        public string NombreFuente { get; set; }
        public string NombreSubFuente { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public decimal Edad { get; set; }
        public int IdProspecto { get; set; }
        public string TelefonoFijo { get; set; }
        public string TelefonoCelular { get; set; }
        public int Hijos { get; set; }
        public short CodigoSexo { get; set; }
        public string Sexo { get; set; }
        public string Direccion { get; set; }
        public short Departamento_Id { get; set; }
        public short Provincia_Id { get; set; }
        public short Distrito_Id { get; set; }
        public string Departamento { get; set; }
        public string Provincia { get; set; }
        public string Distrito { get; set; }
        public string Correo { get; set; }
        public short CodigoCargo { get; set; }
        public string Empresa { get; set; }
        public string NombreCargo { get; set; }
        public string OtroCargo { get; set; }
        public short MonedaFondo { get; set; }
        public decimal MontoFondo { get; set; }
        public int IdReferenciador { get; set; }
        public bool? FlagDescarte { get; set; }
        public string TextoMotivoDescarte { get; set; }
        public bool VisibleDescarte { get; set; }
        public bool VisibleAgendar { get; set; }
        public int PorcentajeAvance { get; set; }
        public string DescripcionAvance { get; set; }
        public DateTime? FechaEstimadaCierre { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaUltimaActividad { get; set; }
    }
}
