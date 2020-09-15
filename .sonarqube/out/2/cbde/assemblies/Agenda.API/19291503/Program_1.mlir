func @_Agenda.API.Program.Main$string$$$(none) -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :9 :8) {
^entry (%_args : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :9 :32)
cbde.store %_args, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :9 :32)
br ^0

^0: // SimpleBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: GetConfiguration
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :11 :32) // GetConfiguration() (InvocationExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: CreateHostBuilder
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :12 :41) // Not a variable of known type: configuration
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :12 :56) // Not a variable of known type: args
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :12 :23) // CreateHostBuilder(configuration, args) (InvocationExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :13 :12) // Not a variable of known type: host
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :13 :12) // host.Run() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
func @_Agenda.API.Program.GetConfiguration$$() -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :23 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :25 :19) // new ConfigurationBuilder() (ObjectCreationExpression)
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :25 :19) // new ConfigurationBuilder().Build() (InvocationExpression)
return %1 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Program.cs" :25 :12)

^1: // ExitBlock
cbde.unreachable

}
