func @_Agenda.API.Application.Comun.ResponseInternalServerModelExample.GetExamples$$() -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :11 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :13 :38) // string (PredefinedType)
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :13 :38) // string.Empty (SimpleMemberAccessExpression)
%3 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :14 :25)
%4 = cbde.alloca i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :14 :16) // status
cbde.store %3, %4 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :14 :16)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :15 :42) // new AuditResponse() (ObjectCreationExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :16 :35) // new List<EntidadDto>() (ObjectCreationExpression)
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :17 :12) // Not a variable of known type: auditResponse
%10 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :17 :12) // auditResponse.idTransaccion (SimpleMemberAccessExpression)
%11 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :17 :42) // "123456789" (StringLiteralExpression)
%12 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :18 :12) // Not a variable of known type: auditResponse
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :18 :12) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%14 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :18 :44) // Not a variable of known type: CodigoRespuestaServicio
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :18 :44) // CodigoRespuestaServicio.ErrorInesperado (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :19 :12) // new ConfigurationHelper() (ObjectCreationExpression)
%17 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :19 :70) // Not a variable of known type: auditResponse
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :19 :70) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%19 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :19 :105) // Not a variable of known type: mensajeRespuesta
%20 = cbde.load %4 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :19 :127)
%21 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :19 :12) // new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status) (InvocationExpression)
%22 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :20 :12) // Not a variable of known type: auditResponse
%23 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :20 :12) // auditResponse.mensajeRespuesta (SimpleMemberAccessExpression)
%24 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :20 :45) // Not a variable of known type: mensajeRespuesta
%25 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :21 :19) // new ResponseInternalServerModelExample()              {                  responseModel = new ResponseModel<List<EntidadDto>>()                  {                      auditResponse = auditResponse,                      Entity = adn                  }              } (ObjectCreationExpression)
%26 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :23 :32) // new ResponseModel<List<EntidadDto>>()                  {                      auditResponse = auditResponse,                      Entity = adn                  } (ObjectCreationExpression)
%27 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :25 :36) // Not a variable of known type: auditResponse
%28 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :26 :29) // Not a variable of known type: adn
return %25 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ResponseInternalServerModelExample.cs" :21 :12)

^1: // ExitBlock
cbde.unreachable

}
