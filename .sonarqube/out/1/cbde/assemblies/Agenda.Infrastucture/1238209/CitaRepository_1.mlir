func @_Agenda.Infrastucture.Repositories.CitaRepository.Agregar$Agenda.Domain.AggregatesModel.CitaAggregate.Cita$(none) -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :12 :8) {
^entry (%_cita : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :12 :28)
cbde.store %_cita, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :12 :28)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :14 :12) // Not a variable of known type: cita
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :14 :12) // cita.AuditoriaFechaCreacion (SimpleMemberAccessExpression)
// Entity from another assembly: DateTime
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :14 :42) // DateTime.Now (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :15 :12) // Not a variable of known type: cita
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :15 :12) // cita.Prospecto (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :15 :29) // null (NullLiteralExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :16 :12) // Not a variable of known type: _context
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :16 :12) // _context.Citas (SimpleMemberAccessExpression)
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :16 :31) // Not a variable of known type: cita
%10 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Repositories\\CitaRepository.cs" :16 :12) // _context.Citas.Add(cita) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
// Skipping function Actualizar(none), it contains poisonous unsupported syntaxes

// Skipping function ActualizarReagendado(none), it contains poisonous unsupported syntaxes

// Skipping function Calificar(none), it contains poisonous unsupported syntaxes

// Skipping function CalificarMultipleCitaNoConcretada(i32, none), it contains poisonous unsupported syntaxes

// Skipping function ObtenerCitaPorId(i32), it contains poisonous unsupported syntaxes

