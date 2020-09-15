// Skipping function ObtenerMensajeRespuestaServicio(none, none, i32), it contains poisonous unsupported syntaxes

func @_Agenda.API.Application.Comun.ConfigurationHelper.ObtenerMensajeRespuestaServicio$string.refstring.refobject$(none, none, none) -> () loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :8) {
^entry (%_codigoRespuesta : none, %_mensajeRespuesta : none, %_status : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :52)
cbde.store %_codigoRespuesta, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :52)
%1 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :76)
cbde.store %_mensajeRespuesta, %1 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :76)
%2 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :105)
cbde.store %_status, %2 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :49 :105)
br ^0

^0: // JumpBlock
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :51 :18) // new NotImplementedException() (ObjectCreationExpression)
cbde.throw %3 :  none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :51 :12)

^1: // ExitBlock
return

}
func @_Agenda.API.Application.Comun.ConfigurationHelper.ObtenerCodigoRespuestaServicio$string.string$(none, none) -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :54 :8) {
^entry (%_exNumber : none, %_exMessage : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :54 :62)
cbde.store %_exNumber, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :54 :62)
%1 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :54 :79)
cbde.store %_exMessage, %1 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :54 :79)
br ^0

^0: // BinaryBranchBlock
%2 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :56 :46) // new ResponseService() (ObjectCreationExpression)
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :58 :37) // string (PredefinedType)
%5 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :58 :37) // string.Empty (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :59 :38) // string (PredefinedType)
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :59 :38) // string.Empty (SimpleMemberAccessExpression)
%10 = constant 0 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :60 :25)
%11 = cbde.alloca i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :60 :16) // status
cbde.store %10, %11 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :60 :16)
%12 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :62 :16) // Not a variable of known type: exNumber
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :62 :28) // "-2" (StringLiteralExpression)
%14 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :62 :16) // comparison of unknown type: exNumber != "-2"
cond_br %14, ^1, ^2 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :62 :16)

^1: // SimpleBlock
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :64 :34) // Not a variable of known type: CodigoRespuestaServicio
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :64 :34) // CodigoRespuestaServicio.DisponibilidadBD (SimpleMemberAccessExpression)
br ^2

^2: // BinaryBranchBlock
%17 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :66 :16) // Not a variable of known type: exNumber
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :66 :28) // "50000" (StringLiteralExpression)
%19 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :66 :16) // comparison of unknown type: exNumber == "50000"
cond_br %19, ^3, ^4 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :66 :16)

^3: // SimpleBlock
%20 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :68 :34) // Not a variable of known type: CodigoRespuestaServicio
%21 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :68 :34) // CodigoRespuestaServicio.DisponibilidadBD (SimpleMemberAccessExpression)
br ^4

^4: // BinaryBranchBlock
%22 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :70 :16) // Not a variable of known type: exNumber
%23 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :70 :28) // "-2" (StringLiteralExpression)
%24 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :70 :16) // comparison of unknown type: exNumber == "-2"
cond_br %24, ^5, ^6 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :70 :16)

^5: // SimpleBlock
%25 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :72 :34) // Not a variable of known type: CodigoRespuestaServicio
%26 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :72 :34) // CodigoRespuestaServicio.TimeOutBD (SimpleMemberAccessExpression)
br ^6

^6: // BinaryBranchBlock
%27 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :74 :16) // Not a variable of known type: exNumber
%28 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :74 :28) // Not a variable of known type: CodigoRespuestaServicio
%29 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :74 :28) // CodigoRespuestaServicio.Exito (SimpleMemberAccessExpression)
%30 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :74 :16) // comparison of unknown type: exNumber == CodigoRespuestaServicio.Exito
cond_br %30, ^7, ^8 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :74 :16)

^7: // SimpleBlock
%31 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :76 :34) // Not a variable of known type: exNumber
br ^8

^8: // BinaryBranchBlock
%32 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :78 :16) // Not a variable of known type: exNumber
%33 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :78 :28) // Not a variable of known type: CodigoRespuestaServicio
%34 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :78 :28) // CodigoRespuestaServicio.DisponibilidadServicio (SimpleMemberAccessExpression)
%35 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :78 :16) // comparison of unknown type: exNumber == CodigoRespuestaServicio.DisponibilidadServicio
cond_br %35, ^9, ^10 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :78 :16)

^9: // SimpleBlock
%36 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :80 :34) // Not a variable of known type: exNumber
br ^10

^10: // BinaryBranchBlock
%37 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :82 :16) // Not a variable of known type: exNumber
%38 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :82 :28) // Not a variable of known type: CodigoRespuestaServicio
%39 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :82 :28) // CodigoRespuestaServicio.SinDatos (SimpleMemberAccessExpression)
%40 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :82 :16) // comparison of unknown type: exNumber == CodigoRespuestaServicio.SinDatos
cond_br %40, ^11, ^12 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :82 :16)

^11: // SimpleBlock
%41 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :84 :34) // Not a variable of known type: exNumber
br ^12

^12: // BinaryBranchBlock
%42 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :86 :16) // Not a variable of known type: exNumber
%43 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :86 :28) // Not a variable of known type: CodigoRespuestaServicio
%44 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :86 :28) // CodigoRespuestaServicio.ErrorInesperado (SimpleMemberAccessExpression)
%45 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :86 :16) // comparison of unknown type: exNumber == CodigoRespuestaServicio.ErrorInesperado
cond_br %45, ^13, ^14 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :86 :16)

^13: // SimpleBlock
%46 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :88 :34) // Not a variable of known type: exNumber
br ^14

^14: // BinaryBranchBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: ObtenerMensajeRespuestaServicio
%47 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :90 :44) // Not a variable of known type: codigoRespuesta
%48 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :90 :65) // Not a variable of known type: mensajeRespuesta
%49 = cbde.load %11 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :90 :87)
%50 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :90 :12) // ObtenerMensajeRespuestaServicio(codigoRespuesta, ref mensajeRespuesta, ref status) (InvocationExpression)
%51 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :92 :16) // Not a variable of known type: exMessage
%52 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :92 :29) // "" (StringLiteralExpression)
%53 = cbde.unknown : i1  loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :92 :16) // comparison of unknown type: exMessage != ""
cond_br %53, ^15, ^16 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :92 :16)

^15: // SimpleBlock
// Entity from another assembly: String
%54 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :93 :49) // Not a variable of known type: mensajeRespuesta
%55 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :93 :67) // " / " (StringLiteralExpression)
%56 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :93 :74) // Not a variable of known type: exMessage
%57 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :93 :35) // String.Concat(mensajeRespuesta, " / ", exMessage) (InvocationExpression)
br ^16

^16: // JumpBlock
%58 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :95 :12) // Not a variable of known type: responseService
%59 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :95 :12) // responseService.codigoRespuesta (SimpleMemberAccessExpression)
%60 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :95 :46) // Not a variable of known type: codigoRespuesta
%61 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :96 :12) // Not a variable of known type: responseService
%62 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :96 :12) // responseService.mensajeRespuesta (SimpleMemberAccessExpression)
%63 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :96 :47) // Not a variable of known type: mensajeRespuesta
%64 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :97 :12) // Not a variable of known type: responseService
%65 = cbde.unknown : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :97 :12) // responseService.status (SimpleMemberAccessExpression)
%66 = cbde.load %11 : memref<i32> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :97 :37)
%67 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :99 :19) // Not a variable of known type: responseService
return %67 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.API\\Application\\Comun\\ConfigurationHelper.cs" :99 :12)

^17: // ExitBlock
cbde.unreachable

}
