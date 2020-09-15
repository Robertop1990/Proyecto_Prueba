func @_Agenda.Infrastucture.Logging.CustomLoggerProviderExtensions.UseCustomLoggerProvider$Microsoft.AspNetCore.Hosting.IWebHostBuilder$(none) -> none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :8 :8) {
^entry (%_builder : none):
%0 = cbde.alloca none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :8 :62)
cbde.store %_builder, %0 : memref<none> loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :8 :62)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :10 :34) // new ConfigApp() (ObjectCreationExpression)
%3 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :12 :39) // Not a variable of known type: configApp
%4 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :12 :39) // configApp.TamanoMaximoLog (SimpleMemberAccessExpression)
%5 = constant 1024 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :12 :67)
%6 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :12 :39) // Binary expression on unsupported types configApp.TamanoMaximoLog * 1024
%7 = constant 1024 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :12 :74)
%8 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :12 :39) // Binary expression on unsupported types configApp.TamanoMaximoLog * 1024 * 1024
%10 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :13 :34) // Not a variable of known type: configApp
%11 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :13 :34) // configApp.RutaArchivoLog (SimpleMemberAccessExpression)
// Entity from another assembly: Log
%13 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :15 :12) // Log.Logger (SimpleMemberAccessExpression)
%14 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :15 :25) // new LoggerConfiguration() (ObjectCreationExpression)
%15 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :15 :25) // new LoggerConfiguration()                  .WriteTo (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :16 :30) // Not a variable of known type: _FileLogName
%17 = constant 1 : i1 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :17 :41) // true
%18 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :18 :40) // Not a variable of known type: _FileSizeLimitBytes
%19 = constant 2 : i32 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :19 :44)
%20 = constant 0 : i1 loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :20 :30) // false
%21 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :21 :36) // "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message}{NewLine}{Exception}" (StringLiteralExpression)
%22 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :15 :25) // new LoggerConfiguration()                  .WriteTo.File(_FileLogName,                      rollOnFileSizeLimit: true,                      fileSizeLimitBytes: _FileSizeLimitBytes,                      retainedFileCountLimit: 2,                      buffered: false,                      outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message}{NewLine}{Exception}") (InvocationExpression)
%23 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :15 :25) // new LoggerConfiguration()                  .WriteTo.File(_FileLogName,                      rollOnFileSizeLimit: true,                      fileSizeLimitBytes: _FileSizeLimitBytes,                      retainedFileCountLimit: 2,                      buffered: false,                      outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message}{NewLine}{Exception}")                  .CreateLogger() (InvocationExpression)
%24 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :24 :12) // Not a variable of known type: builder
%25 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :24 :12) // builder.UseSerilog() (InvocationExpression)
%26 = cbde.unknown : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :25 :19) // Not a variable of known type: builder
return %26 : none loc("D:\\Proyecto-Agenda-Mejoras-1\\Agenda.Infrastucture\\Logging\\CustomLoggerProviderExtensions.cs" :25 :12)

^1: // ExitBlock
cbde.unreachable

}
