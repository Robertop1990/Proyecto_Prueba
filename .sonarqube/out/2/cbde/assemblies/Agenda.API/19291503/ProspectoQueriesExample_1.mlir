func @_Agenda.API.Application.Queries.Prospecto.ResponseObtenerProspectosQueryExample.GetExamples$$() -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :13 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :15 :38) // string (PredefinedType)
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :15 :38) // string.Empty (SimpleMemberAccessExpression)
%3 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :16 :25)
%4 = cbde.alloca i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :16 :16) // status
cbde.store %3, %4 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :16 :16)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :17 :42) // new AuditResponse() (ObjectCreationExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :18 :41) // new List<Prospecto>() (ObjectCreationExpression)
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :19 :12) // Not a variable of known type: prospectos
%10 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :19 :27) // new Prospecto { NombresApellidos = "Robert Eduardo Arango Ramos", Fuente = "ADN", Edad = 30 } (ObjectCreationExpression)
%11 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :19 :62) // "Robert Eduardo Arango Ramos" (StringLiteralExpression)
%12 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :19 :102) // "ADN" (StringLiteralExpression)
%13 = constant 30 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :19 :116)
%14 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :19 :12) // prospectos.Add(new Prospecto { NombresApellidos = "Robert Eduardo Arango Ramos", Fuente = "ADN", Edad = 30 }) (InvocationExpression)
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :20 :12) // Not a variable of known type: prospectos
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :20 :27) // new Prospecto { NombresApellidos = "Eduardo Arango Ramos", Fuente = "Campaña - SISCO", Edad = 28 } (ObjectCreationExpression)
%17 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :20 :62) // "Eduardo Arango Ramos" (StringLiteralExpression)
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :20 :95) // "Campaña - SISCO" (StringLiteralExpression)
%19 = constant 28 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :20 :121)
%20 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :20 :12) // prospectos.Add(new Prospecto { NombresApellidos = "Eduardo Arango Ramos", Fuente = "Campaña - SISCO", Edad = 28 }) (InvocationExpression)
%21 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :21 :12) // Not a variable of known type: auditResponse
%22 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :21 :12) // auditResponse.idTransaccion (SimpleMemberAccessExpression)
%23 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :21 :42) // "123456789" (StringLiteralExpression)
%24 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :22 :12) // Not a variable of known type: auditResponse
%25 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :22 :12) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%26 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :22 :44) // Not a variable of known type: CodigoRespuestaServicio
%27 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :22 :44) // CodigoRespuestaServicio.Exito (SimpleMemberAccessExpression)
%28 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :23 :12) // new ConfigurationHelper() (ObjectCreationExpression)
%29 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :23 :70) // Not a variable of known type: auditResponse
%30 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :23 :70) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%31 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :23 :105) // Not a variable of known type: mensajeRespuesta
%32 = cbde.load %4 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :23 :127)
%33 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :23 :12) // new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status) (InvocationExpression)
%34 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :24 :12) // Not a variable of known type: auditResponse
%35 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :24 :12) // auditResponse.mensajeRespuesta (SimpleMemberAccessExpression)
%36 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :24 :45) // Not a variable of known type: mensajeRespuesta
%37 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :25 :19) // new ResponseObtenerProspectosQueryExample()              {                  responseModel = new ResponseModel<List<Prospecto>>()                  {                      auditResponse = auditResponse,                      Entity = prospectos                  }              } (ObjectCreationExpression)
%38 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :27 :32) // new ResponseModel<List<Prospecto>>()                  {                      auditResponse = auditResponse,                      Entity = prospectos                  } (ObjectCreationExpression)
%39 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :29 :36) // Not a variable of known type: auditResponse
%40 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :30 :29) // Not a variable of known type: prospectos
return %37 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :25 :12)

