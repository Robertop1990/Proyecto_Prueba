func @_Agenda.Infrastucture.Repositories.ReunionRepository.Agregar$Agenda.Domain.AggregatesModel.ReunionAggegate.Reunion$(none) -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :14 :8) {
^entry (%_reunion : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :14 :31)
cbde.store %_reunion, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :14 :31)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :16 :12) // Not a variable of known type: reunion
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :16 :12) // reunion.AuditoriaFechaCreacion (SimpleMemberAccessExpression)
// Entity from another assembly: DateTime
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :16 :45) // DateTime.Now (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :17 :19) // Not a variable of known type: _context
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :17 :19) // _context.Reunions (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :17 :41) // Not a variable of known type: reunion
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :17 :19) // _context.Reunions.Add(reunion) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :17 :19) // _context.Reunions.Add(reunion).Entity (SimpleMemberAccessExpression)
return %8 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :17 :12)

^1: // ExitBlock
cbde.unreachable

}
// Skipping function Actualizar(none), it contains poisonous unsupported syntaxes

func @_Agenda.Infrastucture.Repositories.ReunionRepository.Eliminar$Agenda.Domain.AggregatesModel.ReunionAggegate.Reunion$(none) -> i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :41 :8) {
^entry (%_reunion : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :41 :28)
cbde.store %_reunion, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :41 :28)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :43 :12) // Not a variable of known type: _context
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :43 :12) // _context.Reunions (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :43 :37) // Not a variable of known type: reunion
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :43 :12) // _context.Reunions.Remove(reunion) (InvocationExpression)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :45 :19) // Not a variable of known type: reunion
%6 = cbde.unknown : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :45 :19) // reunion.IdReunion (SimpleMemberAccessExpression)
return %6 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ReunionRepository.cs" :45 :12)

^1: // ExitBlock
cbde.unreachable

}
