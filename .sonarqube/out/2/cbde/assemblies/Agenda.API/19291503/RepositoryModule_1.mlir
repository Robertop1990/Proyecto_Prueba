func @_Agenda.API.Infrastructure.AutofacModules.RepositoryModule.Load$Autofac.ContainerBuilder$(none) -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :11 :8) {
^entry (%_builder : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :11 :37)
cbde.store %_builder, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :11 :37)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :13 :12) // Not a variable of known type: builder
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :13 :12) // builder.RegisterType<ProspectoRepository>() (InvocationExpression)
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :13 :12) // builder.RegisterType<ProspectoRepository>().As<IProspectoRepository>() (InvocationExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :13 :12) // builder.RegisterType<ProspectoRepository>().As<IProspectoRepository>().InstancePerLifetimeScope() (InvocationExpression)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :14 :12) // Not a variable of known type: builder
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :14 :12) // builder.RegisterType<CitaRepository>() (InvocationExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :14 :12) // builder.RegisterType<CitaRepository>().As<ICitaRepository>() (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :14 :12) // builder.RegisterType<CitaRepository>().As<ICitaRepository>().InstancePerLifetimeScope() (InvocationExpression)
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :15 :12) // Not a variable of known type: builder
%10 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :15 :12) // builder.RegisterType<ReunionRepository>() (InvocationExpression)
%11 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :15 :12) // builder.RegisterType<ReunionRepository>().As<IReunionRepository>() (InvocationExpression)
%12 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :15 :12) // builder.RegisterType<ReunionRepository>().As<IReunionRepository>().InstancePerLifetimeScope() (InvocationExpression)
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :16 :12) // Not a variable of known type: builder
%14 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :16 :12) // builder.RegisterType<RecordatorioLlamadaRepository>() (InvocationExpression)
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :16 :12) // builder.RegisterType<RecordatorioLlamadaRepository>().As<IRecordatorioLlamadaRepository>() (InvocationExpression)
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Infrastructure\\AutofacModules\\RepositoryModule.cs" :16 :12) // builder.RegisterType<RecordatorioLlamadaRepository>().As<IRecordatorioLlamadaRepository>().InstancePerLifetimeScope() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
