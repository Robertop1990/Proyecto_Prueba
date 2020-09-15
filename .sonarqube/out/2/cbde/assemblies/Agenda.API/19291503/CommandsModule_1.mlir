func @_Agenda.API.Infrastructure.AutofacModules.CommandsModule.Load$Autofac.ContainerBuilder$(none) -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :9 :8) {
^entry (%_builder : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :9 :37)
cbde.store %_builder, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :9 :37)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :12) // Not a variable of known type: builder
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :42) // typeof(CrearProspectoCommand) (TypeOfExpression)
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :42) // typeof(CrearProspectoCommand).GetTypeInfo() (InvocationExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :42) // typeof(CrearProspectoCommand).GetTypeInfo().Assembly (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :12) // builder.RegisterAssemblyTypes(typeof(CrearProspectoCommand).GetTypeInfo().Assembly) (InvocationExpression)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :112) // typeof(IRequestHandler<,>) (TypeOfExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\CommandsModule.cs" :11 :12) // builder.RegisterAssemblyTypes(typeof(CrearProspectoCommand).GetTypeInfo().Assembly).AsClosedTypesOf(typeof(IRequestHandler<,>)) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