^1: // ExitBlock
cbde.unreachable

}
func @_Agenda.API.Application.Queries.Prospecto.ResponseObtenerProspectoDetalleQueryExample.GetExamples$$() -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :41 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :43 :68) // new ActualizarProspectoCommand() (ObjectCreationExpression)
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :44 :64) // new ProspectoAdnRentaCommand() (ObjectCreationExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :45 :66) // new ProspectoDireccionCommand() (ObjectCreationExpression)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :49 :12) // Not a variable of known type: actualizarProspectoCommand
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :49 :12) // actualizarProspectoCommand.CodigoTipoDocumento (SimpleMemberAccessExpression)
%8 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :49 :61)
%9 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :50 :12) // Not a variable of known type: actualizarProspectoCommand
%10 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :50 :12) // actualizarProspectoCommand.NumeroDocumento (SimpleMemberAccessExpression)
%11 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :50 :57) // "46712539" (StringLiteralExpression)
%12 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :51 :12) // Not a variable of known type: actualizarProspectoCommand
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :51 :12) // actualizarProspectoCommand.Nombres (SimpleMemberAccessExpression)
%14 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :51 :49) // "Robert Eduardo" (StringLiteralExpression)
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :52 :12) // Not a variable of known type: actualizarProspectoCommand
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :52 :12) // actualizarProspectoCommand.ApellidoPaterno (SimpleMemberAccessExpression)
%17 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :52 :57) // "Arango" (StringLiteralExpression)
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :53 :12) // Not a variable of known type: actualizarProspectoCommand
%19 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :53 :12) // actualizarProspectoCommand.ApellidoMaterno (SimpleMemberAccessExpression)
%20 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :53 :57) // "Ramos" (StringLiteralExpression)
%21 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :54 :12) // Not a variable of known type: actualizarProspectoCommand
%22 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :54 :12) // actualizarProspectoCommand.FechaNacimiento (SimpleMemberAccessExpression)
// Entity from another assembly: DateTime
%23 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :54 :72) // "1990/04/04" (StringLiteralExpression)
%24 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :54 :57) // DateTime.Parse("1990/04/04") (InvocationExpression)
%25 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :55 :12) // Not a variable of known type: actualizarProspectoCommand
%26 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :55 :12) // actualizarProspectoCommand.CodigoSexo (SimpleMemberAccessExpression)
%27 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :55 :52)
%28 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :56 :12) // Not a variable of known type: actualizarProspectoCommand
%29 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :56 :12) // actualizarProspectoCommand.CodigoFuente (SimpleMemberAccessExpression)
%30 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :56 :54)
%31 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :57 :12) // Not a variable of known type: actualizarProspectoCommand
%32 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :57 :12) // actualizarProspectoCommand.CodigoEtapa (SimpleMemberAccessExpression)
%33 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :57 :53)
%34 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :58 :12) // Not a variable of known type: actualizarProspectoCommand
%35 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :58 :12) // actualizarProspectoCommand.CodigoEstado (SimpleMemberAccessExpression)
%36 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :58 :54)
%37 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :59 :12) // Not a variable of known type: actualizarProspectoCommand
%38 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :59 :12) // actualizarProspectoCommand.Empresa (SimpleMemberAccessExpression)
%39 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :59 :49) // "Seguro Pacifico" (StringLiteralExpression)
%40 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :60 :12) // Not a variable of known type: actualizarProspectoCommand
%41 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :60 :12) // actualizarProspectoCommand.CodigoCargo (SimpleMemberAccessExpression)
%42 = constant 8 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :60 :53)
%43 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :61 :12) // Not a variable of known type: actualizarProspectoCommand
%44 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :61 :12) // actualizarProspectoCommand.OtroCargo (SimpleMemberAccessExpression)
%45 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :61 :51) // "Otro cargo" (StringLiteralExpression)
%46 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :62 :12) // Not a variable of known type: actualizarProspectoCommand
%47 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :62 :12) // actualizarProspectoCommand.FlagHijo (SimpleMemberAccessExpression)
%48 = constant 1 : i1 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :62 :50) // true
%49 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :63 :12) // Not a variable of known type: actualizarProspectoCommand
%50 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :63 :12) // actualizarProspectoCommand.TelefonoCelular (SimpleMemberAccessExpression)
%51 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :63 :57) // "957290129" (StringLiteralExpression)
%52 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :64 :12) // Not a variable of known type: actualizarProspectoCommand
%53 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :64 :12) // actualizarProspectoCommand.TelefonoFijo (SimpleMemberAccessExpression)
%54 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :64 :54) // "01 3636564" (StringLiteralExpression)
%55 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :65 :12) // Not a variable of known type: actualizarProspectoCommand
%56 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :65 :12) // actualizarProspectoCommand.CorreoElectronico1 (SimpleMemberAccessExpression)
%57 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :65 :60) // "robertarangoramos@gmail.com" (StringLiteralExpression)
%58 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :66 :12) // Not a variable of known type: actualizarProspectoCommand
%59 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :66 :12) // actualizarProspectoCommand.AuditoriaFechaModificacion (SimpleMemberAccessExpression)
// Entity from another assembly: DateTime
%60 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :66 :68) // DateTime.Now (SimpleMemberAccessExpression)
%61 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :67 :12) // Not a variable of known type: actualizarProspectoCommand
%62 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :67 :12) // actualizarProspectoCommand.AuditoriaUsuarioModificacion (SimpleMemberAccessExpression)
%63 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :67 :70) // "rmiranda" (StringLiteralExpression)
%64 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :69 :12) // Not a variable of known type: prospectoAdnRentaCommand
%65 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :69 :12) // prospectoAdnRentaCommand.MonedaPatrimonioAfp (SimpleMemberAccessExpression)
%66 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :69 :59)
%67 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :70 :12) // Not a variable of known type: prospectoAdnRentaCommand
%68 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :70 :12) // prospectoAdnRentaCommand.MontoPatrimonioAfp (SimpleMemberAccessExpression)
%69 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :70 :58) // decimal (PredefinedType)
%70 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :70 :72) // "1000.00" (StringLiteralExpression)
%71 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :70 :58) // decimal.Parse("1000.00") (InvocationExpression)
%72 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :71 :12) // Not a variable of known type: prospectoAdnRentaCommand
%73 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :71 :12) // prospectoAdnRentaCommand.PorcentajeAvance (SimpleMemberAccessExpression)
%74 = constant 20 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :71 :56)
%75 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :72 :12) // Not a variable of known type: prospectoAdnRentaCommand
%76 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :72 :12) // prospectoAdnRentaCommand.PorcentajeAvanceCompleto (SimpleMemberAccessExpression)
%77 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :72 :64)
%78 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :73 :12) // Not a variable of known type: prospectoAdnRentaCommand
%79 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :73 :12) // prospectoAdnRentaCommand.AuditoriaFechaModificacion (SimpleMemberAccessExpression)
// Entity from another assembly: DateTime
%80 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :73 :66) // DateTime.Now (SimpleMemberAccessExpression)
%81 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :74 :12) // Not a variable of known type: prospectoAdnRentaCommand
%82 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :74 :12) // prospectoAdnRentaCommand.AuditoriaUsuarioModificacion (SimpleMemberAccessExpression)
%83 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :74 :68) // "rmiranda" (StringLiteralExpression)
%84 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :76 :12) // Not a variable of known type: prospectoDireccionCommand
%85 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :76 :12) // prospectoDireccionCommand.Direccion (SimpleMemberAccessExpression)
%86 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :76 :50) // "Direccion Ejemplo" (StringLiteralExpression)
%87 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :77 :12) // Not a variable of known type: prospectoDireccionCommand
%88 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :77 :12) // prospectoDireccionCommand.Departamento_Id (SimpleMemberAccessExpression)
%89 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :77 :56)
%90 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :78 :12) // Not a variable of known type: prospectoDireccionCommand
%91 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :78 :12) // prospectoDireccionCommand.Provincia_Id (SimpleMemberAccessExpression)
%92 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :78 :53)
%93 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :79 :12) // Not a variable of known type: prospectoDireccionCommand
%94 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :79 :12) // prospectoDireccionCommand.Distrito_Id (SimpleMemberAccessExpression)
%95 = constant 1 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :79 :52)
%96 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :80 :12) // Not a variable of known type: prospectoDireccionCommand
%97 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :80 :12) // prospectoDireccionCommand.FlagActivo (SimpleMemberAccessExpression)
%98 = constant 1 : i1 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :80 :51) // true
%99 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :82 :12) // Not a variable of known type: actualizarProspectoCommand
%100 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :82 :12) // actualizarProspectoCommand.ProspectoAdnRentaCommand (SimpleMemberAccessExpression)
%101 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :82 :66) // Not a variable of known type: prospectoAdnRentaCommand
%102 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :83 :38) // string (PredefinedType)
%103 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :83 :38) // string.Empty (SimpleMemberAccessExpression)
%105 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :84 :25)
%106 = cbde.alloca i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :84 :16) // status
cbde.store %105, %106 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :84 :16)
%107 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :85 :42) // new AuditResponse() (ObjectCreationExpression)
%109 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :86 :12) // Not a variable of known type: auditResponse
%110 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :86 :12) // auditResponse.idTransaccion (SimpleMemberAccessExpression)
%111 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :86 :42) // "123456789" (StringLiteralExpression)
%112 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :87 :12) // Not a variable of known type: auditResponse
%113 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :87 :12) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%114 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :87 :44) // Not a variable of known type: CodigoRespuestaServicio
%115 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :87 :44) // CodigoRespuestaServicio.Exito (SimpleMemberAccessExpression)
%116 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :88 :12) // new ConfigurationHelper() (ObjectCreationExpression)
%117 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :88 :70) // Not a variable of known type: auditResponse
%118 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :88 :70) // auditResponse.codigoRespuesta (SimpleMemberAccessExpression)
%119 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :88 :105) // Not a variable of known type: mensajeRespuesta
%120 = cbde.load %106 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :88 :127)
%121 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :88 :12) // new ConfigurationHelper().ObtenerMensajeRespuestaServicio(auditResponse.codigoRespuesta, ref mensajeRespuesta, ref status) (InvocationExpression)
%122 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :89 :12) // Not a variable of known type: auditResponse
%123 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :89 :12) // auditResponse.mensajeRespuesta (SimpleMemberAccessExpression)
%124 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :89 :45) // Not a variable of known type: mensajeRespuesta
%125 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :90 :19) // new ResponseObtenerProspectoDetalleQueryExample()              {                  responseModel = new ResponseModel<ActualizarProspectoCommand>()                  {                      auditResponse = auditResponse,                      Entity = actualizarProspectoCommand                  }              } (ObjectCreationExpression)
%126 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :92 :32) // new ResponseModel<ActualizarProspectoCommand>()                  {                      auditResponse = auditResponse,                      Entity = actualizarProspectoCommand                  } (ObjectCreationExpression)
%127 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :94 :36) // Not a variable of known type: auditResponse
%128 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :95 :29) // Not a variable of known type: actualizarProspectoCommand
return %125 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Queries\\Prospecto\\ProspectoQueriesExample.cs" :90 :12)

^1: // ExitBlock
cbde.unreachable

}
