func @_Agenda.API.Application.Queries.Cita.ResponseObtenerNumeroCitaQueryExample.GetExamples$$() -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :11 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :13 :36) // new AgendaCita() (ObjectCreationExpression)
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :14 :12) // Not a variable of known type: agendaCita
%3 = cbde.unknown : i1 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :14 :12) // agendaCita.TieneAgendamiento (SimpleMemberAccessExpression)
%4 = constant 0 : i1 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :14 :43) // false
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :15 :12) // Not a variable of known type: agendaCita
%6 = cbde.unknown : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :15 :12) // agendaCita.NumeroCita (SimpleMemberAccessExpression)
%7 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :15 :36)
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :17 :38) // string (PredefinedType)
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :17 :38) // string.Empty (SimpleMemberAccessExpression)
%11 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :18 :25)
%12 = cbde.alloca i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :18 :16) // status
cbde.store %11, %12 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :18 :16)
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :19 :42) // new AuditResponse() (ObjectCreationExpression)
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :20 :12) // Not a variable of known type: auditResponse
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :20 :12) // auditResponse.idTransaccion (SimpleMemberAccessExpression)
%17 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :20 :42) // "123456789" (StringLiteralExpression)
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :21 :12) // Not a variable of known type: auditResponse
%19 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :21 :12) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%20 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :21 :44) // Not a variable of known type: CodigoRespuestaServicio
%21 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :21 :44) // CodigoRespuestaServicio.Exito (SimpleMemberAccessExpression)
%22 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :22 :12) // new ConfigurationHelper() (ObjectCreationExpression)
%23 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :22 :70) // Not a variable of known type: auditResponse
%24 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :22 :70) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%25 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :22 :105) // Not a variable of known type: mensajeRespuesta
%26 = cbde.load %12 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :22 :127)
%27 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :22 :12) // new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status) (InvocationExpression)
%28 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :23 :12) // Not a variable of known type: auditResponse
%29 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :23 :12) // auditResponse.mensajeRespuesta (SimpleMemberAccessExpression)
%30 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :23 :45) // Not a variable of known type: mensajeRespuesta
%31 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :24 :19) // new ResponseObtenerNumeroCitaQueryExample()              {                  responseModel = new ResponseModel<AgendaCita>()                  {                      auditResponse = auditResponse,                      Entity = agendaCita                  }              } (ObjectCreationExpression)
%32 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :26 :32) // new ResponseModel<AgendaCita>()                  {                      auditResponse = auditResponse,                      Entity = agendaCita                  } (ObjectCreationExpression)
%33 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :28 :36) // Not a variable of known type: auditResponse
%34 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :29 :29) // Not a variable of known type: agendaCita
return %31 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Cita\\CitaQueriesExample.cs" :24 :12)

^1: // ExitBlock
cbde.unreachable

}
