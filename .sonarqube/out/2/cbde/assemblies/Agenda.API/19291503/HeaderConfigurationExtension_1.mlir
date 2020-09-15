func @_Agenda.API.Extensions.HeaderConfigurationExtension.UseHeaderConfiguration$Microsoft.AspNetCore.Builder.IApplicationBuilder$(none) -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Extensions\\HeaderConfigurationExtension.cs" :7 :8) {
^entry (%_applicationBuilder : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Extensions\\HeaderConfigurationExtension.cs" :7 :65)
cbde.store %_applicationBuilder, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Extensions\\HeaderConfigurationExtension.cs" :7 :65)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Extensions\\HeaderConfigurationExtension.cs" :9 :19) // Not a variable of known type: applicationBuilder
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Extensions\\HeaderConfigurationExtension.cs" :9 :19) // applicationBuilder.UseMiddleware<HeaderConfigurationMiddleware>() (InvocationExpression)
return %2 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Extensions\\HeaderConfigurationExtension.cs" :9 :12)

^1: // ExitBlock
cbde.unreachable

}
