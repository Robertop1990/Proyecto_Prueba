func @_Agenda.Infrastucture.Repositories.ProspectoRepository.Agregar$Agenda.Domain.AggregatesModel.ProspectoAggregate.Prospecto$(none) -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :17 :8) {
^entry (%_prospecto : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :17 :28)
cbde.store %_prospecto, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :17 :28)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :19 :12) // Not a variable of known type: prospecto
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :19 :12) // prospecto.AuditoriaFechaCreacion (SimpleMemberAccessExpression)
// Entity from another assembly: DateTime
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :19 :47) // DateTime.Now (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :20 :12) // Not a variable of known type: _context
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :20 :12) // _context.Prospectos (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :20 :36) // Not a variable of known type: prospecto
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :20 :12) // _context.Prospectos.Add(prospecto) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
// Skipping function Actualizar(none), it contains poisonous unsupported syntaxes

// Skipping function Descartar(none), it contains poisonous unsupported syntaxes

// Skipping function ActivarProspecto(none), it contains poisonous unsupported syntaxes

func @_Agenda.Infrastucture.Repositories.ProspectoRepository.Obtener$int$(i32) -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :149 :8) {
^entry (%_prospectoId : i32):
%0 = cbde.alloca i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :149 :39)
cbde.store %_prospectoId, %0 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :149 :39)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :151 :18) // new NotImplementedException() (ObjectCreationExpression)
cbde.throw %1 :  none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\ProspectoRepository.cs" :151 :12)

^1: // ExitBlock
cbde.unreachable

}
