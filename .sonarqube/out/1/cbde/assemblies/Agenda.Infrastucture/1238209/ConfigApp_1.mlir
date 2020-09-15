func @_Agenda.Infrastucture.Utilitarios.ConfigApp.LeerParametrosDesdeArchivo$$() -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :22 :8) {
^entry :
br ^0

^0: // SimpleBlock
%0 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :24 :39) // new ConfigurationBuilder() (ObjectCreationExpression)
// Entity from another assembly: Path
// Entity from another assembly: Assembly
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :25 :47) // Assembly.GetEntryAssembly() (InvocationExpression)
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :25 :47) // Assembly.GetEntryAssembly().Location (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :25 :25) // Path.GetDirectoryName(Assembly.GetEntryAssembly().Location) (InvocationExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :24 :39) // new ConfigurationBuilder()              .SetBasePath(Path.GetDirectoryName(Assembly.GetEntryAssembly().Location)) (InvocationExpression)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :26 :25) // "appsettings.json" (StringLiteralExpression)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :24 :39) // new ConfigurationBuilder()              .SetBasePath(Path.GetDirectoryName(Assembly.GetEntryAssembly().Location))              .AddJsonFile("appsettings.json") (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :28 :38) // Not a variable of known type: configurationBuilder
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :28 :38) // configurationBuilder.Build() (InvocationExpression)
%11 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :29 :47) // Not a variable of known type: root
%12 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :29 :63) // "Properties" (StringLiteralExpression)
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :29 :47) // root.GetSection("Properties") (InvocationExpression)
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :31 :31) // Not a variable of known type: properties
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :31 :57) // "TamanoMaximoLog" (StringLiteralExpression)
%17 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :31 :31) // properties.GetValue<long>("TamanoMaximoLog") (InvocationExpression)
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :32 :30) // Not a variable of known type: properties
%19 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :32 :58) // "NombreArchivoLog" (StringLiteralExpression)
%20 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Utilitarios\\ConfigApp.cs" :32 :30) // properties.GetValue<string>("NombreArchivoLog") (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
