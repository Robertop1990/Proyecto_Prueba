±

LD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Abstractions\IHeaderConfiguration.cs
	namespace 	
Agenda
 
. 
API 
. 
Abstractions !
{ 
public 

	interface  
IHeaderConfiguration )
{ 
string 
idTransaccion 
{ 
get "
;" #
set$ '
;' (
}) *
string		 
nombreAplicacion		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
string

 
usuarioAplicacion

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
int 
idIntermediario 
{ 
get !
;! "
set# &
;& '
}( )
string 
CodigoIntermediario "
{# $
get% (
;( )
set* -
;- .
}/ 0
string 
correlationId 
{ 
get "
;" #
set$ '
;' (
}) *
AuditRequest 
auditRequest !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} á

MD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Auditoria\AuditRequest.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
	Auditoria! *
{ 
public 

class 
AuditRequest 
{ 
public 
string 
idTransaccion #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
nombreAplicacion &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
usuarioAplicacion '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public		 
AuditRequest		 
(		 
)		 
{

 	
idTransaccion 
= 
string "
." #
Empty# (
;( )
nombreAplicacion 
= 
string %
.% &
Empty& +
;+ ,
usuarioAplicacion 
= 
string  &
.& '
Empty' ,
;, -
} 	
} 
} …
ND:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Auditoria\AuditResponse.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
	Auditoria! *
{ 
public 

class 
AuditResponse 
{ 
public 
string 
idTransaccion #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
codigoRespuesta %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
mensajeRespuesta &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
}		 Ë
MD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Auditoria\RequestModel.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
	Auditoria! *
{ 
public 

class 
RequestModel 
< 
T 
>  
where! &
T' (
:) *
class+ 0
{ 
public 
RequestModel 
( 
) 
=>  
auditRequest! -
=. /
new0 3
AuditRequest4 @
(@ A
)A B
;B C
public 
AuditRequest 
auditRequest (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
T 
Entity 
{ 
get 
; 
set "
;" #
}$ %
} 
}		 Ô
ND:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Auditoria\ResponseModel.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
	Auditoria! *
{ 
public 

class 
ResponseModel 
< 
T  
>  !
where" '
T( )
:* +
class, 1
{ 
public 
ResponseModel 
( 
) 
=> !
auditResponse" /
=0 1
new2 5
AuditResponse6 C
(C D
)D E
;E F
public 
AuditResponse 
auditResponse *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
T 
Entity 
{ 
get 
; 
set "
;" #
}$ %
} 
}		 √
PD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Auditoria\ResponseService.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
	Auditoria! *
{ 
public 

class 
ResponseService  
{ 
public 
string 
codigoRespuesta %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
mensajeRespuesta &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
int 
status 
{ 
get 
;  
set! $
;$ %
}& '
} 
}

 ‚
UD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Behaviors\TransactionBehaviour.cs
	namespace

 	
Agenda


 
.

 
API

 
.

 
Application

  
.

  !
	Behaviors

! *
{ 
public 

class  
TransactionBehaviour %
<% &
TRequest& .
,. /
	TResponse0 9
>9 :
:; <
IPipelineBehavior= N
<N O
TRequestO W
,W X
	TResponseY b
>b c
{ 
private 
readonly 
AgendaContext &

_dbContext' 1
;1 2
public  
TransactionBehaviour #
(# $
AgendaContext$ 1
	dbContext2 ;
); <
{ 	

_dbContext 
= 
	dbContext "
??# %
throw& +
new, /
ArgumentException0 A
(A B
nameofB H
(H I
AgendaContextI V
)V W
)W X
;X Y
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
var 
response 
= 
default "
(" #
	TResponse# ,
), -
;- .
try 
{ 
if 
( 

_dbContext 
.  
HasActiveTransaction 3
)3 4
{ 
return 
await  
next! %
(% &
)& '
;' (
} 
var   
strategy   
=   

_dbContext   )
.  ) *
Database  * 2
.  2 3#
CreateExecutionStrategy  3 J
(  J K
)  K L
;  L M
await"" 
strategy"" 
."" 
ExecuteAsync"" +
(""+ ,
async"", 1
(""2 3
)""3 4
=>""5 7
{## 
using$$ 
($$ 
var$$ 
transaction$$ *
=$$+ ,
await$$- 2

_dbContext$$3 =
.$$= >!
BeginTransactionAsync$$> S
($$S T
)$$T U
)$$U V
using%% 
(%% 

LogContext%% %
.%%% &
PushProperty%%& 2
(%%2 3
$str%%3 G
,%%G H
transaction%%I T
.%%T U
TransactionId%%U b
)%%b c
)%%c d
{&& 
response''  
=''! "
await''# (
next'') -
(''- .
)''. /
;''/ 0
await(( 

_dbContext(( (
.((( )"
CommitTransactionAsync(() ?
(((? @
transaction((@ K
)((K L
;((L M
})) 
}++ 
)++ 
;++ 
return-- 
response-- 
;--  
}.. 
catch// 
(// 
	Exception// 
)// 
{00 
throw11 
;11 
}22 
}33 	
}44 
}55 ¨
RD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Behaviors\ValidatorBehavior.cs
	namespace

 	
Agenda


 
.

 
API

 
.

 
Application

  
.

  !
	Behaviors

! *
{ 
public 

class 
ValidatorBehavior "
<" #
TRequest# +
,+ ,
	TResponse- 6
>6 7
:8 9
IPipelineBehavior: K
<K L
TRequestL T
,T U
	TResponseV _
>_ `
{ 
private 
readonly 

IValidator #
<# $
TRequest$ ,
>, -
[- .
]. /
_validators0 ;
;; <
public 
ValidatorBehavior  
(  !

IValidator! +
<+ ,
TRequest, 4
>4 5
[5 6
]6 7

validators8 B
)B C
=>D F
_validatorsG R
=S T

validatorsU _
;_ `
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
var 
failures 
= 
_validators &
. 
Select 
( 
v 
=> 
v  
.  !
Validate! )
() *
request* 1
)1 2
)2 3
. 

SelectMany 
( 
result $
=>% '
result( .
.. /
Errors/ 5
)5 6
. 
Where 
( 
error 
=> !
error" '
!=( *
null+ /
)/ 0
. 
ToList 
( 
) 
; 
if 
( 
failures 
. 
Any 
( 
) 
) 
{ 
var 
errors 
= 
string #
.# $
Join$ (
(( )
$str) ,
,, -
failures. 6
.6 7
Select7 =
(= >
x> ?
=>@ B
xC D
.D E
ErrorMessageE Q
)Q R
.R S
ToArrayS Z
(Z [
)[ \
)\ ]
;] ^
throw 
new !
AgendaDomainException /
(/ 0
$"0 2
Command 2 :
{: ;
typeof; A
(A B
TRequestB J
)J K
.K L
NameL P
}P Q
 => Q U
{U V
errorsV \
}\ ]
"] ^
,^ _
new` c
ValidationExceptiond w
(w x
$str	x é
,
é è
failures
ê ò
)
ò ô
)
ô ö
;
ö õ
} 
var 
response 
= 
await  
next! %
(% &
)& '
;' (
return 
response 
; 
} 	
}   
}!! ¢
aD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\CitaCommand\ActualizarCitaCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
CitaCommand* 5
{		 
public

 

class

 !
ActualizarCitaCommand

 &
:

' (
IRequest

) 1
<

1 2
ResponseModel

2 ?
<

? @

EntidadDto

@ J
>

J K
>

K L
{ 
public 
int 
IdCita 
{ 
get 
;  
set! $
;$ %
}& '
public 
DateTime 
? 
	FechaCita "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Ubicacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoDepartamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoProvincia %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoDistrito $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
short 
? "
CodigoMotivoReagendado ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
bool 
? 
FlagUrlTeams !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
UrlTeams 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
[ 	

JsonIgnore	 
] 
[ 	
IgnoreDataMember	 
] 
public   
int   
?   +
CodigoIntermediarioModificacion   3
{  4 5
get  6 9
;  9 :
set  ; >
;  > ?
}  @ A
public$$ 
string$$ 
Accion$$ 
{$$ 
get$$ "
;$$" #
set$$$ '
;$$' (
}$$) *
}&& 
}'' ⁄
`D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\CitaCommand\CalificarCitaCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
CitaCommand* 5
{ 
public 

class  
CalificarCitaCommand %
:& '
IRequest( 0
<0 1
ResponseModel1 >
<> ?

EntidadDto? I
>I J
>J K
{		 
public 
int 
IdCita 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
? 
FlagCalificacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? "
CodigoTipoCalificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
short 
? -
!CodigoTipoExperienciaCalificacion 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
short 
? (
CodigoMotivoCitaNoConcretada 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
short 
? .
"CodigoPorcentajeAvanceCalificacion 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
DateTime 
? 
FechaEstimadaCierre ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
string "
ComentarioCalificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
short 
CodigoEstado !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
CodigoResultado $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
bool 
FlagDescarte  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
? #
CodigoMotivoUnoDescarte -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
short 
? #
CodigoMotivoDosDescarte -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
short 
? $
CodigoMotivoTresDescarte .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string $
TextoMontivoTresDescarte .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DateTime 
? #
FechaMotivoTresDescarte 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
}   
}!! Éâ
^D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\CitaCommand\CitaCommandExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
CitaCommand* 5
{ 
public		 

class		 *
RequestCrearCitaCommandExample		 /
:		0 1
IExamplesProvider		2 C
<		C D
CrearCitaCommand		D T
>		T U
{

 
public 
CrearCitaCommand 
GetExamples  +
(+ ,
), -
{ 	
AuditRequest 
auditRequest %
=& '
new( +
AuditRequest, 8
(8 9
)9 :
;: ;
CrearCitaCommand 
crearCitaCommand -
=. /
new0 3
CrearCitaCommand4 D
(D E
)E F
;F G 
CitaProspectoCommand   
citaProspectoCommand! 5
=6 7
new8 ; 
CitaProspectoCommand< P
(P Q
)Q R
;R S
auditRequest 
. 
idTransaccion &
=' (
$str) 4
;4 5
auditRequest 
. 
nombreAplicacion )
=* +
$str, 4
;4 5
auditRequest 
. 
usuarioAplicacion *
=+ ,
$str- 7
;7 8
crearCitaCommand 
. 
IdCitaDispositivo .
=/ 0
$num1 2
;2 3
crearCitaCommand 
. 
CodigoLineaNegocio /
=0 1
$num2 4
;4 5
crearCitaCommand 
. 
NumeroEntrevista -
=. /
$num0 1
;1 2
crearCitaCommand 
. 
	FechaCita &
=' (
DateTime) 1
.1 2
Today2 7
;7 8
crearCitaCommand 
. 

HoraInicio '
=( )
$str* 1
;1 2
crearCitaCommand 
. 
HoraFin $
=% &
$str' .
;. /
crearCitaCommand 
. 
	Ubicacion &
=' (
$str) 8
;8 9
crearCitaCommand 
. 
CodigoDepartamento /
=0 1
$num2 3
;3 4
crearCitaCommand 
. 
CodigoProvincia ,
=- .
$num/ 0
;0 1
crearCitaCommand   
.   
CodigoDistrito   +
=  , -
$num  . /
;  / 0
crearCitaCommand!! 
.!! 
ReferenciaUbicacion!! 0
=!!1 2
$str!!3 B
;!!B C
crearCitaCommand"" 
."" 
FlagInvitadoGA"" +
="", -
true"". 2
;""2 3
crearCitaCommand## 
.## 
FlagInvitadoGU## +
=##, -
true##. 2
;##2 3
crearCitaCommand$$ 
.$$ 
Descripcion$$ (
=$$) *
$str$$+ <
;$$< =
crearCitaCommand%% 
.%% 
AlertaMinutosAntes%% /
=%%0 1
$num%%2 4
;%%4 5
crearCitaCommand&& 
.&& 
CodigoEstado&& )
=&&* +
$num&&, -
;&&- .
crearCitaCommand'' 
.'' 
CodigoResultado'' ,
=''- .
$num''/ 0
;''0 1
crearCitaCommand(( 
.((  
CodigoEtapaProspecto(( 1
=((2 3
$num((4 5
;((5 6
crearCitaCommand)) 
.)) "
AuditoriaFechaCreacion)) 3
=))4 5
DateTime))6 >
.))> ?
Now))? B
;))B C
crearCitaCommand** 
.** $
AuditoriaUsuarioCreacion** 5
=**6 7
$str**8 A
;**A B 
citaProspectoCommand..  
...  !
TelefonoCelular..! 0
=..1 2
$str..3 >
;..> ? 
citaProspectoCommand//  
.//  !
TelefonoFijo//! -
=//. /
$str//0 9
;//9 :
crearCitaCommand22 
.22  
CitaProspectoCommand22 1
=222 3 
citaProspectoCommand224 H
;22H I
return33 
crearCitaCommand33 #
;33# $
}44 	
}55 
public77 

class77 +
ResponseCrearCitaCommandExample77 0
:771 2
IExamplesProvider773 D
<77D E+
ResponseCrearCitaCommandExample77E d
>77d e
{88 
public99 +
ResponseCrearCitaCommandExample99 .
(99. /
)99/ 0
=>991 3
responseModel994 A
=99B C
new99D G
ResponseModel99H U
<99U V

EntidadDto99V `
>99` a
(99a b
)99b c
;99c d
public:: 
ResponseModel:: 
<:: 

EntidadDto:: '
>::' (
responseModel::) 6
{::7 8
get::9 <
;::< =
set::> A
;::A B
}::C D
public;; +
ResponseCrearCitaCommandExample;; .
GetExamples;;/ :
(;;: ;
);;; <
{<< 	
string== 
mensajeRespuesta== #
===$ %
string==& ,
.==, -
Empty==- 2
;==2 3
int>> 
status>> 
=>> 
$num>> 
;>> 
AuditResponse?? 
auditResponse?? '
=??( )
new??* -
AuditResponse??. ;
(??; <
)??< =
;??= >

EntidadDto@@ 
citaDto@@ 
=@@  
new@@! $

EntidadDto@@% /
(@@/ 0
)@@0 1
;@@1 2
citaDtoAA 
.AA 
IdAA 
=AA 
$numAA 
;AA 
citaDtoBB 
.BB 
MensajeBB 
=BB 
$strBB A
;BBA B
auditResponseCC 
.CC 
idTransaccionCC '
=CC( )
$strCC* 5
;CC5 6
auditResponseDD 
.DD 
codigoRespuestaDD )
=DD* +#
CodigoRespuestaServicioDD, C
.DDC D
ExitoDDD I
;DDI J
newEE 
ConfigurationHelperEE #
(EE# $
)EE$ %
.EE% &+
ObtenerMensajeRespuestaServicioEE& E
(EEE F
auditResponseEEF S
.EES T
codigoRespuestaEET c
,EEc d
refEEe h
mensajeRespuestaEEi y
,EEy z
refEE{ ~
status	EE Ö
)
EEÖ Ü
;
EEÜ á
auditResponseFF 
.FF 
mensajeRespuestaFF *
=FF+ ,
mensajeRespuestaFF- =
;FF= >
returnGG 
newGG +
ResponseCrearCitaCommandExampleGG 6
(GG6 7
)GG7 8
{HH 
responseModelII 
=II 
newII  #
ResponseModelII$ 1
<II1 2

EntidadDtoII2 <
>II< =
(II= >
)II> ?
{JJ 
auditResponseKK !
=KK" #
auditResponseKK$ 1
,KK1 2
EntityLL 
=LL 
citaDtoLL $
}MM 
}NN 
;NN 
}OO 	
}PP 
publicRR 

classRR /
#RequestActualizarCitaCommandExampleRR 4
:RR5 6
IExamplesProviderRR7 H
<RRH I!
ActualizarCitaCommandRRI ^
>RR^ _
{SS 
publicTT !
ActualizarCitaCommandTT $
GetExamplesTT% 0
(TT0 1
)TT1 2
{UU 	!
ActualizarCitaCommandVV !!
actualizarCitaCommandVV" 7
=VV8 9
newVV: =!
ActualizarCitaCommandVV> S
(VVS T
)VVT U
;VVU V!
actualizarCitaCommandXX !
.XX! "
	FechaCitaXX" +
=XX, -
DateTimeXX. 6
.XX6 7
NowXX7 :
;XX: ;!
actualizarCitaCommandYY !
.YY! "

HoraInicioYY" ,
=YY- .
$strYY/ 6
;YY6 7!
actualizarCitaCommandZZ !
.ZZ! "
HoraFinZZ" )
=ZZ* +
$strZZ, 3
;ZZ3 4!
actualizarCitaCommand[[ !
.[[! "
	Ubicacion[[" +
=[[, -
$str[[. =
;[[= >!
actualizarCitaCommand\\ !
.\\! "
CodigoDepartamento\\" 4
=\\5 6
$num\\7 8
;\\8 9!
actualizarCitaCommand]] !
.]]! "
CodigoProvincia]]" 1
=]]2 3
$num]]4 5
;]]5 6!
actualizarCitaCommand^^ !
.^^! "
CodigoDistrito^^" 0
=^^1 2
$num^^3 4
;^^4 5!
actualizarCitaCommand__ !
.__! ""
CodigoMotivoReagendado__" 8
=__9 :
$num__; <
;__< =!
actualizarCitaCommand`` !
.``! "&
AuditoriaFechaModificacion``" <
=``= >
DateTime``? G
.``G H
Now``H K
;``K L!
actualizarCitaCommandaa !
.aa! "(
AuditoriaUsuarioModificacionaa" >
=aa? @
$straaA J
;aaJ K
returnbb !
actualizarCitaCommandbb (
;bb( )
}cc 	
}dd 
publicff 

classff 0
$ResponseActualizarCitaCommandExampleff 5
:ff6 7
IExamplesProviderff8 I
<ffI J0
$ResponseActualizarCitaCommandExampleffJ n
>ffn o
{gg 
publichh 0
$ResponseActualizarCitaCommandExamplehh 3
(hh3 4
)hh4 5
=>hh6 8
responseModelhh9 F
=hhG H
newhhI L
ResponseModelhhM Z
<hhZ [

EntidadDtohh[ e
>hhe f
(hhf g
)hhg h
;hhh i
publicii 
ResponseModelii 
<ii 

EntidadDtoii '
>ii' (
responseModelii) 6
{ii7 8
getii9 <
;ii< =
setii> A
;iiA B
}iiC D
publicjj 0
$ResponseActualizarCitaCommandExamplejj 3
GetExamplesjj4 ?
(jj? @
)jj@ A
{kk 	
stringll 
mensajeRespuestall #
=ll$ %
stringll& ,
.ll, -
Emptyll- 2
;ll2 3
intmm 
statusmm 
=mm 
$nummm 
;mm 
AuditResponsenn 
auditResponsenn '
=nn( )
newnn* -
AuditResponsenn. ;
(nn; <
)nn< =
;nn= >

EntidadDtooo 

entidadDtooo !
=oo" #
newoo$ '

EntidadDtooo( 2
(oo2 3
)oo3 4
;oo4 5

entidadDtopp 
.pp 
Idpp 
=pp 
$numpp 
;pp 

entidadDtoqq 
.qq 
Mensajeqq 
=qq  
$strqq! E
;qqE F
auditResponserr 
.rr 
idTransaccionrr '
=rr( )
$strrr* 5
;rr5 6
auditResponsess 
.ss 
codigoRespuestass )
=ss* +#
CodigoRespuestaServicioss, C
.ssC D
ExitossD I
;ssI J
newtt 
ConfigurationHelpertt #
(tt# $
)tt$ %
.tt% &+
ObtenerMensajeRespuestaServiciott& E
(ttE F
auditResponsettF S
.ttS T
codigoRespuestattT c
,ttc d
reftte h
mensajeRespuestatti y
,tty z
reftt{ ~
status	tt Ö
)
ttÖ Ü
;
ttÜ á
auditResponseuu 
.uu 
mensajeRespuestauu *
=uu+ ,
mensajeRespuestauu- =
;uu= >
returnvv 
newvv 0
$ResponseActualizarCitaCommandExamplevv ;
(vv; <
)vv< =
{ww 
responseModelxx 
=xx 
newxx  #
ResponseModelxx$ 1
<xx1 2

EntidadDtoxx2 <
>xx< =
(xx= >
)xx> ?
{yy 
auditResponsezz !
=zz" #
auditResponsezz$ 1
,zz1 2
Entity{{ 
={{ 

entidadDto{{ '
}|| 
}}} 
;}} 
}~~ 	
} 
public
ÅÅ 

class
ÅÅ 0
"RequestCalificarCitaCommandExample
ÅÅ 3
:
ÅÅ4 5
IExamplesProvider
ÅÅ6 G
<
ÅÅG H"
CalificarCitaCommand
ÅÅH \
>
ÅÅ\ ]
{
ÇÇ 
public
ÉÉ "
CalificarCitaCommand
ÉÉ #
GetExamples
ÉÉ$ /
(
ÉÉ/ 0
)
ÉÉ0 1
{
ÑÑ 	"
CalificarCitaCommand
ÖÖ  "
calificarCitaCommand
ÖÖ! 5
=
ÖÖ6 7
new
ÖÖ8 ;"
CalificarCitaCommand
ÖÖ< P
(
ÖÖP Q
)
ÖÖQ R
;
ÖÖR S"
calificarCitaCommand
áá  
.
áá  !
FlagCalificacion
áá! 1
=
áá2 3
true
áá4 8
;
áá8 9"
calificarCitaCommand
àà  
.
àà  !$
CodigoTipoCalificacion
àà! 7
=
àà8 9
$num
àà: ;
;
àà; <"
calificarCitaCommand
ââ  
.
ââ  !/
!CodigoTipoExperienciaCalificacion
ââ! B
=
ââC D
$num
ââE F
;
ââF G"
calificarCitaCommand
ää  
.
ää  !0
"CodigoPorcentajeAvanceCalificacion
ää! C
=
ääD E
$num
ääF G
;
ääG H"
calificarCitaCommand
ãã  
.
ãã  !!
FechaEstimadaCierre
ãã! 4
=
ãã5 6
DateTime
ãã7 ?
.
ãã? @
Now
ãã@ C
;
ããC D"
calificarCitaCommand
åå  
.
åå  !$
ComentarioCalificacion
åå! 7
=
åå8 9
$str
åå: J
;
ååJ K"
calificarCitaCommand
çç  
.
çç  !(
AuditoriaFechaModificacion
çç! ;
=
çç< =
DateTime
çç> F
.
ççF G
Now
ççG J
;
ççJ K"
calificarCitaCommand
éé  
.
éé  !*
AuditoriaUsuarioModificacion
éé! =
=
éé> ?
$str
éé@ I
;
ééI J
return
êê "
calificarCitaCommand
êê '
;
êê' (
}
ëë 	
}
íí 
public
îî 

class
îî 1
#ResponseCalificarCitaCommandExample
îî 4
:
îî5 6
IExamplesProvider
îî7 H
<
îîH I1
#ResponseCalificarCitaCommandExample
îîI l
>
îîl m
{
ïï 
public
ññ 1
#ResponseCalificarCitaCommandExample
ññ 2
(
ññ2 3
)
ññ3 4
=>
ññ5 7
responseModel
ññ8 E
=
ññF G
new
ññH K
ResponseModel
ññL Y
<
ññY Z

EntidadDto
ññZ d
>
ññd e
(
ññe f
)
ññf g
;
ññg h
public
óó 
ResponseModel
óó 
<
óó 

EntidadDto
óó '
>
óó' (
responseModel
óó) 6
{
óó7 8
get
óó9 <
;
óó< =
set
óó> A
;
óóA B
}
óóC D
public
ôô 1
#ResponseCalificarCitaCommandExample
ôô 2
GetExamples
ôô3 >
(
ôô> ?
)
ôô? @
{
öö 	
string
õõ 
mensajeRespuesta
õõ #
=
õõ$ %
string
õõ& ,
.
õõ, -
Empty
õõ- 2
;
õõ2 3
int
úú 
status
úú 
=
úú 
$num
úú 
;
úú 
AuditResponse
ùù 
auditResponse
ùù '
=
ùù( )
new
ùù* -
AuditResponse
ùù. ;
(
ùù; <
)
ùù< =
;
ùù= >

EntidadDto
ûû 

entidadDto
ûû !
=
ûû" #
new
ûû$ '

EntidadDto
ûû( 2
(
ûû2 3
)
ûû3 4
;
ûû4 5

entidadDto
üü 
.
üü 
Id
üü 
=
üü 
$num
üü 
;
üü 

entidadDto
†† 
.
†† 
Mensaje
†† 
=
††  
$str
††! D
;
††D E
auditResponse
°° 
.
°° 
idTransaccion
°° '
=
°°( )
$str
°°* 5
;
°°5 6
auditResponse
¢¢ 
.
¢¢ 
codigoRespuesta
¢¢ )
=
¢¢* +%
CodigoRespuestaServicio
¢¢, C
.
¢¢C D
Exito
¢¢D I
;
¢¢I J
new
££ !
ConfigurationHelper
££ #
(
££# $
)
££$ %
.
££% &-
ObtenerMensajeRespuestaServicio
££& E
(
££E F
auditResponse
££F S
.
££S T
codigoRespuesta
££T c
,
££c d
ref
££e h
mensajeRespuesta
££i y
,
££y z
ref
££{ ~
status££ Ö
)££Ö Ü
;££Ü á
auditResponse
§§ 
.
§§ 
mensajeRespuesta
§§ *
=
§§+ ,
mensajeRespuesta
§§- =
;
§§= >
return
•• 
new
•• 1
#ResponseCalificarCitaCommandExample
•• :
(
••: ;
)
••; <
{
¶¶ 
responseModel
ßß 
=
ßß 
new
ßß  #
ResponseModel
ßß$ 1
<
ßß1 2

EntidadDto
ßß2 <
>
ßß< =
(
ßß= >
)
ßß> ?
{
®® 
auditResponse
©© !
=
©©" #
auditResponse
©©$ 1
,
©©1 2
Entity
™™ 
=
™™ 

entidadDto
™™ '
}
´´ 
}
¨¨ 
;
¨¨ 
}
≠≠ 	
}
ÆÆ 
}ØØ ÊÑ
^D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\CitaCommand\CitaCommandHandler.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
CitaCommand* 5
{ 
public 

class 
CitaCommandHandler #
:$ %
IRequestHandler& 5
<5 6
CrearCitaCommand6 F
,F G
ResponseModelH U
<U V

EntidadDtoV `
>` a
>a b
,b c
IRequestHandler& 5
<5 6!
ActualizarCitaCommand6 K
,K L
ResponseModelL Y
<Y Z

EntidadDtoZ d
>d e
>e f
,f g
IRequestHandler& 5
<5 6 
CalificarCitaCommand6 J
,J K
ResponseModelK X
<X Y

EntidadDtoY c
>c d
>d e
{ 
private 
readonly 
ICitaRepository (
_citaRepository) 8
;8 9
private 
readonly  
IProspectoRepository - 
_prospectoRepository. B
;B C
private 
readonly 
IMapper  
_mapper! (
;( )
public 
CitaCommandHandler !
(! "
ICitaRepository" 1
citaRepository2 @
,@ A
IMapperB I
mapperJ P
,P Q 
IProspectoRepositoryQ e
prospectoRepositoryf y
)y z
{ 	
_citaRepository 
= 
citaRepository ,
;, - 
_prospectoRepository  
=! "
prospectoRepository# 6
;6 7
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ResponseModel '
<' (

EntidadDto( 2
>2 3
>3 4
Handle5 ;
(; <
CrearCitaCommand< L
requestM T
,T U
CancellationTokenV g
cancellationTokenh y
)y z
{ 	
ResponseModel 
< 

EntidadDto $
>$ %
response& .
=/ 0
new1 4
ResponseModel5 B
<B C

EntidadDtoC M
>M N
(N O
)O P
;P Q
ResponseService   
responseService   +
;  + ,
ConfigurationHelper!! 
configuration!!  -
=!!. /
new!!0 3
ConfigurationHelper!!4 G
(!!G H
)!!H I
;!!I J
try## 
{$$ 
var%% 
cita%% 
=%% 
_mapper%% "
.%%" #
Map%%# &
<%%& '
Cita%%' +
>%%+ ,
(%%, -
request%%- 4
)%%4 5
;%%5 6
_citaRepository&& 
.&&  
Agregar&&  '
(&&' (
cita&&( ,
)&&, -
;&&- .
	Prospecto)) 
	prospecto)) #
=))$ %
new))& )
	Prospecto))* 3
())3 4
request))4 ;
.)); <
IdProspecto))< G
,))G H
request**4 ;
.**; < 
CitaProspectoCommand**< P
!=**Q S
null**T X
?**Y Z
request**[ b
.**b c 
CitaProspectoCommand**c w
.**w x
TelefonoCelular	**x á
:
**à â
$str
**ä å
,
**å ç
request++4 ;
.++; < 
CitaProspectoCommand++< P
!=++Q S
null++T X
?++Y Z
request++[ b
.++b c 
CitaProspectoCommand++c w
.++w x
TelefonoFijo	++x Ñ
:
++Ö Ü
$str
++á â
,
++â ä
request,,4 ;
.,,; <"
AuditoriaFechaCreacion,,< R
,,,R S
request,,T [
.,,[ \$
AuditoriaUsuarioCreacion,,\ t
),,t u
;,,u v 
_prospectoRepository-- $
.--$ %
ActivarProspecto--% 5
(--5 6
	prospecto--6 ?
)--? @
;--@ A
await// 
_citaRepository// %
.//% &

UnitOfWork//& 0
.//0 1
SaveEntitiesAsync//1 B
(//B C
cancellationToken//C T
)//T U
;//U V
responseService11 
=11  !
configuration11" /
.11/ 0*
ObtenerCodigoRespuestaServicio110 N
(11N O#
CodigoRespuestaServicio11O f
.11f g
Exito11g l
,11l m
$str11n p
)11p q
;11q r
response22 
.22 
auditResponse22 &
=22' (
new22) ,
AuditResponse22- :
{22; <
codigoRespuesta22= L
=22M N
responseService22O ^
.22^ _
codigoRespuesta22_ n
,22n o
mensajeRespuesta	22p Ä
=
22Å Ç
responseService
22É í
.
22í ì
mensajeRespuesta
22ì £
}
22§ •
;
22• ¶
response33 
.33 
Entity33 
=33  !
new33" %

EntidadDto33& 0
{331 2
Id333 5
=336 7
cita338 <
.33< =
IdProspecto33= H
,33H I
Mensaje33J Q
=33R S
$str33T w
}33x y
;33y z
return55 
await55 
Task55 !
.55! "
Run55" %
(55% &
(55& '
)55' (
=>55) +
{55, -
return66 
response66 #
;66# $
}77 
)77 
;77 
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
responseService;; 
=;;  !
configuration;;" /
.;;/ 0*
ObtenerCodigoRespuestaServicio;;0 N
(;;N O#
CodigoRespuestaServicio;;O f
.;;f g
ErrorInesperado;;g v
,;;v w
ex;;x z
.;;z {
InnerException	;;{ â
.
;;â ä
Message
;;ä ë
.
;;ë í
ToString
;;í ö
(
;;ö õ
)
;;õ ú
)
;;ú ù
;
;;ù û
response<< 
.<< 
auditResponse<< &
=<<' (
new<<) ,
AuditResponse<<- :
{<<; <
codigoRespuesta<<= L
=<<M N
responseService<<O ^
.<<^ _
codigoRespuesta<<_ n
,<<n o
mensajeRespuesta	<<p Ä
=
<<Å Ç
responseService
<<É í
.
<<í ì
mensajeRespuesta
<<ì £
}
<<§ •
;
<<• ¶
return>> 
await>> 
Task>> !
.>>! "
Run>>" %
(>>% &
(>>& '
)>>' (
=>>>) +
{>>, -
return?? 
response?? #
;??# $
}@@ 
)@@ 
;@@ 
}AA 
}BB 	
publicCC 
asyncCC 
TaskCC 
<CC 
ResponseModelCC '
<CC' (

EntidadDtoCC( 2
>CC2 3
>CC3 4
HandleCC5 ;
(CC; <!
ActualizarCitaCommandCC< Q
requestCCR Y
,CCY Z
CancellationTokenCC[ l
cancellationTokenCCm ~
)CC~ 
{DD 	
ResponseModelEE 
<EE 

EntidadDtoEE $
>EE$ %
responseEE& .
=EE/ 0
newEE1 4
ResponseModelEE5 B
<EEB C

EntidadDtoEEC M
>EEM N
(EEN O
)EEO P
;EEP Q
ResponseServiceFF 
responseServiceFF +
;FF+ ,
ConfigurationHelperGG 
configurationGG  -
=GG. /
newGG0 3
ConfigurationHelperGG4 G
(GGG H
)GGH I
;GGI J
tryHH 
{II 
varJJ 
citaJJ 
=JJ 
_mapperJJ "
.JJ" #
MapJJ# &
<JJ& '
CitaJJ' +
>JJ+ ,
(JJ, -
requestJJ- 4
)JJ4 5
;JJ5 6
ifKK 
(KK 
!KK 
stringKK 
.KK 
IsNullOrEmptyKK )
(KK) *
requestKK* 1
.KK1 2
AccionKK2 8
)KK8 9
)KK9 :
_citaRepositoryLL #
.LL# $ 
ActualizarReagendadoLL$ 8
(LL8 9
citaLL9 =
)LL= >
;LL> ?
elseMM 
_citaRepositoryNN #
.NN# $

ActualizarNN$ .
(NN. /
citaNN/ 3
)NN3 4
;NN4 5
awaitPP 
_citaRepositoryPP %
.PP% &

UnitOfWorkPP& 0
.PP0 1
SaveChangesAsyncPP1 A
(PPA B
cancellationTokenPPB S
)PPS T
;PPT U
responseServiceQQ 
=QQ  !
configurationQQ" /
.QQ/ 0*
ObtenerCodigoRespuestaServicioQQ0 N
(QQN O#
CodigoRespuestaServicioQQO f
.QQf g
ExitoQQg l
,QQl m
$strQQn p
)QQp q
;QQq r
responseRR 
.RR 
auditResponseRR &
=RR' (
newRR) ,
AuditResponseRR- :
{RR; <
codigoRespuestaRR= L
=RRM N
responseServiceRRO ^
.RR^ _
codigoRespuestaRR_ n
,RRn o
mensajeRespuesta	RRp Ä
=
RRÅ Ç
responseService
RRÉ í
.
RRí ì
mensajeRespuesta
RRì £
}
RR§ •
;
RR• ¶
responseSS 
.SS 
EntitySS 
=SS  !
newSS" %

EntidadDtoSS& 0
{SS1 2
IdSS3 5
=SS6 7
citaSS8 <
.SS< =
IdProspectoSS= H
,SSH I
MensajeSSJ Q
=SSR S
$strSST x
}SSx y
;SSy z
returnUU 
awaitUU 
TaskUU !
.UU! "
RunUU" %
(UU% &
(UU& '
)UU' (
=>UU) +
{UU, -
returnVV 
responseVV #
;VV# $
}WW 
)WW 
;WW 
}XX 
catchYY 
(YY 
	ExceptionYY 
exYY 
)YY  
{ZZ 
responseService[[ 
=[[  !
configuration[[" /
.[[/ 0*
ObtenerCodigoRespuestaServicio[[0 N
([[N O#
CodigoRespuestaServicio[[O f
.[[f g
ErrorInesperado[[g v
,[[v w
ex[[w y
.[[y z
InnerException	[[z à
.
[[à â
Message
[[â ê
.
[[ê ë
ToString
[[ë ô
(
[[ô ö
)
[[ö õ
)
[[õ ú
;
[[ú ù
response\\ 
.\\ 
auditResponse\\ &
=\\' (
new\\) ,
AuditResponse\\- :
{\\; <
codigoRespuesta\\= L
=\\M N
responseService\\O ^
.\\^ _
codigoRespuesta\\_ n
,\\n o
mensajeRespuesta	\\p Ä
=
\\Å Ç
responseService
\\É í
.
\\í ì
mensajeRespuesta
\\ì £
}
\\§ •
;
\\• ¶
return^^ 
await^^ 
Task^^ !
.^^! "
Run^^" %
(^^% &
(^^& '
)^^' (
=>^^) +
{^^, -
return__ 
response__ #
;__# $
}`` 
)`` 
;`` 
}aa 
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
ResponseModeldd '
<dd' (

EntidadDtodd( 2
>dd2 3
>dd3 4
Handledd5 ;
(dd; < 
CalificarCitaCommanddd< P
requestddQ X
,ddX Y
CancellationTokenddZ k
cancellationTokenddl }
)dd} ~
{ee 	
ResponseModelff 
<ff 

EntidadDtoff $
>ff$ %
responseff& .
=ff/ 0
newff1 4
ResponseModelff5 B
<ffB C

EntidadDtoffC M
>ffM N
(ffN O
)ffO P
;ffP Q
ResponseServicegg 
responseServicegg +
;gg+ ,
ConfigurationHelperhh 
configurationhh  -
=hh. /
newhh0 3
ConfigurationHelperhh4 G
(hhG H
)hhH I
;hhI J
tryii 
{jj 
varkk 
citakk 
=kk 
_mapperkk "
.kk" #
Mapkk# &
<kk& '
Citakk' +
>kk+ ,
(kk, -
requestkk- 4
)kk4 5
;kk5 6
ifll 
(ll 
requestll 
.ll (
CodigoMotivoCitaNoConcretadall 8
==ll9 ;'
TablaMotivoCitaNoConcretadall< W
.llW X
NoDeseaContinuarllX h
)llh i
{mm 
	Prospectonn 
	prospectonn '
=nn( )
newnn* -
	Prospectonn. 7
(nn7 8
requestnn8 ?
.nn? @
IdProspectonn@ K
,nnK L
requestnnL S
.nnS T
FlagDescartennT `
,nn` a
requestnna h
.nnh i$
CodigoMotivoUnoDescarte	nni Ä
,
nnÄ Å
request
nnÇ â
.
nnâ ä%
CodigoMotivoDosDescarte
nnä °
,
nn° ¢
request
nn£ ™
.
nn™ ´&
CodigoMotivoTresDescarte
nn´ √
,
nn√ ƒ
requestoo %
.oo% &$
TextoMontivoTresDescarteoo& >
,oo> ?
requestoo@ G
.ooG H#
FechaMotivoTresDescarteooH _
,oo_ `
requestooa h
.ooh i'
AuditoriaFechaModificacion	ooi É
,
ooÉ Ñ
request
ooÖ å
.
ooå ç*
AuditoriaUsuarioModificacion
ooç ©
)
oo© ™
;
oo™ ´ 
_prospectoRepositoryrr (
.rr( )
	Descartarrr) 2
(rr2 3
	prospectorr3 <
)rr< =
;rr= >
}ss 
_citaRepositorytt 
.tt  
	Calificartt  )
(tt) *
citatt* .
)tt. /
;tt/ 0
awaituu 
_citaRepositoryuu %
.uu% &

UnitOfWorkuu& 0
.uu0 1
SaveEntitiesAsyncuu1 B
(uuB C
cancellationTokenuuC T
)uuT U
;uuU V
responseServiceww 
=ww  !
configurationww" /
.ww/ 0*
ObtenerCodigoRespuestaServicioww0 N
(wwN O#
CodigoRespuestaServiciowwO f
.wwf g
Exitowwg l
,wwl m
$strwwn p
)wwp q
;wwq r
responsexx 
.xx 
auditResponsexx &
=xx' (
newxx) ,
AuditResponsexx- :
{xx; <
codigoRespuestaxx= L
=xxM N
responseServicexxO ^
.xx^ _
codigoRespuestaxx_ n
,xxn o
mensajeRespuesta	xxp Ä
=
xxÅ Ç
responseService
xxÉ í
.
xxí ì
mensajeRespuesta
xxì £
}
xx§ •
;
xx• ¶
responseyy 
.yy 
Entityyy 
=yy  !
newyy" %

EntidadDtoyy& 0
{yy1 2
Idyy3 5
=yy6 7
citayy8 <
.yy< =
IdProspectoyy= H
,yyH I
MensajeyyJ Q
=yyR S
$stryyT w
}yyx y
;yyy z
return{{ 
await{{ 
Task{{ !
.{{! "
Run{{" %
({{% &
({{& '
){{' (
=>{{) +
{{{, -
return|| 
response|| #
;||# $
}}} 
)}} 
;}} 
}~~ 
catch 
( 
	Exception 
ex 
)  
{
ÄÄ 
responseService
ÅÅ 
=
ÅÅ  !
configuration
ÅÅ" /
.
ÅÅ/ 0,
ObtenerCodigoRespuestaServicio
ÅÅ0 N
(
ÅÅN O%
CodigoRespuestaServicio
ÅÅO f
.
ÅÅf g
ErrorInesperado
ÅÅg v
,
ÅÅv w
ex
ÅÅx z
.
ÅÅz {
InnerExceptionÅÅ{ â
.ÅÅâ ä
MessageÅÅä ë
.ÅÅë í
ToStringÅÅí ö
(ÅÅö õ
)ÅÅõ ú
)ÅÅú ù
;ÅÅù û
response
ÇÇ 
.
ÇÇ 
auditResponse
ÇÇ &
=
ÇÇ' (
new
ÇÇ) ,
AuditResponse
ÇÇ- :
{
ÇÇ; <
codigoRespuesta
ÇÇ= L
=
ÇÇM N
responseService
ÇÇO ^
.
ÇÇ^ _
codigoRespuesta
ÇÇ_ n
,
ÇÇn o
mensajeRespuestaÇÇp Ä
=ÇÇÅ Ç
responseServiceÇÇÉ í
.ÇÇí ì 
mensajeRespuestaÇÇì £
}ÇÇ§ •
;ÇÇ• ¶
return
ÑÑ 
await
ÑÑ 
Task
ÑÑ !
.
ÑÑ! "
Run
ÑÑ" %
(
ÑÑ% &
(
ÑÑ& '
)
ÑÑ' (
=>
ÑÑ) +
{
ÑÑ, -
return
ÖÖ 
response
ÖÖ #
;
ÖÖ# $
}
ÜÜ 
)
ÜÜ 
;
ÜÜ 
}
áá 
}
àà 	
}
ââ 
}ää æ-
\D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\CitaCommand\CrearCitaCommand.cs
	namespace		 	
Agenda		
 
.		 
API		 
.		 
Application		  
.		  !
Commands		! )
.		) *
CitaCommand		* 5
{

 
public 

class 
CrearCitaCommand !
:" #
IRequest$ ,
<, -
ResponseModel- :
<: ;

EntidadDto; E
>E F
>F G
{ 
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
IdCitaDispositivo $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
IdGrupoProducto #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
NumeroEntrevista #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
short 
CodigoEstado !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
CodigoResultado $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
? 
	FechaCita "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Ubicacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoDepartamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoProvincia %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoDistrito $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
ReferenciaUbicacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
? 
FlagInvitadoGU #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
? 
FlagInvitadoGA #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
? 
AlertaMinutosAntes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
short    
CodigoEtapaProspecto   )
{  * +
get  , /
;  / 0
set  1 4
;  4 5
}  6 7
public!! 
short!! 
?!!  
CodigoMotivoDescarte!! *
{!!+ ,
get!!- 0
;!!0 1
set!!2 5
;!!5 6
}!!7 8
public"" 
int"" 
?"" 
PorcentajeAvance"" $
{""% &
get""' *
;""* +
set"", /
;""/ 0
}""1 2
public## 
short## 
CodigoLineaNegocio## '
{##( )
get##* -
;##- .
set##/ 2
;##2 3
}##4 5
public$$ 
bool$$ 
?$$ 
FlagUrlTeams$$ !
{$$" #
get$$$ '
;$$' (
set$$) ,
;$$, -
}$$. /
public%% 
string%% 
UrlTeams%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
public&& 
DateTime&& "
AuditoriaFechaCreacion&& .
{&&/ 0
get&&1 4
;&&4 5
set&&6 9
;&&9 :
}&&; <
public'' 
string'' $
AuditoriaUsuarioCreacion'' .
{''/ 0
get''1 4
;''4 5
set''6 9
;''9 :
}''; <
public,,  
CitaProspectoCommand,, # 
CitaProspectoCommand,,$ 8
{,,9 :
get,,; >
;,,> ?
set,,@ C
;,,C D
},,E F
[00 	

JsonIgnore00	 
]00 
[11 	
IgnoreDataMember11	 
]11 
public22 
int22 '
CodigoIntermediarioCreacion22 .
{22/ 0
get221 4
;224 5
set226 9
;229 :
}22; <
}44 
public66 

class66  
CitaProspectoCommand66 %
{77 
public88 
string88 
TelefonoFijo88 "
{88# $
get88% (
;88( )
set88* -
;88- .
}88/ 0
public99 
string99 
TelefonoCelular99 %
{99& '
get99( +
;99+ ,
set99- 0
;990 1
}992 3
}:: 
};; ‚)
kD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ProspectoCommand\ActualizarProspectoCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ProspectoCommand* :
{ 
public 

class &
ActualizarProspectoCommand +
:, -
IRequest. 6
<6 7
ResponseModel7 D
<D E

EntidadDtoE O
>O P
>P Q
{		 
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
short 
? 
CodigoTipoDocumento )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
NumeroDocumento %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ApellidoPaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ApellidoMaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
? 
FechaNacimiento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoRangoEdad %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoRangoIngreso (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 

CodigoSexo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 
FlagHijo 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Empresa 
{ 
get  #
;# $
set% (
;( )
}* +
public 
short 
? 
CodigoCargo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	OtroCargo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Referenciador #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
short 
? 
CodigoFuente "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
short 
? 
CodigoSubFuente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
CorreoElectronico1 (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
TelefonoFijo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
TelefonoCelular %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
CodigoEstado !
{" #
get$ '
;' (
set) ,
;, -
}. /
public   
short   
CodigoEtapa    
{  ! "
get  # &
;  & '
set  ( +
;  + ,
}  - .
public!! 
short!! 
?!! 
CodigoRangoFondo!! &
{!!' (
get!!) ,
;!!, -
set!!. 1
;!!1 2
}!!3 4
public"" 
DateTime"" 
?"" &
AuditoriaFechaModificacion"" 3
{""4 5
get""6 9
;""9 :
set""; >
;""> ?
}""@ A
public## 
string## (
AuditoriaUsuarioModificacion## 2
{##3 4
get##5 8
;##8 9
set##: =
;##= >
}##? @
public(( $
ProspectoAdnRentaCommand(( '$
ProspectoAdnRentaCommand((( @
{((A B
get((C F
;((F G
set((H K
;((K L
}((M N
public)) %
ProspectoDireccionCommand)) (%
ProspectoDireccionCommand))) B
{))C D
get))E H
;))H I
set))J M
;))M N
}))O P
public-- 
string-- "
ProspectoReferenciador-- ,
{--- .
get--/ 2
;--2 3
set--4 7
;--7 8
}--9 :
}// 
}00 àH
fD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ProspectoCommand\CrearProspectoCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ProspectoCommand* :
{		 
public

 

class

 !
CrearProspectoCommand

 &
:

' (
IRequest

) 1
<

1 2
ResponseModel

2 ?
<

? @

EntidadDto

@ J
>

J K
>

K L
{ 
public 
int &
IdConsolidadoIntermediario -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
short 
? 
CodigoTipoDocumento )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
NumeroDocumento %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ApellidoPaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ApellidoMaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
? 
FechaNacimiento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoRangoEdad %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoRangoIngreso (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 

CodigoSexo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 
FlagHijo 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Empresa 
{ 
get  #
;# $
set% (
;( )
}* +
public 
short 
? 
CodigoCargo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	OtroCargo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoFuente "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
short 
? 
CodigoSubFuente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Referenciador #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
CorreoElectronico1 (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
string   
TelefonoFijo   "
{  # $
get  % (
;  ( )
set  * -
;  - .
}  / 0
public!! 
string!! 
TelefonoCelular!! %
{!!& '
get!!( +
;!!+ ,
set!!- 0
;!!0 1
}!!2 3
public"" 
short"" 
CodigoEstado"" !
{""" #
get""$ '
;""' (
set"") ,
;"", -
}"". /
public## 
short## 
CodigoEtapa##  
{##! "
get### &
;##& '
set##( +
;##+ ,
}##- .
public$$ 
short$$ 
?$$ 
CodigoRangoFondo$$ &
{$$' (
get$$) ,
;$$, -
set$$. 1
;$$1 2
}$$3 4
public%% 
DateTime%% 
?%% "
AuditoriaFechaCreacion%% /
{%%0 1
get%%2 5
;%%5 6
set%%7 :
;%%: ;
}%%< =
public&& 
string&& $
AuditoriaUsuarioCreacion&& .
{&&/ 0
get&&1 4
;&&4 5
set&&6 9
;&&9 :
}&&; <
public++ $
ProspectoAdnRentaCommand++ '$
ProspectoAdnRentaCommand++( @
{++A B
get++C F
;++F G
set++H K
;++K L
}++M N
public,, %
ProspectoDireccionCommand,, (%
ProspectoDireccionCommand,,) B
{,,C D
get,,E H
;,,H I
set,,J M
;,,M N
},,O P
[00 	

JsonIgnore00	 
]00 
[11 	
IgnoreDataMember11	 
]11 
public22 
int22 
CodigoIntermediario22 &
{22' (
get22) ,
;22, -
set22. 1
;221 2
}223 4
}44 
public66 

class66 $
ProspectoAdnRentaCommand66 )
{77 
public99 
int99 
IdProspecto99 
{99  
get99! $
;99$ %
set99& )
;99) *
}99+ ,
public:: 
decimal:: 

TipoCambio:: !
{::" #
get::$ '
;::' (
set::) ,
;::, -
}::. /
public;; 
short;; 
?;; 
MonedaPatrimonioAfp;; )
{;;* +
get;;, /
;;;/ 0
set;;1 4
;;;4 5
};;6 7
public<< 
decimal<< 
?<< 
MontoPatrimonioAfp<< *
{<<+ ,
get<<- 0
;<<0 1
set<<2 5
;<<5 6
}<<7 8
public== 
int== 
?== 
PorcentajeAvance== $
{==% &
get==' *
;==* +
set==, /
;==/ 0
}==1 2
public>> 
int>> 
?>> $
PorcentajeAvanceCompleto>> ,
{>>- .
get>>/ 2
;>>2 3
set>>4 7
;>>7 8
}>>9 :
public?? 
DateTime?? 
??? "
AuditoriaFechaCreacion?? /
{??0 1
get??2 5
;??5 6
set??7 :
;??: ;
}??< =
public@@ 
string@@ $
AuditoriaUsuarioCreacion@@ .
{@@/ 0
get@@1 4
;@@4 5
set@@6 9
;@@9 :
}@@; <
publicAA 
DateTimeAA 
?AA &
AuditoriaFechaModificacionAA 3
{AA4 5
getAA6 9
;AA9 :
setAA; >
;AA> ?
}AA@ A
publicBB 
stringBB (
AuditoriaUsuarioModificacionBB 2
{BB3 4
getBB5 8
;BB8 9
setBB: =
;BB= >
}BB? @
}EE 
publicGG 

classGG %
ProspectoDireccionCommandGG *
{HH 
publicJJ 
intJJ 
IdDireccionJJ 
{JJ  
getJJ! $
;JJ$ %
setJJ& )
;JJ) *
}JJ+ ,
publicKK 
intKK 
IdProspectoKK 
{KK  
getKK! $
;KK$ %
setKK& )
;KK) *
}KK+ ,
publicLL 
stringLL 
	DireccionLL 
{LL  !
getLL" %
;LL% &
setLL' *
;LL* +
}LL, -
publicMM 
shortMM 
Departamento_IdMM $
{MM% &
getMM' *
;MM* +
setMM, /
;MM/ 0
}MM1 2
publicNN 
shortNN 
Provincia_IdNN !
{NN" #
getNN$ '
;NN' (
setNN) ,
;NN, -
}NN. /
publicOO 
shortOO 
Distrito_IdOO  
{OO! "
getOO# &
;OO& '
setOO( +
;OO+ ,
}OO- .
publicPP 
boolPP 
?PP 

FlagActivoPP 
{PP  !
getPP" %
;PP% &
setPP' *
;PP* +
}PP, -
publicQQ 
shortQQ 
?QQ 
TipoDireccionQQ #
{QQ$ %
getQQ& )
;QQ) *
setQQ+ .
;QQ. /
}QQ0 1
publicRR 
DateTimeRR "
AuditoriaFechaCreacionRR .
{RR/ 0
getRR1 4
;RR4 5
setRR6 9
;RR9 :
}RR; <
publicSS 
stringSS $
AuditoriaUsuarioCreacionSS .
{SS/ 0
getSS1 4
;SS4 5
setSS6 9
;SS9 :
}SS; <
}VV 
}WW Ü
jD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ProspectoCommand\DescartarProspectoCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ProspectoCommand* :
{ 
public		 

class		 %
DescartarProspectoCommand		 *
:		+ ,
IRequest		- 5
<		5 6
ResponseModel		6 C
<		C D

EntidadDto		D N
>		N O
>		O P
{

 
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
FlagDescarte  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
? #
CodigoMotivoUnoDescarte -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
short 
? #
CodigoMotivoDosDescarte -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
short 
? $
CodigoMotivoTresDescarte .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string $
TextoMontivoTresDescarte .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DateTime 
? #
FechaMotivoTresDescarte 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} Ó≥
hD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ProspectoCommand\ProspectoCommandExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ProspectoCommand* :
{ 
public		 

class		 /
#RequestCrearProspectoCommandExample		 4
:		5 6
IExamplesProvider		7 H
<		H I!
CrearProspectoCommand		I ^
>		^ _
{

 
public !
CrearProspectoCommand $
GetExamples% 0
(0 1
)1 2
{ 	
AuditRequest 
auditRequest %
=& '
new( +
AuditRequest, 8
(8 9
)9 :
;: ;!
CrearProspectoCommand !!
crearProspectoCommand" 7
=8 9
new: =!
CrearProspectoCommand> S
(S T
)T U
;U V$
ProspectoAdnRentaCommand $$
prospectoAdnRentaCommand% =
=> ?
new@ C$
ProspectoAdnRentaCommandD \
(\ ]
)] ^
;^ _
auditRequest 
. 
idTransaccion &
=' (
$str) 4
;4 5
auditRequest 
. 
nombreAplicacion )
=* +
$str, 4
;4 5
auditRequest 
. 
usuarioAplicacion *
=+ ,
$str- 7
;7 8!
crearProspectoCommand !
.! "
CodigoTipoDocumento" 5
=6 7
$num8 9
;9 :!
crearProspectoCommand !
.! "
NumeroDocumento" 1
=2 3
$str4 >
;> ?!
crearProspectoCommand !
.! "
Nombres" )
=* +
$str, <
;< =!
crearProspectoCommand !
.! "
ApellidoPaterno" 1
=2 3
$str4 <
;< =!
crearProspectoCommand !
.! "
ApellidoMaterno" 1
=2 3
$str4 ;
;; <!
crearProspectoCommand !
.! "
FechaNacimiento" 1
=2 3
DateTime4 <
.< =
Parse= B
(B C
$strC O
)O P
;P Q!
crearProspectoCommand !
.! "

CodigoSexo" ,
=- .
$num/ 0
;0 1!
crearProspectoCommand !
.! "
CodigoFuente" .
=/ 0
$num1 2
;2 3!
crearProspectoCommand !
.! "
CodigoEtapa" -
=. /
$num0 1
;1 2!
crearProspectoCommand   !
.  ! "
CodigoEstado  " .
=  / 0
$num  1 2
;  2 3!
crearProspectoCommand!! !
.!!! "
Empresa!!" )
=!!* +
$str!!, =
;!!= >!
crearProspectoCommand"" !
.""! "
CodigoCargo""" -
="". /
$num""0 1
;""1 2!
crearProspectoCommand## !
.##! "
	OtroCargo##" +
=##, -
$str##. :
;##: ;!
crearProspectoCommand$$ !
.$$! "
FlagHijo$$" *
=$$+ ,
true$$- 1
;$$1 2!
crearProspectoCommand%% !
.%%! "
TelefonoCelular%%" 1
=%%2 3
$str%%4 ?
;%%? @!
crearProspectoCommand&& !
.&&! "
TelefonoFijo&&" .
=&&/ 0
$str&&1 =
;&&= >!
crearProspectoCommand'' !
.''! "
CorreoElectronico1''" 4
=''5 6
$str''7 T
;''T U!
crearProspectoCommand(( !
.((! ""
AuditoriaFechaCreacion((" 8
=((9 :
DateTime((; C
.((C D
Now((D G
;((G H!
crearProspectoCommand)) !
.))! "$
AuditoriaUsuarioCreacion))" :
=)); <
$str))= G
;))G H$
prospectoAdnRentaCommand++ $
.++$ %
MonedaPatrimonioAfp++% 8
=++9 :
$num++; <
;++< =$
prospectoAdnRentaCommand,, $
.,,$ %
MontoPatrimonioAfp,,% 7
=,,8 9
decimal,,: A
.,,A B
Parse,,B G
(,,G H
$str,,H Q
),,Q R
;,,R S$
prospectoAdnRentaCommand-- $
.--$ %
PorcentajeAvance--% 5
=--6 7
$num--8 :
;--: ;$
prospectoAdnRentaCommand.. $
...$ %$
PorcentajeAvanceCompleto..% =
=..> ?
$num..@ A
;..A B$
prospectoAdnRentaCommand// $
.//$ %"
AuditoriaFechaCreacion//% ;
=//< =
DateTime//> F
.//F G
Now//G J
;//J K$
prospectoAdnRentaCommand00 $
.00$ %$
AuditoriaUsuarioCreacion00% =
=00> ?
$str00@ J
;00J K!
crearProspectoCommand22 !
.22! "$
ProspectoAdnRentaCommand22" :
=22; <$
prospectoAdnRentaCommand22= U
;22U V
return44 !
crearProspectoCommand44 (
;44( )
}55 	
}66 
public88 

class88 0
$ResponseCrearProspectoCommandExample88 5
:886 7
IExamplesProvider888 I
<88I J0
$ResponseCrearProspectoCommandExample88J n
>88n o
{99 
public:: 0
$ResponseCrearProspectoCommandExample:: 3
(::3 4
)::4 5
=>::6 8
responseModel::9 F
=::G H
new::I L
ResponseModel::M Z
<::Z [

EntidadDto::[ e
>::e f
(::f g
)::g h
;::h i
public;; 
ResponseModel;; 
<;; 

EntidadDto;; '
>;;' (
responseModel;;) 6
{;;7 8
get;;9 <
;;;< =
set;;> A
;;;A B
};;C D
public<< 0
$ResponseCrearProspectoCommandExample<< 3
GetExamples<<4 ?
(<<? @
)<<@ A
{== 	
string>> 
mensajeRespuesta>> #
=>>$ %
string>>& ,
.>>, -
Empty>>- 2
;>>2 3
int?? 
status?? 
=?? 
$num?? 
;?? 
AuditResponse@@ 
auditResponse@@ '
=@@( )
new@@* -
AuditResponse@@. ;
(@@; <
)@@< =
;@@= >

EntidadDtoAA 

entidadDtoAA !
=AA" #
newAA$ '

EntidadDtoAA( 2
(AA2 3
)AA3 4
;AA4 5

entidadDtoBB 
.BB 
IdBB 
=BB 
$numBB 
;BB 

entidadDtoCC 
.CC 
MensajeCC 
=CC  
$strCC! I
;CCI J
auditResponseDD 
.DD 
idTransaccionDD '
=DD( )
$strDD* 5
;DD5 6
auditResponseEE 
.EE 
codigoRespuestaEE )
=EE* +#
CodigoRespuestaServicioEE, C
.EEC D
ExitoEED I
;EEI J
newFF 
ConfigurationHelperFF #
(FF# $
)FF$ %
.FF% &+
ObtenerMensajeRespuestaServicioFF& E
(FFE F
auditResponseFFF S
.FFS T
codigoRespuestaFFT c
,FFc d
refFFe h
mensajeRespuestaFFi y
,FFy z
refFF{ ~
status	FF Ö
)
FFÖ Ü
;
FFÜ á
auditResponseGG 
.GG 
mensajeRespuestaGG *
=GG+ ,
mensajeRespuestaGG- =
;GG= >
returnHH 
newHH 0
$ResponseCrearProspectoCommandExampleHH ;
(HH; <
)HH< =
{II 
responseModelJJ 
=JJ 
newJJ  #
ResponseModelJJ$ 1
<JJ1 2

EntidadDtoJJ2 <
>JJ< =
(JJ= >
)JJ> ?
{KK 
auditResponseLL !
=LL" #
auditResponseLL$ 1
,LL1 2
EntityMM 
=MM 

entidadDtoMM '
}NN 
}OO 
;OO 
}PP 	
}QQ 
publicSS 

classSS 4
(RequestActualizarProspectoCommandExampleSS 9
:SS: ;
IExamplesProviderSS< M
<SSM N&
ActualizarProspectoCommandSSN h
>SSh i
{TT 
publicUU &
ActualizarProspectoCommandUU )
GetExamplesUU* 5
(UU5 6
)UU6 7
{VV 	
AuditRequestWW 
auditRequestWW %
=WW& '
newWW( +
AuditRequestWW, 8
(WW8 9
)WW9 :
;WW: ;&
ActualizarProspectoCommandXX &&
actualizarProspectoCommandXX' A
=XXB C
newXXD G&
ActualizarProspectoCommandXXH b
(XXb c
)XXc d
;XXd e$
ProspectoAdnRentaCommandYY $$
prospectoAdnRentaCommandYY% =
=YY> ?
newYY@ C$
ProspectoAdnRentaCommandYYD \
(YY\ ]
)YY] ^
;YY^ _%
ProspectoDireccionCommandZZ %%
prospectoDireccionCommandZZ& ?
=ZZ@ A
newZZB E%
ProspectoDireccionCommandZZF _
(ZZ_ `
)ZZ` a
;ZZa b
auditRequest]] 
.]] 
idTransaccion]] &
=]]' (
$str]]) 4
;]]4 5
auditRequest^^ 
.^^ 
nombreAplicacion^^ )
=^^* +
$str^^, 4
;^^4 5
auditRequest__ 
.__ 
usuarioAplicacion__ *
=__+ ,
$str__- 7
;__7 8&
actualizarProspectoCommandbb &
.bb& '
CodigoTipoDocumentobb' :
=bb; <
$numbb= >
;bb> ?&
actualizarProspectoCommandcc &
.cc& '
NumeroDocumentocc' 6
=cc7 8
$strcc9 C
;ccC D&
actualizarProspectoCommanddd &
.dd& '
Nombresdd' .
=dd/ 0
$strdd1 A
;ddA B&
actualizarProspectoCommandee &
.ee& '
ApellidoPaternoee' 6
=ee7 8
$stree9 A
;eeA B&
actualizarProspectoCommandff &
.ff& '
ApellidoMaternoff' 6
=ff7 8
$strff9 @
;ff@ A&
actualizarProspectoCommandgg &
.gg& '
FechaNacimientogg' 6
=gg7 8
DateTimegg9 A
.ggA B
ParseggB G
(ggG H
$strggH T
)ggT U
;ggU V&
actualizarProspectoCommandhh &
.hh& '

CodigoSexohh' 1
=hh2 3
$numhh4 5
;hh5 6&
actualizarProspectoCommandii &
.ii& '
CodigoFuenteii' 3
=ii4 5
$numii6 7
;ii7 8&
actualizarProspectoCommandjj &
.jj& '
CodigoEtapajj' 2
=jj3 4
$numjj5 6
;jj6 7&
actualizarProspectoCommandkk &
.kk& '
CodigoEstadokk' 3
=kk4 5
$numkk6 7
;kk7 8&
actualizarProspectoCommandll &
.ll& '
Empresall' .
=ll/ 0
$strll1 B
;llB C&
actualizarProspectoCommandmm &
.mm& '
CodigoCargomm' 2
=mm3 4
$nummm5 6
;mm6 7&
actualizarProspectoCommandnn &
.nn& '
	OtroCargonn' 0
=nn1 2
$strnn3 ?
;nn? @&
actualizarProspectoCommandoo &
.oo& '
FlagHijooo' /
=oo0 1
trueoo2 6
;oo6 7&
actualizarProspectoCommandpp &
.pp& '
TelefonoCelularpp' 6
=pp7 8
$strpp9 D
;ppD E&
actualizarProspectoCommandqq &
.qq& '
TelefonoFijoqq' 3
=qq4 5
$strqq6 B
;qqB C&
actualizarProspectoCommandrr &
.rr& '
CorreoElectronico1rr' 9
=rr: ;
$strrr< Y
;rrY Z&
actualizarProspectoCommandss &
.ss& '&
AuditoriaFechaModificacionss' A
=ssB C
DateTimessD L
.ssL M
NowssM P
;ssP Q&
actualizarProspectoCommandtt &
.tt& '(
AuditoriaUsuarioModificaciontt' C
=ttD E
$strttF P
;ttP Q$
prospectoAdnRentaCommandvv $
.vv$ %
MonedaPatrimonioAfpvv% 8
=vv9 :
$numvv; <
;vv< =$
prospectoAdnRentaCommandww $
.ww$ %
MontoPatrimonioAfpww% 7
=ww8 9
decimalww: A
.wwA B
ParsewwB G
(wwG H
$strwwH Q
)wwQ R
;wwR S$
prospectoAdnRentaCommandxx $
.xx$ %
PorcentajeAvancexx% 5
=xx6 7
$numxx8 :
;xx: ;$
prospectoAdnRentaCommandyy $
.yy$ %$
PorcentajeAvanceCompletoyy% =
=yy> ?
$numyy@ A
;yyA B$
prospectoAdnRentaCommandzz $
.zz$ %&
AuditoriaFechaModificacionzz% ?
=zz@ A
DateTimezzB J
.zzJ K
NowzzK N
;zzN O$
prospectoAdnRentaCommand{{ $
.{{$ %(
AuditoriaUsuarioModificacion{{% A
={{B C
$str{{D N
;{{N O%
prospectoDireccionCommand}} %
.}}% &
	Direccion}}& /
=}}0 1
$str}}2 E
;}}E F%
prospectoDireccionCommand~~ %
.~~% &
Departamento_Id~~& 5
=~~6 7
$num~~8 9
;~~9 :%
prospectoDireccionCommand %
.% &
Provincia_Id& 2
=3 4
$num5 6
;6 7'
prospectoDireccionCommand
ÄÄ %
.
ÄÄ% &
Distrito_Id
ÄÄ& 1
=
ÄÄ2 3
$num
ÄÄ4 5
;
ÄÄ5 6'
prospectoDireccionCommand
ÅÅ %
.
ÅÅ% &
TipoDireccion
ÅÅ& 3
=
ÅÅ4 5
$num
ÅÅ6 7
;
ÅÅ7 8'
prospectoDireccionCommand
ÇÇ %
.
ÇÇ% &

FlagActivo
ÇÇ& 0
=
ÇÇ1 2
true
ÇÇ3 7
;
ÇÇ7 8'
prospectoDireccionCommand
ÉÉ %
.
ÉÉ% &$
AuditoriaFechaCreacion
ÉÉ& <
=
ÉÉ= >
DateTime
ÉÉ? G
.
ÉÉG H
Now
ÉÉH K
;
ÉÉK L'
prospectoDireccionCommand
ÑÑ %
.
ÑÑ% &&
AuditoriaUsuarioCreacion
ÑÑ& >
=
ÑÑ? @
$str
ÑÑA J
;
ÑÑJ K(
actualizarProspectoCommand
áá &
.
áá& '&
ProspectoAdnRentaCommand
áá' ?
=
áá@ A&
prospectoAdnRentaCommand
ááB Z
;
ááZ [(
actualizarProspectoCommand
àà &
.
àà& ''
ProspectoDireccionCommand
àà' @
=
ààA B'
prospectoDireccionCommand
ààC \
;
àà\ ]
return
ää (
actualizarProspectoCommand
ää -
;
ää- .
}
ãã 	
}
åå 
public
éé 

class
éé 7
)ResponseActualizarProspectoCommandExample
éé :
:
éé; <
IExamplesProvider
éé= N
<
ééN O7
)ResponseActualizarProspectoCommandExample
ééO x
>
ééx y
{
èè 
public
êê 7
)ResponseActualizarProspectoCommandExample
êê 8
(
êê8 9
)
êê9 :
=>
êê; =
responseModel
êê> K
=
êêL M
new
êêN Q
ResponseModel
êêR _
<
êê_ `

EntidadDto
êê` j
>
êêj k
(
êêk l
)
êêl m
;
êêm n
public
ëë 
ResponseModel
ëë 
<
ëë 

EntidadDto
ëë '
>
ëë' (
responseModel
ëë) 6
{
ëë7 8
get
ëë9 <
;
ëë< =
set
ëë> A
;
ëëA B
}
ëëC D
public
íí 7
)ResponseActualizarProspectoCommandExample
íí 8
GetExamples
íí9 D
(
ííD E
)
ííE F
{
ìì 	
string
îî 
mensajeRespuesta
îî #
=
îî$ %
string
îî& ,
.
îî, -
Empty
îî- 2
;
îî2 3
int
ïï 
status
ïï 
=
ïï 
$num
ïï 
;
ïï 
AuditResponse
ññ 
auditResponse
ññ '
=
ññ( )
new
ññ* -
AuditResponse
ññ. ;
(
ññ; <
)
ññ< =
;
ññ= >

EntidadDto
óó 

entidadDto
óó !
=
óó" #
new
óó$ '

EntidadDto
óó( 2
(
óó2 3
)
óó3 4
;
óó4 5

entidadDto
òò 
.
òò 
Id
òò 
=
òò 
$num
òò 
;
òò 

entidadDto
ôô 
.
ôô 
Mensaje
ôô 
=
ôô  
$str
ôô! J
;
ôôJ K
auditResponse
öö 
.
öö 
idTransaccion
öö '
=
öö( )
$str
öö* 5
;
öö5 6
auditResponse
õõ 
.
õõ 
codigoRespuesta
õõ )
=
õõ* +%
CodigoRespuestaServicio
õõ, C
.
õõC D
Exito
õõD I
;
õõI J
new
úú !
ConfigurationHelper
úú #
(
úú# $
)
úú$ %
.
úú% &-
ObtenerMensajeRespuestaServicio
úú& E
(
úúE F
auditResponse
úúF S
.
úúS T
codigoRespuesta
úúT c
,
úúc d
ref
úúe h
mensajeRespuesta
úúi y
,
úúy z
ref
úú{ ~
statusúú Ö
)úúÖ Ü
;úúÜ á
auditResponse
ùù 
.
ùù 
mensajeRespuesta
ùù *
=
ùù+ ,
mensajeRespuesta
ùù- =
;
ùù= >
return
ûû 
new
ûû 7
)ResponseActualizarProspectoCommandExample
ûû @
(
ûû@ A
)
ûûA B
{
üü 
responseModel
†† 
=
†† 
new
††  #
ResponseModel
††$ 1
<
††1 2

EntidadDto
††2 <
>
††< =
(
††= >
)
††> ?
{
°° 
auditResponse
¢¢ !
=
¢¢" #
auditResponse
¢¢$ 1
,
¢¢1 2
Entity
££ 
=
££ 

entidadDto
££ '
}
§§ 
}
•• 
;
•• 
}
¶¶ 	
}
ßß 
public
™™ 

class
™™ 5
'RequestDescartarProspectoCommandExample
™™ 8
:
™™9 :
IExamplesProvider
™™; L
<
™™L M'
DescartarProspectoCommand
™™M f
>
™™f g
{
´´ 
public
¨¨ '
DescartarProspectoCommand
¨¨ (
GetExamples
¨¨) 4
(
¨¨4 5
)
¨¨5 6
{
≠≠ 	'
DescartarProspectoCommand
ÆÆ %'
descartarProspectoCommand
ÆÆ& ?
=
ÆÆ@ A
new
ÆÆB E'
DescartarProspectoCommand
ÆÆF _
(
ÆÆ_ `
)
ÆÆ` a
;
ÆÆa b'
descartarProspectoCommand
∞∞ %
.
∞∞% &
FlagDescarte
∞∞& 2
=
∞∞3 4
true
∞∞5 9
;
∞∞9 :'
descartarProspectoCommand
±± %
.
±±% &%
CodigoMotivoUnoDescarte
±±& =
=
±±> ?
$num
±±@ A
;
±±A B'
descartarProspectoCommand
≤≤ %
.
≤≤% &%
CodigoMotivoDosDescarte
≤≤& =
=
≤≤> ?
$num
≤≤@ B
;
≤≤B C'
descartarProspectoCommand
≥≥ %
.
≥≥% &&
TextoMontivoTresDescarte
≥≥& >
=
≥≥? @
$str
≥≥A O
;
≥≥O P'
descartarProspectoCommand
¥¥ %
.
¥¥% &(
AuditoriaFechaModificacion
¥¥& @
=
¥¥A B
DateTime
¥¥C K
.
¥¥K L
Now
¥¥L O
;
¥¥O P'
descartarProspectoCommand
µµ %
.
µµ% &*
AuditoriaUsuarioModificacion
µµ& B
=
µµC D
$str
µµE N
;
µµN O
return
∑∑ '
descartarProspectoCommand
∑∑ ,
;
∑∑, -
}
∏∏ 	
}
ππ 
public
ªª 

class
ªª 6
(ResponseDescartarProspectoCommandExample
ªª 9
:
ªª: ;
IExamplesProvider
ªª< M
<
ªªM N6
(ResponseDescartarProspectoCommandExample
ªªN v
>
ªªv w
{
ºº 
public
ΩΩ 6
(ResponseDescartarProspectoCommandExample
ΩΩ 7
(
ΩΩ7 8
)
ΩΩ8 9
=>
ΩΩ: <
responseModel
ΩΩ= J
=
ΩΩK L
new
ΩΩM P
ResponseModel
ΩΩQ ^
<
ΩΩ^ _

EntidadDto
ΩΩ_ i
>
ΩΩi j
(
ΩΩj k
)
ΩΩk l
;
ΩΩl m
public
ææ 
ResponseModel
ææ 
<
ææ 

EntidadDto
ææ '
>
ææ' (
responseModel
ææ) 6
{
ææ7 8
get
ææ9 <
;
ææ< =
set
ææ> A
;
ææA B
}
ææC D
public
øø 6
(ResponseDescartarProspectoCommandExample
øø 7
GetExamples
øø8 C
(
øøC D
)
øøD E
{
¿¿ 	
string
¡¡ 
mensajeRespuesta
¡¡ #
=
¡¡$ %
string
¡¡& ,
.
¡¡, -
Empty
¡¡- 2
;
¡¡2 3
int
¬¬ 
status
¬¬ 
=
¬¬ 
$num
¬¬ 
;
¬¬ 
AuditResponse
√√ 
auditResponse
√√ '
=
√√( )
new
√√* -
AuditResponse
√√. ;
(
√√; <
)
√√< =
;
√√= >

EntidadDto
ƒƒ 

entidadDto
ƒƒ !
=
ƒƒ" #
new
ƒƒ$ '

EntidadDto
ƒƒ( 2
(
ƒƒ2 3
)
ƒƒ3 4
;
ƒƒ4 5

entidadDto
≈≈ 
.
≈≈ 
Id
≈≈ 
=
≈≈ 
$num
≈≈ 
;
≈≈ 

entidadDto
∆∆ 
.
∆∆ 
Mensaje
∆∆ 
=
∆∆  
$str
∆∆! I
;
∆∆I J
auditResponse
«« 
.
«« 
idTransaccion
«« '
=
««( )
$str
««* 5
;
««5 6
auditResponse
»» 
.
»» 
codigoRespuesta
»» )
=
»»* +%
CodigoRespuestaServicio
»», C
.
»»C D
Exito
»»D I
;
»»I J
new
…… !
ConfigurationHelper
…… #
(
……# $
)
……$ %
.
……% &-
ObtenerMensajeRespuestaServicio
……& E
(
……E F
auditResponse
……F S
.
……S T
codigoRespuesta
……T c
,
……c d
ref
……e h
mensajeRespuesta
……i y
,
……y z
ref
……{ ~
status…… Ö
)……Ö Ü
;……Ü á
auditResponse
   
.
   
mensajeRespuesta
   *
=
  + ,
mensajeRespuesta
  - =
;
  = >
return
ÀÀ 
new
ÀÀ 6
(ResponseDescartarProspectoCommandExample
ÀÀ ?
(
ÀÀ? @
)
ÀÀ@ A
{
ÃÃ 
responseModel
ÕÕ 
=
ÕÕ 
new
ÕÕ  #
ResponseModel
ÕÕ$ 1
<
ÕÕ1 2

EntidadDto
ÕÕ2 <
>
ÕÕ< =
(
ÕÕ= >
)
ÕÕ> ?
{
ŒŒ 
auditResponse
œœ !
=
œœ" #
auditResponse
œœ$ 1
,
œœ1 2
Entity
–– 
=
–– 

entidadDto
–– '
}
—— 
}
““ 
;
““ 
}
”” 	
}
‘‘ 
}’’ ˛z
hD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ProspectoCommand\ProspectoCommandHandler.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ProspectoCommand* :
{ 
public 

class #
ProspectoCommandHandler (
:) *
IRequestHandler+ :
<: ;!
CrearProspectoCommand; P
,P Q
ResponseModelR _
<_ `

EntidadDto` j
>j k
>k l
,l m
IRequestHandler0 ?
<? @&
ActualizarProspectoCommand@ Z
,Z [
ResponseModel[ h
<h i

EntidadDtoi s
>s t
>t u
,u v
IRequestHandler0 ?
<? @%
DescartarProspectoCommand@ Y
,Y Z
ResponseModelZ g
<g h

EntidadDtoh r
>r s
>s t
{ 
private 
readonly  
IProspectoRepository - 
_prospectoRepository. B
;B C
private 
readonly 
ICitaRepository (
_citaRepository) 8
;8 9
private 
readonly 
IMapper  
_mapper! (
;( )
public #
ProspectoCommandHandler &
(& ' 
IProspectoRepository' ;
prospectoRepository< O
,O P
ICitaRepositoryP _
citaRepository` n
,n o
IMapperp w
mapperx ~
)~ 
{ 	 
_prospectoRepository  
=! "
prospectoRepository# 6
;6 7
_citaRepository 
= 
citaRepository ,
;, -
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ResponseModel '
<' (

EntidadDto( 2
>2 3
>3 4
Handle5 ;
(; <!
CrearProspectoCommand< Q
requestR Y
,Y Z
CancellationToken[ l
cancellationTokenm ~
)~ 
{ 	
ResponseModel 
< 

EntidadDto $
>$ %
response& .
=/ 0
new1 4
ResponseModel5 B
<B C

EntidadDtoC M
>M N
(N O
)O P
;P Q
ResponseService   
responseService   +
;  + ,
ConfigurationHelper!! 
configuration!!  -
=!!. /
new!!0 3
ConfigurationHelper!!4 G
(!!G H
)!!H I
;!!I J
if## 
(## 
request## 
.## &
IdConsolidadoIntermediario## 2
==##3 5
$num##6 7
)##7 8
{$$ 
responseService%% 
=%%  !
configuration%%" /
.%%/ 0*
ObtenerCodigoRespuestaServicio%%0 N
(%%N O#
CodigoRespuestaServicio%%O f
.%%f g
SinDatos%%g o
,%%o p
string%%q w
.%%w x
Format%%x ~
(%%~ 
$str	%% ≠
,
%%≠ Æ
request
%%Ø ∂
.
%%∂ ∑!
CodigoIntermediario
%%∑  
.
%%  À
ToString
%%À ”
(
%%” ‘
)
%%‘ ’
)
%%’ ÷
)
%%÷ ◊
;
%%◊ ÿ
response&& 
.&& 
auditResponse&& &
=&&' (
new&&) ,
AuditResponse&&- :
{&&; <
codigoRespuesta&&= L
=&&M N
responseService&&O ^
.&&^ _
codigoRespuesta&&_ n
,&&n o
mensajeRespuesta	&&p Ä
=
&&Å Ç
responseService
&&É í
.
&&í ì
mensajeRespuesta
&&ì £
}
&&§ •
;
&&• ¶
return'' 
response'' 
;''  
}(( 
try** 
{++ 
var,, 
	prospecto,, 
=,, 
_mapper,,  '
.,,' (
Map,,( +
<,,+ ,
	Prospecto,,, 5
>,,5 6
(,,6 7
request,,7 >
),,> ?
;,,? @ 
_prospectoRepository-- $
.--$ %
Agregar--% ,
(--, -
	prospecto--- 6
)--6 7
;--7 8
await..  
_prospectoRepository.. *
...* +

UnitOfWork..+ 5
...5 6
SaveEntitiesAsync..6 G
(..G H
cancellationToken..H Y
)..Y Z
;..Z [
responseService00 
=00  !
configuration00" /
.00/ 0*
ObtenerCodigoRespuestaServicio000 N
(00N O#
CodigoRespuestaServicio00O f
.00f g
Exito00g l
,00l m
$str00n p
)00p q
;00q r
response11 
.11 
auditResponse11 &
=11' (
new11) ,
AuditResponse11- :
{11; <
codigoRespuesta11= L
=11M N
responseService11O ^
.11^ _
codigoRespuesta11_ n
,11n o
mensajeRespuesta	11p Ä
=
11Å Ç
responseService
11É í
.
11í ì
mensajeRespuesta
11ì £
}
11§ •
;
11• ¶
response22 
.22 
Entity22 
=22  !
new22" %

EntidadDto22& 0
{221 2
Id223 5
=226 7
	prospecto228 A
.22A B
IdProspecto22B M
,22M N
Mensaje22O V
=22W X
$str	22Y Å
}
22Å Ç
;
22Ç É
return44 
await44 
Task44 !
.44! "
Run44" %
(44% &
(44& '
)44' (
=>44) +
{44, -
return55 
response55 #
;55# $
}66 
)66 
;66 
}77 
catch88 
(88 
	Exception88 
ex88 
)88  
{99 
responseService:: 
=::  !
configuration::" /
.::/ 0*
ObtenerCodigoRespuestaServicio::0 N
(::N O#
CodigoRespuestaServicio::O f
.::f g
ErrorInesperado::g v
,::v w
ex::x z
.::z {
InnerException	::{ â
.
::â ä
Message
::ä ë
.
::ë í
ToString
::í ö
(
::ö õ
)
::õ ú
)
::ú ù
;
::ù û
response;; 
.;; 
auditResponse;; &
=;;' (
new;;) ,
AuditResponse;;- :
{;;; <
codigoRespuesta;;= L
=;;M N
responseService;;O ^
.;;^ _
codigoRespuesta;;_ n
,;;n o
mensajeRespuesta	;;p Ä
=
;;Å Ç
responseService
;;É í
.
;;í ì
mensajeRespuesta
;;ì £
}
;;§ •
;
;;• ¶
return== 
await== 
Task== !
.==! "
Run==" %
(==% &
(==& '
)==' (
=>==) +
{==, -
return>> 
response>> #
;>># $
}?? 
)?? 
;?? 
}@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
ResponseModelCC '
<CC' (

EntidadDtoCC( 2
>CC2 3
>CC3 4
HandleCC5 ;
(CC; <&
ActualizarProspectoCommandCC< V
requestCCW ^
,CC^ _
CancellationTokenCC` q
cancellationToken	CCr É
)
CCÉ Ñ
{DD 	
ResponseModelEE 
<EE 

EntidadDtoEE $
>EE$ %
responseEE& .
=EE/ 0
newEE1 4
ResponseModelEE5 B
<EEB C

EntidadDtoEEC M
>EEM N
(EEN O
)EEO P
;EEP Q
ResponseServiceFF 
responseServiceFF +
;FF+ ,
ConfigurationHelperGG 
configurationGG  -
=GG. /
newGG0 3
ConfigurationHelperGG4 G
(GGG H
)GGH I
;GGI J
tryHH 
{II 
varJJ 
	prospectoJJ 
=JJ 
_mapperJJ  '
.JJ' (
MapJJ( +
<JJ+ ,
	ProspectoJJ, 5
>JJ5 6
(JJ6 7
requestJJ7 >
)JJ> ?
;JJ? @ 
_prospectoRepositoryKK $
.KK$ %

ActualizarKK% /
(KK/ 0
	prospectoKK0 9
)KK9 :
;KK: ;
awaitLL  
_prospectoRepositoryLL *
.LL* +

UnitOfWorkLL+ 5
.LL5 6
SaveEntitiesAsyncLL6 G
(LLG H
cancellationTokenLLH Y
)LLY Z
;LLZ [
responseServiceNN 
=NN  !
configurationNN" /
.NN/ 0*
ObtenerCodigoRespuestaServicioNN0 N
(NNN O#
CodigoRespuestaServicioNNO f
.NNf g
ExitoNNg l
,NNl m
$strNNn p
)NNp q
;NNq r
responseOO 
.OO 
auditResponseOO &
=OO' (
newOO) ,
AuditResponseOO- :
{OO; <
codigoRespuestaOO= L
=OOM N
responseServiceOOO ^
.OO^ _
codigoRespuestaOO_ n
,OOn o
mensajeRespuesta	OOp Ä
=
OOÅ Ç
responseService
OOÉ í
.
OOí ì
mensajeRespuesta
OOì £
}
OO§ •
;
OO• ¶
responsePP 
.PP 
EntityPP 
=PP  !
newPP" %

EntidadDtoPP& 0
{PP1 2
IdPP3 5
=PP6 7
	prospectoPP8 A
.PPA B
IdProspectoPPB M
,PPM N
MensajePPO V
=PPW X
$str	PPY Ç
}
PPÉ Ñ
;
PPÑ Ö
returnRR 
awaitRR 
TaskRR !
.RR! "
RunRR" %
(RR% &
(RR& '
)RR' (
=>RR) +
{RR, -
returnSS 
responseSS #
;SS# $
}TT 
)TT 
;TT 
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
responseServiceXX 
=XX  !
configurationXX" /
.XX/ 0*
ObtenerCodigoRespuestaServicioXX0 N
(XXN O#
CodigoRespuestaServicioXXO f
.XXf g
ErrorInesperadoXXg v
,XXv w
exXXx z
.XXz {
InnerException	XX{ â
.
XXâ ä
Message
XXä ë
.
XXë í
ToString
XXí ö
(
XXö õ
)
XXõ ú
)
XXú ù
;
XXù û
responseYY 
.YY 
auditResponseYY &
=YY' (
newYY) ,
AuditResponseYY- :
{YY; <
codigoRespuestaYY= L
=YYM N
responseServiceYYO ^
.YY^ _
codigoRespuestaYY_ n
,YYn o
mensajeRespuesta	YYp Ä
=
YYÅ Ç
responseService
YYÉ í
.
YYí ì
mensajeRespuesta
YYì £
}
YY§ •
;
YY• ¶
return[[ 
await[[ 
Task[[ !
.[[! "
Run[[" %
([[% &
([[& '
)[[' (
=>[[) +
{[[, -
return\\ 
response\\ #
;\\# $
}]] 
)]] 
;]] 
}^^ 
}__ 	
publicaa 
asyncaa 
Taskaa 
<aa 
ResponseModelaa '
<aa' (

EntidadDtoaa( 2
>aa2 3
>aa3 4
Handleaa5 ;
(aa; <%
DescartarProspectoCommandaa< U
requestaaV ]
,aa] ^
CancellationTokenaa_ p
cancellationToken	aaq Ç
)
aaÇ É
{bb 	
ResponseModelcc 
<cc 

EntidadDtocc $
>cc$ %
responsecc& .
=cc/ 0
newcc1 4
ResponseModelcc5 B
<ccB C

EntidadDtoccC M
>ccM N
(ccN O
)ccO P
;ccP Q
ResponseServicedd 
responseServicedd +
;dd+ ,
ConfigurationHelperee 
configurationee  -
=ee. /
newee0 3
ConfigurationHelperee4 G
(eeG H
)eeH I
;eeI J
tryff 
{gg 
varhh 
	prospectohh 
=hh 
_mapperhh  '
.hh' (
Maphh( +
<hh+ ,
	Prospectohh, 5
>hh5 6
(hh6 7
requesthh7 >
)hh> ?
;hh? @ 
_prospectoRepositoryii $
.ii$ %
	Descartarii% .
(ii. /
	prospectoii/ 8
)ii8 9
;ii9 :
_citaRepositoryll 
.ll  -
!CalificarMultipleCitaNoConcretadall  A
(llA B
requestllB I
.llI J
IdProspectollJ U
,llU V
requestllW ^
.ll^ _$
TextoMontivoTresDescartell_ w
)llw x
;llx y
awaitnn  
_prospectoRepositorynn *
.nn* +

UnitOfWorknn+ 5
.nn5 6
SaveEntitiesAsyncnn6 G
(nnG H
cancellationTokennnH Y
)nnY Z
;nnZ [
responseServicepp 
=pp  !
configurationpp" /
.pp/ 0*
ObtenerCodigoRespuestaServiciopp0 N
(ppN O#
CodigoRespuestaServicioppO f
.ppf g
Exitoppg l
,ppl m
$strppn p
)ppp q
;ppq r
responseqq 
.qq 
auditResponseqq &
=qq' (
newqq) ,
AuditResponseqq- :
{qq; <
codigoRespuestaqq= L
=qqM N
responseServiceqqO ^
.qq^ _
codigoRespuestaqq_ n
,qqn o
mensajeRespuesta	qqp Ä
=
qqÅ Ç
responseService
qqÉ í
.
qqí ì
mensajeRespuesta
qqì £
}
qq§ •
;
qq• ¶
responserr 
.rr 
Entityrr 
=rr  !
newrr" %

EntidadDtorr& 0
{rr1 2
Idrr3 5
=rr6 7
	prospectorr8 A
.rrA B
IdProspectorrB M
,rrM N
MensajerrO V
=rrW X
$str	rrY Å
}
rrÇ É
;
rrÉ Ñ
returntt 
awaittt 
Tasktt !
.tt! "
Runtt" %
(tt% &
(tt& '
)tt' (
=>tt) +
{tt, -
returnuu 
responseuu #
;uu# $
}vv 
)vv 
;vv 
}ww 
catchxx 
(xx 
	Exceptionxx 
exxx 
)xx  
{yy 
responseServicezz 
=zz  !
configurationzz" /
.zz/ 0*
ObtenerCodigoRespuestaServiciozz0 N
(zzN O#
CodigoRespuestaServiciozzO f
.zzf g
ErrorInesperadozzg v
,zzv w
exzzx z
.zzz {
InnerException	zz{ â
.
zzâ ä
Message
zzä ë
.
zzë í
ToString
zzí ö
(
zzö õ
)
zzõ ú
)
zzú ù
;
zzù û
response{{ 
.{{ 
auditResponse{{ &
={{' (
new{{) ,
AuditResponse{{- :
{{{; <
codigoRespuesta{{= L
={{M N
responseService{{O ^
.{{^ _
codigoRespuesta{{_ n
,{{n o
mensajeRespuesta	{{p Ä
=
{{Å Ç
responseService
{{É í
.
{{í ì
mensajeRespuesta
{{ì £
}
{{§ •
;
{{• ¶
return}} 
await}} 
Task}} !
.}}! "
Run}}" %
(}}% &
(}}& '
)}}' (
=>}}) +
{}}, -
return~~ 
response~~ #
;~~# $
} 
) 
; 
}
ÄÄ 
}
ÅÅ 	
}
ÉÉ 
}ÑÑ •
D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\RecordatorioLlamadaCommand\ActualizarRecordatorioLlamadaCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *&
RecordatorioLlamadaCommand* D
{ 
public 

class 0
$ActualizarRecordatorioLlamadaCommand 5
:6 7
IRequest8 @
<@ A
ResponseModelA N
<N O

EntidadDtoO Y
>Y Z
>Z [
{		 
public 
int !
IdRecordatorioLlamada (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DateTime 
FechaRecordatorio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
? 

FlagActivo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
? 
AlertaMinutosAntes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoLineaNegocio (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DateTime &
AuditoriaFechaModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
string 
Accion 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ˘
zD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\RecordatorioLlamadaCommand\CrearRecordatorioLlamadaCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *&
RecordatorioLlamadaCommand* D
{ 
public 

class +
CrearRecordatorioLlamadaCommand 0
:1 2
IRequest3 ;
<; <
ResponseModel< I
<I J

EntidadDtoJ T
>T U
>U V
{		 
public 
int !
IdRecordatorioLlamada (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 
IdCita 
{ 
get  
;  !
set" %
;% &
}' (
public 
int ,
 IdRecordatorioLlamadaDispositivo 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
DateTime 
FechaRecordatorio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
? 

FlagActivo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
? 
AlertaMinutosAntes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoLineaNegocio (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DateTime "
AuditoriaFechaCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
string $
AuditoriaUsuarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public /
#RecordatorioLlamadaProspectoCommand 2/
#RecordatorioLlamadaProspectoCommand3 V
{W X
getY \
;\ ]
set^ a
;a b
}c d
} 
public   

class   /
#RecordatorioLlamadaProspectoCommand   4
{!! 
public"" 
string"" 
TelefonoFijo"" "
{""# $
get""% (
;""( )
set""* -
;""- .
}""/ 0
public## 
string## 
TelefonoCelular## %
{##& '
get##( +
;##+ ,
set##- 0
;##0 1
}##2 3
}$$ 
}%% €[
|D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\RecordatorioLlamadaCommand\RecordatorioLlamadaCommandExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *&
RecordatorioLlamadaCommand* D
{		 
public

 

class

 -
!RecordatorioLlamadaCommandExample

 2
{ 
} 
public 

class 9
-RequestCrearRecordatorioLlamadaCommandExample >
:? @
IExamplesProviderA R
<R S+
CrearRecordatorioLlamadaCommandS r
>r s
{ 
public +
CrearRecordatorioLlamadaCommand .
GetExamples/ :
(: ;
); <
{ 	
AuditRequest 
auditRequest %
=& '
new( +
AuditRequest, 8
(8 9
)9 :
;: ;+
CrearRecordatorioLlamadaCommand ++
crearRecordatorioLlamadaCommand, K
=L M
newN Q+
CrearRecordatorioLlamadaCommandR q
(q r
)r s
;s t/
#RecordatorioLlamadaProspectoCommand //
#recordatorioLlamadaProspectoCommand0 S
=T U
newV Y/
#RecordatorioLlamadaProspectoCommandZ }
(} ~
)~ 
;	 Ä
auditRequest 
. 
idTransaccion &
=' (
$str) 4
;4 5
auditRequest 
. 
nombreAplicacion )
=* +
$str, 4
;4 5
auditRequest 
. 
usuarioAplicacion *
=+ ,
$str- 7
;7 8+
crearRecordatorioLlamadaCommand +
.+ ,
CodigoLineaNegocio, >
=? @
$numA C
;C D+
crearRecordatorioLlamadaCommand +
.+ ,
FechaRecordatorio, =
=> ?
DateTime@ H
.H I
NowI L
;L M+
crearRecordatorioLlamadaCommand +
.+ ,,
 IdRecordatorioLlamadaDispositivo, L
=M N
$numO P
;P Q+
crearRecordatorioLlamadaCommand +
.+ ,

FlagActivo, 6
=7 8
true9 =
;= >+
crearRecordatorioLlamadaCommand   +
.  + ,

HoraInicio  , 6
=  7 8
$str  9 @
;  @ A+
crearRecordatorioLlamadaCommand!! +
.!!+ ,
HoraFin!!, 3
=!!4 5
$str!!6 =
;!!= >+
crearRecordatorioLlamadaCommand"" +
.""+ ,
AlertaMinutosAntes"", >
=""? @
$num""A C
;""C D+
crearRecordatorioLlamadaCommand## +
.##+ ,
Descripcion##, 7
=##8 9
$str##: K
;##K L+
crearRecordatorioLlamadaCommand$$ +
.$$+ ,"
AuditoriaFechaCreacion$$, B
=$$C D
DateTime$$E M
.$$M N
Now$$N Q
;$$Q R+
crearRecordatorioLlamadaCommand%% +
.%%+ ,$
AuditoriaUsuarioCreacion%%, D
=%%E F
$str%%G P
;%%P Q/
#recordatorioLlamadaProspectoCommand(( /
.((/ 0
TelefonoCelular((0 ?
=((@ A
$str((B M
;((M N/
#recordatorioLlamadaProspectoCommand)) /
.))/ 0
TelefonoFijo))0 <
=))= >
$str))? H
;))H I+
crearRecordatorioLlamadaCommand++ +
.+++ ,/
#RecordatorioLlamadaProspectoCommand++, O
=++P Q/
#recordatorioLlamadaProspectoCommand++R u
;++u v
return-- +
crearRecordatorioLlamadaCommand-- 2
;--2 3
}.. 	
}// 
public11 

class11 :
.ResponseCrearRecordatorioLlamadaCommandExample11 ?
:11@ A
IExamplesProvider11B S
<11S T;
.ResponseCrearRecordatorioLlamadaCommandExample	11T Ç
>
11Ç É
{22 
public33 :
.ResponseCrearRecordatorioLlamadaCommandExample33 =
(33= >
)33> ?
=>33@ B
responseModel33C P
=33Q R
new33S V
ResponseModel33W d
<33d e

EntidadDto33e o
>33o p
(33p q
)33q r
;33r s
public44 
ResponseModel44 
<44 

EntidadDto44 '
>44' (
responseModel44) 6
{447 8
get449 <
;44< =
set44> A
;44A B
}44C D
public55 :
.ResponseCrearRecordatorioLlamadaCommandExample55 =
GetExamples55> I
(55I J
)55J K
{66 	
string77 
mensajeRespuesta77 #
=77$ %
string77& ,
.77, -
Empty77- 2
;772 3
int88 
status88 
=88 
$num88 
;88 
AuditResponse99 
auditResponse99 '
=99( )
new99* -
AuditResponse99. ;
(99; <
)99< =
;99= >

EntidadDto:: "
recordatorioLlamadaDto:: -
=::. /
new::0 3

EntidadDto::4 >
(::> ?
)::? @
;::@ A"
recordatorioLlamadaDto;; "
.;;" #
Id;;# %
=;;& '
$num;;( *
;;;* +"
recordatorioLlamadaDto<< "
.<<" #
Mensaje<<# *
=<<+ ,
$str<<- `
;<<` a
auditResponse== 
.== 
idTransaccion== '
===( )
$str==* 5
;==5 6
auditResponse>> 
.>> 
codigoRespuesta>> )
=>>* +#
CodigoRespuestaServicio>>, C
.>>C D
Exito>>D I
;>>I J
new?? 
ConfigurationHelper?? #
(??# $
)??$ %
.??% &+
ObtenerMensajeRespuestaServicio??& E
(??E F
auditResponse??F S
.??S T
codigoRespuesta??T c
,??c d
ref??e h
mensajeRespuesta??i y
,??y z
ref??{ ~
status	?? Ö
)
??Ö Ü
;
??Ü á
auditResponse@@ 
.@@ 
mensajeRespuesta@@ *
=@@+ ,
mensajeRespuesta@@- =
;@@= >
returnAA 
newAA :
.ResponseCrearRecordatorioLlamadaCommandExampleAA E
(AAE F
)AAF G
{BB 
responseModelCC 
=CC 
newCC  #
ResponseModelCC$ 1
<CC1 2

EntidadDtoCC2 <
>CC< =
(CC= >
)CC> ?
{DD 
auditResponseEE !
=EE" #
auditResponseEE$ 1
,EE1 2
EntityFF 
=FF "
recordatorioLlamadaDtoFF 3
}GG 
}HH 
;HH 
}II 	
}JJ 
publicMM 

classMM >
2RequestActualizarRecordatorioLlamadaCommandExampleMM C
:MMD E
IExamplesProviderMMF W
<MMW X0
$ActualizarRecordatorioLlamadaCommandMMX |
>MM| }
{NN 
publicOO 0
$ActualizarRecordatorioLlamadaCommandOO 3
GetExamplesOO4 ?
(OO? @
)OO@ A
{PP 	0
$ActualizarRecordatorioLlamadaCommandQQ 00
$actualizarRecordatorioLlamadaCommandQQ1 U
=QQV W
newQQX [1
$ActualizarRecordatorioLlamadaCommand	QQ\ Ä
(
QQÄ Å
)
QQÅ Ç
;
QQÇ É0
$actualizarRecordatorioLlamadaCommandSS 0
.SS0 1
FechaRecordatorioSS1 B
=SSC D
DateTimeSSE M
.SSM N
NowSSN Q
;SSQ R0
$actualizarRecordatorioLlamadaCommandTT 0
.TT0 1

HoraInicioTT1 ;
=TT< =
$strTT> E
;TTE F0
$actualizarRecordatorioLlamadaCommandUU 0
.UU0 1
HoraFinUU1 8
=UU9 :
$strUU; B
;UUB C0
$actualizarRecordatorioLlamadaCommandVV 0
.VV0 1
DescripcionVV1 <
=VV= >
$strVV? P
;VVP Q0
$actualizarRecordatorioLlamadaCommandWW 0
.WW0 1
AlertaMinutosAntesWW1 C
=WWD E
$numWWF H
;WWH I0
$actualizarRecordatorioLlamadaCommandXX 0
.XX0 1&
AuditoriaFechaModificacionXX1 K
=XXL M
DateTimeXXN V
.XXV W
NowXXW Z
;XXZ [0
$actualizarRecordatorioLlamadaCommandYY 0
.YY0 1(
AuditoriaUsuarioModificacionYY1 M
=YYN O
$strYYP Y
;YYY Z
returnZZ 0
$actualizarRecordatorioLlamadaCommandZZ 7
;ZZ7 8
}[[ 	
}\\ 
public^^ 

class^^ ?
3ResponseActualizarRecordatorioLlamadaCommandExample^^ D
:^^E F
IExamplesProvider^^G X
<^^X Y@
3ResponseActualizarRecordatorioLlamadaCommandExample	^^Y å
>
^^å ç
{__ 
public`` ?
3ResponseActualizarRecordatorioLlamadaCommandExample`` B
(``B C
)``C D
=>``E G
responseModel``H U
=``V W
new``X [
ResponseModel``\ i
<``i j

EntidadDto``j t
>``t u
(``u v
)``v w
;``w x
publicaa 
ResponseModelaa 
<aa 

EntidadDtoaa '
>aa' (
responseModelaa) 6
{aa7 8
getaa9 <
;aa< =
setaa> A
;aaA B
}aaC D
publicbb ?
3ResponseActualizarRecordatorioLlamadaCommandExamplebb B
GetExamplesbbC N
(bbN O
)bbO P
{cc 	
stringdd 
mensajeRespuestadd #
=dd$ %
stringdd& ,
.dd, -
Emptydd- 2
;dd2 3
intee 
statusee 
=ee 
$numee 
;ee 
AuditResponseff 
auditResponseff '
=ff( )
newff* -
AuditResponseff. ;
(ff; <
)ff< =
;ff= >

EntidadDtogg 

entidadDtogg !
=gg" #
newgg$ '

EntidadDtogg( 2
(gg2 3
)gg3 4
;gg4 5

entidadDtohh 
.hh 
Idhh 
=hh 
$numhh 
;hh 

entidadDtoii 
.ii 
Mensajeii 
=ii  
$strii! U
;iiU V
auditResponsejj 
.jj 
idTransaccionjj '
=jj( )
$strjj* 5
;jj5 6
auditResponsekk 
.kk 
codigoRespuestakk )
=kk* +#
CodigoRespuestaServiciokk, C
.kkC D
ExitokkD I
;kkI J
newll 
ConfigurationHelperll #
(ll# $
)ll$ %
.ll% &+
ObtenerMensajeRespuestaServicioll& E
(llE F
auditResponsellF S
.llS T
codigoRespuestallT c
,llc d
reflle h
mensajeRespuestalli y
,lly z
refll{ ~
status	ll Ö
)
llÖ Ü
;
llÜ á
auditResponsemm 
.mm 
mensajeRespuestamm *
=mm+ ,
mensajeRespuestamm- =
;mm= >
returnnn 
newnn ?
3ResponseActualizarRecordatorioLlamadaCommandExamplenn J
(nnJ K
)nnK L
{oo 
responseModelpp 
=pp 
newpp  #
ResponseModelpp$ 1
<pp1 2

EntidadDtopp2 <
>pp< =
(pp= >
)pp> ?
{qq 
auditResponserr !
=rr" #
auditResponserr$ 1
,rr1 2
Entityss 
=ss 

entidadDtoss '
}tt 
}uu 
;uu 
}vv 	
}ww 
}xx ÈP
|D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\RecordatorioLlamadaCommand\RecordatorioLlamadaCommandHandler.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *&
RecordatorioLlamadaCommand* D
{ 
public 

class -
!RecordatorioLlamadaCommandHandler 2
:3 4
IRequestHandler5 D
<D E+
CrearRecordatorioLlamadaCommandE d
,d e
ResponseModelf s
<s t

EntidadDtot ~
>~ 
>	 Ä
,
Ä Å
IRequestHandler5 D
<D E0
$ActualizarRecordatorioLlamadaCommandE i
,i j
ResponseModelj w
<w x

EntidadDto	x Ç
>
Ç É
>
É Ñ
{ 
private 
readonly *
IRecordatorioLlamadaRepository 7*
_recordatorioLlamadaRepository8 V
;V W
private 
readonly 
IMapper  
_mapper! (
;( )
public -
!RecordatorioLlamadaCommandHandler 0
(0 1*
IRecordatorioLlamadaRepository1 O)
recordatorioLlamadaRepositoryP m
,m n
IMappero v
mapperw }
)} ~
{ 	*
_recordatorioLlamadaRepository *
=+ ,)
recordatorioLlamadaRepository- J
;J K
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ResponseModel '
<' (

EntidadDto( 2
>2 3
>3 4
Handle5 ;
(; <+
CrearRecordatorioLlamadaCommand< [
request\ c
,c d
CancellationTokene v
cancellationToken	w à
)
à â
{ 	
ResponseModel 
< 

EntidadDto $
>$ %
response& .
=/ 0
new1 4
ResponseModel5 B
<B C

EntidadDtoC M
>M N
(N O
)O P
;P Q
ResponseService 
responseService +
;+ ,
ConfigurationHelper 
configuration  -
=. /
new0 3
ConfigurationHelper4 G
(G H
)H I
;I J
try 
{   
var!! 
recordatorioLlamada!! '
=!!( )
_mapper!!* 1
.!!1 2
Map!!2 5
<!!5 6
RecordatorioLlamada!!6 I
>!!I J
(!!J K
request!!K R
)!!R S
;!!S T*
_recordatorioLlamadaRepository"" .
."". /
Agregar""/ 6
(""6 7
recordatorioLlamada""7 J
)""J K
;""K L
await## *
_recordatorioLlamadaRepository## 4
.##4 5

UnitOfWork##5 ?
.##? @
SaveEntitiesAsync##@ Q
(##Q R
cancellationToken##R c
)##c d
;##d e
responseService%% 
=%%  !
configuration%%" /
.%%/ 0*
ObtenerCodigoRespuestaServicio%%0 N
(%%N O#
CodigoRespuestaServicio%%O f
.%%f g
Exito%%g l
,%%l m
$str%%n p
)%%p q
;%%q r
response&& 
.&& 
auditResponse&& &
=&&' (
new&&) ,
AuditResponse&&- :
{&&; <
codigoRespuesta&&= L
=&&M N
responseService&&O ^
.&&^ _
codigoRespuesta&&_ n
,&&n o
mensajeRespuesta	&&p Ä
=
&&Å Ç
responseService
&&É í
.
&&í ì
mensajeRespuesta
&&ì £
}
&&§ •
;
&&• ¶
response'' 
.'' 
Entity'' 
=''  !
new''" %

EntidadDto''& 0
{''1 2
Id''3 5
=''6 7
recordatorioLlamada''8 K
.''K L!
IdRecordatorioLlamada''L a
,''a b
Mensaje''c j
=''k l
$str	''m £
}
''§ •
;
''• ¶
return)) 
await)) 
Task)) !
.))! "
Run))" %
())% &
())& '
)))' (
=>))) +
{)), -
return** 
response** #
;**# $
}++ 
)++ 
;++ 
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)--  
{.. 
responseService// 
=//  !
configuration//" /
./// 0*
ObtenerCodigoRespuestaServicio//0 N
(//N O#
CodigoRespuestaServicio//O f
.//f g
ErrorInesperado//g v
,//v w
ex//x z
.//z {
InnerException	//{ â
.
//â ä
Message
//ä ë
.
//ë í
ToString
//í ö
(
//ö õ
)
//õ ú
)
//ú ù
;
//ù û
response00 
.00 
auditResponse00 &
=00' (
new00) ,
AuditResponse00- :
{00; <
codigoRespuesta00= L
=00M N
responseService00O ^
.00^ _
codigoRespuesta00_ n
,00n o
mensajeRespuesta	00p Ä
=
00Å Ç
responseService
00É í
.
00í ì
mensajeRespuesta
00ì £
}
00§ •
;
00• ¶
return22 
await22 
Task22 !
.22! "
Run22" %
(22% &
(22& '
)22' (
=>22) +
{22, -
return33 
response33 #
;33# $
}44 
)44 
;44 
}55 
}66 	
public88 
async88 
Task88 
<88 
ResponseModel88 '
<88' (

EntidadDto88( 2
>882 3
>883 4
Handle885 ;
(88; <0
$ActualizarRecordatorioLlamadaCommand88< `
request88a h
,88h i
CancellationToken88j {
cancellationToken	88| ç
)
88ç é
{99 	
ResponseModel:: 
<:: 

EntidadDto:: $
>::$ %
response::& .
=::/ 0
new::1 4
ResponseModel::5 B
<::B C

EntidadDto::C M
>::M N
(::N O
)::O P
;::P Q
ResponseService;; 
responseService;; +
;;;+ ,
ConfigurationHelper<< 
configuration<<  -
=<<. /
new<<0 3
ConfigurationHelper<<4 G
(<<G H
)<<H I
;<<I J
try== 
{>> 
var?? 
recordatorioLlamada?? '
=??( )
_mapper??* 1
.??1 2
Map??2 5
<??5 6
RecordatorioLlamada??6 I
>??I J
(??J K
request??K R
)??R S
;??S T
if@@ 
(@@ 
!@@ 
string@@ 
.@@ 
IsNullOrEmpty@@ )
(@@) *
request@@* 1
.@@1 2
Accion@@2 8
)@@8 9
)@@9 :*
_recordatorioLlamadaRepositoryAA 2
.AA2 3 
ActualizarReagendadoAA3 G
(AAG H
recordatorioLlamadaAAH [
)AA[ \
;AA\ ]
elseBB *
_recordatorioLlamadaRepositoryCC 2
.CC2 3

ActualizarCC3 =
(CC= >
recordatorioLlamadaCC> Q
)CCQ R
;CCR S
awaitEE *
_recordatorioLlamadaRepositoryEE 4
.EE4 5

UnitOfWorkEE5 ?
.EE? @
SaveChangesAsyncEE@ P
(EEP Q
cancellationTokenEEQ b
)EEb c
;EEc d
responseServiceFF 
=FF  !
configurationFF" /
.FF/ 0*
ObtenerCodigoRespuestaServicioFF0 N
(FFN O#
CodigoRespuestaServicioFFO f
.FFf g
ExitoFFg l
,FFl m
$strFFn p
)FFp q
;FFq r
responseGG 
.GG 
auditResponseGG &
=GG' (
newGG) ,
AuditResponseGG- :
{GG; <
codigoRespuestaGG= L
=GGM N
responseServiceGGO ^
.GG^ _
codigoRespuestaGG_ n
,GGn o
mensajeRespuesta	GGp Ä
=
GGÅ Ç
responseService
GGÉ í
.
GGí ì
mensajeRespuesta
GGì £
}
GG§ •
;
GG• ¶
responseHH 
.HH 
EntityHH 
=HH  !
newHH" %

EntidadDtoHH& 0
{HH1 2
IdHH3 5
=HH6 7
recordatorioLlamadaHH8 K
.HHK L
IdProspectoHHL W
,HHW X
MensajeHHY `
=HHa b
$str	HHc ó
}
HHò ô
;
HHô ö
returnJJ 
awaitJJ 
TaskJJ !
.JJ! "
RunJJ" %
(JJ% &
(JJ& '
)JJ' (
=>JJ) +
{JJ, -
returnKK 
responseKK #
;KK# $
}LL 
)LL 
;LL 
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
responseServicePP 
=PP  !
configurationPP" /
.PP/ 0*
ObtenerCodigoRespuestaServicioPP0 N
(PPN O#
CodigoRespuestaServicioPPO f
.PPf g
ErrorInesperadoPPg v
,PPv w
exPPx z
.PPz {
InnerException	PP{ â
.
PPâ ä
Message
PPä ë
.
PPë í
ToString
PPí ö
(
PPö õ
)
PPõ ú
)
PPú ù
;
PPù û
responseQQ 
.QQ 
auditResponseQQ &
=QQ' (
newQQ) ,
AuditResponseQQ- :
{QQ; <
codigoRespuestaQQ= L
=QQM N
responseServiceQQO ^
.QQ^ _
codigoRespuestaQQ_ n
,QQn o
mensajeRespuesta	QQp Ä
=
QQÅ Ç
responseService
QQÉ í
.
QQí ì
mensajeRespuesta
QQì £
}
QQ§ •
;
QQ• ¶
returnSS 
awaitSS 
TaskSS !
.SS! "
RunSS" %
(SS% &
(SS& '
)SS' (
=>SS) +
{SS, -
returnTT 
responseTT #
;TT# $
}UU 
)UU 
;UU 
}VV 
}WW 	
}XX 
}YY º
gD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ReunionCommand\ActualizarReunionCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ReunionCommand* 8
{ 
public 

class $
ActualizarReunionCommand )
:* +
IRequest, 4
<4 5
ResponseModel5 B
<B C

EntidadDtoC M
>M N
>N O
{		 
public 
int 
	IdReunion 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
FechaReunion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Ubicacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoDepartamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoProvincia %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoDistrito $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
bool 
? 
FlagUrlTeams !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
UrlTeams 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
string 
Accion 
{ 
get "
;" #
set$ '
;' (
}) *
} 
}   —
bD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ReunionCommand\CrearReunionCommand.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ReunionCommand* 8
{ 
public 

class 
CrearReunionCommand $
:% &
IRequest' /
</ 0
ResponseModel0 =
<= >

EntidadDto> H
>H I
>I J
{		 
public 
int &
IdConsolidadoIntermediario -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
int  
IdReunionDispositivo '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
short 
? 
CodigoTipoReunion '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DateTime 
FechaReunion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 

HoraInicio  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
HoraFin 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Ubicacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoDepartamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoProvincia %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoDistrito $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
ReferenciaUbicacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
? 
FlagInvitadoGU #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
? 
FlagInvitadoGA #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
? 
AlertaMinutosAntes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool 
? 
FlagUrlTeams !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
UrlTeams 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? "
AuditoriaFechaCreacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string $
AuditoriaUsuarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
}   
}!! ΩO
dD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ReunionCommand\ReunionCommandExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ReunionCommand* 8
{ 
public

 

class

 -
!RequestCrearReunionCommandExample

 2
:

3 4
IExamplesProvider

5 F
<

F G
CrearReunionCommand

G Z
>

Z [
{ 
public 
CrearReunionCommand "
GetExamples# .
(. /
)/ 0
{ 	
CrearReunionCommand 
crearReunionCommand  3
=4 5
new6 9
CrearReunionCommand: M
(M N
)N O
;O P
crearReunionCommand 
.  
CodigoTipoReunion  1
=2 3
$num4 5
;5 6
crearReunionCommand 
.  
FechaReunion  ,
=- .
DateTime/ 7
.7 8
Now8 ;
;; <
crearReunionCommand 
.  

HoraInicio  *
=+ ,
$str- 4
;4 5
crearReunionCommand 
.  
HoraFin  '
=( )
$str* 1
;1 2
crearReunionCommand 
.  
	Ubicacion  )
=* +
$str, ;
;; <
crearReunionCommand 
.  
CodigoDepartamento  2
=3 4
$num5 6
;6 7
crearReunionCommand 
.  
CodigoProvincia  /
=0 1
$num2 3
;3 4
crearReunionCommand 
.  
CodigoDistrito  .
=/ 0
$num1 2
;2 3
crearReunionCommand 
.  
ReferenciaUbicacion  3
=4 5
$str6 P
;P Q
crearReunionCommand 
.  
FlagInvitadoGA  .
=/ 0
true1 5
;5 6
crearReunionCommand 
.  
FlagInvitadoGU  .
=/ 0
true1 5
;5 6
crearReunionCommand 
.  
Descripcion  +
=, -
$str. ?
;? @
crearReunionCommand 
.  
AlertaMinutosAntes  2
=3 4
$num5 7
;7 8
crearReunionCommand 
.  "
AuditoriaFechaCreacion  6
=7 8
DateTime9 A
.A B
NowB E
;E F
crearReunionCommand 
.  $
AuditoriaUsuarioCreacion  8
=9 :
$str; D
;D E
return 
crearReunionCommand &
;& '
}   	
}!! 
public## 

class## .
"ResponseCrearReunionCommandExample## 3
:##4 5
IExamplesProvider##6 G
<##G H.
"ResponseCrearReunionCommandExample##H j
>##j k
{$$ 
public%% .
"ResponseCrearReunionCommandExample%% 1
(%%1 2
)%%2 3
=>%%4 6
responseModel%%7 D
=%%E F
new%%G J
ResponseModel%%K X
<%%X Y

EntidadDto%%Y c
>%%c d
(%%d e
)%%e f
;%%f g
public&& 
ResponseModel&& 
<&& 

EntidadDto&& '
>&&' (
responseModel&&) 6
{&&7 8
get&&9 <
;&&< =
set&&> A
;&&A B
}&&C D
public'' .
"ResponseCrearReunionCommandExample'' 1
GetExamples''2 =
(''= >
)''> ?
{(( 	
string)) 
mensajeRespuesta)) #
=))$ %
string))& ,
.)), -
Empty))- 2
;))2 3
int** 
status** 
=** 
$num** 
;** 
AuditResponse++ 
auditResponse++ '
=++( )
new++* -
AuditResponse++. ;
(++; <
)++< =
;++= >

EntidadDto,, 

reunionDto,, !
=,," #
new,,$ '

EntidadDto,,( 2
(,,2 3
),,3 4
;,,4 5

reunionDto-- 
.-- 
Id-- 
=-- 
$num-- 
;-- 

reunionDto.. 
... 
Mensaje.. 
=..  
$str..! G
;..G H
auditResponse// 
.// 
idTransaccion// '
=//( )
$str//* 5
;//5 6
auditResponse00 
.00 
codigoRespuesta00 )
=00* +#
CodigoRespuestaServicio00, C
.00C D
Exito00D I
;00I J
new11 
ConfigurationHelper11 #
(11# $
)11$ %
.11% &+
ObtenerMensajeRespuestaServicio11& E
(11E F
auditResponse11F S
.11S T
codigoRespuesta11T c
,11c d
ref11e h
mensajeRespuesta11i y
,11y z
ref11{ ~
status	11 Ö
)
11Ö Ü
;
11Ü á
auditResponse22 
.22 
mensajeRespuesta22 *
=22+ ,
mensajeRespuesta22- =
;22= >
return33 
new33 .
"ResponseCrearReunionCommandExample33 9
(339 :
)33: ;
{44 
responseModel55 
=55 
new55  #
ResponseModel55$ 1
<551 2

EntidadDto552 <
>55< =
(55= >
)55> ?
{66 
auditResponse77 !
=77" #
auditResponse77$ 1
,771 2
Entity88 
=88 

reunionDto88 '
}99 
}:: 
;:: 
};; 	
}<< 
public?? 

class?? 2
&RequestActualizarReunionCommandExample?? 7
:??8 9
IExamplesProvider??: K
<??K L$
ActualizarReunionCommand??L d
>??d e
{@@ 
publicAA $
ActualizarReunionCommandAA '
GetExamplesAA( 3
(AA3 4
)AA4 5
{BB 	$
ActualizarReunionCommandCC $$
actualizarReunionCommandCC% =
=CC> ?
newCC@ C$
ActualizarReunionCommandCCD \
(CC\ ]
)CC] ^
;CC^ _$
actualizarReunionCommandEE $
.EE$ %
FechaReunionEE% 1
=EE2 3
DateTimeEE4 <
.EE< =
NowEE= @
;EE@ A$
actualizarReunionCommandFF $
.FF$ %

HoraInicioFF% /
=FF0 1
$strFF2 9
;FF9 :$
actualizarReunionCommandGG $
.GG$ %
HoraFinGG% ,
=GG- .
$strGG/ 6
;GG6 7$
actualizarReunionCommandHH $
.HH$ %&
AuditoriaFechaModificacionHH% ?
=HH@ A
DateTimeHHB J
.HHJ K
NowHHK N
;HHN O$
actualizarReunionCommandII $
.II$ %(
AuditoriaUsuarioModificacionII% A
=IIB C
$strIID M
;IIM N
returnJJ $
actualizarReunionCommandJJ +
;JJ+ ,
}KK 	
}LL 
publicNN 

classNN 3
'ResponseActualizarReunionCommandExampleNN 8
:NN9 :
IExamplesProviderNN; L
<NNL M3
'ResponseActualizarReunionCommandExampleNNM t
>NNt u
{OO 
publicPP 3
'ResponseActualizarReunionCommandExamplePP 6
(PP6 7
)PP7 8
=>PP9 ;
responseModelPP< I
=PPJ K
newPPL O
ResponseModelPPP ]
<PP] ^

EntidadDtoPP^ h
>PPh i
(PPi j
)PPj k
;PPk l
publicQQ 
ResponseModelQQ 
<QQ 

EntidadDtoQQ '
>QQ' (
responseModelQQ) 6
{QQ7 8
getQQ9 <
;QQ< =
setQQ> A
;QQA B
}QQC D
publicRR 3
'ResponseActualizarReunionCommandExampleRR 6
GetExamplesRR7 B
(RRB C
)RRC D
{SS 	
stringTT 
mensajeRespuestaTT #
=TT$ %
stringTT& ,
.TT, -
EmptyTT- 2
;TT2 3
intUU 
statusUU 
=UU 
$numUU 
;UU 
AuditResponseVV 
auditResponseVV '
=VV( )
newVV* -
AuditResponseVV. ;
(VV; <
)VV< =
;VV= >

EntidadDtoWW 

entidadDtoWW !
=WW" #
newWW$ '

EntidadDtoWW( 2
(WW2 3
)WW3 4
;WW4 5

entidadDtoXX 
.XX 
IdXX 
=XX 
$numXX 
;XX 

entidadDtoYY 
.YY 
MensajeYY 
=YY  
$strYY! H
;YYH I
auditResponseZZ 
.ZZ 
idTransaccionZZ '
=ZZ( )
$strZZ* 5
;ZZ5 6
auditResponse[[ 
.[[ 
codigoRespuesta[[ )
=[[* +#
CodigoRespuestaServicio[[, C
.[[C D
Exito[[D I
;[[I J
new\\ 
ConfigurationHelper\\ #
(\\# $
)\\$ %
.\\% &+
ObtenerMensajeRespuestaServicio\\& E
(\\E F
auditResponse\\F S
.\\S T
codigoRespuesta\\T c
,\\c d
ref\\e h
mensajeRespuesta\\i y
,\\y z
ref\\{ ~
status	\\ Ö
)
\\Ö Ü
;
\\Ü á
auditResponse]] 
.]] 
mensajeRespuesta]] *
=]]+ ,
mensajeRespuesta]]- =
;]]= >
return^^ 
new^^ 3
'ResponseActualizarReunionCommandExample^^ >
(^^> ?
)^^? @
{__ 
responseModel`` 
=`` 
new``  #
ResponseModel``$ 1
<``1 2

EntidadDto``2 <
>``< =
(``= >
)``> ?
{aa 
auditResponsebb !
=bb" #
auditResponsebb$ 1
,bb1 2
Entitycc 
=cc 

entidadDtocc '
}dd 
}ee 
;ee 
}ff 	
}gg 
}hh ïO
dD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Commands\ReunionCommand\ReunionCommandHandler.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Commands! )
.) *
ReunionCommand* 8
{ 
public 

class !
ReunionCommandHandler &
:' (
IRequestHandler) 8
<8 9
CrearReunionCommand9 L
,L M
ResponseModelN [
<[ \

EntidadDto\ f
>f g
>g h
,h i
IRequestHandler) 8
<8 9$
ActualizarReunionCommand9 Q
,Q R
ResponseModelS `
<` a

EntidadDtoa k
>k l
>l m
{ 
private 
readonly 
IReunionRepository +
_reunionRepository, >
;> ?
private 
readonly 
IMapper  
_mapper! (
;( )
public !
ReunionCommandHandler $
($ %
IReunionRepository% 7
reunionRepository8 I
,I J
IMapperK R
mapperS Y
)Y Z
{ 	
_reunionRepository 
=  
reunionRepository! 2
;2 3
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ResponseModel '
<' (

EntidadDto( 2
>2 3
>3 4
Handle5 ;
(; <
CrearReunionCommand< O
requestP W
,W X
CancellationTokenY j
cancellationTokenk |
)| }
{ 	
ResponseModel 
< 

EntidadDto $
>$ %
response& .
=/ 0
new1 4
ResponseModel5 B
<B C

EntidadDtoC M
>M N
(N O
)O P
;P Q
ResponseService 
responseService +
;+ ,
ConfigurationHelper 
configuration  -
=. /
new0 3
ConfigurationHelper4 G
(G H
)H I
;I J
try 
{   
var!! 
reunion!! 
=!! 
_mapper!! %
.!!% &
Map!!& )
<!!) *
Reunion!!* 1
>!!1 2
(!!2 3
request!!3 :
)!!: ;
;!!; <
_reunionRepository"" "
.""" #
Agregar""# *
(""* +
reunion""+ 2
)""2 3
;""3 4
await## 
_reunionRepository## (
.##( )

UnitOfWork##) 3
.##3 4
SaveEntitiesAsync##4 E
(##E F
cancellationToken##F W
)##W X
;##X Y
responseService%% 
=%%  !
configuration%%" /
.%%/ 0*
ObtenerCodigoRespuestaServicio%%0 N
(%%N O#
CodigoRespuestaServicio%%O f
.%%f g
Exito%%g l
,%%l m
$str%%n p
)%%p q
;%%q r
response&& 
.&& 
auditResponse&& &
=&&' (
new&&) ,
AuditResponse&&- :
{&&; <
codigoRespuesta&&= L
=&&M N
responseService&&O ^
.&&^ _
codigoRespuesta&&_ n
,&&n o
mensajeRespuesta	&&p Ä
=
&&Å Ç
responseService
&&É í
.
&&í ì
mensajeRespuesta
&&ì £
}
&&§ •
;
&&• ¶
response'' 
.'' 
Entity'' 
=''  !
new''" %

EntidadDto''& 0
{''1 2
Id''3 5
=''6 7
reunion''8 ?
.''? @
	IdReunion''@ I
,''I J
Mensaje''K R
=''S T
$str''U {
}''| }
;''} ~
return)) 
await)) 
Task)) !
.))! "
Run))" %
())% &
())& '
)))' (
=>))) +
{)), -
return** 
response** #
;**# $
}++ 
)++ 
;++ 
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)--  
{.. 
responseService// 
=//  !
configuration//" /
./// 0*
ObtenerCodigoRespuestaServicio//0 N
(//N O#
CodigoRespuestaServicio//O f
.//f g
ErrorInesperado//g v
,//v w
ex//x z
.//z {
InnerException	//{ â
.
//â ä
Message
//ä ë
.
//ë í
ToString
//í ö
(
//ö õ
)
//õ ú
)
//ú ù
;
//ù û
response00 
.00 
auditResponse00 &
=00' (
new00) ,
AuditResponse00- :
{00; <
codigoRespuesta00= L
=00M N
responseService00O ^
.00^ _
codigoRespuesta00_ n
,00n o
mensajeRespuesta	00p Ä
=
00Å Ç
responseService
00É í
.
00í ì
mensajeRespuesta
00ì £
}
00§ •
;
00• ¶
return22 
await22 
Task22 !
.22! "
Run22" %
(22% &
(22& '
)22' (
=>22) +
{22, -
return33 
response33 #
;33# $
}44 
)44 
;44 
}55 
}66 	
public88 
async88 
Task88 
<88 
ResponseModel88 '
<88' (

EntidadDto88( 2
>882 3
>883 4
Handle885 ;
(88; <$
ActualizarReunionCommand88< T
request88U \
,88\ ]
CancellationToken88^ o
cancellationToken	88p Å
)
88Å Ç
{99 	
ResponseModel:: 
<:: 

EntidadDto:: $
>::$ %
response::& .
=::/ 0
new::1 4
ResponseModel::5 B
<::B C

EntidadDto::C M
>::M N
(::N O
)::O P
;::P Q
ResponseService;; 
responseService;; +
;;;+ ,
ConfigurationHelper<< 
configuration<<  -
=<<. /
new<<0 3
ConfigurationHelper<<4 G
(<<G H
)<<H I
;<<I J
try>> 
{?? 
var@@ 
reunion@@ 
=@@ 
_mapper@@ %
.@@% &
Map@@& )
<@@) *
Reunion@@* 1
>@@1 2
(@@2 3
request@@3 :
)@@: ;
;@@; <
ifBB 
(BB 
stringBB 
.BB 
IsNullOrEmptyBB (
(BB( )
requestBB) 0
.BB0 1
AccionBB1 7
)BB7 8
)BB8 9
_reunionRepositoryCC &
.CC& '

ActualizarCC' 1
(CC1 2
reunionCC2 9
)CC9 :
;CC: ;
elseDD 
_reunionRepositoryEE &
.EE& '
EliminarEE' /
(EE/ 0
reunionEE0 7
)EE7 8
;EE8 9
awaitGG 
_reunionRepositoryGG (
.GG( )

UnitOfWorkGG) 3
.GG3 4
SaveEntitiesAsyncGG4 E
(GGE F
cancellationTokenGGF W
)GGW X
;GGX Y
responseServiceII 
=II  !
configurationII" /
.II/ 0*
ObtenerCodigoRespuestaServicioII0 N
(IIN O#
CodigoRespuestaServicioIIO f
.IIf g
ExitoIIg l
,IIl m
$strIIn p
)IIp q
;IIq r
responseJJ 
.JJ 
auditResponseJJ &
=JJ' (
newJJ) ,
AuditResponseJJ- :
{JJ; <
codigoRespuestaJJ= L
=JJM N
responseServiceJJO ^
.JJ^ _
codigoRespuestaJJ_ n
,JJn o
mensajeRespuesta	JJp Ä
=
JJÅ Ç
responseService
JJÉ í
.
JJí ì
mensajeRespuesta
JJì £
}
JJ§ •
;
JJ• ¶
responseKK 
.KK 
EntityKK 
=KK  !
newKK" %

EntidadDtoKK& 0
{KK1 2
IdKK3 5
=KK6 7
reunionKK8 ?
.KK? @
	IdReunionKK@ I
,KKI J
MensajeKKK R
=KKS T
stringKKU [
.KK[ \
IsNullOrEmptyKK\ i
(KKi j
requestKKj q
.KKq r
AccionKKr x
)KKx y
?KKz {
$str	KK| £
:LLL M
$strLLN s
}LLs t
;LLt u
returnNN 
awaitNN 
TaskNN !
.NN! "
RunNN" %
(NN% &
(NN& '
)NN' (
=>NN) +
{NN, -
returnOO 
responseOO #
;OO# $
}PP 
)PP 
;PP 
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
responseServiceTT 
=TT  !
configurationTT" /
.TT/ 0*
ObtenerCodigoRespuestaServicioTT0 N
(TTN O#
CodigoRespuestaServicioTTO f
.TTf g
ErrorInesperadoTTg v
,TTv w
exTTx z
.TTz {
InnerException	TT{ â
.
TTâ ä
Message
TTä ë
.
TTë í
ToString
TTí ö
(
TTö õ
)
TTõ ú
)
TTú ù
;
TTù û
responseUU 
.UU 
auditResponseUU &
=UU' (
newUU) ,
AuditResponseUU- :
{UU; <
codigoRespuestaUU= L
=UUM N
responseServiceUUO ^
.UU^ _
codigoRespuestaUU_ n
,UUn o
mensajeRespuesta	UUp Ä
=
UUÅ Ç
responseService
UUÉ í
.
UUí ì
mensajeRespuesta
UUì £
}
UU§ •
;
UU• ¶
returnWW 
awaitWW 
TaskWW !
.WW! "
RunWW" %
(WW% &
(WW& '
)WW' (
=>WW) +
{WW, -
returnXX 
responseXX #
;XX# $
}YY 
)YY 
;YY 
}ZZ 
}[[ 	
}\\ 
}]] ¡=
PD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Comun\ConfigurationHelper.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Comun! &
{ 
public 

class 
ConfigurationHelper $
{ 
public 
void +
ObtenerMensajeRespuestaServicio 3
(3 4
string4 :
codigoRespuesta; J
,J K
refL O
stringP V
mensajeRespuestaW g
,g h
refi l
intm p
statusq w
)w x
{		 	
mensajeRespuesta

 
=

 
string

 %
.

% &
Empty

& +
;

+ ,
status 
= 
$num 
; 
switch 
( 
codigoRespuesta #
)# $
{ 
case #
CodigoRespuestaServicio ,
., -
Exito- 2
:2 3
mensajeRespuesta $
=% &
$str' <
;< =
status 
= 

StatusCode '
.' (
Creado( .
;. /
break 
; 
case #
CodigoRespuestaServicio ,
., -
SinDatos- 5
:5 6
mensajeRespuesta $
=% &
$str' @
;@ A
status 
= 

StatusCode '
.' (
NoEncontrado( 4
;4 5
break 
; 
case #
CodigoRespuestaServicio ,
., -
	TimeOutBD- 6
:6 7
mensajeRespuesta $
=% &
$str' J
;J K
status 
= 

StatusCode '
.' (
TimeOut( /
;/ 0
break 
; 
case #
CodigoRespuestaServicio ,
., -
DisponibilidadBD- =
:= >
mensajeRespuesta $
=% &
$str' P
;P Q
status 
= 

StatusCode '
.' ( 
ServicioNoDisponible( <
;< =
break 
; 
case #
CodigoRespuestaServicio ,
., -
TimeOutServicio- <
:< =
mensajeRespuesta   $
=  % &
$str  ' H
;  H I
status!! 
=!! 

StatusCode!! '
.!!' (
TimeOut!!( /
;!!/ 0
break"" 
;"" 
case## #
CodigoRespuestaServicio## ,
.##, -"
DisponibilidadServicio##- C
:##C D
mensajeRespuesta$$ $
=$$% &
$str$$' M
;$$M N
status%% 
=%% 

StatusCode%% '
.%%' ( 
ServicioNoDisponible%%( <
;%%< =
break&& 
;&& 
case'' #
CodigoRespuestaServicio'' ,
.'', -
ErrorInesperado''- <
:''< =
mensajeRespuesta(( $
=((% &
$str((' D
;((D E
status)) 
=)) 

StatusCode)) '
.))' (
ErrorInterno))( 4
;))4 5
break** 
;** 
case++ #
CodigoRespuestaServicio++ ,
.++, -
SinParametros++- :
:++: ;
mensajeRespuesta,, $
=,,% &
$str,,' K
;,,K L
status-- 
=-- 

StatusCode-- '
.--' (
PeticionIncorrecta--( :
;--: ;
break.. 
;.. 
}// 
}00 	
public22 
void22 +
ObtenerMensajeRespuestaServicio22 3
(223 4
string224 :
codigoRespuesta22; J
,22J K
ref22L O
string22P V
mensajeRespuesta22W g
,22g h
ref22i l
object22m s
status22t z
)22z {
{33 	
throw44 
new44 #
NotImplementedException44 -
(44- .
)44. /
;44/ 0
}55 	
public77 
ResponseService77 *
ObtenerCodigoRespuestaServicio77 =
(77= >
string77> D
exNumber77E M
,77M N
string77O U
	exMessage77V _
)77_ `
{88 	
ResponseService99 
responseService99 +
=99, -
new99. 1
ResponseService992 A
(99A B
)99B C
;99C D
string;; 
codigoRespuesta;; "
=;;# $
string;;% +
.;;+ ,
Empty;;, 1
;;;1 2
string<< 
mensajeRespuesta<< #
=<<$ %
string<<& ,
.<<, -
Empty<<- 2
;<<2 3
int== 
status== 
=== 
$num== 
;== 
if?? 
(?? 
exNumber?? 
!=?? 
$str??  
)??  !
{@@ 
codigoRespuestaAA 
=AA  !#
CodigoRespuestaServicioAA" 9
.AA9 :
DisponibilidadBDAA: J
;AAJ K
}BB 
ifCC 
(CC 
exNumberCC 
==CC 
$strCC #
)CC# $
{DD 
codigoRespuestaEE 
=EE  !#
CodigoRespuestaServicioEE" 9
.EE9 :
DisponibilidadBDEE: J
;EEJ K
}FF 
ifGG 
(GG 
exNumberGG 
==GG 
$strGG  
)GG  !
{HH 
codigoRespuestaII 
=II  !#
CodigoRespuestaServicioII" 9
.II9 :
	TimeOutBDII: C
;IIC D
}JJ 
ifKK 
(KK 
exNumberKK 
==KK #
CodigoRespuestaServicioKK 3
.KK3 4
ExitoKK4 9
)KK9 :
{LL 
codigoRespuestaMM 
=MM  !
exNumberMM" *
;MM* +
}NN 
ifOO 
(OO 
exNumberOO 
==OO #
CodigoRespuestaServicioOO 3
.OO3 4"
DisponibilidadServicioOO4 J
)OOJ K
{PP 
codigoRespuestaQQ 
=QQ  !
exNumberQQ" *
;QQ* +
}RR 
ifSS 
(SS 
exNumberSS 
==SS #
CodigoRespuestaServicioSS 3
.SS3 4
SinDatosSS4 <
)SS< =
{TT 
codigoRespuestaUU 
=UU  !
exNumberUU" *
;UU* +
}VV 
ifWW 
(WW 
exNumberWW 
==WW #
CodigoRespuestaServicioWW 3
.WW3 4
ErrorInesperadoWW4 C
)WWC D
{XX 
codigoRespuestaYY 
=YY  !
exNumberYY" *
;YY* +
}ZZ +
ObtenerMensajeRespuestaServicio[[ +
([[+ ,
codigoRespuesta[[, ;
,[[; <
ref[[= @
mensajeRespuesta[[A Q
,[[Q R
ref[[S V
status[[W ]
)[[] ^
;[[^ _
if]] 
(]] 
	exMessage]] 
!=]] 
$str]] 
)]]  
mensajeRespuesta^^  
=^^! "
String^^# )
.^^) *
Concat^^* 0
(^^0 1
mensajeRespuesta^^1 A
,^^A B
$str^^C H
,^^H I
	exMessage^^J S
)^^S T
;^^T U
responseService`` 
.`` 
codigoRespuesta`` +
=``, -
codigoRespuesta``. =
;``= >
responseServiceaa 
.aa 
mensajeRespuestaaa ,
=aa- .
mensajeRespuestaaa/ ?
;aa? @
responseServicebb 
.bb 
statusbb "
=bb# $
statusbb% +
;bb+ ,
returndd 
responseServicedd "
;dd" #
}ee 	
}ff 
}gg ¸;
FD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Comun\Constante.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Comun! &
{ 
class 	
	Constante
 
{ 
} 
public 

struct 
Flag 
{ 
public 
const 
int 
Activo 
=  !
$num" #
;# $
public		 
const		 
int		 
Inactivo		 !
=		" #
$num		$ %
;		% &
}

 
public 

struct 

MensajeLog 
{ 
public 
const 
string 
TiempoProceso )
=* +
$str, T
;T U
} 
public 

struct #
CodigoRespuestaServicio )
{ 
public 
const 
string 
Exito !
=" #
$str$ '
;' (
public 
const 
string 
SinParametros )
=* +
$str, /
;/ 0
public 
const 
string 
SinDatos $
=% &
$str' *
;* +
public 
const 
string 
	TimeOutBD %
=& '
$str( ,
;, -
public 
const 
string 
TimeOutServicio +
=, -
$str. 2
;2 3
public 
const 
string 
DisponibilidadBD ,
=- .
$str/ 3
;3 4
public 
const 
string "
DisponibilidadServicio 2
=3 4
$str5 9
;9 :
public 
const 
string 
ErrorInesperado +
=, -
$str. 2
;2 3
} 
public   

struct   

StatusCode   
{!! 
public"" 
const"" 
int"" 
Ok"" 
="" 
$num"" !
;""! "
public## 
const## 
int## 
Creado## 
=##  !
$num##" %
;##% &
public%% 
const%% 
int%% 
NoEncontrado%% %
=%%& '
$num%%( +
;%%+ ,
public'' 
const'' 
int'' 
TimeOut''  
=''! "
$num''# &
;''& '
public)) 
const)) 
int))  
ServicioNoDisponible)) -
=)). /
$num))0 3
;))3 4
public++ 
const++ 
int++ 
PeticionIncorrecta++ +
=++, -
$num++. 1
;++1 2
public,, 
const,, 
int,, 
NoAutorizado,, %
=,,& '
$num,,( +
;,,+ ,
public.. 
const.. 
int.. 
ErrorInterno.. %
=..& '
$num..( +
;..+ ,
}// 
public11 

struct11 

TablaTabla11 
{22 
public33 
const33 
short33 
Sexo33 
=33  !
$num33" #
;33# $
public44 
const44 
short44 
FuenteProspecto44 *
=44+ ,
$num44- .
;44. /
public55 
const55 
short55 
TipoReunion55 &
=55' (
$num55) +
;55+ ,
public66 
const66 
short66 
MotivoReagendada66 +
=66, -
$num66. 0
;660 1
public77 
const77 
short77 
LineaNegocio77 '
=77( )
$num77* ,
;77, -
public88 
const88 
short88 
PersonaCargo88 '
=88( )
$num88* ,
;88, -
public99 
const99 
short99 
EtapaActivad99 '
=99( )
$num99* -
;99- .
public:: 
const:: 
short:: 
MotivoDescarte:: )
=::* +
$num::, /
;::/ 0
public;; 
const;; 
short;; 
TipoCalificacion;; +
=;;, -
$num;;. 1
;;;1 2
public<< 
const<< 
short<< #
ExperienciaCalificacion<< 2
=<<3 4
$num<<5 8
;<<8 9
public== 
const== 
short== (
PorcentajeAvanceCalificacion== 7
===8 9
$num==: =
;=== >
public>> 
const>> 
short>> "
MotivoCitaNoConcretada>> 1
=>>2 3
$num>>4 7
;>>7 8
}?? 
publicAA 

structAA !
TablaTipoCalificacionAA '
{BB 
publicCC 
constCC 
shortCC 

ConcretadoCC %
=CC& '
$numCC( )
;CC) *
publicDD 
constDD 
shortDD 
NoConcretadoDD '
=DD( )
$numDD* +
;DD+ ,
}EE 
publicGG 

structGG  
TablaMotivoRegendadaGG &
{HH 
publicII 
constII 
shortII )
ProspectoSolicitoCambiarFechaII 8
=II9 :
$numII; <
;II< =
publicJJ 
constJJ 
shortJJ 
ErrorAgendarCitaJJ +
=JJ, -
$numJJ. /
;JJ/ 0
publicKK 
constKK 
shortKK  
NoAsistioHoraPactadaKK /
=KK0 1
$numKK2 3
;KK3 4
publicLL 
constLL 
shortLL #
EntrevistaTomoMasTiempoLL 2
=LL3 4
$numLL5 6
;LL6 7
}MM 
publicOO 

structOO '
TablaMotivoCitaNoConcretadaOO -
{PP 
publicQQ 
constQQ 
shortQQ 
CanceloCitaQQ &
=QQ' (
$numQQ) *
;QQ* +
publicRR 
constRR 
shortRR 
SeguirEvaluandoRR *
=RR+ ,
$numRR- .
;RR. /
publicSS 
constSS 
shortSS 
NoContextoLlamadaSS ,
=SS- .
$numSS/ 0
;SS0 1
publicTT 
constTT 
shortTT 
NoDeseaContinuarTT +
=TT, -
$numTT. /
;TT/ 0
}UU 
publicWW 

structWW 
LineaNegocioWW 
{XX 
publicYY 
constYY 
shortYY 
RentaYY  
=YY! "
$numYY# %
;YY% &
}ZZ 
public\\ 

struct\\ 
Fuente\\ 
{]] 
public^^ 
const^^ 
short^^ 
CentroInfluencia^^ +
=^^, -
$num^^. /
;^^/ 0
}__ 
publicaa 

structaa "
CategoriaIntermediarioaa (
{bb 
publiccc 
constcc 
shortcc 

Supervisorcc %
=cc& '
$numcc( *
;cc* +
publicdd 
constdd 
shortdd 
	JefeZonaldd $
=dd% &
$numdd' )
;dd) *
publicee 
constee 
shortee 

JefeUnidadee %
=ee& '
$numee( +
;ee+ ,
publicff 
constff 
shortff 
JefeZonalProvinciaff -
=ff. /
$numff0 3
;ff3 4
}gg 
}ii ™
JD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Comun\IImpresionLog.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Comun! &
{ 
public 

	interface 
IImpresionLog "
{ 
void 
InicioMetodo 
( 
string  
claselineacodigo! 1
,1 2
string3 9
idtransaccion: G
,G H
stringI O
correlationidP ]
,] ^
string_ e
nombremetodof r
)r s
;s t
void 
	FinMetodo 
( 
string 
claselineacodigo .
,. /
string0 6
idtransaccion7 D
,D E
stringF L
correlationidM Z
,Z [
string\ b
nombremetodoc o
,o p
stringq w
tiempox ~
)~ 
;	 Ä
void 
DatosInicioMetodo 
( 
string %
claselineacodigo& 6
,6 7
string8 >
idtransaccion? L
,L M
stringN T
correlationidU b
,b c
objectd j
requestmodelk w
)w x
;x y
void 
DatosFinMetodo 
( 
string "
claselineacodigo# 3
,3 4
string5 ;
idtransaccion< I
,I J
stringK Q
correlationidR _
,_ `
objecta g
responseModelh u
)u v
;v w
}		 
}

 Ò'
ID:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Comun\ImpresionLog.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Comun! &
{ 
public 

class 
ImpresionLog 
: 
IImpresionLog  -
{ 
private 
readonly 
ILogger  
<  !
ImpresionLog! -
>- .
_logger/ 6
;6 7
public

 
ImpresionLog

 
(

 
ILogger

 #
<

# $
ImpresionLog

$ 0
>

0 1
logger

2 8
)

8 9
=>

: <
_logger

= D
=

E F
logger

G M
;

M N
public 
void 
InicioMetodo  
(  !
string! '
claselineacodigo( 8
,8 9
string: @
idtransaccionA N
,N O
stringP V
correlationidW d
,d e
stringf l
nombremetodom y
)y z
{ 	
string 
cadena 
= 
claselineacodigo ,
+- .
$str/ 4
+5 6
$str7 ?
+@ A
idtransaccionB O
+P Q
$strR [
+\ ]
correlationid^ k
+l m
$strn q
+r s
$strt 
+
Ä Å
nombremetodo
Ç é
+
è ê
$str
ë î
;
î ï
_logger 
. 
LogInformation "
(" #
$str# -
,- .
cadena/ 5
)5 6
;6 7
} 	
public 
void 
	FinMetodo 
( 
string $
claselineacodigo% 5
,5 6
string7 =
idtransaccion> K
,K L
stringM S
correlationidT a
,a b
stringc i
nombremetodoj v
,v w
stringx ~
tiempo	 Ö
)
Ö Ü
{ 	
string 
cadena 
= 
claselineacodigo ,
+- .
$str/ 4
+5 6
$str7 ?
+@ A
idtransaccionB O
+P Q
$strR [
+\ ]
correlationid^ k
+l m
$strn q
+r s
$strt |
+} ~
nombremetodo	 ã
+
å ç
$str
é ë
+
í ì
$str
î æ
+
ø ¿
tiempo
¡ «
+
» …
$str
  œ
;
œ –
_logger 
. 
LogInformation "
(" #
$str# -
,- .
cadena/ 5
)5 6
;6 7
} 	
public 
void 
DatosInicioMetodo %
(% &
string& ,
claselineacodigo- =
,= >
string? E
idtransaccionF S
,S T
stringU [
correlationid\ i
,i j
objectk q
requestmodelr ~
)~ 
{ 	
string 
cadena 
= 
claselineacodigo ,
+- .
$str/ 4
+5 6
$str7 ?
+@ A
idtransaccionB O
+P Q
$strR [
+\ ]
correlationid^ k
+l m
$strn q
+r s
$str	t à
+
â ä
JsonConvert
ã ñ
.
ñ ó
SerializeObject
ó ¶
(
¶ ß
requestmodel
ß ≥
,
≥ ¥

Formatting
µ ø
.
ø ¿
Indented
¿ »
)
» …
;
…  
_logger"" 
."" 
LogInformation"" "
(""" #
$str""# -
,""- .
cadena""/ 5
)""5 6
;""6 7
}## 	
public%% 
void%% 
DatosFinMetodo%% "
(%%" #
string%%# )
claselineacodigo%%* :
,%%: ;
string%%< B
idtransaccion%%C P
,%%P Q
string%%R X
correlationid%%Y f
,%%f g
object%%h n
responseModel%%o |
)%%| }
{&& 	
string'' 
cadena'' 
='' 
claselineacodigo'' ,
+''- .
$str''/ 4
+''5 6
$str''7 ?
+''@ A
idtransaccion''B O
+''P Q
$str''R [
+''\ ]
correlationid''^ k
+''l m
$str''n q
+''r s
$str	''t á
+
''à â
JsonConvert
''ä ï
.
''ï ñ
SerializeObject
''ñ •
(
''• ¶
responseModel
''¶ ≥
,
''≥ ¥

Formatting
''µ ø
.
''ø ¿
Indented
''¿ »
)
''» …
;
''…  
_logger** 
.** 
LogInformation** "
(**" #
$str**# -
,**- .
cadena**/ 5
)**5 6
;**6 7
}++ 	
},, 
}-- Æ
_D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Comun\ResponseInternalServerModelExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Comun! &
{ 
public 

class .
"ResponseInternalServerModelExample 3
:4 5
IExamplesProvider6 G
<G H.
"ResponseInternalServerModelExampleH j
>j k
{		 
public

 .
"ResponseInternalServerModelExample

 1
(

1 2
)

2 3
=>

4 6
responseModel

7 D
=

E F
new

G J
ResponseModel

K X
<

X Y
List

Y ]
<

] ^

EntidadDto

^ h
>

h i
>

i j
(

j k
)

k l
;

l m
public 
ResponseModel 
< 
List !
<! "

EntidadDto" ,
>, -
>- .
responseModel/ <
{= >
get? B
;B C
setD G
;G H
}I J
public .
"ResponseInternalServerModelExample 1
GetExamples2 =
(= >
)> ?
{ 	
string 
mensajeRespuesta #
=$ %
string& ,
., -
Empty- 2
;2 3
int 
status 
= 
$num 
; 
AuditResponse 
auditResponse '
=( )
new* -
AuditResponse. ;
(; <
)< =
;= >
List 
< 

EntidadDto 
> 
adn  
=! "
new# &
List' +
<+ ,

EntidadDto, 6
>6 7
(7 8
)8 9
;9 :
auditResponse 
. 
idTransaccion '
=( )
$str* 5
;5 6
auditResponse 
. 
codigoRespuesta )
=* +#
CodigoRespuestaServicio, C
.C D
ErrorInesperadoD S
;S T
new 
ConfigurationHelper #
(# $
)$ %
.% &+
ObtenerMensajeRespuestaServicio& E
(E F
auditResponseF S
.S T
codigoRespuestaT c
,c d
refe h
mensajeRespuestai y
,y z
ref{ ~
status	 Ö
)
Ö Ü
;
Ü á
auditResponse 
. 
mensajeRespuesta *
=+ ,
mensajeRespuesta- =
;= >
return 
new .
"ResponseInternalServerModelExample 9
(9 :
): ;
{ 
responseModel 
= 
new  #
ResponseModel$ 1
<1 2
List2 6
<6 7

EntidadDto7 A
>A B
>B C
(C D
)D E
{ 
auditResponse !
=" #
auditResponse$ 1
,1 2
Entity 
= 
adn  
} 
} 
; 
} 	
} 
}   ú
XD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Dtos\Request\ProspectoQueryFilter.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Dtos! %
.% &
Request& -
{ 
public 

class  
ProspectoQueryFilter %
{ 
public 
DateTime 
? 
fechacreacioninicio ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
DateTime 
? 
fechacreacionfin )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public		 
string		 
codigorangoedad		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
string

 

codigosexo

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
string 
codigofuente "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
codigosubfuente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
codigorangoingreso (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
codigorangofondo &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
codigoproducto $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
? %
fechaestimadacierreinicio 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
DateTime 
? "
fechaestimadacierrefin /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string $
codigoporcentajeavanzada .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DateTime 
? &
fechaultimaactividadinicio 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
DateTime 
? #
fechaultimaactividadfin 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
DateTime 
? 
fechacreacioncita *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
	parametro 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
tab 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
codigointermediario &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ≠
OD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Dtos\Response\EntidadDto.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Dtos! %
.% &
Response& .
{ 
public 

class 

EntidadDto 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Mensaje 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ª,
QD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Dtos\Response\ProspectoDto.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Dtos! %
.% &
Response& .
{ 
public 

class 
ProspectoDto 
{ 
public 
int &
IdConsolidadoIntermediario -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
short		 
?		 
CodigoTipoDocumento		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
string

 
NumeroDocumento

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ApellidoPaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ApellidoMaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
? 
FechaNacimiento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoRangoEdad %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoRangoIngreso (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 

CodigoSexo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
? 
MonedaFondo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
? 

MontoFondo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
? 
FlagHijo 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Empresa 
{ 
get  #
;# $
set% (
;( )
}* +
public 
short 
? 
CodigoCargo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	OtroCargo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoFuente "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
short 
? 
CodigoSubFuente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
CorreoElectronico1 (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
TelefonoFijo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
TelefonoCelular %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
? 
IdReferenciador #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Referenciador #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
? 
FlagDescarte !
{" #
get$ '
;' (
set) ,
;, -
}. /
public   
short   
?   #
CodigoMotivoUnoDescarte   -
{  . /
get  0 3
;  3 4
set  5 8
;  8 9
}  : ;
public!! 
short!! 
?!! #
CodigoMotivoDosDescarte!! -
{!!. /
get!!0 3
;!!3 4
set!!5 8
;!!8 9
}!!: ;
public"" 
short"" 
?"" $
CodigoMotivoTresDescarte"" .
{""/ 0
get""1 4
;""4 5
set""6 9
;""9 :
}""; <
public## 
string## $
TextoMontivoTresDescarte## .
{##/ 0
get##1 4
;##4 5
set##6 9
;##9 :
}##; <
public$$ 
short$$ 
?$$ 
CodigoRangoFondo$$ &
{$$' (
get$$) ,
;$$, -
set$$. 1
;$$1 2
}$$3 4
public%% 
DateTime%% 
?%% "
AuditoriaFechaCreacion%% /
{%%0 1
get%%2 5
;%%5 6
set%%7 :
;%%: ;
}%%< =
}&& 
}'' Æ+
UD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\MappingProfiles\MappingProfile.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
MappingProfiles! 0
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< $
ProspectoAdnRentaCommand .
,. /
AdnRenta0 8
>8 9
(9 :
): ;
;; <
	CreateMap 
< %
ProspectoDireccionCommand /
,/ 0
DireccionProspecto1 C
>C D
(D E
)E F
;F G
	CreateMap 
< !
CrearProspectoCommand +
,+ ,
	Prospecto- 6
>6 7
(7 8
)8 9
. 
	ForMember 
( 
destino "
=># %
destino& -
.- .
AdnRenta. 6
,6 7
x8 9
=>: <
x= >
.> ?
MapFrom? F
(F G
origenG M
=>N P
origenQ W
.W X$
ProspectoAdnRentaCommandX p
)p q
)q r
. 
	ForMember 
( 
destino "
=># %
destino& -
.- .
DireccionProspecto. @
,@ A
xB C
=>D F
xG H
.H I
MapFromI P
(P Q
origenQ W
=>X Z
origen[ a
.a b%
ProspectoDireccionCommandb {
){ |
)| }
;} ~
	CreateMap 
< &
ActualizarProspectoCommand 0
,0 1
	Prospecto2 ;
>; <
(< =
)= >
. 
	ForMember 
( 
destino "
=># %
destino& -
.- .
AdnRenta. 6
,6 7
x8 9
=>: <
x= >
.> ?
MapFrom? F
(F G
origenG M
=>N P
origenQ W
.W X$
ProspectoAdnRentaCommandX p
)p q
)q r
. 
	ForMember 
( 
destino "
=># %
destino& -
.- .
DireccionProspecto. @
,@ A
xB C
=>D F
xG H
.H I
MapFromI P
(P Q
origenQ W
=>X Z
origen[ a
.a b%
ProspectoDireccionCommandb {
){ |
)| }
;} ~
	CreateMap 
< %
DescartarProspectoCommand /
,/ 0
	Prospecto1 :
>: ;
(; <
)< =
;= >
	CreateMap 
< 
	Prospecto 
,  
ProspectoDto! -
>- .
(. /
)/ 0
;0 1
	CreateMap## 
<##  
CitaProspectoCommand## *
,##* +
	Prospecto##, 5
>##5 6
(##6 7
)##7 8
;##8 9
	CreateMap$$ 
<$$ 
CrearCitaCommand$$ &
,$$& '
Cita$$( ,
>$$, -
($$- .
)$$. /
.%% 
	ForMember%% 
(%% 
destino%% "
=>%%# %
destino%%& -
.%%- .
	Prospecto%%. 7
,%%7 8
x%%9 :
=>%%; =
x%%> ?
.%%? @
MapFrom%%@ G
(%%G H
origen%%H N
=>%%O Q
origen%%R X
.%%X Y 
CitaProspectoCommand%%Y m
)%%m n
)%%n o
;%%o p
	CreateMap'' 
<'' !
ActualizarCitaCommand'' +
,''+ ,
Cita''- 1
>''1 2
(''2 3
)''3 4
;''4 5
	CreateMap(( 
<((  
CalificarCitaCommand(( *
,((* +
Cita((, 0
>((0 1
(((1 2
)((2 3
;((3 4
	CreateMap,, 
<,, /
#RecordatorioLlamadaProspectoCommand,, 9
,,,9 :
	Prospecto,,; D
>,,D E
(,,E F
),,F G
;,,G H
	CreateMap-- 
<-- +
CrearRecordatorioLlamadaCommand-- 5
,--5 6
RecordatorioLlamada--7 J
>--J K
(--K L
)--L M
... 
	ForMember.. 
(.. 
destino.. "
=>..# %
destino..& -
...- .
	Prospecto... 7
,..7 8
x..9 :
=>..; =
x..> ?
...? @
MapFrom..@ G
(..G H
origen..H N
=>..O Q
origen..R X
...X Y/
#RecordatorioLlamadaProspectoCommand..Y |
)..| }
)..} ~
;..~ 
	CreateMap00 
<00 0
$ActualizarRecordatorioLlamadaCommand00 :
,00: ;
RecordatorioLlamada00< O
>00O P
(00P Q
)00Q R
;00R S
	CreateMap44 
<44 
CrearReunionCommand44 )
,44) *
Reunion44+ 2
>442 3
(443 4
)444 5
;445 6
	CreateMap55 
<55 $
ActualizarReunionCommand55 .
,55. /
Reunion55/ 6
>556 7
(557 8
)558 9
;559 :
}88 	
}99 
}:: ˇç
[D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Calendario\CalendarioQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )

Calendario) 3
{ 
public 

class 
CalendarioQueries "
:# $
ICalendarioQueries% 7
{ 
private 
readonly 
string 
_connectionString  1
;1 2
private 
readonly 
AgendaContext &
_context' /
;/ 0
public 
CalendarioQueries  
(  !
IConfiguration! /
configuration0 =
,= >
AgendaContext? L
contextM T
)T U
{ 	
_connectionString 
= 
configuration  -
.- .
GetConnectionString. A
(A B
$strB N
)N O
;O P
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
ResponseModel '
<' (
List( ,
<, -
SemanaCalendario- =
>= >
>> ?
>? @#
ObtenerSemanaCalendarioA X
(X Y
stringY _
fechaactual` k
,k l
intm p 
codigointermediario	q Ñ
)
Ñ Ö
{ 	
ResponseService 
responseService +
;+ ,
ConfigurationHelper 
configurationHelper  3
=4 5
new6 9
ConfigurationHelper: M
(M N
)N O
;O P
ResponseModel 
< 
List 
< 
SemanaCalendario /
>/ 0
>0 1
response2 :
=; <
new= @
ResponseModelA N
<N O
ListO S
<S T
SemanaCalendarioT d
>d e
>e f
(f g
)g h
;h i
List 
< 
SemanaCalendario !
>! "
semanaCalendarios# 4
=5 6
new7 :
List; ?
<? @
SemanaCalendario@ P
>P Q
(Q R
)R S
;S T
List 
< 
DiaCalendario 
> 
diaCalendarios  .
=/ 0
new1 4
List5 9
<9 :
DiaCalendario: G
>G H
(H I
)I J
;J K
List 
< !
CumpleaniosCalendario &
>& '"
cumplea√±osCalendarios( =
;= >
List   
<   
CitaCalendario   
>    
citaCalendarios  ! 0
;  0 1
List!! 
<!! )
RecordatorioLlamadaCalendario!! .
>!!. /*
recordatorioLlamadaCalendarios!!0 N
;!!N O
List"" 
<"" 
ReunionCalendario"" "
>""" #
reunionCalendarios""$ 6
;""6 7
List## 
<## 
EtapaCalendario##  
>##  !
etapaCalendarios##" 2
;##2 3
DateTime%% 
factual%% 
=%% 
DateTime%% '
.%%' (
Parse%%( -
(%%- .
fechaactual%%. 9
)%%9 :
;%%: ;
DateTime&& 
fsemanamenosuno&& $
=&&% &
factual&&' .
.&&. /
AddDays&&/ 6
(&&6 7
-&&7 8
$num&&8 9
)&&9 :
,&&: ;
fsemanamenosdos&&< K
=&&L M
factual&&N U
.&&U V
AddDays&&V ]
(&&] ^
-&&^ _
$num&&_ a
)&&a b
,&&b c
fsemanamasuno'' "
=''# $
factual''% ,
.'', -
AddDays''- 4
(''4 5
$num''5 6
)''6 7
,''7 8
fsemanamasdos''9 F
=''G H
factual''I P
.''P Q
AddDays''Q X
(''X Y
$num''Y [
)''[ \
;''\ ]
DateTime)) 
finicio)) 
,)) 
ffin)) "
;))" #
List++ 
<++ 
DateTime++ 
>++ 
fsemanas++ #
=++$ %
new++& )
List++* .
<++. /
DateTime++/ 7
>++7 8
(++8 9
)++9 :
{++; <
factual++= D
,++D E
fsemanamenosuno++F U
,++U V
fsemanamenosdos++W f
,++f g
fsemanamasuno++h u
,++u v
fsemanamasdos	++w Ñ
}
++Ö Ü
;
++Ü á
foreach-- 
(-- 
var-- 
fecha-- 
in-- !
fsemanas--" *
)--* +
{.. 
semanaCalendarios// !
.//! "
Add//" %
(//% &
new//& )
SemanaCalendario//* :
{00 
A√±o11 
=11 
fecha11 
.11  
Year11  $
,11$ %
Mes22 
=22 
fecha22 
.22  
ToString22  (
(22( )
$str22) /
)22/ 0
,220 1
FechaInicio33 
=33  !
fecha33" '
.33' (
AddDays33( /
(33/ 0
-330 1"
ObtenerNumeroDiaSemana331 G
(33G H
fecha33H M
.33M N
	DayOfWeek33N W
.33W X
ToString33X `
(33` a
)33a b
)33b c
)33c d
,33d e
FechaFin44 
=44 
fecha44 $
.44$ %
AddDays44% ,
(44, -
-44- ."
ObtenerNumeroDiaSemana44. D
(44D E
fecha44E J
.44J K
	DayOfWeek44K T
.44T U
ToString44U ]
(44] ^
)44^ _
)44_ `
)44` a
.44a b
AddDays44b i
(44i j
$num44j k
)44k l
}55 
)55 
;55 
}66 
finicio99 
=99 
fsemanamenosdos99 %
.99% &
AddDays99& -
(99- .
-99. /"
ObtenerNumeroDiaSemana99/ E
(99E F
fsemanamenosdos99F U
.99U V
	DayOfWeek99V _
.99_ `
ToString99` h
(99h i
)99i j
)99j k
)99k l
;99l m
ffin:: 
=:: 
fsemanamasdos::  
.::  !
AddDays::! (
(::( )
-::) *"
ObtenerNumeroDiaSemana::* @
(::@ A
fsemanamasdos::A N
.::N O
	DayOfWeek::O X
.::X Y
ToString::Y a
(::a b
)::b c
)::c d
)::d e
.::e f
AddDays::f m
(::m n
$num::n o
)::o p
;::p q
for>> 
(>> 
DateTime>> 
inicio>>  
=>>! "
finicio>># *
;>>* +
inicio>>, 2
<>>3 4
ffin>>5 9
;>>9 :
inicio>>; A
=>>B C
inicio>>D J
.>>J K
AddDays>>K R
(>>R S
$num>>S V
)>>V W
)>>W X
{?? 
diaCalendarios@@ 
.@@ 
Add@@ "
(@@" #
new@@# &
DiaCalendario@@' 4
{@@5 6
FechaDia@@7 ?
=@@@ A
inicio@@B H
,@@H I
Dia@@J M
=@@N O
inicio@@P V
.@@V W
ToString@@W _
(@@_ `
$str@@` f
)@@f g
}@@h i
)@@i j
;@@j k
}AA 
usingCC 
(CC 
varCC 

connectionCC !
=CC" #
newCC$ '
SqlConnectionCC( 5
(CC5 6
_connectionStringCC6 G
)CCG H
)CCH I
{DD "
cumplea√±osCalendariosEE %
=EE& '
(EE( )
awaitEE) .

connectionEE/ 9
.EE9 :

QueryAsyncEE: D
<EED E!
CumpleaniosCalendarioEEE Z
>EEZ [
(EE[ \
$str	GP Ü
,QQ 
newQQ !
{QQ" #
codigointermediarioQQ$ 7
,QQ7 8
finicioQQ9 @
,QQ@ A
ffinQQB F
}QQG H
)QQH I
)QQI J
.QQJ K
ToListQQK Q
(QQQ R
)QQR S
;QQS T
citaCalendariosSS 
=SS  !
awaitSS" '!
ObtenerCitaCalendarioSS( =
(SS= >
codigointermediarioSS> Q
,SSQ R
finicioSSS Z
,SSZ [
ffinSS\ `
)SS` a
.SSa b
ToListAsyncSSb m
(SSm n
)SSn o
;SSo p*
recordatorioLlamadaCalendariosTT .
=TT/ 0
awaitTT1 60
$ObtenerRecordatorioLlamadaCalendarioTT7 [
(TT[ \
codigointermediarioTT\ o
,TTo p
finicioTTq x
,TTx y
ffinTTz ~
)TT~ 
.	TT Ä
ToListAsync
TTÄ ã
(
TTã å
)
TTå ç
;
TTç é
reunionCalendariosUU "
=UU# $
awaitUU% *$
ObtenerReunionCalendarioUU+ C
(UUC D
codigointermediarioUUD W
,UUW X
finicioUUY `
,UU` a
ffinUUb f
)UUf g
.UUg h
ToListAsyncUUh s
(UUs t
)UUt u
;UUu v
}VV 
etapaCalendariosXX 
=XX 
citaCalendariosXX .
.XX. /
GroupByXX/ 6
(XX6 7
xXX7 8
=>XX9 ;
newXX< ?
{XX@ A
xXXB C
.XXC D
EtapaXXD I
,XXI J
xXXK L
.XXL M
FechaXXM R
}XXS T
)XXT U
.XXU V
SelectXXV \
(XX\ ]
yXX] ^
=>XX_ a
newXXb e
EtapaCalendarioXXf u
(XXu v
)XXv w
{YY 
NombreEtapaZZ 
=ZZ 
yZZ 
.ZZ  
KeyZZ  #
.ZZ# $
EtapaZZ$ )
,ZZ) *
Fecha[[ 
=[[ 
y[[ 
.[[ 
Key[[ 
.[[ 
Fecha[[ #
,[[# $
CantidadCita\\ 
=\\ 
y\\  
.\\  !
Count\\! &
(\\& '
)\\' (
,\\( )
CantidadEntrevista]] "
=]]# $
y]]% &
.]]& '
Count]]' ,
(]], -
x]]- .
=>]]/ 1
x]]2 3
.]]3 4
TieneCalificacion]]4 E
&&]]F H
x]]I J
.]]J K"
CodigoTipoCalificacion]]K a
==]]a c!
TablaTipoCalificacion]]c x
.]]x y

Concretado	]]y É
)
]]É Ñ
}^^ 
)^^ 
.^^ 
ToList^^ 
(^^ 
)^^ 
;^^ 
foreach`` 
(`` 
var`` 
dia`` 
in`` 
diaCalendarios`` -
)``- .
{aa 
diabb 
.bb "
CumpleaniosCalendariosbb *
=bb+ ,"
cumplea√±osCalendariosbb- B
.bbB C
WherebbC H
(bbH I
xbbI J
=>bbK M
xbbN O
.bbO P
FechaCumplebbP [
==bb\ ^
diabb_ b
.bbb c
FechaDiabbc k
)bbk l
.bbl m
ToListbbm s
(bbs t
)bbt u
;bbu v
diacc 
.cc 
CitaCalendarioscc #
=cc$ %
citaCalendarioscc& 5
.cc5 6
Wherecc6 ;
(cc; <
xcc< =
=>cc> @
xccA B
.ccB C
FechaccC H
==ccI K
diaccL O
.ccO P
FechaDiaccP X
)ccX Y
.ccY Z
ToListccZ `
(cc` a
)cca b
;ccb c
diadd 
.dd *
RecordatorioLlamadaCalendariosdd 2
=dd3 4*
recordatorioLlamadaCalendariosdd5 S
.ddS T
WhereddT Y
(ddY Z
xddZ [
=>dd\ ^
xdd_ `
.dd` a
Fechadda f
==ddg i
diaddj m
.ddm n
FechaDiaddn v
)ddv w
.ddw x
ToListddx ~
(dd~ 
)	dd Ä
;
ddÄ Å
diaee 
.ee 
ReunionCalendariosee &
=ee' (
reunionCalendariosee) ;
.ee; <
Whereee< A
(eeA B
xeeB C
=>eeD F
xeeG H
.eeH I
FechaeeI N
==eeO Q
diaeeR U
.eeU V
FechaDiaeeV ^
)ee^ _
.ee_ `
ToListee` f
(eef g
)eeg h
;eeh i
}ff 
foreachhh 
(hh 
varhh 
semanahh 
inhh !
semanaCalendarioshh" 3
)hh3 4
{ii 
semanajj 
.jj 
DiaCalendariosjj %
=jj& '
diaCalendariosjj( 6
.jj6 7
Wherejj7 <
(jj< =
xjj= >
=>jj? A
xjjB C
.jjC D
FechaDiajjD L
>=jjM O
semanajjP V
.jjV W
FechaIniciojjW b
&&jjc e
xjjf g
.jjg h
FechaDiajjh p
<=jjq s
semanajjt z
.jjz {
FechaFin	jj{ É
)
jjÉ Ñ
.
jjÑ Ö
ToList
jjÖ ã
(
jjã å
)
jjå ç
;
jjç é
semanakk 
.kk 
EtapaCalendarioskk '
=kk( )
etapaCalendarioskk* :
.kk: ;
Wherell* /
(ll/ 0
xll0 1
=>ll2 4
xll5 6
.ll6 7
Fechall7 <
>=ll= ?
semanall@ F
.llF G
FechaIniciollG R
&&llS U
xllV W
.llW X
FechallX ]
<=ll^ `
semanalla g
.llg h
FechaFinllh p
)llp q
.mm* +
GroupBymm+ 2
(mm2 3
xmm3 4
=>mm5 7
newmm8 ;
{mm< =
xmm> ?
.mm? @
NombreEtapamm@ K
}mmK L
)mmL M
.mmM N
SelectmmN T
(mmT U
ymmU V
=>mmW Y
newmmZ ]
EtapaCalendariomm^ m
(mmm n
)mmn o
{nn* +
NombreEtapaoo. 9
=oo: ;
yoo< =
.oo= >
Keyoo> A
.ooA B
NombreEtapaooB M
,ooM N
CantidadCitapp. :
=pp; <
ypp= >
.pp> ?
Sumpp? B
(ppB C
xppC D
=>ppE G
xppH I
.ppI J
CantidadCitappJ V
)ppV W
,ppW X
CantidadEntrevistaqq. @
=qqA B
yqqC D
.qqD E
SumqqE H
(qqH I
xqqI J
=>qqK M
xqqN O
.qqO P
CantidadEntrevistaqqP b
)qqb c
}rr* +
)rr+ ,
.ss) *
ToListss* 0
(ss0 1
)ss1 2
;ss2 3
}tt 
responseServicevv 
=vv 
configurationHelpervv 1
.vv1 2*
ObtenerCodigoRespuestaServiciovv2 P
(vvP Q#
CodigoRespuestaServiciovvQ h
.vvh i
Exitovvi n
,vvn o
$strvvp r
)vvr s
;vvs t
responseww 
.ww 
auditResponseww "
=ww# $
newww% (
AuditResponseww) 6
{ww7 8
codigoRespuestaww9 H
=wwI J
responseServicewwK Z
.wwZ [
codigoRespuestaww[ j
,wwj k
mensajeRespuestawwl |
=ww} ~
responseService	ww é
.
wwé è
mensajeRespuesta
wwè ü
}
ww† °
;
ww° ¢
responsexx 
.xx 
Entityxx 
=xx 
semanaCalendariosxx /
;xx/ 0
returnzz 
responsezz 
;zz 
}{{ 	
public}} 
async}} 
Task}} 
<}} 
ResponseModel}} '
<}}' (
List}}( ,
<}}, -
ActividadReporte}}- =
>}}= >
>}}> ?
>}}? @*
ObtenerReporteActividadSemanal}}A _
(}}_ `
string}}` f
fechaactual}}g r
,}}r s
string}}t z!
codigointermediarios	}}{ è
)
}}è ê
{~~ 	
ResponseService 
responseService +
;+ ,!
ConfigurationHelper
ÄÄ !
configurationHelper
ÄÄ  3
=
ÄÄ4 5
new
ÄÄ6 9!
ConfigurationHelper
ÄÄ: M
(
ÄÄM N
)
ÄÄN O
;
ÄÄO P
ResponseModel
ÅÅ 
<
ÅÅ 
List
ÅÅ 
<
ÅÅ 
ActividadReporte
ÅÅ /
>
ÅÅ/ 0
>
ÅÅ0 1
response
ÅÅ2 :
=
ÅÅ; <
new
ÅÅ= @
ResponseModel
ÅÅA N
<
ÅÅN O
List
ÅÅO S
<
ÅÅS T
ActividadReporte
ÅÅT d
>
ÅÅd e
>
ÅÅe f
(
ÅÅf g
)
ÅÅg h
;
ÅÅh i
var
ÉÉ %
listcodigointermediario
ÉÉ '
=
ÉÉ( )"
codigointermediarios
ÉÉ* >
.
ÉÉ> ?
Split
ÉÉ? D
(
ÉÉD E
$char
ÉÉE H
)
ÉÉH I
.
ÉÉI J
Select
ÉÉJ P
(
ÉÉP Q
int
ÉÉQ T
.
ÉÉT U
Parse
ÉÉU Z
)
ÉÉZ [
.
ÉÉ[ \
ToList
ÉÉ\ b
(
ÉÉb c
)
ÉÉc d
;
ÉÉd e
DateTime
ÑÑ 
factual
ÑÑ 
=
ÑÑ 
DateTime
ÑÑ '
.
ÑÑ' (
Parse
ÑÑ( -
(
ÑÑ- .
fechaactual
ÑÑ. 9
)
ÑÑ9 :
;
ÑÑ: ;
DateTime
ÖÖ 
finiciosemana
ÖÖ "
,
ÖÖ" #

ffinsemana
ÖÖ$ .
,
ÖÖ. /

finiciomes
ÖÖ0 :
,
ÖÖ: ;
ffinmes
ÖÖ< C
;
ÖÖC D
finiciosemana
ÜÜ 
=
ÜÜ 
factual
ÜÜ #
.
ÜÜ# $
AddDays
ÜÜ$ +
(
ÜÜ+ ,
-
ÜÜ, -$
ObtenerNumeroDiaSemana
ÜÜ- C
(
ÜÜC D
factual
ÜÜD K
.
ÜÜK L
	DayOfWeek
ÜÜL U
.
ÜÜU V
ToString
ÜÜV ^
(
ÜÜ^ _
)
ÜÜ_ `
)
ÜÜ` a
)
ÜÜa b
;
ÜÜb c

ffinsemana
áá 
=
áá 
factual
áá  
.
áá  !
AddDays
áá! (
(
áá( )
-
áá) *$
ObtenerNumeroDiaSemana
áá* @
(
áá@ A
factual
ááA H
.
ááH I
	DayOfWeek
ááI R
.
ááR S
ToString
ááS [
(
áá[ \
)
áá\ ]
)
áá] ^
)
áá^ _
.
áá_ `
AddDays
áá` g
(
áág h
$num
ááh i
)
áái j
;
ááj k

finiciomes
ââ 
=
ââ 
new
ââ 
DateTime
ââ %
(
ââ% &
factual
ââ& -
.
ââ- .
Year
ââ. 2
,
ââ2 3
factual
ââ4 ;
.
ââ; <
Month
ââ< A
,
ââA B
$num
ââC D
)
ââD E
;
ââE F
ffinmes
ää 
=
ää 

finiciomes
ää  
.
ää  !
	AddMonths
ää! *
(
ää* +
$num
ää+ ,
)
ää, -
.
ää- .
AddDays
ää. 5
(
ää5 6
-
ää6 7
$num
ää7 8
)
ää8 9
;
ää9 :
List
åå 
<
åå 
ProspectoReporte
åå !
>
åå! ")
listProspectoCitasPorSemana
åå# >
=
åå? @
null
ååA E
;
ååE F
List
çç 
<
çç 
ProspectoReporte
çç !
>
çç! ".
 listProspectoEntrevistaPorSemana
çç# C
=
ççD E
null
ççF J
;
ççJ K
List
éé 
<
éé 
ProspectoReporte
éé !
>
éé! "&
listProspectoCitasPorMes
éé# ;
=
éé< =
null
éé> B
;
ééB C
List
èè 
<
èè 
ProspectoReporte
èè !
>
èè! "+
listProspectoEntrevistaPorMes
èè# @
=
èèA B
null
èèC G
;
èèG H
List
êê 
<
êê 
ActividadReporte
êê !
>
êê! "!
listaReporteSemanal
êê# 6
=
êê7 8
new
êê9 <
List
êê= A
<
êêA B
ActividadReporte
êêB R
>
êêR S
(
êêS T
)
êêT U
;
êêU V
List
ìì 
<
ìì 
ActividadReporte
ìì !
>
ìì! "(
listaReporteSemanalInicial
ìì# =
=
ìì> ?
new
ìì@ C
List
ììD H
<
ììH I
ActividadReporte
ììI Y
>
ììY Z
(
ììZ [
)
ìì[ \
;
ìì\ ](
listaReporteSemanalInicial
îî &
.
îî& '
Add
îî' *
(
îî* +
new
îî+ .
ActividadReporte
îî/ ?
{
îî@ A
Subcategoria
îîB N
=
îîO P
$str
îîQ b
}
îîc d
)
îîd e
;
îîe f(
listaReporteSemanalInicial
ïï &
.
ïï& '
Add
ïï' *
(
ïï* +
new
ïï+ .
ActividadReporte
ïï/ ?
{
ïï@ A
Category
ïïB J
=
ïïK L
$str
ïïM Z
,
ïïZ [
Subcategoria
ïï\ h
=
ïïi j
$str
ïïk r
}
ïïs t
)
ïït u
;
ïïu v(
listaReporteSemanalInicial
ññ &
.
ññ& '
Add
ññ' *
(
ññ* +
new
ññ+ .
ActividadReporte
ññ/ ?
{
ññ@ A
Category
ññB J
=
ññK L
$str
ññM Z
,
ññZ [
Subcategoria
ññ\ h
=
ññi j
$str
ññk v
}
ññw x
)
ññx y
;
ññy z(
listaReporteSemanalInicial
óó &
.
óó& '
Add
óó' *
(
óó* +
new
óó+ .
ActividadReporte
óó/ ?
{
óó@ A
Category
óóB J
=
óóK L
$str
óóM Z
,
óóZ [
Subcategoria
óó\ h
=
óói j
$str
óók z
}
óó{ |
)
óó| }
;
óó} ~(
listaReporteSemanalInicial
òò &
.
òò& '
Add
òò' *
(
òò* +
new
òò+ .
ActividadReporte
òò/ ?
{
òò@ A
Category
òòB J
=
òòK L
$str
òòM T
,
òòT U
Subcategoria
òòV b
=
òòc d
$str
òòe t
}
òòu v
)
òòv w
;
òòw x(
listaReporteSemanalInicial
ôô &
.
ôô& '
Add
ôô' *
(
ôô* +
new
ôô+ .
ActividadReporte
ôô/ ?
{
ôô@ A
Category
ôôB J
=
ôôK L
$str
ôôM T
,
ôôT U
Subcategoria
ôôV b
=
ôôc d
$str
ôôe t
}
ôôu v
)
ôôv w
;
ôôw x(
listaReporteSemanalInicial
öö &
.
öö& '
Add
öö' *
(
öö* +
new
öö+ .
ActividadReporte
öö/ ?
{
öö@ A
Category
ööB J
=
ööK L
$str
ööM T
,
ööT U
Subcategoria
ööV b
=
ööc d
$str
ööe v
}
ööw x
)
ööx y
;
ööy z(
listaReporteSemanalInicial
õõ &
.
õõ& '
Add
õõ' *
(
õõ* +
new
õõ+ .
ActividadReporte
õõ/ ?
{
õõ@ A
Category
õõB J
=
õõK L
$str
õõM Z
,
õõZ [
Subcategoria
õõ\ h
=
õõi j
$str
õõk z
}
õõ{ |
)
õõ| }
;
õõ} ~(
listaReporteSemanalInicial
úú &
.
úú& '
Add
úú' *
(
úú* +
new
úú+ .
ActividadReporte
úú/ ?
{
úú@ A
Category
úúB J
=
úúK L
$str
úúM Z
,
úúZ [
Subcategoria
úú\ h
=
úúi j
$str
úúk z
}
úú{ |
)
úú| }
;
úú} ~(
listaReporteSemanalInicial
ùù &
.
ùù& '
Add
ùù' *
(
ùù* +
new
ùù+ .
ActividadReporte
ùù/ ?
{
ùù@ A
Category
ùùB J
=
ùùK L
$str
ùùM Z
,
ùùZ [
Subcategoria
ùù\ h
=
ùùi j
$str
ùùk |
}
ùù} ~
)
ùù~ 
;ùù Ä(
listaReporteSemanalInicial
ûû &
.
ûû& '
Add
ûû' *
(
ûû* +
new
ûû+ .
ActividadReporte
ûû/ ?
{
ûû@ A
Category
ûûB J
=
ûûK L
$str
ûûM Y
,
ûûY Z
Subcategoria
ûû[ g
=
ûûh i
$str
ûûj w
}
ûûx y
)
ûûy z
;
ûûz {(
listaReporteSemanalInicial
üü &
.
üü& '
Add
üü' *
(
üü* +
new
üü+ .
ActividadReporte
üü/ ?
{
üü@ A
Category
üüB J
=
üüK L
$str
üüM Y
,
üüY Z
Subcategoria
üü[ g
=
üüh i
$str
üüj r
}
üüs t
)
üüt u
;
üüu v(
listaReporteSemanalInicial
†† &
.
††& '
Add
††' *
(
††* +
new
††+ .
ActividadReporte
††/ ?
{
††@ A
Category
††B J
=
††K L
$str
††M d
,
††d e
Subcategoria
††f r
=
††s t
$str††u Ñ
}††Ö Ü
)††Ü á
;††á à(
listaReporteSemanalInicial
°° &
.
°°& '
Add
°°' *
(
°°* +
new
°°+ .
ActividadReporte
°°/ ?
{
°°@ A
Category
°°B J
=
°°K L
$str
°°M d
,
°°d e
Subcategoria
°°f r
=
°°s t
$str°°u Ñ
}°°Ö Ü
)°°Ü á
;°°á à(
listaReporteSemanalInicial
¢¢ &
.
¢¢& '
Add
¢¢' *
(
¢¢* +
new
¢¢+ .
ActividadReporte
¢¢/ ?
{
¢¢@ A
Category
¢¢B J
=
¢¢K L
$str
¢¢M d
,
¢¢d e
Subcategoria
¢¢f r
=
¢¢s t
$str¢¢u Ü
}¢¢á à
)¢¢à â
;¢¢â ä
var
•• !
listProspectoPorMes
•• #
=
••$ %
await
••& +$
ObtenerProspectoPorMes
••, B
(
••B C%
listcodigointermediario
••C Z
,
••Z [

finiciomes
••\ f
,
••f g
ffinmes
••h o
)
••o p
.
••p q
ToListAsync
••q |
(
••| }
)
••} ~
;
••~ 
var
¶¶ &
listProspectosAdnsPorMes
¶¶ (
=
¶¶) *
await
¶¶+ 0'
ObtenerProspectoAdnPorMes
¶¶1 J
(
¶¶J K%
listcodigointermediario
¶¶K b
,
¶¶b c

finiciomes
¶¶d n
,
¶¶n o
ffinmes
¶¶p w
)
¶¶w x
.
¶¶x y
ToListAsync¶¶y Ñ
(¶¶Ñ Ö
)¶¶Ö Ü
;¶¶Ü á
var
ßß 
listcitaspormes
ßß 
=
ßß  !
await
ßß" ' 
ObtenerCitasPorMes
ßß( :
(
ßß: ;%
listcodigointermediario
ßß; R
,
ßßR S

finiciomes
ßßT ^
,
ßß^ _
ffinmes
ßß` g
)
ßßg h
.
ßßh i
ToListAsync
ßßi t
(
ßßt u
)
ßßu v
;
ßßv w
var
≠≠ $
listprospectoporsemana
≠≠ &
=
≠≠' (!
listProspectoPorMes
≠≠) <
.
≠≠< =
Where
≠≠= B
(
≠≠B C
x
≠≠C D
=>
≠≠E G
x
≠≠H I
.
≠≠I J
Fecha
≠≠J O
>=
≠≠P R
finiciosemana
≠≠S `
&&
≠≠a c
x
≠≠d e
.
≠≠e f
Fecha
≠≠f k
<=
≠≠l n

ffinsemana
≠≠o y
)
≠≠y z
.
≠≠z {
GroupBy≠≠{ Ç
(≠≠Ç É
x≠≠É Ñ
=>≠≠Ö á
new≠≠à ã
{≠≠å ç
x≠≠é è
.≠≠è ê
Fecha≠≠ê ï
,≠≠ï ñ
x≠≠ó ò
.≠≠ò ô
	Categoria≠≠ô ¢
,≠≠¢ £
x≠≠§ •
.≠≠• ¶
Subcategoria≠≠¶ ≤
}≠≠≥ ¥
)≠≠¥ µ
.
ÆÆ) *
Select
ÆÆ* 0
(
ÆÆ0 1
y
ÆÆ1 2
=>
ÆÆ3 5
new
ÆÆ6 9
ProspectoReporte
ÆÆ: J
(
ÆÆJ K
)
ÆÆK L
{
ØØ) *
	Categoria
∞∞- 6
=
∞∞7 8
y
∞∞9 :
.
∞∞: ;
Key
∞∞; >
.
∞∞> ?
	Categoria
∞∞? H
,
∞∞H I
Subcategoria
±±- 9
=
±±: ;
y
±±< =
.
±±= >
Key
±±> A
.
±±A B
Subcategoria
±±B N
,
±±N O
CantidadProspecto
≤≤- >
=
≤≤? @
y
≤≤A B
.
≤≤B C
Count
≤≤C H
(
≤≤H I
)
≤≤I J
,
≤≤J K
Fecha
≥≥- 2
=
≥≥3 4
y
≥≥5 6
.
≥≥6 7
Key
≥≥7 :
.
≥≥: ;
Fecha
≥≥; @
}
¥¥) *
)
¥¥* +
.
¥¥+ ,
ToList
¥¥, 2
(
¥¥2 3
)
¥¥3 4
;
¥¥4 5!
listProspectoPorMes
∑∑ 
=
∑∑  !!
listProspectoPorMes
∑∑" 5
.
∑∑5 6
GroupBy
∑∑6 =
(
∑∑= >
x
∑∑> ?
=>
∑∑@ B
new
∑∑C F
{
∑∑G H
x
∑∑I J
.
∑∑J K
Fecha
∑∑K P
,
∑∑P Q
x
∑∑R S
.
∑∑S T
	Categoria
∑∑T ]
,
∑∑] ^
x
∑∑_ `
.
∑∑` a
Subcategoria
∑∑a m
}
∑∑n o
)
∑∑o p
.
∏∏) *
Select
∏∏* 0
(
∏∏0 1
y
∏∏1 2
=>
∏∏3 5
new
∏∏6 9
ProspectoReporte
∏∏: J
(
∏∏J K
)
∏∏K L
{
ππ) *
	Categoria
∫∫- 6
=
∫∫7 8
y
∫∫9 :
.
∫∫: ;
Key
∫∫; >
.
∫∫> ?
	Categoria
∫∫? H
,
∫∫H I
Subcategoria
ªª- 9
=
ªª: ;
y
ªª< =
.
ªª= >
Key
ªª> A
.
ªªA B
Subcategoria
ªªB N
,
ªªN O
CantidadProspecto
ºº- >
=
ºº? @
y
ººA B
.
ººB C
Count
ººC H
(
ººH I
)
ººI J
,
ººJ K
Fecha
ΩΩ- 2
=
ΩΩ3 4
y
ΩΩ5 6
.
ΩΩ6 7
Key
ΩΩ7 :
.
ΩΩ: ;
Fecha
ΩΩ; @
}
ææ) *
)
ææ* +
.
ææ+ ,
ToList
ææ, 2
(
ææ2 3
)
ææ3 4
;
ææ4 5
var
¡¡ '
listprospectoadnporsemana
¡¡ )
=
¡¡* +&
listProspectosAdnsPorMes
¡¡, D
.
¡¡D E
Where
¡¡E J
(
¡¡J K
x
¡¡K L
=>
¡¡M O
x
¡¡P Q
.
¡¡Q R
Fecha
¡¡R W
>=
¡¡X Z
finiciosemana
¡¡[ h
&&
¡¡i k
x
¡¡l m
.
¡¡m n
Fecha
¡¡n s
<=
¡¡t v

ffinsemana¡¡w Å
)¡¡Å Ç
;¡¡Ç É
if
≈≈ 
(
≈≈ 
listcitaspormes
≈≈ 
.
≈≈  
Count
≈≈  %
(
≈≈% &
)
≈≈& '
>
≈≈( )
$num
≈≈* +
)
≈≈+ ,
{
∆∆ &
listProspectoCitasPorMes
»» )
=
»»* +
listcitaspormes
»», ;
.
»»; <
GroupBy
»»< C
(
»»C D
x
»»D E
=>
»»F H
new
»»I L
{
»»M N
x
»»O P
.
»»P Q
Fecha
»»Q V
,
»»V W
x
»»X Y
.
»»Y Z
Subcategoria
»»Z f
}
»»g h
)
»»h i
.
……) *
Select
……* 0
(
……0 1
y
……1 2
=>
……3 5
new
……6 9
ProspectoReporte
……: J
(
……J K
)
……K L
{
  ) *
	Categoria
ÀÀ- 6
=
ÀÀ7 8
$str
ÀÀ9 @
,
ÀÀ@ A
Subcategoria
ÃÃ- 9
=
ÃÃ: ;
y
ÃÃ< =
.
ÃÃ= >
Key
ÃÃ> A
.
ÃÃA B
Subcategoria
ÃÃB N
,
ÃÃN O
CantidadProspecto
ÕÕ- >
=
ÕÕ? @
y
ÕÕA B
.
ÕÕB C
Sum
ÕÕC F
(
ÕÕF G
x
ÕÕG H
=>
ÕÕI K
x
ÕÕL M
.
ÕÕM N
CantidadCita
ÕÕN Z
)
ÕÕZ [
,
ÕÕ[ \
Fecha
ŒŒ- 2
=
ŒŒ3 4
y
ŒŒ5 6
.
ŒŒ6 7
Key
ŒŒ7 :
.
ŒŒ: ;
Fecha
ŒŒ; @
}
œœ) *
)
œœ* +
.
œœ+ ,
ToList
œœ, 2
(
œœ2 3
)
œœ3 4
;
œœ4 5+
listProspectoEntrevistaPorMes
““ .
=
““/ 0
listcitaspormes
““1 @
.
““@ A
Where
““A F
(
““F G
x
““G H
=>
““I K
x
““L M
.
““M N
Calificacion
““N Z
&&
““[ ]
x
““^ _
.
““_ `$
CodigoTipoCalificacion
““` v
==
““w y$
TablaTipoCalificacion““z è
.““è ê

Concretado““ê ö
)““ö õ
.““õ ú
GroupBy““ú £
(““£ §
x““§ •
=>““¶ ®
new““© ¨
{““≠ Æ
x““Ø ∞
.““∞ ±
Fecha““± ∂
,““∂ ∑
x““∏ π
.““π ∫
Subcategoria““∫ ∆
}““« »
)““» …
.
””/ 0
Select
””0 6
(
””6 7
y
””7 8
=>
””9 ;
new
””< ?
ProspectoReporte
””@ P
(
””P Q
)
””Q R
{
‘‘/ 0
	Categoria
’’3 <
=
’’= >
$str
’’? L
,
’’L M
Subcategoria
÷÷3 ?
=
÷÷@ A
y
÷÷B C
.
÷÷C D
Key
÷÷D G
.
÷÷G H
Subcategoria
÷÷H T
,
÷÷T U
CantidadProspecto
◊◊3 D
=
◊◊E F
y
◊◊G H
.
◊◊H I
Sum
◊◊I L
(
◊◊L M
X
◊◊M N
=>
◊◊O Q
X
◊◊R S
.
◊◊S T
CantidadCita
◊◊T `
)
◊◊` a
,
◊◊a b
Fecha
ÿÿ3 8
=
ÿÿ9 :
y
ÿÿ; <
.
ÿÿ< =
Key
ÿÿ= @
.
ÿÿ@ A
Fecha
ÿÿA F
}
ŸŸ/ 0
)
ŸŸ0 1
.
ŸŸ1 2
ToList
ŸŸ2 8
(
ŸŸ8 9
)
ŸŸ9 :
;
ŸŸ: ;)
listProspectoCitasPorSemana
‹‹ ,
=
‹‹- .&
listProspectoCitasPorMes
‹‹/ G
.
‹‹G H
Where
‹‹H M
(
‹‹M N
x
‹‹N O
=>
‹‹P R
x
‹‹S T
.
‹‹T U
Fecha
‹‹U Z
>=
‹‹[ ]
finiciosemana
‹‹^ k
&&
‹‹l n
x
‹‹o p
.
‹‹p q
Fecha
‹‹q v
<=
‹‹w y

ffinsemana‹‹z Ñ
)‹‹Ñ Ö
.‹‹Ö Ü
ToList‹‹Ü å
(‹‹å ç
)‹‹ç é
;‹‹é è.
 listProspectoEntrevistaPorSemana
›› 1
=
››2 3+
listProspectoEntrevistaPorMes
››4 Q
.
››Q R
Where
››R W
(
››W X
x
››X Y
=>
››Z \
x
››] ^
.
››^ _
Fecha
››_ d
>=
››e g
finiciosemana
››h u
&&
››v x
x
››y z
.
››z {
Fecha››{ Ä
<=››Å É

ffinsemana››Ñ é
)››é è
.››è ê
ToList››ê ñ
(››ñ ó
)››ó ò
;››ò ô
}
ﬁﬁ 
if
‰‰ 
(
‰‰ '
listprospectoadnporsemana
‰‰ )
?
‰‰) *
.
‰‰* +
Any
‰‰+ .
(
‰‰. /
)
‰‰/ 0
==
‰‰1 3
true
‰‰4 8
)
‰‰8 9
{
ÂÂ !
listaReporteSemanal
ÁÁ #
.
ÁÁ# $
Add
ÁÁ$ '
(
ÁÁ' ('
listprospectoadnporsemana
ÁÁ( A
.
ÁÁA B
GroupBy
ÁÁB I
(
ÁÁI J
x
ÁÁJ K
=>
ÁÁL N
new
ÁÁO R
{
ÁÁS T
x
ÁÁU V
.
ÁÁV W
Subcategoria
ÁÁW c
}
ÁÁd e
)
ÁÁe f
.
ÁÁf g
Select
ËË* 0
(
ËË0 1
y
ËË1 2
=>
ËË3 5
new
ËË6 9
ActividadReporte
ËË: J
(
ËËJ K
)
ËËK L
{
ÈÈ* +
Subcategoria
ÍÍ. :
=
ÍÍ; <
y
ÍÍ= >
.
ÍÍ> ?
Key
ÍÍ? B
.
ÍÍB C
Subcategoria
ÍÍC O
,
ÍÍO P
Lunes
ÎÎ. 3
=
ÎÎ4 5
y
ÎÎ6 7
.
ÎÎ7 8
Where
ÎÎ8 =
(
ÎÎ= >
x
ÎÎ> ?
=>
ÎÎ@ B
(
ÎÎC D
byte
ÎÎD H
)
ÎÎH I
x
ÎÎI J
.
ÎÎJ K
Fecha
ÎÎK P
.
ÎÎP Q
	DayOfWeek
ÎÎQ Z
==
ÎÎ[ ]
$num
ÎÎ^ _
)
ÎÎ_ `
.
ÎÎ` a
Sum
ÎÎa d
(
ÎÎd e
x
ÎÎe f
=>
ÎÎg i
x
ÎÎj k
.
ÎÎk l
CantidadProspecto
ÎÎl }
)
ÎÎ} ~
,
ÎÎ~ 
Martes
ÏÏ. 4
=
ÏÏ5 6
y
ÏÏ7 8
.
ÏÏ8 9
Where
ÏÏ9 >
(
ÏÏ> ?
x
ÏÏ? @
=>
ÏÏA C
(
ÏÏD E
byte
ÏÏE I
)
ÏÏI J
x
ÏÏJ K
.
ÏÏK L
Fecha
ÏÏL Q
.
ÏÏQ R
	DayOfWeek
ÏÏR [
==
ÏÏ\ ^
$num
ÏÏ_ `
)
ÏÏ` a
.
ÏÏa b
Sum
ÏÏb e
(
ÏÏe f
x
ÏÏf g
=>
ÏÏh j
x
ÏÏk l
.
ÏÏl m
CantidadProspecto
ÏÏm ~
)
ÏÏ~ 
,ÏÏ Ä
	Miercoles
ÌÌ. 7
=
ÌÌ8 9
y
ÌÌ: ;
.
ÌÌ; <
Where
ÌÌ< A
(
ÌÌA B
x
ÌÌB C
=>
ÌÌD F
(
ÌÌG H
byte
ÌÌH L
)
ÌÌL M
x
ÌÌM N
.
ÌÌN O
Fecha
ÌÌO T
.
ÌÌT U
	DayOfWeek
ÌÌU ^
==
ÌÌ_ a
$num
ÌÌb c
)
ÌÌc d
.
ÌÌd e
Sum
ÌÌe h
(
ÌÌh i
x
ÌÌi j
=>
ÌÌk m
x
ÌÌn o
.
ÌÌo p 
CantidadProspectoÌÌp Å
)ÌÌÅ Ç
,ÌÌÇ É
Jueves
ÓÓ. 4
=
ÓÓ5 6
y
ÓÓ7 8
.
ÓÓ8 9
Where
ÓÓ9 >
(
ÓÓ> ?
x
ÓÓ? @
=>
ÓÓA C
(
ÓÓD E
byte
ÓÓE I
)
ÓÓI J
x
ÓÓJ K
.
ÓÓK L
Fecha
ÓÓL Q
.
ÓÓQ R
	DayOfWeek
ÓÓR [
==
ÓÓ\ ^
$num
ÓÓ_ `
)
ÓÓ` a
.
ÓÓa b
Sum
ÓÓb e
(
ÓÓe f
x
ÓÓf g
=>
ÓÓh j
x
ÓÓk l
.
ÓÓl m
CantidadProspecto
ÓÓm ~
)
ÓÓ~ 
,ÓÓ Ä
Viernes
ÔÔ. 5
=
ÔÔ6 7
y
ÔÔ8 9
.
ÔÔ9 :
Where
ÔÔ: ?
(
ÔÔ? @
x
ÔÔ@ A
=>
ÔÔB D
(
ÔÔE F
byte
ÔÔF J
)
ÔÔJ K
x
ÔÔK L
.
ÔÔL M
Fecha
ÔÔM R
.
ÔÔR S
	DayOfWeek
ÔÔS \
==
ÔÔ] _
$num
ÔÔ` a
)
ÔÔa b
.
ÔÔb c
Sum
ÔÔc f
(
ÔÔf g
x
ÔÔg h
=>
ÔÔi k
x
ÔÔl m
.
ÔÔm n
CantidadProspecto
ÔÔn 
)ÔÔ Ä
,ÔÔÄ Å
Sabado
. 4
=
5 6
y
7 8
.
8 9
Where
9 >
(
> ?
x
? @
=>
A C
(
D E
byte
E I
)
I J
x
J K
.
K L
Fecha
L Q
.
Q R
	DayOfWeek
R [
==
\ ^
$num
_ `
)
` a
.
a b
Sum
b e
(
e f
x
f g
=>
h j
x
k l
.
l m
CantidadProspecto
m ~
)
~ 
, Ä
Domingo
ÒÒ. 5
=
ÒÒ6 7
y
ÒÒ8 9
.
ÒÒ9 :
Where
ÒÒ: ?
(
ÒÒ? @
x
ÒÒ@ A
=>
ÒÒB D
(
ÒÒE F
byte
ÒÒF J
)
ÒÒJ K
x
ÒÒK L
.
ÒÒL M
Fecha
ÒÒM R
.
ÒÒR S
	DayOfWeek
ÒÒS \
==
ÒÒ] _
$num
ÒÒ` a
)
ÒÒa b
.
ÒÒb c
Sum
ÒÒc f
(
ÒÒf g
x
ÒÒg h
=>
ÒÒi k
x
ÒÒl m
.
ÒÒm n
CantidadProspecto
ÒÒn 
)ÒÒ Ä
,ÒÒÄ Å
TotalSemana
ÚÚ. 9
=
ÚÚ: ;
y
ÚÚ< =
.
ÚÚ= >
Sum
ÚÚ> A
(
ÚÚA B
x
ÚÚB C
=>
ÚÚD F
x
ÚÚG H
.
ÚÚH I
CantidadProspecto
ÚÚI Z
)
ÚÚZ [
,
ÚÚ[ \
TotalMes
ÛÛ. 6
=
ÛÛ7 8&
listProspectosAdnsPorMes
ÛÛ9 Q
.
ÛÛQ R
Sum
ÛÛR U
(
ÛÛU V
x
ÛÛV W
=>
ÛÛX Z
x
ÛÛ[ \
.
ÛÛ\ ]
CantidadProspecto
ÛÛ] n
)
ÛÛn o
}
ÙÙ* +
)
ÙÙ+ ,
.
ÙÙ, -
FirstOrDefault
ÙÙ- ;
(
ÙÙ; <
)
ÙÙ< =
)
ÙÙ= >
;
ÙÙ> ?
}
ıı 
if
˜˜ 
(
˜˜ $
listprospectoporsemana
˜˜ *
?
˜˜* +
.
˜˜+ ,
Any
˜˜, /
(
˜˜/ 0
)
˜˜0 1
==
˜˜2 4
true
˜˜5 9
)
˜˜9 :
{
¯¯ !
listaReporteSemanal
˙˙ #
.
˙˙# $
AddRange
˙˙$ ,
(
˙˙, -"
AgruparProspectoCita
˙˙- A
(
˙˙A B$
listprospectoporsemana
˙˙B X
,
˙˙X Y!
listProspectoPorMes
˙˙Z m
)
˙˙m n
)
˙˙n o
;
˙˙o p
}
˚˚ 
if
˝˝ 
(
˝˝ )
listProspectoCitasPorSemana
˝˝ /
?
˝˝/ 0
.
˝˝0 1
Any
˝˝1 4
(
˝˝4 5
)
˝˝5 6
==
˝˝7 9
true
˝˝: >
)
˝˝> ?
{
˛˛ !
listaReporteSemanal
ÄÄ #
.
ÄÄ# $
AddRange
ÄÄ$ ,
(
ÄÄ, -"
AgruparProspectoCita
ÄÄ- A
(
ÄÄA B)
listProspectoCitasPorSemana
ÄÄB ]
,
ÄÄ] ^&
listProspectoCitasPorMes
ÄÄ_ w
)
ÄÄw x
)
ÄÄx y
;
ÄÄy z
}
ÅÅ 
if
ÉÉ 
(
ÉÉ .
 listProspectoEntrevistaPorSemana
ÉÉ 4
?
ÉÉ4 5
.
ÉÉ5 6
Any
ÉÉ6 9
(
ÉÉ9 :
)
ÉÉ: ;
==
ÉÉ< >
true
ÉÉ? C
)
ÉÉC D
{
ÑÑ !
listaReporteSemanal
ÜÜ #
.
ÜÜ# $
AddRange
ÜÜ$ ,
(
ÜÜ, -"
AgruparProspectoCita
ÜÜ- A
(
ÜÜA B.
 listProspectoEntrevistaPorSemana
ÜÜB b
,
ÜÜb c,
listProspectoEntrevistaPorMesÜÜd Å
)ÜÜÅ Ç
)ÜÜÇ É
;ÜÜÉ Ñ
}
áá 
if
ää 
(
ää !
listaReporteSemanal
ää #
.
ää# $
Count
ää$ )
>
ää) *
$num
ää* +
)
ää+ ,
{
ãã 
foreach
åå 
(
åå 
var
åå 
	actividad
åå &
in
åå' )(
listaReporteSemanalInicial
åå* D
)
ååD E
{
çç 
var
èè  
respuestaactividad
èè *
=
èè+ ,!
listaReporteSemanal
èè- @
.
èè@ A
Where
èèA F
(
èèF G
x
èèG H
=>
èèI K
x
èèL M
.
èèM N
Category
èèN V
==
èèW Y
	actividad
èèZ c
.
èèc d
Category
èèd l
&&
èèm o
x
èèp q
.
èèq r
Subcategoria
èèr ~
.
èè~ 
ToUpperèè Ü
(èèÜ á
)èèá à
==èèâ ã
	actividadèèå ï
.èèï ñ
Subcategoriaèèñ ¢
.èè¢ £
ToUpperèè£ ™
(èè™ ´
)èè´ ¨
)èè¨ ≠
.èè≠ Æ
FirstOrDefaultèèÆ º
(èèº Ω
)èèΩ æ
;èèæ ø
if
ëë 
(
ëë  
respuestaactividad
ëë *
!=
ëë+ -
null
ëë. 2
)
ëë2 3
{
íí 
	actividad
ìì !
.
ìì! "
Lunes
ìì" '
=
ìì( ) 
respuestaactividad
ìì* <
.
ìì< =
Lunes
ìì= B
;
ììB C
	actividad
îî !
.
îî! "
Martes
îî" (
=
îî) * 
respuestaactividad
îî+ =
.
îî= >
Martes
îî> D
;
îîD E
	actividad
ïï !
.
ïï! "
	Miercoles
ïï" +
=
ïï, - 
respuestaactividad
ïï. @
.
ïï@ A
	Miercoles
ïïA J
;
ïïJ K
	actividad
ññ !
.
ññ! "
Jueves
ññ" (
=
ññ) * 
respuestaactividad
ññ+ =
.
ññ= >
Jueves
ññ> D
;
ññD E
	actividad
óó !
.
óó! "
Viernes
óó" )
=
óó* + 
respuestaactividad
óó, >
.
óó> ?
Viernes
óó? F
;
óóF G
	actividad
òò !
.
òò! "
Sabado
òò" (
=
òò) * 
respuestaactividad
òò+ =
.
òò= >
Sabado
òò> D
;
òòD E
	actividad
ôô !
.
ôô! "
Domingo
ôô" )
=
ôô* + 
respuestaactividad
ôô, >
.
ôô> ?
Domingo
ôô? F
;
ôôF G
	actividad
öö !
.
öö! "
TotalSemana
öö" -
=
öö. / 
respuestaactividad
öö0 B
.
ööB C
TotalSemana
ööC N
;
ööN O
	actividad
õõ !
.
õõ! "
TotalMes
õõ" *
=
õõ+ , 
respuestaactividad
õõ- ?
.
õõ? @
TotalMes
õõ@ H
;
õõH I
}
úú 
}
ùù 
}
ûû 
else
üü 
{
†† 
List
°° 
<
°° 
ProspectoReporte
°° %
>
°°% &
total
°°' ,
=
°°- .
new
°°/ 2
List
°°3 7
<
°°7 8
ProspectoReporte
°°8 H
>
°°H I
(
°°I J
)
°°J K
;
°°K L
if
¢¢ 
(
¢¢ +
listProspectoEntrevistaPorMes
¢¢ 1
?
¢¢1 2
.
¢¢2 3
Any
¢¢3 6
(
¢¢6 7
)
¢¢7 8
==
¢¢9 ;
true
¢¢< @
)
¢¢@ A
total
¢¢B G
.
¢¢G H
AddRange
¢¢H P
(
¢¢P Q+
listProspectoEntrevistaPorMes
¢¢Q n
)
¢¢n o
;
¢¢o p
if
££ 
(
££ !
listProspectoPorMes
££ '
?
££' (
.
££( )
Any
££) ,
(
££, -
)
££- .
==
££/ 1
true
££2 6
)
££6 7
total
££8 =
.
££= >
AddRange
££> F
(
££F G!
listProspectoPorMes
££G Z
)
££Z [
;
££[ \
if
§§ 
(
§§ &
listProspectoCitasPorMes
§§ ,
?
§§, -
.
§§- .
Any
§§. 1
(
§§1 2
)
§§2 3
==
§§4 6
true
§§7 ;
)
§§; <
total
§§= B
.
§§B C
AddRange
§§C K
(
§§K L&
listProspectoCitasPorMes
§§L d
)
§§d e
;
§§e f
if
•• 
(
•• +
listProspectoEntrevistaPorMes
•• 1
?
••1 2
.
••2 3
Any
••3 6
(
••6 7
)
••7 8
==
••9 ;
true
••< @
)
••@ A
total
••B G
.
••G H
AddRange
••H P
(
••P Q+
listProspectoEntrevistaPorMes
••Q n
)
••n o
;
••o p
foreach
ßß 
(
ßß 
var
ßß 
	actividad
ßß &
in
ßß' )(
listaReporteSemanalInicial
ßß* D
)
ßßD E
{
®® 
	actividad
©© 
.
©© 
TotalMes
©© #
=
©©$ %
total
©©& +
?
©©+ ,
.
©©, -
Any
©©- 0
(
©©0 1
)
©©1 2
==
©©3 5
true
©©6 :
?
©©; <
total
©©= B
.
©©B C
Where
©©C H
(
©©H I
x
©©I J
=>
©©K M
x
©©N O
.
©©O P
	Categoria
©©P Y
==
©©Z \
	actividad
©©] f
.
©©f g
Category
©©g o
&&
©©p r
x
©©s t
.
©©t u
Subcategoria©©u Å
.©©Å Ç
ToUpper©©Ç â
(©©â ä
)©©ä ã
==©©å é
	actividad©©è ò
.©©ò ô
Subcategoria©©ô •
.©©• ¶
ToUpper©©¶ ≠
(©©≠ Æ
)©©Æ Ø
)©©Ø ∞
.©©∞ ±
Sum©©± ¥
(©©¥ µ
x©©µ ∂
=>©©∑ π
x©©∫ ª
.©©ª º!
CantidadProspecto©©º Õ
)©©Õ Œ
:©©œ –
$num©©— “
;©©“ ”
}
™™ 
}
´´ 
responseService
¨¨ 
=
¨¨ !
configurationHelper
¨¨ 1
.
¨¨1 2,
ObtenerCodigoRespuestaServicio
¨¨2 P
(
¨¨P Q%
CodigoRespuestaServicio
¨¨Q h
.
¨¨h i
Exito
¨¨i n
,
¨¨n o
$str
¨¨p r
)
¨¨r s
;
¨¨s t
response
≠≠ 
.
≠≠ 
auditResponse
≠≠ "
=
≠≠# $
new
≠≠% (
AuditResponse
≠≠) 6
{
≠≠7 8
codigoRespuesta
≠≠9 H
=
≠≠I J
responseService
≠≠K Z
.
≠≠Z [
codigoRespuesta
≠≠[ j
,
≠≠j k
mensajeRespuesta
≠≠l |
=
≠≠} ~
responseService≠≠ é
.≠≠é è 
mensajeRespuesta≠≠è ü
}≠≠† °
;≠≠° ¢
response
ÆÆ 
.
ÆÆ 
Entity
ÆÆ 
=
ÆÆ (
listaReporteSemanalInicial
ÆÆ 8
;
ÆÆ8 9
return
∞∞ 
response
∞∞ 
;
∞∞ 
}
±± 	
public
≥≥ 
async
≥≥ 
Task
≥≥ 
<
≥≥ 
ResponseModel
≥≥ '
<
≥≥' (
List
≥≥( ,
<
≥≥, -
Intermediario
≥≥- :
>
≥≥: ;
>
≥≥; <
>
≥≥< =*
ObtenerAsesoresPorSupervisor
≥≥> Z
(
≥≥Z [
int
≥≥[ ^!
codigointermediario
≥≥_ r
)
≥≥r s
{
¥¥ 	
ResponseService
µµ 
responseService
µµ +
;
µµ+ ,!
ConfigurationHelper
∂∂ !
configurationHelper
∂∂  3
=
∂∂4 5
new
∂∂6 9!
ConfigurationHelper
∂∂: M
(
∂∂M N
)
∂∂N O
;
∂∂O P
ResponseModel
∑∑ 
<
∑∑ 
List
∑∑ 
<
∑∑ 
Intermediario
∑∑ ,
>
∑∑, -
>
∑∑- .
response
∑∑/ 7
=
∑∑8 9
new
∑∑: =
ResponseModel
∑∑> K
<
∑∑K L
List
∑∑L P
<
∑∑P Q
Intermediario
∑∑Q ^
>
∑∑^ _
>
∑∑_ `
(
∑∑` a
)
∑∑a b
;
∑∑b c
var
ππ 
result
ππ 
=
ππ 
await
ππ 
(
ππ  
from
ππ  $
intermediario
ππ% 2
in
ππ3 5
_context
ππ6 >
.
ππ> ?'
ConsolidadoIntermediarios
ππ? X
where
∫∫" '
intermediario
∫∫( 5
.
∫∫5 6#
CodigoIntermediarioGA
∫∫6 K
==
∫∫L N!
codigointermediario
∫∫O b
||
∫∫c e
intermediario
ªª( 5
.
ªª5 6#
CodigoIntermediarioGU
ªª6 K
==
ªªL N!
codigointermediario
ªªO b
select
ºº" (
new
ºº) ,
{
ΩΩ" #
intermediario
ææ& 3
}
øø" #
)
øø# $
.
øø$ %
Select
øø% +
(
øø+ ,
x
øø, -
=>
øø. 0
new
øø1 4
Intermediario
øø5 B
(
øøB C
)
øøC D
{
¿¿" #
Nombres
¡¡& -
=
¡¡. /
x
¡¡0 1
.
¡¡1 2
intermediario
¡¡2 ?
.
¡¡? @
NombreRazonSocial
¡¡@ Q
,
¡¡Q R!
CodigoIntermediario
¬¬& 9
=
¬¬: ;
x
¬¬< =
.
¬¬= >
intermediario
¬¬> K
.
¬¬K L!
CodigoIntermediario
¬¬L _
}
√√" #
)
√√# $
.
√√$ %
ToListAsync
√√% 0
(
√√0 1
)
√√1 2
;
√√2 3
responseService
≈≈ 
=
≈≈ !
configurationHelper
≈≈ 1
.
≈≈1 2,
ObtenerCodigoRespuestaServicio
≈≈2 P
(
≈≈P Q%
CodigoRespuestaServicio
≈≈Q h
.
≈≈h i
Exito
≈≈i n
,
≈≈n o
$str
≈≈p r
)
≈≈r s
;
≈≈s t
response
∆∆ 
.
∆∆ 
auditResponse
∆∆ "
=
∆∆# $
new
∆∆% (
AuditResponse
∆∆) 6
{
∆∆7 8
codigoRespuesta
∆∆9 H
=
∆∆I J
responseService
∆∆K Z
.
∆∆Z [
codigoRespuesta
∆∆[ j
,
∆∆j k
mensajeRespuesta
∆∆l |
=
∆∆} ~
responseService∆∆ é
.∆∆é è 
mensajeRespuesta∆∆è ü
}∆∆† °
;∆∆° ¢
response
«« 
.
«« 
Entity
«« 
=
«« 
result
«« $
;
««$ %
return
…… 
response
…… 
;
…… 
}
   	
public
ŒŒ 
int
ŒŒ $
ObtenerNumeroDiaSemana
ŒŒ )
(
ŒŒ) *
string
ŒŒ* 0
	diasemana
ŒŒ1 :
)
ŒŒ: ;
{
œœ 	
int
–– 
	numerodia
–– 
=
–– 
$num
–– 
;
–– 
switch
—— 
(
—— 
	diasemana
—— 
)
—— 
{
““ 
case
”” 
$str
”” 
:
”” 
	numerodia
‘‘ 
=
‘‘ 
$num
‘‘  !
;
‘‘! "
break
’’ 
;
’’ 
case
÷÷ 
$str
÷÷ 
:
÷÷ 
	numerodia
◊◊ 
=
◊◊ 
$num
◊◊  !
;
◊◊! "
break
ÿÿ 
;
ÿÿ 
case
ŸŸ 
$str
ŸŸ  
:
ŸŸ  !
	numerodia
⁄⁄ 
=
⁄⁄ 
$num
⁄⁄  !
;
⁄⁄! "
break
€€ 
;
€€ 
case
‹‹ 
$str
‹‹ 
:
‹‹  
	numerodia
›› 
=
›› 
$num
››  !
;
››! "
break
ﬁﬁ 
;
ﬁﬁ 
case
ﬂﬂ 
$str
ﬂﬂ 
:
ﬂﬂ 
	numerodia
‡‡ 
=
‡‡ 
$num
‡‡  !
;
‡‡! "
break
·· 
;
·· 
case
‚‚ 
$str
‚‚ 
:
‚‚  
	numerodia
„„ 
=
„„ 
$num
„„  !
;
„„! "
break
‰‰ 
;
‰‰ 
case
ÂÂ 
$str
ÂÂ 
:
ÂÂ 
	numerodia
ÊÊ 
=
ÊÊ 
$num
ÊÊ  !
;
ÊÊ! "
break
ÁÁ 
;
ÁÁ 
default
ËË 
:
ËË 
	numerodia
ÈÈ 
=
ÈÈ 
-
ÈÈ  !
$num
ÈÈ! "
;
ÈÈ" #
break
ÍÍ 
;
ÍÍ 
}
ÏÏ 
return
ÓÓ 
	numerodia
ÓÓ 
;
ÓÓ 
}
ÔÔ 	
public
 

IQueryable
 
<
 
CitaCalendario
 (
>
( )#
ObtenerCitaCalendario
* ?
(
? @
int
@ C!
codigoIntermediario
D W
,
W X
DateTime
X `
fechaInicio
a l
,
l m
DateTime
m u
fechaFin
v ~
)
~ 
{
ÒÒ 	
var
ÚÚ 
result
ÚÚ 
=
ÚÚ 
(
ÚÚ% &
from
ÚÚ& *
c
ÚÚ+ ,
in
ÚÚ- /
_context
ÚÚ0 8
.
ÚÚ8 9
Citas
ÚÚ9 >
join
ÛÛ% )
	prospecto
ÛÛ* 3
in
ÛÛ4 6
_context
ÛÛ7 ?
.
ÛÛ? @

Prospectos
ÛÛ@ J
on
ÛÛK M
c
ÛÛN O
.
ÛÛO P
IdProspecto
ÛÛP [
equals
ÛÛ\ b
	prospecto
ÛÛc l
.
ÛÛl m
IdProspecto
ÛÛm x
join
ÙÙ% )
intermediario
ÙÙ* 7
in
ÙÙ8 :
_context
ÙÙ; C
.
ÙÙC D'
ConsolidadoIntermediarios
ÙÙD ]
on
ÙÙ^ `
	prospecto
ÙÙa j
.
ÙÙj k)
IdConsolidadoIntermediarioÙÙk Ö
equalsÙÙÜ å
intermediarioÙÙç ö
.ÙÙö õ*
IdConsolidadoIntermediarioÙÙõ µ
join
ıı% )
referido
ıı* 2
in
ıı3 5
_context
ıı6 >
.
ıı> ?

Prospectos
ıı? I
on
ııJ L
	prospecto
ııM V
.
ııV W
IdReferenciador
ııW f
equals
ııg m
referido
ıın v
.
ııv w
IdProspectoııw Ç
intoııÉ á!
ProspectoReferidoııà ô
from
ˆˆ% )
	preferido
ˆˆ* 3
in
ˆˆ4 6
ProspectoReferido
ˆˆ7 H
.
ˆˆH I
DefaultIfEmpty
ˆˆI W
(
ˆˆW X
)
ˆˆX Y
join
˜˜% )
	actividad
˜˜* 3
in
˜˜4 6
_context
˜˜7 ?
.
˜˜? @

Actividads
˜˜@ J
on
˜˜K M
new
˜˜N Q
{
˜˜R S
c
˜˜T U
.
˜˜U V
NumeroEntrevista
˜˜V f
,
˜˜f g
lnegocio
˜˜h p
=
˜˜q r
LineaNegocio
˜˜s 
.˜˜ Ä
Renta˜˜Ä Ö
}˜˜Ü á
equals
¯¯@ F
new
¯¯G J
{
¯¯K L
NumeroEntrevista
¯¯M ]
=
¯¯^ _
	actividad
¯¯` i
.
¯¯i j

NumeroCita
¯¯j t
,
¯¯t u
lnegocio
¯¯v ~
=¯¯ Ä
	actividad¯¯Å ä
.¯¯ä ã"
CodigoLineaNegocio¯¯ã ù
}¯¯û ü
into¯¯† §
CitaActividad¯¯• ≤
from
˘˘% )

cactividad
˘˘* 4
in
˘˘5 7
CitaActividad
˘˘8 E
.
˘˘E F
DefaultIfEmpty
˘˘F T
(
˘˘T U
)
˘˘U V
join
˙˙% )
etapa
˙˙* /
in
˙˙0 2
_context
˙˙3 ;
.
˙˙; <
TablaTablas
˙˙< G
on
˙˙H J
new
˙˙K N
{
˙˙O P

cactividad
˙˙Q [
.
˙˙[ \
CodigoEtapa
˙˙\ g
,
˙˙g h
idtablaetapa
˙˙i u
=
˙˙v w

TablaTabla˙˙x Ç
.˙˙Ç É
EtapaActivad˙˙É è
}˙˙ê ë
equals
˚˚@ F
new
˚˚G J
{
˚˚K L
CodigoEtapa
˚˚M X
=
˚˚Y Z
etapa
˚˚[ `
.
˚˚` a
CodigoCampo
˚˚a l
,
˚˚l m
idtablaetapa
˚˚n z
=
˚˚{ |
etapa˚˚} Ç
.˚˚Ç É
IdTabla˚˚É ä
}˚˚ã å
into˚˚ç ë
ActividadEtapa˚˚í †
from
¸¸% )
actividadetapa
¸¸* 8
in
¸¸9 ;
ActividadEtapa
¸¸< J
.
¸¸J K
DefaultIfEmpty
¸¸K Y
(
¸¸Y Z
)
¸¸Z [
join
˝˝% )
motivounodescarte
˝˝* ;
in
˝˝< >
_context
˝˝? G
.
˝˝G H
ListaTablas
˝˝H S
on
˝˝T V
new
˝˝W Z
{
˝˝[ \
	prospecto
˝˝] f
.
˝˝f g%
CodigoMotivoUnoDescarte
˝˝g ~
,
˝˝~ %
idtablamotivodescarte˝˝Ä ï
=˝˝ñ ó

TablaTabla˝˝ò ¢
.˝˝¢ £
MotivoDescarte˝˝£ ±
}˝˝≤ ≥
equals
˛˛A G
new
˛˛H K
{
˛˛L M%
CodigoMotivoUnoDescarte
˛˛N e
=
˛˛f g
(
˛˛h i
short
˛˛i n
?
˛˛n o
)
˛˛o p 
motivounodescarte˛˛p Å
.˛˛Å Ç
CodigoCampo˛˛Ç ç
,˛˛ç é%
idtablamotivodescarte˛˛è §
=˛˛• ¶!
motivounodescarte˛˛ß ∏
.˛˛∏ π
IdTabla˛˛π ¿
}˛˛¡ ¬
into˛˛√ «*
ProspectoMotivoUnoDescarte˛˛» ‚
from
ˇˇ% ) 
pmotivounodescarte
ˇˇ* <
in
ˇˇ= ?(
ProspectoMotivoUnoDescarte
ˇˇ@ Z
.
ˇˇZ [
DefaultIfEmpty
ˇˇ[ i
(
ˇˇi j
)
ˇˇj k
join
ÄÄ% )
motivodosdescarte
ÄÄ* ;
in
ÄÄ< >
_context
ÄÄ? G
.
ÄÄG H
ListaTablas
ÄÄH S
on
ÄÄT V
new
ÄÄW Z
{
ÄÄ[ \
	prospecto
ÄÄ] f
.
ÄÄf g%
CodigoMotivoDosDescarte
ÄÄg ~
,
ÄÄ~ %
idtablamotivodescarteÄÄÄ ï
=ÄÄñ ó

TablaTablaÄÄò ¢
.ÄÄ¢ £
MotivoDescarteÄÄ£ ±
}ÄÄ≤ ≥
equals
ÅÅI O
new
ÅÅP S
{
ÅÅT U%
CodigoMotivoDosDescarte
ÅÅV m
=
ÅÅn o
(
ÅÅp q
short
ÅÅq v
?
ÅÅv w
)
ÅÅw x 
motivodosdescarteÅÅx â
.ÅÅâ ä
CodigoCampoÅÅä ï
,ÅÅï ñ%
idtablamotivodescarteÅÅó ¨
=ÅÅ≠ Æ!
motivodosdescarteÅÅØ ¿
.ÅÅ¿ ¡
IdTablaÅÅ¡ »
}ÅÅ…  
intoÅÅÀ œ*
ProspectoMotivoDosDescarteÅÅ– Í
from
ÇÇ% ) 
pmotivodosdescarte
ÇÇ* <
in
ÇÇ= ?(
ProspectoMotivoDosDescarte
ÇÇ@ Z
.
ÇÇZ [
DefaultIfEmpty
ÇÇ[ i
(
ÇÇi j
)
ÇÇj k
join
ÉÉ% )
fuente
ÉÉ* 0
in
ÉÉ1 3
_context
ÉÉ4 <
.
ÉÉ< =
ListaTablas
ÉÉ= H
on
ÉÉI K
new
ÉÉL O
{
ÉÉP Q
	prospecto
ÉÉR [
.
ÉÉ[ \
CodigoFuente
ÉÉ\ h
,
ÉÉh i
idtablafuente
ÉÉj w
=
ÉÉx y

TablaTablaÉÉz Ñ
.ÉÉÑ Ö
FuenteProspectoÉÉÖ î
,ÉÉî ï
lnegocioÉÉñ û
=ÉÉü †
LineaNegocioÉÉ° ≠
.ÉÉ≠ Æ
RentaÉÉÆ ≥
}ÉÉ¥ µ
equals
ÑÑA G
new
ÑÑH K
{
ÑÑL M
CodigoFuente
ÑÑN Z
=
ÑÑ[ \
(
ÑÑ] ^
short
ÑÑ^ c
?
ÑÑc d
)
ÑÑd e
fuente
ÑÑe k
.
ÑÑk l
CodigoCampo
ÑÑl w
,
ÑÑw x
idtablafuenteÑÑy Ü
=ÑÑá à
fuenteÑÑâ è
.ÑÑè ê
IdTablaÑÑê ó
,ÑÑó ò
lnegocioÑÑô °
=ÑÑ¢ £
fuenteÑÑ§ ™
.ÑÑ™ ´"
CodigoLineaNegocioÑÑ´ Ω
}ÑÑæ ø
intoÑÑ¿ ƒ
ProspectoFuenteÑÑ≈ ‘
from
ÖÖ% )
pfuente
ÖÖ* 1
in
ÖÖ2 4
ProspectoFuente
ÖÖ5 D
.
ÖÖD E
DefaultIfEmpty
ÖÖE S
(
ÖÖS T
)
ÖÖT U
join
ÜÜ% )
	subfuente
ÜÜ* 3
in
ÜÜ4 6
_context
ÜÜ7 ?
.
ÜÜ? @
ListaTablas
ÜÜ@ K
on
ÜÜL N
new
ÜÜO R
{
ÜÜS T
	prospecto
ÜÜU ^
.
ÜÜ^ _
CodigoSubFuente
ÜÜ_ n
,
ÜÜn o
idtablasubfuenteÜÜp Ä
=ÜÜÅ Ç

TablaTablaÜÜÉ ç
.ÜÜç é
FuenteProspectoÜÜé ù
,ÜÜù û
lnegocioÜÜü ß
=ÜÜ® ©
LineaNegocioÜÜ™ ∂
.ÜÜ∂ ∑
RentaÜÜ∑ º
}ÜÜΩ æ
equals
ááI O
new
ááP S
{
ááT U
CodigoSubFuente
ááV e
=
ááf g
(
ááh i
short
áái n
?
áán o
)
ááo p
	subfuente
ááp y
.
ááy z
CodigoCampoááz Ö
,ááÖ Ü 
idtablasubfuenteááá ó
=ááò ô
	subfuenteááö £
.áá£ §
IdTablaáá§ ´
,áá´ ¨
lnegocioáá≠ µ
=áá∂ ∑
	subfuenteáá∏ ¡
.áá¡ ¬"
CodigoLineaNegocioáá¬ ‘
}áá’ ÷
intoáá◊ €"
ProspectoSubFuenteáá‹ Ó
from
àà% )

psubfuente
àà* 4
in
àà5 7 
ProspectoSubFuente
àà8 J
.
ààJ K
DefaultIfEmpty
ààK Y
(
ààY Z
)
ààZ [
join
ââ% )
tipocalificacion
ââ* :
in
ââ; =
_context
ââ> F
.
ââF G
TablaTablas
ââG R
on
ââS U
new
ââV Y
{
ââZ [
c
ââ\ ]
.
ââ] ^$
CodigoTipoCalificacion
ââ^ t
,
âât u&
idtablatipocalificacionââv ç
=ââé è

TablaTablaââê ö
.ââö õ 
TipoCalificacionââõ ´
}ââ¨ ≠
equals
ääI O
new
ääP S
{
ääT U$
CodigoTipoCalificacion
ääV l
=
ääm n
(
ääo p
short
ääp u
?
ääu v
)
ääv w
tipocalificacionääw á
.ääá à
CodigoCampoääà ì
,ääì î'
idtablatipocalificacionääï ¨
=ää≠ Æ 
tipocalificacionääØ ø
.ääø ¿
IdTablaää¿ «
}ää» …
intoää  Œ$
CitaTipoCalificacionääœ „
from
ãã% )
ctipocalificacion
ãã* ;
in
ãã< >"
CitaTipoCalificacion
ãã? S
.
ããS T
DefaultIfEmpty
ããT b
(
ããb c
)
ããc d
join
åå% )%
experienciacalificacion
åå* A
in
ååB D
_context
ååE M
.
ååM N
TablaTablas
ååN Y
on
ååZ \
new
åå] `
{
ååa b
c
ååc d
.
ååd e0
!CodigoTipoExperienciaCalificacionååe Ü
,ååÜ á.
idtablaexperienciacalificacionååà ¶
=ååß ®

TablaTablaåå© ≥
.åå≥ ¥'
ExperienciaCalificacionåå¥ À
}ååÃ Õ
equals
ççI O
new
ççP S
{
ççT U/
!CodigoTipoExperienciaCalificacion
ççV w
=
ççx y
(
ççz {
shortçç{ Ä
?ççÄ Å
)ççÅ Ç'
experienciacalificacionççÇ ô
.ççô ö
CodigoCampoççö •
,çç• ¶.
idtablaexperienciacalificacionççß ≈
=çç∆ «'
experienciacalificacionçç» ﬂ
.ççﬂ ‡
IdTablaçç‡ Á
}ççË È
intoççÍ Ó+
CitaExperienciaCalificacionççÔ ä
from
éé% )&
cexperienciacalificacion
éé* B
in
ééC E)
CitaExperienciaCalificacion
ééF a
.
ééa b
DefaultIfEmpty
ééb p
(
éép q
)
ééq r
join
èè% )
porcentajeavance
èè* :
in
èè; =
_context
èè> F
.
èèF G
TablaTablas
èèG R
on
èèS U
new
èèV Y
{
èèZ [
c
èè\ ]
.
èè] ^1
"CodigoPorcentajeAvanceCalificacionèè^ Ä
,èèÄ Å'
idtablaporcentajeavanceèèÇ ô
=èèö õ

TablaTablaèèú ¶
.èè¶ ß,
PorcentajeAvanceCalificacionèèß √
}èèƒ ≈
equals
êê? E
new
êêF I
{
êêJ K0
"CodigoPorcentajeAvanceCalificacion
êêL n
=
êêo p
(
êêq r
short
êêr w
?
êêw x
)
êêx y
porcentajeavanceêêy â
.êêâ ä
CodigoCampoêêä ï
,êêï ñ'
idtablaporcentajeavanceêêó Æ
=êêØ ∞ 
porcentajeavanceêê± ¡
.êê¡ ¬
IdTablaêê¬ …
}êê  À
intoêêÃ –
CitaPorcentajeêê— ﬂ
from
ëë% )
cporcentajeavance
ëë* ;
in
ëë< >
CitaPorcentaje
ëë? M
.
ëëM N
DefaultIfEmpty
ëëN \
(
ëë\ ]
)
ëë] ^
join
íí% ) 
motivonoconcretada
íí* <
in
íí= ?
_context
íí@ H
.
ííH I
TablaTablas
ííI T
on
ííU W
new
ííX [
{
íí\ ]
c
íí^ _
.
íí_ `*
CodigoMotivoCitaNoConcretada
íí` |
,
íí| }(
idtablamotivonoconcretadaíí~ ó
=ííò ô

TablaTablaííö §
.íí§ •&
MotivoCitaNoConcretadaíí• ª
}ííº Ω
equals
ìì? E
new
ììF I
{
ììJ K*
CodigoMotivoCitaNoConcretada
ììL h
=
ììi j
(
ììk l
short
ììl q
?
ììq r
)
ììr s!
motivonoconcretadaììs Ö
.ììÖ Ü
CodigoCampoììÜ ë
,ììë í)
idtablamotivonoconcretadaììì ¨
=ìì≠ Æ"
motivonoconcretadaììØ ¡
.ìì¡ ¬
IdTablaìì¬ …
}ìì  À
intoììÃ –&
CitaMotivoNoConcretadaìì— Á
from
îî% )!
cmotivonoconcretada
îî* =
in
îî> @$
CitaMotivoNoConcretada
îîA W
.
îîW X
DefaultIfEmpty
îîX f
(
îîf g
)
îîg h
join
ññ% )
motivoreagendada
ññ* :
in
ññ; =
_context
ññ> F
.
ññF G
TablaTablas
ññG R
on
ññS U
new
ññV Y
{
ññZ [
c
ññ\ ]
.
ññ] ^$
CodigoMotivoReagendado
ññ^ t
,
ññt u&
idtablamotivoreagendadaññv ç
=ññé è

TablaTablaññê ö
.ññö õ 
MotivoReagendadaññõ ´
}ññ¨ ≠
equals
óó? E
new
óóF I
{
óóJ K$
CodigoMotivoReagendado
óóL b
=
óóc d
(
óóe f
short
óóf k
?
óók l
)
óól m
motivoreagendada
óóm }
.
óó} ~
CodigoCampoóó~ â
,óóâ ä'
idtablamotivoreagendadaóóã ¢
=óó£ § 
motivoreagendadaóó• µ
.óóµ ∂
IdTablaóó∂ Ω
}óóæ ø
intoóó¿ ƒ$
CitaMotivoReagendadaóó≈ Ÿ
from
òò% )
cmotivoreagendada
òò* ;
in
òò< >"
CitaMotivoReagendada
òò? S
.
òòS T
DefaultIfEmpty
òòT b
(
òòb c
)
òòc d
join
ôô% )
distrito
ôô* 2
in
ôô3 5
_context
ôô6 >
.
ôô> ?
	Distritos
ôô? H
on
ôôI K
new
ôôL O
{
ôôP Q
c
ôôR S
.
ôôS T 
CodigoDepartamento
ôôT f
,
ôôf g
c
ôôh i
.
ôôi j
CodigoProvincia
ôôj y
,
ôôy z
c
ôô{ |
.
ôô| }
CodigoDistritoôô} ã
}ôôå ç
equals
ööA G
new
ööH K
{
ööL M 
CodigoDepartamento
ööN `
=
ööa b
(
ööc d
short
ööd i
?
ööi j
)
ööj k
distrito
öök s
.
öös t
Departamento_Idööt É
,ööÉ Ñ
CodigoProvinciaööÖ î
=ööï ñ
(ööó ò
shortööò ù
?ööù û
)ööû ü
distritoööü ß
.ööß ®
Provincia_Idöö® ¥
,öö¥ µ
CodigoDistritoöö∂ ƒ
=öö≈ ∆
(öö« »
shortöö» Õ
?ööÕ Œ
)ööŒ œ
distritoööœ ◊
.öö◊ ÿ
Distrito_Idööÿ „
}öö‰ Â
intoööÊ Í
CitaDistritoööÎ ˜
from
õõ% )
	cdistrito
õõ* 3
in
õõ4 6
CitaDistrito
õõ7 C
.
õõC D
DefaultIfEmpty
õõD R
(
õõR S
)
õõS T
join
úú% )
	provincia
úú* 3
in
úú4 6
_context
úú7 ?
.
úú? @

Provincias
úú@ J
on
úúK M
new
úúN Q
{
úúR S
c
úúT U
.
úúU V
CodigoProvincia
úúV e
,
úúe f
c
úúg h
.
úúh i 
CodigoDepartamento
úúi {
}
úú| }
equals
ùùK Q
new
ùùR U
{
ùùV W
CodigoProvincia
ùùX g
=
ùùh i
(
ùùj k
short
ùùk p
?
ùùp q
)
ùùq r
	provincia
ùùr {
.
ùù{ |
Provincia_Idùù| à
,ùùà â"
CodigoDepartamentoùùä ú
=ùùù û
(ùùü †
shortùù† •
?ùù• ¶
)ùù¶ ß
	provinciaùùß ∞
.ùù∞ ±
Departamento_Idùù± ¿
}ùù¡ ¬
intoùù√ «"
DireccionProvinciaùù» ⁄
from
ûû% )

cprovincia
ûû* 4
in
ûû5 7 
DireccionProvincia
ûû8 J
.
ûûJ K
DefaultIfEmpty
ûûK Y
(
ûûY Z
)
ûûZ [
join
üü% )
departamento
üü* 6
in
üü7 9
_context
üü: B
.
üüB C
Departamentos
üüC P
on
üüQ S
c
üüT U
.
üüU V 
CodigoDepartamento
üüV h
equals
üüi o
departamento
üüp |
.
üü| }
Departamento_Idüü} å
intoüüç ë%
DireccionDepartamentoüüí ß
from
††% )
cdepartamento
††* 7
in
††8 :#
DireccionDepartamento
††; P
.
††P Q
DefaultIfEmpty
††Q _
(
††_ `
)
††` a
where
°°% *
intermediario
°°+ 8
.
°°8 9!
CodigoIntermediario
°°9 L
==
°°M O!
codigoIntermediario
°°P c
&&
°°d f
(
¢¢+ ,
c
¢¢, -
.
¢¢- .
	FechaCita
¢¢. 7
>=
¢¢8 :
fechaInicio
¢¢; F
&&
¢¢G I
c
¢¢J K
.
¢¢K L
	FechaCita
¢¢L U
<=
¢¢V X
fechaFin
¢¢Y a
)
¢¢a b
select
££% +
new
££, /
{
§§% &
c
••) *
,
••* +
	prospecto
••+ 4
,
••4 5
intermediario
••5 B
,
••B C
	preferido
••C L
,
••L M
pfuente
••M T
,
••T U
actividadetapa
••U c
,
••c d

psubfuente
••d n
,
••n o
	cdistrito
••o x
,
••x y

cprovincia••y É
,••É Ñ
cdepartamento••Ñ ë
,••ë í

cactividad••í ú
,••ú ù
ctipocalificacion
¶¶) :
,
¶¶: ;
cporcentajeavance
¶¶; L
,
¶¶L M&
cexperienciacalificacion
¶¶M e
,
¶¶e f
cmotivoreagendada
¶¶f w
,
¶¶w x"
cmotivonoconcretada¶¶x ã
,¶¶ã å"
pmotivounodescarte¶¶å û
,¶¶û ü 
pmotivodosdescarte
ßß) ;
,
ßß; <
}
©©% &
)
™™( )
.
™™) *
AsNoTracking
™™* 6
(
™™6 7
)
™™7 8
.
™™8 9
Select
™™9 ?
(
™™? @
x
™™@ A
=>
™™B D
new
™™E H
CitaCalendario
™™I W
{
´´( )
IdCita
¨¨, 2
=
¨¨3 4
x
¨¨5 6
.
¨¨6 7
c
¨¨7 8
.
¨¨8 9
IdCita
¨¨9 ?
,
¨¨? @
IdProspecto
≠≠, 7
=
≠≠8 9
x
≠≠: ;
.
≠≠; <
	prospecto
≠≠< E
.
≠≠E F
IdProspecto
≠≠F Q
,
≠≠Q R
Nombres
ÆÆ, 3
=
ÆÆ4 5
string
ÆÆ6 <
.
ÆÆ< =
Format
ÆÆ= C
(
ÆÆC D
$str
ÆÆD Q
,
ÆÆQ R
x
ÆÆS T
.
ÆÆT U
	prospecto
ÆÆU ^
.
ÆÆ^ _
Nombres
ÆÆ_ f
,
ÆÆf g
x
ÆÆh i
.
ÆÆi j
	prospecto
ÆÆj s
.
ÆÆs t
ApellidoPaternoÆÆt É
,ÆÆÉ Ñ
xÆÆÖ Ü
.ÆÆÜ á
	prospectoÆÆá ê
.ÆÆê ë
ApellidoMaternoÆÆë †
)ÆÆ† °
,ÆÆ° ¢
TelefonoFijo
ØØ, 8
=
ØØ9 :
x
ØØ; <
.
ØØ< =
	prospecto
ØØ= F
.
ØØF G
TelefonoFijo
ØØG S
,
ØØS T
TelefonoCelular
∞∞, ;
=
∞∞< =
x
∞∞> ?
.
∞∞? @
	prospecto
∞∞@ I
.
∞∞I J
TelefonoCelular
∞∞J Y
,
∞∞Y Z
Fuente
≥≥, 2
=
≥≥3 4
string
≥≥5 ;
.
≥≥; <
Format
≥≥< B
(
≥≥B C
$str
≥≥C O
,
≥≥O P
x
≥≥P Q
.
≥≥Q R
pfuente
≥≥R Y
.
≥≥Y Z
ValorCadena
≥≥Z e
,
≥≥e f
string
≥≥f l
.
≥≥l m
IsNullOrEmpty
≥≥m z
(
≥≥z {
x
≥≥{ |
.
≥≥| }

psubfuente≥≥} á
.≥≥á à
ValorCadena≥≥à ì
)≥≥ì î
?≥≥ï ñ
$str≥≥ó ô
:≥≥ö õ
$str≥≥ú ü
+≥≥† °
x≥≥¢ £
.≥≥£ §

psubfuente≥≥§ Æ
.≥≥Æ Ø
ValorCadena≥≥Ø ∫
,≥≥∫ ª
x
¥¥D E
.
¥¥E F
	prospecto
¥¥F O
.
¥¥O P
IdReferenciador
¥¥P _
.
¥¥_ `
HasValue
¥¥` h
?
¥¥i j
x
¥¥k l
.
¥¥l m
	preferido
¥¥m v
.
¥¥v w
Nombres
¥¥w ~
+¥¥ Ä
$str¥¥Å Ñ
+¥¥Ö Ü
x¥¥á à
.¥¥à â
	preferido¥¥â í
.¥¥í ì
ApellidoPaterno¥¥ì ¢
+¥¥£ §
$str¥¥• ®
+¥¥© ™
x¥¥´ ¨
.¥¥¨ ≠
	preferido¥¥≠ ∂
.¥¥∂ ∑
ApellidoMaterno¥¥∑ ∆
:¥¥« »
x¥¥…  
.¥¥  À
	prospecto¥¥À ‘
.¥¥‘ ’
Referenciador¥¥’ ‚
)¥¥‚ „
,¥¥„ ‰

Descartado
µµ, 6
=
µµ7 8
x
µµ9 :
.
µµ: ;
	prospecto
µµ; D
.
µµD E
FlagDescarte
µµE Q
.
µµQ R
Value
µµR W
,
µµW X!
TextoMotivoDescarte
∂∂, ?
=
∂∂@ A
string
∂∂B H
.
∂∂H I
IsNullOrEmpty
∂∂I V
(
∂∂V W
x
∂∂W X
.
∂∂X Y 
pmotivodosdescarte
∂∂Y k
.
∂∂k l
ValorCadena
∂∂l w
)
∂∂w x
?
∂∂y z
x
∂∂{ |
.
∂∂| }!
pmotivounodescarte∂∂} è
.∂∂è ê
ValorCadena∂∂ê õ
:
∑∑J K
string
∑∑L R
.
∑∑R S
Format
∑∑S Y
(
∑∑Y Z
$str
∑∑Z c
,
∑∑c d
x
∑∑e f
.
∑∑f g 
pmotivounodescarte
∑∑g y
.
∑∑y z
ValorCadena∑∑z Ö
,∑∑Ö Ü
x∑∑á à
.∑∑à â"
pmotivodosdescarte∑∑â õ
.∑∑õ ú
ValorCadena∑∑ú ß
)∑∑ß ®
,∑∑® ©
FechaDescarte
∏∏, 9
=
∏∏: ;
x
∏∏< =
.
∏∏= >
	prospecto
∏∏> G
.
∏∏G H%
FechaMotivoTresDescarte
∏∏H _
.
∏∏_ `
Value
∏∏` e
,
∏∏e f
Etapa
∫∫, 1
=
∫∫2 3
string
∫∫4 :
.
∫∫: ;
IsNullOrEmpty
∫∫; H
(
∫∫H I
x
∫∫I J
.
∫∫J K
actividadetapa
∫∫K Y
.
∫∫Y Z
ValorCadena
∫∫Z e
)
∫∫e f
?
∫∫g h
$str
∫∫i z
:
∫∫{ |
x
∫∫} ~
.
∫∫~ 
actividadetapa∫∫ ç
.∫∫ç é
ValorCadena∫∫é ô
,∫∫ô ö
	FechaCita
ªª, 5
=
ªª6 7
x
ªª8 9
.
ªª9 :
c
ªª: ;
.
ªª; <
	FechaCita
ªª< E
.
ªªE F
Value
ªªF K
,
ªªK L
NumeroEntrevista
ºº, <
=
ºº= >
x
ºº? @
.
ºº@ A
c
ººA B
.
ººB C
NumeroEntrevista
ººC S
,
ººS T

HoraInicio
ΩΩ, 6
=
ΩΩ7 8
x
ΩΩ9 :
.
ΩΩ: ;
c
ΩΩ; <
.
ΩΩ< =

HoraInicio
ΩΩ= G
.
ΩΩG H
Value
ΩΩH M
.
ΩΩM N
ToString
ΩΩN V
(
ΩΩV W
$str
ΩΩW `
)
ΩΩ` a
,
ΩΩa b
HoraFin
ææ, 3
=
ææ4 5
x
ææ6 7
.
ææ7 8
c
ææ8 9
.
ææ9 :
HoraFin
ææ: A
.
ææA B
Value
ææB G
.
ææG H
ToString
ææH P
(
ææP Q
$str
ææQ Z
)
ææZ [
,
ææ[ \
	Ubicacion
øø, 5
=
øø6 7
x
øø8 9
.
øø9 :
c
øø: ;
.
øø; <
	Ubicacion
øø< E
,
øøE F 
CodigoDepartamento
¿¿, >
=
¿¿? @
x
¿¿A B
.
¿¿B C
c
¿¿C D
.
¿¿D E 
CodigoDepartamento
¿¿E W
,
¿¿W X
CodigoProvincia
¡¡, ;
=
¡¡< =
x
¡¡> ?
.
¡¡? @
c
¡¡@ A
.
¡¡A B
CodigoProvincia
¡¡B Q
,
¡¡Q R
CodigoDistrito
¬¬, :
=
¬¬; <
x
¬¬= >
.
¬¬> ?
c
¬¬? @
.
¬¬@ A
CodigoDistrito
¬¬A O
,
¬¬O P
Departamento
√√, 8
=
√√9 :
x
√√; <
.
√√< =
cdepartamento
√√= J
.
√√J K
Nombre
√√K Q
,
√√Q R
	Provincia
ƒƒ, 5
=
ƒƒ6 7
x
ƒƒ8 9
.
ƒƒ9 :

cprovincia
ƒƒ: D
.
ƒƒD E
Nombre
ƒƒE K
,
ƒƒK L
Distrito
≈≈, 4
=
≈≈5 6
x
≈≈7 8
.
≈≈8 9
	cdistrito
≈≈9 B
.
≈≈B C
Nombre
≈≈C I
,
≈≈I J!
CorreoElectronicoGA
∆∆, ?
=
∆∆@ A
x
∆∆B C
.
∆∆C D
c
∆∆D E
.
∆∆E F
FlagInvitadoGA
∆∆F T
.
∆∆T U
Value
∆∆U Z
?
∆∆[ \
x
∆∆] ^
.
∆∆^ _
intermediario
∆∆_ l
.
∆∆l m"
CorreoElectronicoGA∆∆m Ä
:∆∆Å Ç
$str∆∆É Ö
,∆∆Ö Ü
NombreGA
««, 4
=
««5 6
x
««7 8
.
««8 9
intermediario
««9 F
.
««F G
NombreGA
««G O
,
««O P!
CorreoElectronicoGU
»», ?
=
»»@ A
x
»»B C
.
»»C D
c
»»D E
.
»»E F
FlagInvitadoGU
»»F T
.
»»T U
Value
»»U Z
?
»»[ \
x
»»] ^
.
»»^ _
intermediario
»»_ l
.
»»l m"
CorreoElectronicoGU»»m Ä
:»»Å Ç
$str»»É Ö
,»»Ö Ü
NombreGU
……, 4
=
……5 6
x
……7 8
.
……8 9
intermediario
……9 F
.
……F G
NombreGU
……G O
,
……O P
Descripcion
  , 7
=
  8 9
x
  : ;
.
  ; <
c
  < =
.
  = >
Descripcion
  > I
,
  I J
Recordatorio
ÀÀ, 8
=
ÀÀ9 :
x
ÀÀ; <
.
ÀÀ< =
c
ÀÀ= >
.
ÀÀ> ? 
AlertaMinutosAntes
ÀÀ? Q
.
ÀÀQ R
Value
ÀÀR W
,
ÀÀW X
Fecha
ÃÃ, 1
=
ÃÃ2 3
x
ÃÃ4 5
.
ÃÃ5 6
c
ÃÃ6 7
.
ÃÃ7 8
	FechaCita
ÃÃ8 A
.
ÃÃA B
Value
ÃÃB G
,
ÃÃG H
EtiquetaColor
ÕÕ, 9
=
ÕÕ: ;
string
ÕÕ< B
.
ÕÕB C
IsNullOrEmpty
ÕÕC P
(
ÕÕP Q
x
ÕÕQ R
.
ÕÕR S

cactividad
ÕÕS ]
.
ÕÕ] ^
Etiqueta
ÕÕ^ f
)
ÕÕf g
?
ÕÕh i
$str
ÕÕj r
:
ÕÕs t
x
ÕÕu v
.
ÕÕv w

cactividadÕÕw Å
.ÕÕÅ Ç
EtiquetaÕÕÇ ä
,ÕÕä ã
TieneCalificacion
ŒŒ, =
=
ŒŒ> ?
x
ŒŒ@ A
.
ŒŒA B
c
ŒŒB C
.
ŒŒC D
FlagCalificacion
ŒŒD T
.
ŒŒT U
Value
ŒŒU Z
,
ŒŒZ [
TipoCalificacion
œœ, <
=
œœ= >
x
œœ? @
.
œœ@ A
ctipocalificacion
œœA R
.
œœR S
ValorCadena
œœS ^
,
œœ^ _$
CodigoTipoCalificacion
––, B
=
––C D
x
––E F
.
––F G
ctipocalificacion
––G X
.
––X Y
CodigoCampo
––Y d
,
––d e
CalificacionCita
——, <
=
——= >
x
——? @
.
——@ A&
cexperienciacalificacion
——A Y
.
——Y Z
ValorCadena
——Z e
,
——e f$
ComentarioCalificacion
““, B
=
““C D
x
““E F
.
““F G
c
““G H
.
““H I$
ComentarioCalificacion
““I _
,
““_ ` 
ProbabilidadCierre
””, >
=
””? @
x
””A B
.
””B C
cporcentajeavance
””C T
.
””T U
ValorCadena
””U `
,
””` a
PorcentajeAvance
‘‘, <
=
‘‘= >
(
‘‘? @
int
‘‘@ C
)
‘‘C D
x
‘‘D E
.
‘‘E F
cporcentajeavance
‘‘F W
.
‘‘W X
ValorNumerico
‘‘X e
,
‘‘e f&
PorcentajeAvanceAnterior
’’, D
=
’’E F
(
’’G H
int
’’H K
)
’’K L
(
’’L M
(
’’M N
(
’’N O
from
’’O S
citamax
’’T [
in
’’\ ^
_context
’’_ g
.
’’g h
Citas
’’h m
join
÷÷H L
porcentajeavance
÷÷M ]
in
÷÷^ `
_context
÷÷a i
.
÷÷i j
TablaTablas
÷÷j u
on
÷÷v x
new
÷÷y |
{
÷÷} ~
citamax÷÷ Ü
.÷÷Ü á2
"CodigoPorcentajeAvanceCalificacion÷÷á ©
,÷÷© ™'
idtablaporcentajeavance÷÷´ ¬
=÷÷√ ƒ

TablaTabla÷÷≈ œ
.÷÷œ –,
PorcentajeAvanceCalificacion÷÷– Ï
}÷÷Ì Ó
equals
◊◊H N
new
◊◊O R
{
◊◊S T0
"CodigoPorcentajeAvanceCalificacion
◊◊U w
=
◊◊x y
(
◊◊z {
short◊◊{ Ä
?◊◊Ä Å
)◊◊Å Ç 
porcentajeavance◊◊Ç í
.◊◊í ì
CodigoCampo◊◊ì û
,◊◊û ü'
idtablaporcentajeavance◊◊† ∑
=◊◊∏ π 
porcentajeavance◊◊∫  
.◊◊  À
IdTabla◊◊À “
}◊◊” ‘
into◊◊’ Ÿ!
CitaMaxPorcentaje◊◊⁄ Î
from
ÿÿH L%
citamaxporcentajeavance
ÿÿM d
in
ÿÿe g
CitaMaxPorcentaje
ÿÿh y
.
ÿÿy z
DefaultIfEmptyÿÿz à
(ÿÿà â
)ÿÿâ ä
where
ŸŸH M
citamax
ŸŸN U
.
ŸŸU V
IdProspecto
ŸŸV a
==
ŸŸb d
x
ŸŸe f
.
ŸŸf g
c
ŸŸg h
.
ŸŸh i
IdProspecto
ŸŸi t
select
⁄⁄H N
new
⁄⁄O R
{
⁄⁄S T
citamax
⁄⁄U \
,
⁄⁄\ ]%
citamaxporcentajeavance
⁄⁄] t
}
⁄⁄t u
)
€€H I
.
€€I J
GroupBy
€€J Q
(
€€Q R
x
€€R S
=>
€€T V
new
€€W Z
{
€€[ \
x
€€] ^
.
€€^ _
citamax
€€_ f
.
€€f g
IdProspecto
€€g r
}
€€r s
)
€€s t
.
‹‹H I
Select
‹‹I O
(
‹‹O P
y
‹‹P Q
=>
‹‹R T
new
‹‹U X
{
‹‹Y Z
PorcentajeMaximo
››L \
=
››] ^
y
››_ `
.
››` a
Max
››a d
(
››d e
x
››e f
=>
››g i
x
››j k
.
››k l&
citamaxporcentajeavance››l É
.››É Ñ
ValorNumerico››Ñ ë
.››ë í
Value››í ó
)››ó ò
}
ﬁﬁH I
)
ﬁﬁI J
)
ﬁﬁJ K
.
ﬁﬁK L
First
ﬁﬁL Q
(
ﬁﬁQ R
)
ﬁﬁR S
.
ﬁﬁS T
PorcentajeMaximo
ﬁﬁT d
)
ﬁﬁd e
,
ﬁﬁe f 
MotivoNoConcretada
ﬂﬂ, >
=
ﬂﬂ? @
x
ﬂﬂA B
.
ﬂﬂB C!
cmotivonoconcretada
ﬂﬂC V
.
ﬂﬂV W
ValorCadena
ﬂﬂW b
,
ﬂﬂb c!
FechaEstimadaCierre
‡‡, ?
=
‡‡@ A
x
‡‡B C
.
‡‡C D
c
‡‡D E
.
‡‡E F!
FechaEstimadaCierre
‡‡F Y
.
‡‡Y Z
Value
‡‡Z _
,
‡‡_ `
	Cancelada
··, 5
=
··6 7
(
··8 9
x
··9 :
.
··: ;
c
··; <
.
··< =$
CodigoMotivoReagendado
··= S
==
··T V
$num
··W X
||
··Y [
x
··\ ]
.
··] ^
c
··^ _
.
··_ `$
CodigoMotivoReagendado
··` v
==
··w y
$num
··z {
)
··{ |
,
··| }
MotivoCancelada
‚‚, ;
=
‚‚< =
x
‚‚> ?
.
‚‚? @
cmotivoreagendada
‚‚@ Q
.
‚‚Q R
ValorCadena
‚‚R ]
,
‚‚] ^
FlagUrlTeams
„„, 8
=
„„9 :
x
„„; <
.
„„< =
c
„„= >
.
„„> ?
FlagUrlTeams
„„? K
.
„„K L
Value
„„L Q
,
„„Q R
UrlTeams
‰‰, 4
=
‰‰5 6
x
‰‰7 8
.
‰‰8 9
c
‰‰9 :
.
‰‰: ;
UrlTeams
‰‰; C
}
ÂÂ( )
)
ÂÂ) *
;
ÂÂ* +
return
ÁÁ 
result
ÁÁ 
;
ÁÁ 
}
ËË 	
public
ÈÈ 

IQueryable
ÈÈ 
<
ÈÈ +
RecordatorioLlamadaCalendario
ÈÈ 8
>
ÈÈ8 92
$ObtenerRecordatorioLlamadaCalendario
ÈÈ: ^
(
ÈÈ^ _
int
ÈÈ_ b!
codigoIntermediario
ÈÈc v
,
ÈÈv w
DateTimeÈÈx Ä
fechaInicioÈÈÅ å
,ÈÈå ç
DateTimeÈÈé ñ
fechaFinÈÈó ü
)ÈÈü †
{
ÍÍ 	
var
ÎÎ 
result
ÎÎ 
=
ÎÎ 
(
ÎÎ  !
from
ÎÎ! %
r
ÎÎ& '
in
ÎÎ( *
_context
ÎÎ+ 3
.
ÎÎ3 4"
RecordatorioLlamadas
ÎÎ4 H
join
ÏÏ  $
	prospecto
ÏÏ% .
in
ÏÏ/ 1
_context
ÏÏ2 :
.
ÏÏ: ;

Prospectos
ÏÏ; E
on
ÏÏF H
r
ÏÏI J
.
ÏÏJ K
IdProspecto
ÏÏK V
equals
ÏÏW ]
	prospecto
ÏÏ^ g
.
ÏÏg h
IdProspecto
ÏÏh s
join
ÌÌ  $
intermediario
ÌÌ% 2
in
ÌÌ3 5
_context
ÌÌ6 >
.
ÌÌ> ?'
ConsolidadoIntermediarios
ÌÌ? X
on
ÌÌY [
	prospecto
ÌÌ\ e
.
ÌÌe f)
IdConsolidadoIntermediarioÌÌf Ä
equalsÌÌÅ á
intermediarioÌÌà ï
.ÌÌï ñ*
IdConsolidadoIntermediarioÌÌñ ∞
join
ÓÓ  $
referido
ÓÓ% -
in
ÓÓ. 0
_context
ÓÓ1 9
.
ÓÓ9 :

Prospectos
ÓÓ: D
on
ÓÓE G
	prospecto
ÓÓH Q
.
ÓÓQ R
IdReferenciador
ÓÓR a
equals
ÓÓb h
referido
ÓÓi q
.
ÓÓq r
IdProspecto
ÓÓr }
intoÓÓ~ Ç!
ProspectoReferidoÓÓÉ î
from
ÔÔ  $
	preferido
ÔÔ% .
in
ÔÔ/ 1
ProspectoReferido
ÔÔ2 C
.
ÔÔC D
DefaultIfEmpty
ÔÔD R
(
ÔÔR S
)
ÔÔS T
join
  $
motivounodescarte
% 6
in
7 9
_context
: B
.
B C
ListaTablas
C N
on
O Q
new
R U
{
V W
	prospecto
X a
.
a b%
CodigoMotivoUnoDescarte
b y
,
y z$
idtablamotivodescarte{ ê
=ë í

TablaTablaì ù
.ù û
MotivoDescarteû ¨
}≠ Æ
equals
ÒÒ< B
new
ÒÒC F
{
ÒÒG H%
CodigoMotivoUnoDescarte
ÒÒI `
=
ÒÒa b
(
ÒÒc d
short
ÒÒd i
?
ÒÒi j
)
ÒÒj k
motivounodescarte
ÒÒk |
.
ÒÒ| }
CodigoCampoÒÒ} à
,ÒÒà â%
idtablamotivodescarteÒÒä ü
=ÒÒ† °!
motivounodescarteÒÒ¢ ≥
.ÒÒ≥ ¥
IdTablaÒÒ¥ ª
}ÒÒº Ω
intoÒÒæ ¬*
ProspectoMotivoUnoDescarteÒÒ√ ›
from
ÚÚ  $ 
pmotivounodescarte
ÚÚ% 7
in
ÚÚ8 :(
ProspectoMotivoUnoDescarte
ÚÚ; U
.
ÚÚU V
DefaultIfEmpty
ÚÚV d
(
ÚÚd e
)
ÚÚe f
join
ÛÛ  $
motivodosdescarte
ÛÛ% 6
in
ÛÛ7 9
_context
ÛÛ: B
.
ÛÛB C
ListaTablas
ÛÛC N
on
ÛÛO Q
new
ÛÛR U
{
ÛÛV W
	prospecto
ÛÛX a
.
ÛÛa b%
CodigoMotivoDosDescarte
ÛÛb y
,
ÛÛy z$
idtablamotivodescarteÛÛ{ ê
=ÛÛë í

TablaTablaÛÛì ù
.ÛÛù û
MotivoDescarteÛÛû ¨
}ÛÛ≠ Æ
equals
ÙÙD J
new
ÙÙK N
{
ÙÙO P%
CodigoMotivoDosDescarte
ÙÙQ h
=
ÙÙi j
(
ÙÙk l
short
ÙÙl q
?
ÙÙq r
)
ÙÙr s 
motivodosdescarteÙÙs Ñ
.ÙÙÑ Ö
CodigoCampoÙÙÖ ê
,ÙÙê ë%
idtablamotivodescarteÙÙí ß
=ÙÙ® ©!
motivodosdescarteÙÙ™ ª
.ÙÙª º
IdTablaÙÙº √
}ÙÙƒ ≈
intoÙÙ∆  *
ProspectoMotivoDosDescarteÙÙÀ Â
from
ıı  $ 
pmotivodosdescarte
ıı% 7
in
ıı8 :(
ProspectoMotivoDosDescarte
ıı; U
.
ııU V
DefaultIfEmpty
ııV d
(
ııd e
)
ııe f
join
ˆˆ  $
fuente
ˆˆ% +
in
ˆˆ, .
_context
ˆˆ/ 7
.
ˆˆ7 8
ListaTablas
ˆˆ8 C
on
ˆˆD F
new
ˆˆG J
{
ˆˆK L
	prospecto
ˆˆM V
.
ˆˆV W
CodigoFuente
ˆˆW c
,
ˆˆc d
idtablafuente
ˆˆe r
=
ˆˆs t

TablaTabla
ˆˆu 
.ˆˆ Ä
FuenteProspectoˆˆÄ è
,ˆˆè ê
lnegocioˆˆë ô
=ˆˆö õ
LineaNegocioˆˆú ®
.ˆˆ® ©
Rentaˆˆ© Æ
}ˆˆØ ∞
equals
˜˜< B
new
˜˜C F
{
˜˜G H
CodigoFuente
˜˜I U
=
˜˜V W
(
˜˜X Y
short
˜˜Y ^
?
˜˜^ _
)
˜˜_ `
fuente
˜˜` f
.
˜˜f g
CodigoCampo
˜˜g r
,
˜˜r s
idtablafuente˜˜t Å
=˜˜Ç É
fuente˜˜Ñ ä
.˜˜ä ã
IdTabla˜˜ã í
,˜˜í ì
lnegocio˜˜î ú
=˜˜ù û
fuente˜˜ü •
.˜˜• ¶"
CodigoLineaNegocio˜˜¶ ∏
}˜˜π ∫
into˜˜ª ø
ProspectoFuente˜˜¿ œ
from
¯¯  $
pfuente
¯¯% ,
in
¯¯- /
ProspectoFuente
¯¯0 ?
.
¯¯? @
DefaultIfEmpty
¯¯@ N
(
¯¯N O
)
¯¯O P
join
˘˘  $
	subfuente
˘˘% .
in
˘˘/ 1
_context
˘˘2 :
.
˘˘: ;
ListaTablas
˘˘; F
on
˘˘G I
new
˘˘J M
{
˘˘N O
	prospecto
˘˘P Y
.
˘˘Y Z
CodigoSubFuente
˘˘Z i
,
˘˘i j
idtablasubfuente
˘˘k {
=
˘˘| }

TablaTabla˘˘~ à
.˘˘à â
FuenteProspecto˘˘â ò
,˘˘ò ô
lnegocio˘˘ö ¢
=˘˘£ §
LineaNegocio˘˘• ±
.˘˘± ≤
Renta˘˘≤ ∑
}˘˘∏ π
equals
˙˙D J
new
˙˙K N
{
˙˙O P
CodigoSubFuente
˙˙Q `
=
˙˙a b
(
˙˙c d
short
˙˙d i
?
˙˙i j
)
˙˙j k
	subfuente
˙˙k t
.
˙˙t u
CodigoCampo˙˙u Ä
,˙˙Ä Å 
idtablasubfuente˙˙Ç í
=˙˙ì î
	subfuente˙˙ï û
.˙˙û ü
IdTabla˙˙ü ¶
,˙˙¶ ß
lnegocio˙˙® ∞
=˙˙± ≤
	subfuente˙˙≥ º
.˙˙º Ω"
CodigoLineaNegocio˙˙Ω œ
}˙˙– —
into˙˙“ ÷"
ProspectoSubFuente˙˙◊ È
from
˚˚  $

psubfuente
˚˚% /
in
˚˚0 2 
ProspectoSubFuente
˚˚3 E
.
˚˚E F
DefaultIfEmpty
˚˚F T
(
˚˚T U
)
˚˚U V
join
¸¸  $
lineanegocio
¸¸% 1
in
¸¸2 4
_context
¸¸5 =
.
¸¸= >
TablaTablas
¸¸> I
on
¸¸J L
new
¸¸M P
{
¸¸Q R
r
¸¸S T
.
¸¸T U 
CodigoLineaNegocio
¸¸U g
,
¸¸g h!
idtablalineanegocio
¸¸i |
=
¸¸} ~

TablaTabla¸¸ â
.¸¸â ä
LineaNegocio¸¸ä ñ
}¸¸ó ò
equals
˝˝B H
new
˝˝I L
{
˝˝M N 
CodigoLineaNegocio
˝˝O a
=
˝˝b c
(
˝˝d e
short
˝˝e j
?
˝˝j k
)
˝˝k l
lineanegocio
˝˝l x
.
˝˝x y
CodigoCampo˝˝y Ñ
,˝˝Ñ Ö#
idtablalineanegocio˝˝Ü ô
=˝˝ö õ
lineanegocio˝˝ú ®
.˝˝® ©
IdTabla˝˝© ∞
}˝˝± ≤
into˝˝≥ ∑%
ProspectoLineaNegocio˝˝∏ Õ
from
˛˛  $
plineanegocio
˛˛% 2
in
˛˛3 5#
ProspectoLineaNegocio
˛˛6 K
.
˛˛K L
DefaultIfEmpty
˛˛L Z
(
˛˛Z [
)
˛˛[ \
where
ˇˇ  %
intermediario
ˇˇ& 3
.
ˇˇ3 4!
CodigoIntermediario
ˇˇ4 G
==
ˇˇH J!
codigoIntermediario
ˇˇK ^
&&
ˇˇ_ a
(
ÄÄ& '
r
ÄÄ' (
.
ÄÄ( )
FechaRecordatorio
ÄÄ) :
.
ÄÄ: ;
Date
ÄÄ; ?
>=
ÄÄ@ B
fechaInicio
ÄÄC N
&&
ÄÄO Q
r
ÄÄR S
.
ÄÄS T
FechaRecordatorio
ÄÄT e
.
ÄÄe f
Date
ÄÄf j
<=
ÄÄk m
fechaFin
ÄÄn v
)
ÄÄv w
select
ÅÅ  &
new
ÅÅ' *
{
ÇÇ  !
r
ÉÉ$ %
,
ÉÉ% &
	prospecto
ÑÑ$ -
,
ÑÑ- .
	preferido
ÖÖ$ -
,
ÖÖ- .
intermediario
ÜÜ$ 1
,
ÜÜ1 2
pfuente
áá$ +
,
áá+ ,

psubfuente
àà$ .
,
àà. /
plineanegocio
ââ$ 1
,
ââ1 2 
pmotivounodescarte
ää$ 6
,
ää6 7 
pmotivodosdescarte
ãã$ 6
,
ãã6 7
}
çç  !
)
éé( )
.
éé) *
AsNoTracking
éé* 6
(
éé6 7
)
éé7 8
.
éé8 9
Select
éé9 ?
(
éé? @
x
éé@ A
=>
ééB D
new
ééE H+
RecordatorioLlamadaCalendario
ééI f
{
èè( )#
IdRecordatorioLlamada
êê, A
=
êêB C
x
êêD E
.
êêE F
r
êêF G
.
êêG H#
IdRecordatorioLlamada
êêH ]
,
êê] ^
IdProspecto
ëë, 7
=
ëë8 9
x
ëë: ;
.
ëë; <
	prospecto
ëë< E
.
ëëE F
IdProspecto
ëëF Q
,
ëëQ R
Nombres
íí, 3
=
íí4 5
string
íí6 <
.
íí< =
Format
íí= C
(
ííC D
$str
ííD Q
,
ííQ R
x
ííS T
.
ííT U
	prospecto
ííU ^
.
íí^ _
Nombres
íí_ f
,
ííf g
x
ííh i
.
ííi j
	prospecto
ííj s
.
íís t
ApellidoPaternoíít É
,ííÉ Ñ
xííÖ Ü
.ííÜ á
	prospectoííá ê
.ííê ë
ApellidoMaternoííë †
)íí† °
,íí° ¢
TelefonoFijo
ìì, 8
=
ìì9 :
x
ìì; <
.
ìì< =
	prospecto
ìì= F
.
ììF G
TelefonoFijo
ììG S
,
ììS T
TelefonoCelular
îî, ;
=
îî< =
x
îî> ?
.
îî? @
	prospecto
îî@ I
.
îîI J
TelefonoCelular
îîJ Y
,
îîY Z
Fuente
ïï, 2
=
ïï3 4
string
ïï5 ;
.
ïï; <
Format
ïï< B
(
ïïB C
$str
ïïC K
,
ïïK L
x
ïïL M
.
ïïM N
pfuente
ïïN U
.
ïïU V
ValorCadena
ïïV a
,
ïïa b
string
ïïb h
.
ïïh i
IsNullOrEmpty
ïïi v
(
ïïv w
x
ïïw x
.
ïïx y

psubfuenteïïy É
.ïïÉ Ñ
ValorCadenaïïÑ è
)ïïè ê
?ïïë í
$strïïì ï
:ïïñ ó
$strïïò õ
+ïïú ù
xïïû ü
.ïïü †

psubfuenteïï† ™
.ïï™ ´
ValorCadenaïï´ ∂
)ïï∂ ∑
,ïï∑ ∏
Referenciador
ññ, 9
=
ññ: ;
string
ññ< B
.
ññB C
IsNullOrEmpty
ññC P
(
ññP Q
x
ññQ R
.
ññR S
	prospecto
ññS \
.
ññ\ ]
Referenciador
ññ] j
)
ññj k
?
óó< =
string
óó? E
.
óóE F
Format
óóF L
(
óóL M
$str
óóM Z
,
óóZ [
x
óó\ ]
.
óó] ^
	preferido
óó^ g
.
óóg h
Nombres
óóh o
,
óóo p
x
óóp q
.
óóq r
	preferido
óór {
.
óó{ |
ApellidoPaternoóó| ã
,óóã å
xóóå ç
.óóç é
	preferidoóóé ó
.óóó ò
ApellidoMaternoóóò ß
)óóß ®
:óó© ™
xóó´ ¨
.óó¨ ≠
	prospectoóó≠ ∂
.óó∂ ∑
Referenciadoróó∑ ƒ
,óóƒ ≈

HoraInicio
òò, 6
=
òò7 8
x
òò9 :
.
òò: ;
r
òò; <
.
òò< =

HoraInicio
òò= G
.
òòG H
Value
òòH M
.
òòM N
ToString
òòN V
(
òòV W
$str
òòW `
)
òò` a
,
òòa b
HoraFin
ôô, 3
=
ôô4 5
x
ôô6 7
.
ôô7 8
r
ôô8 9
.
ôô9 :
HoraFin
ôô: A
.
ôôA B
Value
ôôB G
.
ôôG H
ToString
ôôH P
(
ôôP Q
$str
ôôQ Z
)
ôôZ [
,
ôô[ \
Fecha
öö, 1
=
öö2 3
x
öö4 5
.
öö5 6
r
öö6 7
.
öö7 8
FechaRecordatorio
öö8 I
.
ööI J
Date
ööJ N
,
ööN O
Descripcion
õõ, 7
=
õõ8 9
x
õõ: ;
.
õõ; <
r
õõ< =
.
õõ= >
Descripcion
õõ> I
,
õõI J
Producto
úú, 4
=
úú5 6
x
úú7 8
.
úú8 9
plineanegocio
úú9 F
.
úúF G
ValorCadena
úúG R
,
úúR S

Descartado
ùù, 6
=
ùù7 8
x
ùù9 :
.
ùù: ;
	prospecto
ùù; D
.
ùùD E
FlagDescarte
ùùE Q
.
ùùQ R
Value
ùùR W
,
ùùW X!
TextoMotivoDescarte
ûû, ?
=
ûû@ A
string
ûûB H
.
ûûH I
IsNullOrEmpty
ûûI V
(
ûûV W
x
ûûW X
.
ûûX Y 
pmotivodosdescarte
ûûY k
.
ûûk l
ValorCadena
ûûl w
)
ûûw x
?
ûûy z
x
ûû{ |
.
ûû| }!
pmotivounodescarteûû} è
.ûûè ê
ValorCadenaûûê õ
:
üüJ K
string
üüL R
.
üüR S
Format
üüS Y
(
üüY Z
$str
üüZ c
,
üüc d
x
üüe f
.
üüf g 
pmotivounodescarte
üüg y
.
üüy z
ValorCadenaüüz Ö
,üüÖ Ü
xüüá à
.üüà â"
pmotivodosdescarteüüâ õ
.üüõ ú
ValorCadenaüüú ß
)üüß ®
,üü® ©
FechaDescarte
††, 9
=
††: ;
x
††< =
.
††= >
	prospecto
††> G
.
††G H%
FechaMotivoTresDescarte
††H _
.
††_ `
Value
††` e
,
††e f
Activo
°°, 2
=
°°3 4
x
°°5 6
.
°°6 7
r
°°7 8
.
°°8 9

FlagActivo
°°9 C
.
°°C D
Value
°°D I
}
¢¢( )
)
¢¢) *
;
¢¢* +
return
££ 
result
££ 
;
££ 
}
§§ 	
public
•• 

IQueryable
•• 
<
•• 
ReunionCalendario
•• +
>
••+ ,&
ObtenerReunionCalendario
••- E
(
••E F
int
••F I!
codigoIntermediario
••J ]
,
••] ^
DateTime
••_ g
fechaInicio
••h s
,
••s t
DateTime
••u }
fechaFin••~ Ü
)••Ü á
{
¶¶ 	
var
ßß 
result
ßß 
=
ßß 
(
ßß  !
from
ßß! %
r
ßß& '
in
ßß( *
_context
ßß+ 3
.
ßß3 4
Reunions
ßß4 <
join
®®  $
intermediario
®®% 2
in
®®3 5
_context
®®6 >
.
®®> ?'
ConsolidadoIntermediarios
®®? X
on
®®Y [
r
®®\ ]
.
®®] ^(
IdConsolidadoIntermediario
®®^ x
equals
®®y 
intermediario®®Ä ç
.®®ç é*
IdConsolidadoIntermediario®®é ®
join
©©  $
tiporeunion
©©% 0
in
©©1 3
_context
©©4 <
.
©©< =
TablaTablas
©©= H
on
©©I K
new
©©L O
{
©©P Q
r
©©R S
.
©©S T
CodigoTipoReunion
©©T e
,
©©e f 
idtablatiporeunion
©©g y
=
©©z {

TablaTabla©©| Ü
.©©Ü á
TipoReunion©©á í
}©©ì î
equals
™™D J
new
™™K N
{
™™O P
CodigoTipoReunion
™™Q b
=
™™c d
(
™™e f
short
™™f k
?
™™k l
)
™™l m
tiporeunion
™™m x
.
™™x y
CodigoCampo™™y Ñ
,™™Ñ Ö"
idtablatiporeunion™™Ü ò
=™™ô ö
tiporeunion™™õ ¶
.™™¶ ß
IdTabla™™ß Æ
}™™Ø ∞
into™™± µ"
ReunionTipoReunion™™∂ »
from
´´  $
rtiporeunion
´´% 1
in
´´2 4 
ReunionTipoReunion
´´5 G
.
´´G H
DefaultIfEmpty
´´H V
(
´´V W
)
´´W X
join
¨¨  $
distrito
¨¨% -
in
¨¨. 0
_context
¨¨1 9
.
¨¨9 :
	Distritos
¨¨: C
on
¨¨D F
new
¨¨G J
{
¨¨K L
r
¨¨M N
.
¨¨N O 
CodigoDepartamento
¨¨O a
,
¨¨a b
r
¨¨c d
.
¨¨d e
CodigoProvincia
¨¨e t
,
¨¨t u
r
¨¨v w
.
¨¨w x
CodigoDistrito¨¨x Ü
}¨¨á à
equals
≠≠A G
new
≠≠H K
{
≠≠L M 
CodigoDepartamento
≠≠N `
=
≠≠a b
(
≠≠c d
short
≠≠d i
?
≠≠i j
)
≠≠j k
distrito
≠≠k s
.
≠≠s t
Departamento_Id≠≠t É
,≠≠É Ñ
CodigoProvincia≠≠Ö î
=≠≠ï ñ
(≠≠ó ò
short≠≠ò ù
?≠≠ù û
)≠≠û ü
distrito≠≠ü ß
.≠≠ß ®
Provincia_Id≠≠® ¥
,≠≠¥ µ
CodigoDistrito≠≠∂ ƒ
=≠≠≈ ∆
(≠≠« »
short≠≠» Õ
?≠≠Õ Œ
)≠≠Œ œ
distrito≠≠œ ◊
.≠≠◊ ÿ
Distrito_Id≠≠ÿ „
}≠≠‰ Â
into≠≠Ê Í
ReunionDistrito≠≠Î ˙
from
ÆÆ  $
	rdistrito
ÆÆ% .
in
ÆÆ/ 1
ReunionDistrito
ÆÆ2 A
.
ÆÆA B
DefaultIfEmpty
ÆÆB P
(
ÆÆP Q
)
ÆÆQ R
join
ØØ  $
	provincia
ØØ% .
in
ØØ/ 1
_context
ØØ2 :
.
ØØ: ;

Provincias
ØØ; E
on
ØØF H
new
ØØI L
{
ØØM N
r
ØØO P
.
ØØP Q
CodigoProvincia
ØØQ `
,
ØØ` a
r
ØØb c
.
ØØc d 
CodigoDepartamento
ØØd v
}
ØØw x
equals
∞∞F L
new
∞∞M P
{
∞∞Q R
CodigoProvincia
∞∞S b
=
∞∞c d
(
∞∞e f
short
∞∞f k
?
∞∞k l
)
∞∞l m
	provincia
∞∞m v
.
∞∞v w
Provincia_Id∞∞w É
,∞∞É Ñ"
CodigoDepartamento∞∞Ö ó
=∞∞ò ô
(∞∞ö õ
short∞∞õ †
?∞∞† °
)∞∞° ¢
	provincia∞∞¢ ´
.∞∞´ ¨
Departamento_Id∞∞¨ ª
}∞∞º Ω
into∞∞æ ¬ 
ReunionProvincia∞∞√ ”
from
±±  $

rprovincia
±±% /
in
±±0 2
ReunionProvincia
±±3 C
.
±±C D
DefaultIfEmpty
±±D R
(
±±R S
)
±±S T
join
≤≤  $
departamento
≤≤% 1
in
≤≤2 4
_context
≤≤5 =
.
≤≤= >
Departamentos
≤≤> K
on
≤≤L N
r
≤≤O P
.
≤≤P Q 
CodigoDepartamento
≤≤Q c
equals
≤≤d j
departamento
≤≤k w
.
≤≤w x
Departamento_Id≤≤x á
into≤≤à å#
ReunionDepartamento≤≤ç †
from
≥≥  $
rdepartamento
≥≥% 2
in
≥≥3 5!
ReunionDepartamento
≥≥6 I
.
≥≥I J
DefaultIfEmpty
≥≥J X
(
≥≥X Y
)
≥≥Y Z
where
¥¥  %
intermediario
¥¥& 3
.
¥¥3 4!
CodigoIntermediario
¥¥4 G
==
¥¥H J!
codigoIntermediario
¥¥K ^
&&
¥¥_ a
(
µµ& '
r
µµ' (
.
µµ( )
FechaReunion
µµ) 5
>=
µµ6 8
fechaInicio
µµ9 D
&&
µµE G
r
µµH I
.
µµI J
FechaReunion
µµJ V
<=
µµW Y
fechaFin
µµZ b
)
µµb c
select
∂∂  &
new
∂∂' *
{
∑∑  !
r
∏∏$ %
,
∏∏% &
intermediario
ππ$ 1
,
ππ1 2
rtiporeunion
∫∫$ 0
,
∫∫0 1
rdepartamento
ªª$ 1
,
ªª1 2

rprovincia
ºº$ .
,
ºº. /
	rdistrito
ΩΩ$ -
}
øø  !
)
¿¿( )
.
¿¿) *
AsNoTracking
¿¿* 6
(
¿¿6 7
)
¿¿7 8
.
¿¿8 9
Select
¿¿9 ?
(
¿¿? @
x
¿¿@ A
=>
¿¿B D
new
¿¿E H
ReunionCalendario
¿¿I Z
{
¡¡( )
	IdReunion
¬¬, 5
=
¬¬6 7
x
¬¬8 9
.
¬¬9 :
r
¬¬: ;
.
¬¬; <
	IdReunion
¬¬< E
,
¬¬E F
TipoReunion
√√, 7
=
√√8 9
x
√√: ;
.
√√; <
rtiporeunion
√√< H
.
√√H I
ValorCadena
√√I T
,
√√T U
FechaReunion
ƒƒ, 8
=
ƒƒ9 :
x
ƒƒ; <
.
ƒƒ< =
r
ƒƒ= >
.
ƒƒ> ?
FechaReunion
ƒƒ? K
,
ƒƒK L
	Ubicacion
≈≈, 5
=
≈≈6 7
x
≈≈8 9
.
≈≈9 :
r
≈≈: ;
.
≈≈; <
	Ubicacion
≈≈< E
,
≈≈E F
Departamento
∆∆, 8
=
∆∆9 :
x
∆∆; <
.
∆∆< =
rdepartamento
∆∆= J
.
∆∆J K
Nombre
∆∆K Q
,
∆∆Q R
	Provincia
««, 5
=
««6 7
x
««8 9
.
««9 :

rprovincia
««: D
.
««D E
Nombre
««E K
,
««K L
Distrito
»», 4
=
»»5 6
x
»»7 8
.
»»8 9
	rdistrito
»»9 B
.
»»B C
Nombre
»»C I
,
»»I J!
CorreoElectronicoGA
……, ?
=
……@ A
x
……B C
.
……C D
r
……D E
.
……E F
FlagInvitadoGA
……F T
.
……T U
Value
……U Z
?
……[ \
x
……] ^
.
……^ _
intermediario
……_ l
.
……l m"
CorreoElectronicoGA……m Ä
:……Å Ç
$str……É Ö
,……Ö Ü!
CorreoElectronicoGU
  , ?
=
  @ A
x
  B C
.
  C D
r
  D E
.
  E F
FlagInvitadoGU
  F T
.
  T U
Value
  U Z
?
  [ \
x
  ] ^
.
  ^ _
intermediario
  _ l
.
  l m"
CorreoElectronicoGU  m Ä
:  Å Ç
$str  É Ö
,  Ö Ü
Fecha
ÀÀ, 1
=
ÀÀ2 3
x
ÀÀ4 5
.
ÀÀ5 6
r
ÀÀ6 7
.
ÀÀ7 8
FechaReunion
ÀÀ8 D
,
ÀÀD E

HoraInicio
ÃÃ, 6
=
ÃÃ7 8
x
ÃÃ9 :
.
ÃÃ: ;
r
ÃÃ; <
.
ÃÃ< =

HoraInicio
ÃÃ= G
.
ÃÃG H
ToString
ÃÃH P
(
ÃÃP Q
$str
ÃÃQ Z
)
ÃÃZ [
,
ÃÃ[ \
HoraFin
ÕÕ, 3
=
ÕÕ4 5
x
ÕÕ6 7
.
ÕÕ7 8
r
ÕÕ8 9
.
ÕÕ9 :
HoraFin
ÕÕ: A
.
ÕÕA B
ToString
ÕÕB J
(
ÕÕJ K
$str
ÕÕK T
)
ÕÕT U
,
ÕÕU V
Descripcion
ŒŒ, 7
=
ŒŒ8 9
x
ŒŒ: ;
.
ŒŒ; <
r
ŒŒ< =
.
ŒŒ= >
Descripcion
ŒŒ> I
,
ŒŒI J 
AlertaMinutosAntes
œœ, >
=
œœ? @
(
œœA B
int
œœB E
)
œœE F
x
œœF G
.
œœG H
r
œœH I
.
œœI J 
AlertaMinutosAntes
œœJ \
,
œœ\ ]
FlagUrlTeams
––, 8
=
––9 :
x
––; <
.
––< =
r
––= >
.
––> ?
FlagUrlTeams
––? K
.
––K L
Value
––L Q
,
––Q R
EtiquetaColor
——, 9
=
——: ;
$str
——< C
}
““( )
)
““) *
;
““* +
return
”” 
result
”” 
;
”” 
}
‘‘ 	
public
ÿÿ 

IQueryable
ÿÿ 
<
ÿÿ 
ProspectoReporte
ÿÿ *
>
ÿÿ* +$
ObtenerProspectoPorMes
ÿÿ, B
(
ÿÿB C
List
ÿÿC G
<
ÿÿG H
int
ÿÿH K
>
ÿÿK L%
listCodigoIntermediario
ÿÿM d
,
ÿÿd e
DateTime
ÿÿe m
fechaInicio
ÿÿn y
,
ÿÿy z
DateTimeÿÿz Ç
fechaFinÿÿÉ ã
)ÿÿã å
{
ŸŸ 	
var
⁄⁄ 
result
⁄⁄ 
=
⁄⁄ 
(
⁄⁄ 
from
⁄⁄ 
	prospecto
⁄⁄ (
in
⁄⁄) +
_context
⁄⁄, 4
.
⁄⁄4 5

Prospectos
⁄⁄5 ?
join
€€' +
intermediario
€€, 9
in
€€: <
_context
€€= E
.
€€E F'
ConsolidadoIntermediarios
€€F _
on
€€` b
	prospecto
€€c l
.
€€l m)
IdConsolidadoIntermediario€€m á
equals€€à é
intermediario€€è ú
.€€ú ù*
IdConsolidadoIntermediario€€ù ∑
join
‹‹' +
fuente
‹‹, 2
in
‹‹3 5
_context
‹‹6 >
.
‹‹> ?
ListaTablas
‹‹? J
on
‹‹K M
new
‹‹N Q
{
‹‹R S
	prospecto
‹‹T ]
.
‹‹] ^
CodigoFuente
‹‹^ j
,
‹‹j k
idtablafuente
‹‹l y
=
‹‹z {

TablaTabla‹‹| Ü
.‹‹Ü á
FuenteProspecto‹‹á ñ
}‹‹ó ò
equals
››K Q
new
››R U
{
››V W
CodigoFuente
››X d
=
››e f
(
››g h
short
››h m
?
››m n
)
››n o
fuente
››o u
.
››u v
CodigoCampo››v Å
,››Å Ç
idtablafuente››É ê
=››ë í
fuente››ì ô
.››ô ö
IdTabla››ö °
}››¢ £
where
ﬁﬁ' ,%
listCodigoIntermediario
ﬁﬁ- D
.
ﬁﬁD E
Contains
ﬁﬁE M
(
ﬁﬁM N
intermediario
ﬁﬁN [
.
ﬁﬁ[ \!
CodigoIntermediario
ﬁﬁ\ o
)
ﬁﬁo p
&&
ﬁﬁq s
	prospecto
ﬂﬂ' 0
.
ﬂﬂ0 1
CodigoFuente
ﬂﬂ1 =
!=
ﬂﬂ> @
Fuente
ﬂﬂA G
.
ﬂﬂG H
CentroInfluencia
ﬂﬂH X
&&
ﬂﬂY [
(
‡‡' (
	prospecto
‡‡( 1
.
‡‡1 2$
AuditoriaFechaCreacion
‡‡2 H
.
‡‡H I
Value
‡‡I N
.
‡‡N O
Date
‡‡O S
>=
‡‡T V
fechaInicio
‡‡W b
.
‡‡b c
Date
‡‡c g
&&
‡‡h j
	prospecto
‡‡k t
.
‡‡t u%
AuditoriaFechaCreacion‡‡u ã
.‡‡ã å
Value‡‡å ë
.‡‡ë í
Date‡‡í ñ
<=‡‡ó ô
fechaFin‡‡ö ¢
.‡‡¢ £
Date‡‡£ ß
)‡‡ß ®
select
··' -
new
··. 1
{
‚‚' (
	prospecto
„„+ 4
,
„„4 5
fuente
‰‰+ 1
}
ÂÂ' (
)
ÊÊ$ %
.
ÊÊ% &
AsNoTracking
ÊÊ& 2
(
ÊÊ2 3
)
ÊÊ3 4
.
ÊÊ4 5
GroupBy
ÊÊ5 <
(
ÊÊ< =
x
ÊÊ= >
=>
ÊÊ? A
new
ÊÊB E
{
ÊÊF G
x
ÊÊH I
.
ÊÊI J
	prospecto
ÊÊJ S
.
ÊÊS T$
AuditoriaFechaCreacion
ÊÊT j
.
ÊÊj k
Value
ÊÊk p
.
ÊÊp q
Date
ÊÊq u
,
ÊÊu v
x
ÊÊw x
.
ÊÊx y
fuente
ÊÊy 
.ÊÊ Ä
ValorCadenaÊÊÄ ã
,ÊÊã å
xÊÊç é
.ÊÊé è
	prospectoÊÊè ò
.ÊÊò ô
IdProspectoÊÊô §
}ÊÊ• ¶
)ÊÊ¶ ß
.
ÁÁ% &
Select
ÁÁ& ,
(
ÁÁ, -
y
ÁÁ- .
=>
ÁÁ/ 1
new
ÁÁ2 5
ProspectoReporte
ÁÁ6 F
(
ÁÁF G
)
ÁÁG H
{
ËË% &
	Categoria
ÈÈ) 2
=
ÈÈ3 4
$str
ÈÈ5 B
,
ÈÈB C
Subcategoria
ÍÍ) 5
=
ÍÍ6 7
y
ÍÍ8 9
.
ÍÍ9 :
Key
ÍÍ: =
.
ÍÍ= >
ValorCadena
ÍÍ> I
==
ÍÍJ L
$str
ÍÍM T
||
ÍÍU W
y
ÍÍX Y
.
ÍÍY Z
Key
ÍÍZ ]
.
ÍÍ] ^
ValorCadena
ÍÍ^ i
==
ÍÍj l
$str
ÍÍm v
?
ÍÍw x
$strÍÍy Ä
:ÍÍÅ Ç
y
ÎÎ5 6
.
ÎÎ6 7
Key
ÎÎ7 :
.
ÎÎ: ;
ValorCadena
ÎÎ; F
==
ÎÎG I
$str
ÎÎJ T
||
ÎÎU W
y
ÎÎX Y
.
ÎÎY Z
Key
ÎÎZ ]
.
ÎÎ] ^
ValorCadena
ÎÎ^ i
==
ÎÎj l
$str
ÎÎm r
?
ÎÎs t
$strÎÎu Ä
:ÎÎÅ Ç
y
ÏÏ5 6
.
ÏÏ6 7
Key
ÏÏ7 :
.
ÏÏ: ;
ValorCadena
ÏÏ; F
==
ÏÏG I
$str
ÏÏJ T
||
ÏÏU W
y
ÏÏX Y
.
ÏÏY Z
Key
ÏÏZ ]
.
ÏÏ] ^
ValorCadena
ÏÏ^ i
==
ÏÏj l
$strÏÏm É
?ÏÏÑ Ö
$strÏÏÜ ï
:ÏÏñ ó
$strÏÏò ö
,ÏÏö õ
CantidadProspecto
ÌÌ) :
=
ÌÌ; <
y
ÌÌ= >
.
ÌÌ> ?
Count
ÌÌ? D
(
ÌÌD E
)
ÌÌE F
,
ÌÌF G
Fecha
ÓÓ) .
=
ÓÓ/ 0
y
ÓÓ1 2
.
ÓÓ2 3
Key
ÓÓ3 6
.
ÓÓ6 7
Date
ÓÓ7 ;
,
ÓÓ; <
IdProspecto
ÔÔ) 4
=
ÔÔ5 6
y
ÔÔ7 8
.
ÔÔ8 9
Key
ÔÔ9 <
.
ÔÔ< =
IdProspecto
ÔÔ= H
}
% &
)
& '
;
' (
return
ÒÒ 
result
ÒÒ 
;
ÒÒ 
}
ÚÚ 	
public
ÛÛ 

IQueryable
ÛÛ 
<
ÛÛ 
ProspectoReporte
ÛÛ *
>
ÛÛ* +'
ObtenerProspectoAdnPorMes
ÛÛ, E
(
ÛÛE F
List
ÛÛF J
<
ÛÛJ K
int
ÛÛK N
>
ÛÛN O%
listCodigoIntermediario
ÛÛP g
,
ÛÛg h
DateTime
ÛÛi q
fechaInicio
ÛÛr }
,
ÛÛ} ~
DateTimeÛÛ á
fechaFinÛÛà ê
)ÛÛê ë
{
ÙÙ 	
var
ıı 
result
ıı 
=
ıı 
(
ıı 
from
ıı 
	prospecto
ıı (
in
ıı) +
_context
ıı, 4
.
ıı4 5

Prospectos
ıı5 ?
join
ˆˆ, 0
intermediario
ˆˆ1 >
in
ˆˆ? A
_context
ˆˆB J
.
ˆˆJ K'
ConsolidadoIntermediarios
ˆˆK d
on
ˆˆe g
	prospecto
ˆˆh q
.
ˆˆq r)
IdConsolidadoIntermediarioˆˆr å
equalsˆˆç ì
intermediarioˆˆî °
.ˆˆ° ¢*
IdConsolidadoIntermediarioˆˆ¢ º
join
˜˜, 0
adn
˜˜1 4
in
˜˜5 7
_context
˜˜8 @
.
˜˜@ A
	AdnRentas
˜˜A J
on
˜˜K M
	prospecto
˜˜N W
.
˜˜W X
IdProspecto
˜˜X c
equals
˜˜d j
adn
˜˜k n
.
˜˜n o
IdProspecto
˜˜o z
where
¯¯, 1%
listCodigoIntermediario
¯¯2 I
.
¯¯I J
Contains
¯¯J R
(
¯¯R S
intermediario
¯¯S `
.
¯¯` a!
CodigoIntermediario
¯¯a t
)
¯¯t u
&&
¯¯v x
	prospecto
˘˘, 5
.
˘˘5 6
CodigoFuente
˘˘6 B
!=
˘˘C E
Fuente
˘˘F L
.
˘˘L M
CentroInfluencia
˘˘M ]
&&
˘˘^ `
(
˙˙, -
adn
˙˙- 0
.
˙˙0 1
PorcentajeAvance
˙˙1 A
>
˙˙B C
$num
˙˙D F
)
˙˙F G
&&
˙˙H J
(
˚˚, -
	prospecto
˚˚- 6
.
˚˚6 7$
AuditoriaFechaCreacion
˚˚7 M
.
˚˚M N
Value
˚˚N S
.
˚˚S T
Date
˚˚T X
>=
˚˚Y [
fechaInicio
˚˚\ g
.
˚˚g h
Date
˚˚h l
&&
˚˚m o
	prospecto
˚˚p y
.
˚˚y z%
AuditoriaFechaCreacion˚˚z ê
.˚˚ê ë
Value˚˚ë ñ
.˚˚ñ ó
Date˚˚ó õ
<=˚˚ú û
fechaFin˚˚ü ß
.˚˚ß ®
Date˚˚® ¨
)˚˚¨ ≠
select
¸¸, 2
new
¸¸3 6
{
˝˝, -
	prospecto
˛˛0 9
}
ˇˇ, -
)
ÄÄ, -
.
ÄÄ- .
AsNoTracking
ÄÄ. :
(
ÄÄ: ;
)
ÄÄ; <
.
ÄÄ< =
GroupBy
ÄÄ= D
(
ÄÄD E
x
ÄÄE F
=>
ÄÄG I
new
ÄÄJ M
{
ÄÄN O
x
ÄÄP Q
.
ÄÄQ R
	prospecto
ÄÄR [
.
ÄÄ[ \$
AuditoriaFechaCreacion
ÄÄ\ r
.
ÄÄr s
Value
ÄÄs x
.
ÄÄx y
Date
ÄÄy }
}
ÄÄ~ 
)ÄÄ Ä
.
ÅÅ$ %
Select
ÅÅ% +
(
ÅÅ+ ,
y
ÅÅ, -
=>
ÅÅ. 0
new
ÅÅ1 4
ProspectoReporte
ÅÅ5 E
(
ÅÅE F
)
ÅÅF G
{
ÇÇ$ %
Subcategoria
ÉÉ( 4
=
ÉÉ5 6
$str
ÉÉ7 H
,
ÉÉH I
CantidadProspecto
ÑÑ( 9
=
ÑÑ: ;
y
ÑÑ< =
.
ÑÑ= >
Count
ÑÑ> C
(
ÑÑC D
)
ÑÑD E
,
ÑÑE F
Fecha
ÖÖ( -
=
ÖÖ. /
y
ÖÖ0 1
.
ÖÖ1 2
Key
ÖÖ2 5
.
ÖÖ5 6
Date
ÖÖ6 :
}
ÜÜ$ %
)
ÜÜ% &
;
ÜÜ& '
return
áá 
result
áá 
;
áá 
}
àà 	
public
ââ 

IQueryable
ââ 
<
ââ 
CitaReporte
ââ %
>
ââ% & 
ObtenerCitasPorMes
ââ' 9
(
ââ9 :
List
ââ: >
<
ââ> ?
int
ââ? B
>
ââB C%
listCodigoIntermediario
ââD [
,
ââ[ \
DateTime
ââ] e
fechaInicio
ââf q
,
ââq r
DateTime
ââs {
fechaFinââ| Ñ
)ââÑ Ö
{
ää 	
var
ãã 
result
ãã 
=
ãã 
(
ãã 
from
ãã 
cita
ãã #
in
ãã$ &
_context
ãã' /
.
ãã/ 0
Citas
ãã0 5
join
åå 
	actividad
åå (
in
åå) +
_context
åå, 4
.
åå4 5

Actividads
åå5 ?
on
åå@ B
new
ååC F
{
ååG H
cita
ååI M
.
ååM N
NumeroEntrevista
ååN ^
,
åå^ _
lnegocio
åå` h
=
ååi j
LineaNegocio
ååk w
.
ååw x
Renta
ååx }
}
åå~ 
equals
çç7 =
new
çç> A
{
ççB C
NumeroEntrevista
ççD T
=
ççU V
	actividad
ççW `
.
çç` a

NumeroCita
çça k
,
ççk l
lnegocio
ççm u
=
ççv w
	actividadççx Å
.ççÅ Ç"
CodigoLineaNegocioççÇ î
}ççï ñ
intoççó õ
CitaActividadççú ©
from
éé 

cactividad
éé )
in
éé* ,
CitaActividad
éé- :
.
éé: ;
DefaultIfEmpty
éé; I
(
ééI J
)
ééJ K
join
èè 
etapa
èè $
in
èè% '
_context
èè( 0
.
èè0 1
TablaTablas
èè1 <
on
èè= ?
new
èè@ C
{
èèD E

cactividad
èèF P
.
èèP Q
CodigoEtapa
èèQ \
,
èè\ ]
idtablaetapa
èè^ j
=
èèk l

TablaTabla
èèm w
.
èèw x
EtapaActivadèèx Ñ
}èèÖ Ü
equals
êê5 ;
new
êê< ?
{
êê@ A
CodigoEtapa
êêB M
=
êêN O
etapa
êêP U
.
êêU V
CodigoCampo
êêV a
,
êêa b
idtablaetapa
êêc o
=
êêp q
etapa
êêr w
.
êêw x
IdTabla
êêx 
}êêÄ Å
intoêêÇ Ü
ActividadEtapaêêá ï
from
ëë 
actividadetapa
ëë -
in
ëë. 0
ActividadEtapa
ëë1 ?
.
ëë? @
DefaultIfEmpty
ëë@ N
(
ëëN O
)
ëëO P
where
íí %
listCodigoIntermediario
íí  7
.
íí7 8
Contains
íí8 @
(
íí@ A
cita
ííA E
.
ííE F)
CodigoIntermediarioCreacion
ííF a
)
íía b
&&
ííc e
(
ìì 
cita
ìì 
.
ìì  
	FechaCita
ìì  )
.
ìì) *
Value
ìì* /
.
ìì/ 0
Date
ìì0 4
>=
ìì5 7
fechaInicio
ìì8 C
.
ììC D
Date
ììD H
&&
ììI K
cita
ììL P
.
ììP Q
	FechaCita
ììQ Z
.
ììZ [
Value
ìì[ `
.
ìì` a
Date
ììa e
<=
ììf h
fechaFin
ììi q
.
ììq r
Date
ììr v
)
ììv w
select
îî  
new
îî! $
{
ïï 
cita
ññ' +
,
ññ+ ,
actividadetapa
óó' 5
}
òò# $
)
òò$ %
.
òò% &
AsNoTracking
òò& 2
(
òò2 3
)
òò3 4
.
òò4 5
GroupBy
òò5 <
(
òò< =
x
òò= >
=>
òò? A
new
òòB E
{
òòF G
x
ôô' (
.
ôô( )
cita
ôô) -
.
ôô- .
	FechaCita
ôô. 7
.
ôô7 8
Value
ôô8 =
.
ôô= >
Date
ôô> B
,
ôôB C
x
öö' (
.
öö( )
actividadetapa
öö) 7
.
öö7 8
ValorCadena
öö8 C
,
ööC D
x
õõ' (
.
õõ( )
cita
õõ) -
.
õõ- .
FlagCalificacion
õõ. >
,
õõ> ?
x
úú' (
.
úú( )
cita
úú) -
.
úú- .$
CodigoTipoCalificacion
úú. D
,
úúD E
x
ùù' (
.
ùù( )
cita
ùù) -
.
ùù- .$
CodigoMotivoReagendado
ùù. D
}
ûû# $
)
ûû$ %
.
üü$ %
Select
üü% +
(
üü+ ,
y
üü, -
=>
üü. 0
new
üü1 4
CitaReporte
üü5 @
(
üü@ A
)
üüA B
{
††$ %
CantidadCita
°°( 4
=
°°5 6
y
°°7 8
.
°°8 9
Count
°°9 >
(
°°> ?
)
°°? @
,
°°@ A
Subcategoria
¢¢( 4
=
¢¢5 6
string
¢¢7 =
.
¢¢= >
IsNullOrEmpty
¢¢> K
(
¢¢K L
y
¢¢L M
.
¢¢M N
Key
¢¢N Q
.
¢¢Q R
ValorCadena
¢¢R ]
)
¢¢] ^
?
¢¢_ `
$str
¢¢a r
:
¢¢s t
y
¢¢u v
.
¢¢v w
Key
¢¢w z
.
¢¢z {
ValorCadena¢¢{ Ü
,¢¢Ü á
Calificacion
££( 4
=
££5 6
y
££7 8
.
££8 9
Key
££9 <
.
££< =
FlagCalificacion
££= M
.
££M N
Value
££N S
,
££S T$
CodigoTipoCalificacion
§§( >
=
§§? @
y
§§A B
.
§§B C
Key
§§C F
.
§§F G$
CodigoTipoCalificacion
§§G ]
.
§§] ^
Value
§§^ c
,
§§c d$
CodigoMotivoReagendado
••( >
=
••? @
y
••A B
.
••B C
Key
••C F
.
••F G$
CodigoMotivoReagendado
••G ]
.
••] ^
Value
••^ c
,
••c d
Fecha
¶¶( -
=
¶¶. /
y
¶¶0 1
.
¶¶1 2
Key
¶¶2 5
.
¶¶5 6
Date
¶¶6 :
}
ßß$ %
)
ßß% &
;
ßß& '
return
®® 
result
®® 
;
®® 
}
©© 	
public
´´ 
List
´´ 
<
´´ 
ActividadReporte
´´ $
>
´´$ %"
AgruparProspectoCita
´´& :
(
´´: ;
List
´´; ?
<
´´? @
ProspectoReporte
´´@ P
>
´´P Q 
prospectoPorSemana
´´R d
,
´´d e
List
´´e i
<
´´i j
ProspectoReporte
´´j z
>
´´z {
prospectoPorMes´´| ã
)´´ã å
{
¨¨ 	
var
≠≠ 
result
≠≠ 
=
≠≠  
prospectoPorSemana
≠≠ +
.
≠≠+ ,
GroupBy
≠≠, 3
(
≠≠3 4
x
≠≠4 5
=>
≠≠6 8
new
≠≠9 <
{
≠≠= >
x
≠≠? @
.
≠≠@ A
	Categoria
≠≠A J
,
≠≠J K
x
≠≠L M
.
≠≠M N
Subcategoria
≠≠N Z
}
≠≠[ \
)
≠≠\ ]
.
≠≠] ^
Select
ÆÆ" (
(
ÆÆ( )
y
ÆÆ) *
=>
ÆÆ+ -
new
ÆÆ. 1
ActividadReporte
ÆÆ2 B
(
ÆÆB C
)
ÆÆC D
{
ØØ" #
Category
∞∞& .
=
∞∞/ 0
y
∞∞1 2
.
∞∞2 3
Key
∞∞3 6
.
∞∞6 7
	Categoria
∞∞7 @
,
∞∞@ A
Subcategoria
±±& 2
=
±±3 4
y
±±5 6
.
±±6 7
Key
±±7 :
.
±±: ;
Subcategoria
±±; G
,
±±G H
Lunes
≤≤& +
=
≤≤, -
y
≤≤. /
.
≤≤/ 0
Where
≤≤0 5
(
≤≤5 6
x
≤≤6 7
=>
≤≤8 :
(
≤≤; <
byte
≤≤< @
)
≤≤@ A
x
≤≤A B
.
≤≤B C
Fecha
≤≤C H
.
≤≤H I
	DayOfWeek
≤≤I R
==
≤≤S U
$num
≤≤V W
)
≤≤W X
.
≤≤X Y
Sum
≤≤Y \
(
≤≤\ ]
x
≤≤] ^
=>
≤≤_ a
x
≤≤b c
.
≤≤c d
CantidadProspecto
≤≤d u
)
≤≤u v
,
≤≤v w
Martes
≥≥& ,
=
≥≥- .
y
≥≥/ 0
.
≥≥0 1
Where
≥≥1 6
(
≥≥6 7
x
≥≥7 8
=>
≥≥9 ;
(
≥≥< =
byte
≥≥= A
)
≥≥A B
x
≥≥B C
.
≥≥C D
Fecha
≥≥D I
.
≥≥I J
	DayOfWeek
≥≥J S
==
≥≥T V
$num
≥≥W X
)
≥≥X Y
.
≥≥Y Z
Sum
≥≥Z ]
(
≥≥] ^
x
≥≥^ _
=>
≥≥` b
x
≥≥c d
.
≥≥d e
CantidadProspecto
≥≥e v
)
≥≥v w
,
≥≥w x
	Miercoles
¥¥& /
=
¥¥0 1
y
¥¥2 3
.
¥¥3 4
Where
¥¥4 9
(
¥¥9 :
x
¥¥: ;
=>
¥¥< >
(
¥¥? @
byte
¥¥@ D
)
¥¥D E
x
¥¥E F
.
¥¥F G
Fecha
¥¥G L
.
¥¥L M
	DayOfWeek
¥¥M V
==
¥¥W Y
$num
¥¥Z [
)
¥¥[ \
.
¥¥\ ]
Sum
¥¥] `
(
¥¥` a
x
¥¥a b
=>
¥¥c e
x
¥¥f g
.
¥¥g h
CantidadProspecto
¥¥h y
)
¥¥y z
,
¥¥z {
Jueves
µµ& ,
=
µµ- .
y
µµ/ 0
.
µµ0 1
Where
µµ1 6
(
µµ6 7
x
µµ7 8
=>
µµ9 ;
(
µµ< =
byte
µµ= A
)
µµA B
x
µµB C
.
µµC D
Fecha
µµD I
.
µµI J
	DayOfWeek
µµJ S
==
µµT V
$num
µµW X
)
µµX Y
.
µµY Z
Sum
µµZ ]
(
µµ] ^
x
µµ^ _
=>
µµ` b
x
µµc d
.
µµd e
CantidadProspecto
µµe v
)
µµv w
,
µµw x
Viernes
∂∂& -
=
∂∂. /
y
∂∂0 1
.
∂∂1 2
Where
∂∂2 7
(
∂∂7 8
x
∂∂8 9
=>
∂∂: <
(
∂∂= >
byte
∂∂> B
)
∂∂B C
x
∂∂C D
.
∂∂D E
Fecha
∂∂E J
.
∂∂J K
	DayOfWeek
∂∂K T
==
∂∂U W
$num
∂∂X Y
)
∂∂Y Z
.
∂∂Z [
Sum
∂∂[ ^
(
∂∂^ _
x
∂∂_ `
=>
∂∂a c
x
∂∂d e
.
∂∂e f
CantidadProspecto
∂∂f w
)
∂∂w x
,
∂∂x y
Sabado
∑∑& ,
=
∑∑- .
y
∑∑/ 0
.
∑∑0 1
Where
∑∑1 6
(
∑∑6 7
x
∑∑7 8
=>
∑∑9 ;
(
∑∑< =
byte
∑∑= A
)
∑∑A B
x
∑∑B C
.
∑∑C D
Fecha
∑∑D I
.
∑∑I J
	DayOfWeek
∑∑J S
==
∑∑T V
$num
∑∑W X
)
∑∑X Y
.
∑∑Y Z
Sum
∑∑Z ]
(
∑∑] ^
x
∑∑^ _
=>
∑∑` b
x
∑∑c d
.
∑∑d e
CantidadProspecto
∑∑e v
)
∑∑v w
,
∑∑w x
Domingo
∏∏& -
=
∏∏. /
y
∏∏0 1
.
∏∏1 2
Where
∏∏2 7
(
∏∏7 8
x
∏∏8 9
=>
∏∏: <
(
∏∏= >
byte
∏∏> B
)
∏∏B C
x
∏∏C D
.
∏∏D E
Fecha
∏∏E J
.
∏∏J K
	DayOfWeek
∏∏K T
==
∏∏U W
$num
∏∏X Y
)
∏∏Y Z
.
∏∏Z [
Sum
∏∏[ ^
(
∏∏^ _
x
∏∏_ `
=>
∏∏a c
x
∏∏d e
.
∏∏e f
CantidadProspecto
∏∏f w
)
∏∏w x
,
∏∏x y
TotalSemana
ππ& 1
=
ππ2 3
y
ππ4 5
.
ππ5 6
Sum
ππ6 9
(
ππ9 :
x
ππ: ;
=>
ππ< >
x
ππ? @
.
ππ@ A
CantidadProspecto
ππA R
)
ππR S
,
ππS T
TotalMes
∫∫& .
=
∫∫/ 0
prospectoPorMes
∫∫1 @
.
∫∫@ A
Where
∫∫A F
(
∫∫F G
x
∫∫G H
=>
∫∫I K
x
∫∫L M
.
∫∫M N
Subcategoria
∫∫N Z
==
∫∫[ ]
y
∫∫^ _
.
∫∫_ `
Key
∫∫` c
.
∫∫c d
Subcategoria
∫∫d p
)
∫∫p q
.
∫∫q r
Sum
∫∫r u
(
∫∫u v
x
∫∫v w
=>
∫∫x z
x
∫∫{ |
.
∫∫| } 
CantidadProspecto∫∫} é
)∫∫é è
}
ªª" #
)
ªª# $
.
ªª$ %
ToList
ªª% +
(
ªª+ ,
)
ªª, -
;
ªª- .
return
ºº 
result
ºº 
;
ºº 
}
ΩΩ 	
}
øø 
}¿¿ «å
]D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Calendario\CalendarioViewModel.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )

Calendario) 3
{ 
public 

class 
SemanaCalendario !
{ 
public		 
int		 
A√±o		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Mes

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
DateTime 
FechaInicio #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DateTime 
FechaFin  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
List 
< 
EtapaCalendario #
># $
EtapaCalendarios% 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
List 
< 
DiaCalendario !
>! "
DiaCalendarios# 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
public 

class 
DiaCalendario 
{ 
public 
DateTime 
FechaDia  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Dia 
{ 
get 
;  
set! $
;$ %
}& '
public 
List 
< !
CumpleaniosCalendario )
>) *"
CumpleaniosCalendarios+ A
{B C
getD G
;G H
setI L
;L M
}N O
public 
List 
< 
CitaCalendario "
>" #
CitaCalendarios% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
List 
< )
RecordatorioLlamadaCalendario 1
>1 2*
RecordatorioLlamadaCalendarios3 Q
{R S
getT W
;W X
setY \
;\ ]
}^ _
public 
List 
< 
ReunionCalendario %
>% &
ReunionCalendarios' 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
public 

class !
CumpleaniosCalendario &
{ 
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
TelefonoFijo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
TelefonoCelular %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public   
DateTime   
FechaCumple   #
{  $ %
get  & )
;  ) *
set  + .
;  . /
}  0 1
}!! 
public## 

class## 
CitaCalendario## 
{$$ 
public%% 
int%% 
IdCita%% 
{%% 
get%% 
;%%  
set%%! $
;%%$ %
}%%& '
public&& 
int&& 
IdProspecto&& 
{&&  
get&&! $
;&&$ %
set&&& )
;&&) *
}&&+ ,
public'' 
string'' 
Etapa'' 
{'' 
get'' !
;''! "
set''# &
;''& '
}''( )
public(( 
string(( 
Nombres(( 
{(( 
get((  #
;((# $
set((% (
;((( )
}((* +
public)) 
DateTime)) 
	FechaCita)) !
{))" #
get))$ '
;))' (
set))) ,
;)), -
})). /
public** 
int** 
NumeroEntrevista** #
{**$ %
get**& )
;**) *
set**+ .
;**. /
}**0 1
public++ 
string++ 
TelefonoFijo++ "
{++# $
get++% (
;++( )
set++* -
;++- .
}++/ 0
public,, 
string,, 
TelefonoCelular,, %
{,,& '
get,,( +
;,,+ ,
set,,- 0
;,,0 1
},,2 3
public-- 
string-- 
Fuente-- 
{-- 
get-- "
;--" #
set--$ '
;--' (
}--) *
public.. 
string.. 

HoraInicio..  
{..! "
get..# &
;..& '
set..( +
;..+ ,
}..- .
public// 
string// 
HoraFin// 
{// 
get//  #
;//# $
set//% (
;//( )
}//* +
public00 
string00 
	Ubicacion00 
{00  !
get00" %
;00% &
set00' *
;00* +
}00, -
public11 
string11 
Departamento11 "
{11# $
get11% (
;11( )
set11* -
;11- .
}11/ 0
public22 
string22 
	Provincia22 
{22  !
get22" %
;22% &
set22' *
;22* +
}22, -
public33 
string33 
Distrito33 
{33  
get33! $
;33$ %
set33& )
;33) *
}33+ ,
public44 
short44 
?44 
CodigoDepartamento44 (
{44) *
get44+ .
;44. /
set440 3
;443 4
}445 6
public55 
short55 
?55 
CodigoProvincia55 %
{55& '
get55( +
;55+ ,
set55- 0
;550 1
}552 3
public66 
short66 
?66 
CodigoDistrito66 $
{66% &
get66' *
;66* +
set66, /
;66/ 0
}661 2
public77 
string77 
CorreoElectronicoGU77 )
{77* +
get77, /
;77/ 0
set771 4
;774 5
}776 7
public88 
string88 
NombreGU88 
{88  
get88! $
;88$ %
set88& )
;88) *
}88+ ,
public99 
string99 
CorreoElectronicoGA99 )
{99* +
get99, /
;99/ 0
set991 4
;994 5
}996 7
public:: 
string:: 
NombreGA:: 
{::  
get::! $
;::$ %
set::& )
;::) *
}::+ ,
public;; 
string;; 
Descripcion;; !
{;;" #
get;;$ '
;;;' (
set;;) ,
;;;, -
};;. /
public<< 
int<< 
Recordatorio<< 
{<<  !
get<<" %
;<<% &
set<<' *
;<<* +
}<<, -
public== 
bool== 
TieneCalificacion== %
{==& '
get==( +
;==+ ,
set==- 0
;==0 1
}==2 3
public>> 
string>> 
TipoCalificacion>> &
{>>' (
get>>) ,
;>>, -
set>>. 1
;>>1 2
}>>3 4
public?? 
short?? "
CodigoTipoCalificacion?? +
{??, -
get??. 1
;??1 2
set??3 6
;??6 7
}??8 9
public@@ 
string@@ 
CalificacionCita@@ &
{@@' (
get@@) ,
;@@, -
set@@. 1
;@@1 2
}@@3 4
publicAA 
stringAA 
ProbabilidadCierreAA (
{AA) *
getAA+ .
;AA. /
setAA0 3
;AA3 4
}AA5 6
publicBB 
stringBB "
ComentarioCalificacionBB ,
{BB- .
getBB/ 2
;BB2 3
setBB4 7
;BB7 8
}BB9 :
publicCC 
intCC $
PorcentajeAvanceAnteriorCC +
{CC, -
getCC. 1
;CC1 2
setCC3 6
;CC6 7
}CC8 9
publicDD 
intDD 
PorcentajeAvanceDD #
{DD$ %
getDD& )
;DD) *
setDD+ .
;DD. /
}DD0 1
publicEE 
stringEE 
MotivoNoConcretadaEE (
{EE) *
getEE+ .
;EE. /
setEE0 3
;EE3 4
}EE5 6
publicFF 
DateTimeFF 
FechaEstimadaCierreFF +
{FF, -
getFF. 1
;FF1 2
setFF3 6
;FF6 7
}FF8 9
publicGG 
boolGG 
	CanceladaGG 
{GG 
getGG  #
;GG# $
setGG% (
;GG( )
}GG* +
publicHH 
stringHH 
MotivoCanceladaHH %
{HH& '
getHH( +
;HH+ ,
setHH- 0
;HH0 1
}HH2 3
publicII 
DateTimeII 
FechaII 
{II 
getII  #
;II# $
setII% (
;II( )
}II* +
publicJJ 
stringJJ 
EtiquetaColorJJ #
{JJ$ %
getJJ& )
;JJ) *
setJJ+ .
;JJ. /
}JJ0 1
publicKK 
boolKK 

DescartadoKK 
{KK  
getKK! $
;KK$ %
setKK& )
;KK) *
}KK+ ,
publicLL 
stringLL 
TextoMotivoDescarteLL )
{LL* +
getLL, /
;LL/ 0
setLL1 4
;LL4 5
}LL6 7
publicMM 
DateTimeMM 
FechaDescarteMM %
{MM& '
getMM( +
;MM+ ,
setMM- 0
;MM0 1
}MM2 3
publicNN 
boolNN 
FlagUrlTeamsNN  
{NN! "
getNN# &
;NN& '
setNN( +
;NN+ ,
}NN- .
publicOO 
stringOO 
UrlTeamsOO 
{OO  
getOO! $
;OO$ %
setOO& )
;OO) *
}OO+ ,
}PP 
publicRR 

classRR )
RecordatorioLlamadaCalendarioRR .
{SS 
publicTT 
intTT 
IdProspectoTT 
{TT  
getTT! $
;TT$ %
setTT& )
;TT) *
}TT+ ,
publicUU 
intUU !
IdRecordatorioLlamadaUU (
{UU) *
getUU+ .
;UU. /
setUU0 3
;UU3 4
}UU5 6
publicVV 
stringVV 
ProductoVV 
{VV  
getVV! $
;VV$ %
setVV& )
;VV) *
}VV+ ,
publicWW 
stringWW 
NombresWW 
{WW 
getWW  #
;WW# $
setWW% (
;WW( )
}WW* +
publicXX 
stringXX 
TelefonoFijoXX "
{XX# $
getXX% (
;XX( )
setXX* -
;XX- .
}XX/ 0
publicYY 
stringYY 
TelefonoCelularYY %
{YY& '
getYY( +
;YY+ ,
setYY- 0
;YY0 1
}YY2 3
publicZZ 
stringZZ 

HoraInicioZZ  
{ZZ! "
getZZ# &
;ZZ& '
setZZ( +
;ZZ+ ,
}ZZ- .
public[[ 
string[[ 
HoraFin[[ 
{[[ 
get[[  #
;[[# $
set[[% (
;[[( )
}[[* +
public\\ 
string\\ 
Fuente\\ 
{\\ 
get\\ "
;\\" #
set\\$ '
;\\' (
}\\) *
public]] 
string]] 
Referenciador]] #
{]]$ %
get]]& )
;]]) *
set]]+ .
;]]. /
}]]0 1
public^^ 
string^^ 
Descripcion^^ !
{^^" #
get^^$ '
;^^' (
set^^) ,
;^^, -
}^^. /
public__ 
DateTime__ 
Fecha__ 
{__ 
get__  #
;__# $
set__% (
;__( )
}__* +
public`` 
bool`` 

Descartado`` 
{``  
get``! $
;``$ %
set``& )
;``) *
}``+ ,
publicaa 
stringaa 
TextoMotivoDescarteaa )
{aa* +
getaa, /
;aa/ 0
setaa1 4
;aa4 5
}aa6 7
publicbb 
DateTimebb 
FechaDescartebb %
{bb& '
getbb( +
;bb+ ,
setbb- 0
;bb0 1
}bb2 3
publiccc 
boolcc 
Activocc 
{cc 
getcc  
;cc  !
setcc" %
;cc% &
}cc' (
}dd 
publicff 

classff 
ReunionCalendarioff "
{gg 
publichh 
inthh 
	IdReunionhh 
{hh 
gethh "
;hh" #
sethh$ '
;hh' (
}hh) *
publicii 
stringii 
TipoReunionii !
{ii" #
getii$ '
;ii' (
setii) ,
;ii, -
}ii. /
publicjj 
DateTimejj 
FechaReunionjj $
{jj% &
getjj' *
;jj* +
setjj, /
;jj/ 0
}jj1 2
publickk 
stringkk 

HoraIniciokk  
{kk! "
getkk# &
;kk& '
setkk( +
;kk+ ,
}kk- .
publicll 
stringll 
HoraFinll 
{ll 
getll  #
;ll# $
setll% (
;ll( )
}ll* +
publicmm 
stringmm 
	Ubicacionmm 
{mm  !
getmm" %
;mm% &
setmm' *
;mm* +
}mm, -
publicnn 
stringnn 
Departamentonn "
{nn# $
getnn% (
;nn( )
setnn* -
;nn- .
}nn/ 0
publicoo 
stringoo 
	Provinciaoo 
{oo  !
getoo" %
;oo% &
setoo' *
;oo* +
}oo, -
publicpp 
stringpp 
Distritopp 
{pp  
getpp! $
;pp$ %
setpp& )
;pp) *
}pp+ ,
publicqq 
shortqq 
?qq 
CodigoDepartamentoqq (
{qq) *
getqq+ .
;qq. /
setqq0 3
;qq3 4
}qq5 6
publicrr 
shortrr 
?rr 
CodigoProvinciarr %
{rr& '
getrr( +
;rr+ ,
setrr- 0
;rr0 1
}rr2 3
publicss 
shortss 
?ss 
CodigoDistritoss $
{ss% &
getss' *
;ss* +
setss, /
;ss/ 0
}ss1 2
publictt 
stringtt 
CorreoElectronicoGUtt )
{tt* +
gettt, /
;tt/ 0
settt1 4
;tt4 5
}tt6 7
publicuu 
stringuu 
CorreoElectronicoGAuu )
{uu* +
getuu, /
;uu/ 0
setuu1 4
;uu4 5
}uu6 7
publicvv 
stringvv 
Descripcionvv !
{vv" #
getvv$ '
;vv' (
setvv) ,
;vv, -
}vv. /
publicww 
intww 
AlertaMinutosAntesww %
{ww& '
getww( +
;ww+ ,
setww- 0
;ww0 1
}ww2 3
publicxx 
boolxx 
FlagUrlTeamsxx  
{xx! "
getxx# &
;xx& '
setxx( +
;xx+ ,
}xx- .
publicyy 
stringyy 
UrlTeamsyy 
{yy  
getyy! $
;yy$ %
setyy& )
;yy) *
}yy+ ,
publiczz 
DateTimezz 
Fechazz 
{zz 
getzz  #
;zz# $
setzz% (
;zz( )
}zz* +
public{{ 
string{{ 
EtiquetaColor{{ #
{{{$ %
get{{& )
;{{) *
set{{+ .
;{{. /
}{{0 1
}|| 
public~~ 

class~~ 
EtapaCalendario~~  
{ 
public
ÄÄ 
DateTime
ÄÄ 
Fecha
ÄÄ 
{
ÄÄ 
get
ÄÄ  #
;
ÄÄ# $
set
ÄÄ% (
;
ÄÄ( )
}
ÄÄ* +
public
ÅÅ 
string
ÅÅ 
NombreEtapa
ÅÅ !
{
ÅÅ" #
get
ÅÅ$ '
;
ÅÅ' (
set
ÅÅ) ,
;
ÅÅ, -
}
ÅÅ. /
public
ÇÇ 
int
ÇÇ 
CantidadCita
ÇÇ 
{
ÇÇ  !
get
ÇÇ" %
;
ÇÇ% &
set
ÇÇ' *
;
ÇÇ* +
}
ÇÇ, -
public
ÉÉ 
int
ÉÉ  
CantidadEntrevista
ÉÉ %
{
ÉÉ& '
get
ÉÉ( +
;
ÉÉ+ ,
set
ÉÉ- 0
;
ÉÉ0 1
}
ÉÉ2 3
}
ÑÑ 
public
ÜÜ 

class
ÜÜ 
Intermediario
ÜÜ 
{
áá 
public
àà 
int
àà !
CodigoIntermediario
àà &
{
àà' (
get
àà) ,
;
àà, -
set
àà. 1
;
àà1 2
}
àà3 4
public
ââ 
string
ââ 
Nombres
ââ 
{
ââ 
get
ââ  #
;
ââ# $
set
ââ% (
;
ââ( )
}
ââ* +
}
ää 
}ãã ÿ
\D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Calendario\ICalendarioQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )

Calendario) 3
{ 
public 

	interface 
ICalendarioQueries '
{		 
Task

 
<

 
ResponseModel

 
<

 
List

 
<

  
SemanaCalendario

  0
>

0 1
>

1 2
>

2 3#
ObtenerSemanaCalendario

4 K
(

K L
string

L R
fechaactual

S ^
,

^ _
int

` c
codigointermediario

d w
)

w x
;

x y
Task 
< 
ResponseModel 
< 
List 
<  
ActividadReporte  0
>0 1
>1 2
>2 3*
ObtenerReporteActividadSemanal4 R
(R S
stringS Y
fechaactualZ e
,e f
stringg m!
codigointermediarios	n Ç
)
Ç É
;
É Ñ
Task 
< 
ResponseModel 
< 
List 
<  
Intermediario  -
>- .
>. /
>/ 0(
ObtenerAsesoresPorSupervisor1 M
(M N
intN Q
codigointermediarioR e
)e f
;f g
} 
} æ#
`D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Calendario\ReporteSemanaViewModel.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )

Calendario) 3
{ 
public 

class 
ActividadReporte !
{ 
public 
string 
Category 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Subcategoria "
{# $
get% (
;( )
set* -
;- .
}/ 0
public		 
int		 
Lunes		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
int

 
Martes

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
int 
	Miercoles 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Jueves 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Viernes 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Sabado 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
Domingo 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
TotalSemana 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
TotalMes 
{ 
get !
;! "
set# &
;& '
}( )
} 
public 

class 
ProspectoReporte !
{ 
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	Categoria 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Subcategoria "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
CantidadProspecto $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
Fuente 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
Fecha 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

class 
CitaReporte 
{ 
public   
string   
	Categoria   
{    !
get  " %
;  % &
set  ' *
;  * +
}  , -
public!! 
string!! 
Subcategoria!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
public"" 
int"" 
CantidadCita"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
public## 
bool## 
Calificacion##  
{##! "
get### &
;##& '
set##( +
;##+ ,
}##- .
public$$ 
string$$ 
Etapa$$ 
{$$ 
get$$ !
;$$! "
set$$# &
;$$& '
}$$( )
public%% 
short%% 
?%% "
CodigoTipoCalificacion%% ,
{%%- .
get%%/ 2
;%%2 3
set%%4 7
;%%7 8
}%%9 :
public&& 
short&& 
?&& "
CodigoMotivoReagendado&& ,
{&&- .
get&&/ 2
;&&2 3
set&&4 7
;&&7 8
}&&9 :
public'' 
DateTime'' 
Fecha'' 
{'' 
get''  #
;''# $
set''% (
;''( )
}''* +
}(( 
})) ™f
OD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Cita\CitaQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
Cita) -
{ 
public 

class 
CitaQueries 
: 
ICitaQueries +
{ 
private 
readonly 
AgendaContext &
_context' /
;/ 0
public 
CitaQueries 
( 
AgendaContext (
context) 0
)0 1
=>2 4
_context5 =
=> ?
context@ G
;G H
public 
async 
Task 
< 
ResponseModel '
<' (

AgendaCita( 2
>2 3
>3 4
ObtenerNumeroCita5 F
(F G
stringG M
idProspectoN Y
,Y Z
int[ ^
codigoIntermediario_ r
)r s
{ 	
ConfigurationHelper 
configurationHelper  3
=4 5
new6 9
ConfigurationHelper: M
(M N
)N O
;O P
ResponseService 
responseService +
;+ ,
ResponseModel 
< 

AgendaCita $
>$ %
response& .
=/ 0
new1 4
ResponseModel5 B
<B C

AgendaCitaC M
>M N
(N O
)O P
;P Q
bool 
tieneAgendamiento "
=# $
false% *
;* +
bool '
tieneAgendamientoCalificado ,
=- .
false/ 4
;4 5
string 
mensajeEntrevista $
=% &
$str' @
;@ A
int 
numeroEntrevista  
=! "
$num# $
;$ %
var 
cita 
= 
( 
_context  
.  !
Citas! &
.& '
OrderByDescending' 8
(8 9
x9 :
=>; =
x> ?
.? @
IdCita@ F
)F G
.G H
WhereH M
(M N
xN O
=>P R
xS T
.T U
IdProspectoU `
==a c
intd g
.g h
Parseh m
(m n
idProspecton y
)y z
&&{ }
x~ 
.	 Ä)
CodigoIntermediarioCreacion
Ä õ
==
ú û!
codigoIntermediario
ü ≤
)
≤ ≥
)
≥ ¥
;
¥ µ
if 
( 
cita 
. 
Any 
( 
) 
) 
{   
if!! 
(!! 
cita!! 
.!! 
First!! 
(!! 
)!!  
.!!  !
FlagCalificacion!!! 1
??!!1 3
false!!3 8
)!!8 9
{"" 
tieneAgendamiento## %
=##& '
true##( ,
;##, -'
tieneAgendamientoCalificado$$ /
=$$0 1
true$$2 6
;$$6 7
mensajeEntrevista%% %
=%%& '
$str%%( G
;%%G H
numeroEntrevista&& $
=&&% &
cita&&' +
.&&+ ,
First&&, 1
(&&1 2
)&&2 3
.&&3 4"
CodigoTipoCalificacion&&4 J
==&&K M!
TablaTipoCalificacion&&N c
.&&c d

Concretado&&d n
?&&o p
cita&&q u
.&&u v
First&&v {
(&&{ |
)&&| }
.&&} ~
NumeroEntrevista	&&~ é
+
&&è ê
$num
&&ë í
:''& '
cita''( ,
.'', -
First''- 2
(''2 3
)''3 4
.''4 5
NumeroEntrevista''5 E
;''E F
}(( 
else)) 
{** 
tieneAgendamiento++ %
=++& '
true++( ,
;++, -'
tieneAgendamientoCalificado,, /
=,,0 1
false,,2 7
;,,7 8
mensajeEntrevista-- %
=--& '
$str--( J
;--J K
numeroEntrevista.. $
=..% &
cita..' +
...+ ,
First.., 1
(..1 2
)..2 3
...3 4
NumeroEntrevista..4 D
;..D E
}// 
}00 
responseService22 
=22 
numeroEntrevista22 .
!=22/ 1
$num222 3
?224 5
configurationHelper226 I
.22I J*
ObtenerCodigoRespuestaServicio22J h
(22h i$
CodigoRespuestaServicio	22i Ä
.
22Ä Å
Exito
22Å Ü
,
22Ü á
$str
22à ä
)
22ä ã
:33/ 0
configurationHelper331 D
.33D E*
ObtenerCodigoRespuestaServicio33E c
(33c d#
CodigoRespuestaServicio33d {
.33{ |
SinDatos	33| Ñ
,
33Ñ Ö
$str
33Ü à
)
33à â
;
33â ä
response55 
.55 
auditResponse55 "
=55# $
new55% (
AuditResponse55) 6
{557 8
codigoRespuesta559 H
=55I J
responseService55K Z
.55Z [
codigoRespuesta55[ j
,55j k
mensajeRespuesta55l |
=55} ~
responseService	55 é
.
55é è
mensajeRespuesta
55è ü
}
55† °
;
55° ¢
response66 
.66 
Entity66 
=66 
new66 !

AgendaCita66" ,
{66- .
TieneAgendamiento66/ @
=66A B
tieneAgendamiento66C T
,66T U'
TieneAgendamientoCalificado77/ J
=77K L'
tieneAgendamientoCalificado77M h
,77h i
Mensaje88/ 6
=887 8
mensajeEntrevista888 I
,88I J

NumeroCita99/ 9
=99: ;
numeroEntrevista99< L
}99M N
;99N O
return;; 
await;; 
Task;; 
.;; 

FromResult;; (
(;;( )
response;;) 1
);;1 2
;;;2 3
}<< 	
public>> 
async>> 
Task>> 
<>> 
ResponseModel>> '
<>>' (

AgendaCita>>( 2
>>>2 3
>>>3 4+
ValidarFechaHorarioAgendamiento>>5 T
(>>T U
int>>U X
codigoIntermediario>>Y l
,>>l m
string>>m s
	fechaCita>>t }
,>>} ~
string	>>~ Ñ

horaInicio
>>Ö è
,
>>è ê
string
>>ê ñ
horaFin
>>ó û
)
>>û ü
{?? 	
ConfigurationHelper@@ 
configurationHelper@@  3
=@@4 5
new@@6 9
ConfigurationHelper@@: M
(@@M N
)@@N O
;@@O P
ResponseServiceAA 
responseServiceAA +
;AA+ ,
ResponseModelBB 
<BB 

AgendaCitaBB $
>BB$ %
responseBB& .
=BB/ 0
newBB1 4
ResponseModelBB5 B
<BBB C

AgendaCitaBBC M
>BBM N
(BBN O
)BBO P
;BBP Q
boolDD 

existeCitaDD 
=DD 
_contextDD &
.DD& '
CitasDD' ,
.DD, -
WhereDD- 2
(DD2 3
xDD3 4
=>DD5 7
xDD8 9
.DD9 :'
CodigoIntermediarioCreacionDD: U
==DDV X
codigoIntermediarioDDY l
&&EE) +
xEE, -
.EE- .
	FechaCitaEE. 7
==EE8 :
DateTimeEE; C
.EEC D
ParseEED I
(EEI J
	fechaCitaEEJ S
)EES T
&&FF) +
(FF, -
(FF- .
TimeSpanFF. 6
.FF6 7
ParseFF7 <
(FF< =

horaInicioFF= G
)FFG H
>=FFI K
xFFL M
.FFM N

HoraInicioFFN X
&&FFY [
TimeSpanFF\ d
.FFd e
ParseFFe j
(FFj k
horaFinFFk r
)FFr s
<FFt u
xFFv w
.FFw x
HoraFinFFx 
)	FF Ä
||GG, .
(GG/ 0
xGG0 1
.GG1 2

HoraInicioGG2 <
>=GG= ?
TimeSpanGG@ H
.GGH I
ParseGGI N
(GGN O

horaInicioGGO Y
)GGY Z
&&GG[ ]
xGG^ _
.GG_ `

HoraInicioGG` j
<=GGk m
TimeSpanGGn v
.GGv w
ParseGGw |
(GG| }
horaFin	GG} Ñ
)
GGÑ Ö
)
GGÖ Ü
||HH, .
(HH/ 0
TimeSpanHH0 8
.HH8 9
ParseHH9 >
(HH> ?

horaInicioHH? I
)HHI J
>=HHK M
xHHN O
.HHO P

HoraInicioHHP Z
&&HH[ ]
TimeSpanHH^ f
.HHf g
ParseHHg l
(HHl m

horaInicioHHm w
)HHw x
<HHy z
xHH{ |
.HH| }
HoraFin	HH} Ñ
)
HHÑ Ö
)
HHÖ Ü
)
HHÜ á
.
HHá à
Any
HHà ã
(
HHã å
)
HHå ç
;
HHç é
boolJJ %
existeRecordatorioLLamadaJJ *
=JJ+ ,
(JJ- .
fromJJ. 2
rlJJ3 5
inJJ6 8
_contextJJ9 A
.JJA B 
RecordatorioLlamadasJJB V
joinKK, 0
pKK1 2
inKK3 5
_contextKK6 >
.KK> ?

ProspectosKK? I
onKKJ L
rlKKM O
.KKO P
IdProspectoKKP [
equalsKK\ b
pKKc d
.KKd e
IdProspectoKKe p
joinLL, 0
ciLL1 3
inLL4 6
_contextLL7 ?
.LL? @%
ConsolidadoIntermediariosLL@ Y
onLLZ \
pLL] ^
.LL^ _&
IdConsolidadoIntermediarioLL_ y
equals	LLz Ä
ci
LLÅ É
.
LLÉ Ñ(
IdConsolidadoIntermediario
LLÑ û
whereMM, 1
ciMM2 4
.MM4 5
CodigoIntermediarioMM5 H
==MMI K
codigoIntermediarioMML _
&&NN, .
(NN/ 0
(NN0 1
TimeSpanNN1 9
.NN9 :
ParseNN: ?
(NN? @

horaInicioNN@ J
)NNJ K
>=NNL N
rlNNO Q
.NNQ R

HoraInicioNNR \
&&NN] _
TimeSpanNN` h
.NNh i
ParseNNi n
(NNn o
horaFinNNo v
)NNv w
<NNx y
rlNNz |
.NN| }
HoraFin	NN} Ñ
)
NNÑ Ö
||OO+ -
(OO. /
rlOO/ 1
.OO1 2

HoraInicioOO2 <
>=OO= ?
TimeSpanOO@ H
.OOH I
ParseOOI N
(OON O

horaInicioOOO Y
)OOY Z
&&OO[ ]
rlOO^ `
.OO` a

HoraInicioOOa k
<=OOl n
TimeSpanOOo w
.OOw x
ParseOOx }
(OO} ~
horaFin	OO~ Ö
)
OOÖ Ü
)
OOÜ á
||PP+ -
(PP. /
TimeSpanPP/ 7
.PP7 8
ParsePP8 =
(PP= >

horaInicioPP> H
)PPH I
>=PPJ L
rlPPM O
.PPO P

HoraInicioPPP Z
&&PP[ ]
TimeSpanPP^ f
.PPf g
ParsePPg l
(PPl m

horaInicioPPm w
)PPw x
<PPy z
rlPP{ }
.PP} ~
HoraFin	PP~ Ö
)
PPÖ Ü
)
PPÜ á
selectQQ+ 1
newQQ2 5
{QQ5 6
rlQQ6 8
}QQ8 9
)QQ9 :
.QQ: ;
AnyQQ; >
(QQ> ?
)QQ? @
;QQ@ A
responseServiceSS 
=SS 

existeCitaSS (
||SS) +%
existeRecordatorioLLamadaSS, E
?SSF G
configurationHelperSSH [
.SS[ \*
ObtenerCodigoRespuestaServicioSS\ z
(SSz {$
CodigoRespuestaServicio	SS{ í
.
SSí ì
Exito
SSì ò
,
SSò ô
$str
SSö ú
)
SSú ù
:TT/ 0
configurationHelperTT1 D
.TTD E*
ObtenerCodigoRespuestaServicioTTE c
(TTc d#
CodigoRespuestaServicioTTd {
.TT{ |
SinDatos	TT| Ñ
,
TTÑ Ö
$str
TTÜ à
)
TTà â
;
TTâ ä
responseVV 
.VV 
auditResponseVV "
=VV# $
newVV% (
AuditResponseVV) 6
{VV7 8
codigoRespuestaVV9 H
=VVI J
responseServiceVVK Z
.VVZ [
codigoRespuestaVV[ j
,VVj k
mensajeRespuestaVVl |
=VV} ~
responseService	VV é
.
VVé è
mensajeRespuesta
VVè ü
}
VV† °
;
VV° ¢
responseWW 
.WW 
EntityWW 
=WW 
newWW !

AgendaCitaWW" ,
{WW- .
MensajeWW/ 6
=WW7 8

existeCitaWW9 C
||WWD F%
existeRecordatorioLLamadaWWG `
?WWa b
$str	WWc ®
:
WW© ™
$str
WW´ ≠
}
WWÆ Ø
;
WWØ ∞
returnYY 
awaitYY 
TaskYY 
.YY 

FromResultYY (
(YY( )
responseYY) 1
)YY1 2
;YY2 3
}ZZ 	
}[[ 
}\\ —
VD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Cita\CitaQueriesExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
Cita) -
{ 
public 

class 1
%ResponseObtenerNumeroCitaQueryExample 6
:7 8
IExamplesProvider9 J
<J K1
%ResponseObtenerNumeroCitaQueryExampleK p
>p q
{ 
public		 1
%ResponseObtenerNumeroCitaQueryExample		 4
(		4 5
)		5 6
=>		7 9
responseModel		: G
=		H I
new		J M
ResponseModel		N [
<		[ \

AgendaCita		\ f
>		f g
(		g h
)		h i
;		i j
public

 
ResponseModel

 
<

 

AgendaCita

 '
>

' (
responseModel

) 6
{

7 8
get

9 <
;

< =
set

> A
;

A B
}

C D
public 1
%ResponseObtenerNumeroCitaQueryExample 4
GetExamples5 @
(@ A
)A B
{ 	

AgendaCita 

agendaCita !
=" #
new$ '

AgendaCita( 2
(2 3
)3 4
;4 5

agendaCita 
. 
TieneAgendamiento (
=) *
false+ 0
;0 1

agendaCita 
. 

NumeroCita !
=" #
$num$ %
;% &
string 
mensajeRespuesta #
=$ %
string& ,
., -
Empty- 2
;2 3
int 
status 
= 
$num 
; 
AuditResponse 
auditResponse '
=( )
new* -
AuditResponse. ;
(; <
)< =
;= >
auditResponse 
. 
idTransaccion '
=( )
$str* 5
;5 6
auditResponse 
. 
codigoRespuesta )
=* +#
CodigoRespuestaServicio, C
.C D
ExitoD I
;I J
new 
ConfigurationHelper #
(# $
)$ %
.% &+
ObtenerMensajeRespuestaServicio& E
(E F
auditResponseF S
.S T
codigoRespuestaT c
,c d
refe h
mensajeRespuestai y
,y z
ref{ ~
status	 Ö
)
Ö Ü
;
Ü á
auditResponse 
. 
mensajeRespuesta *
=+ ,
mensajeRespuesta- =
;= >
return 
new 1
%ResponseObtenerNumeroCitaQueryExample <
(< =
)= >
{ 
responseModel 
= 
new  #
ResponseModel$ 1
<1 2

AgendaCita2 <
>< =
(= >
)> ?
{ 
auditResponse !
=" #
auditResponse$ 1
,1 2
Entity 
= 

agendaCita '
} 
}   
;   
}"" 	
}## 
}$$ Ü
QD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Cita\CitaViewModel.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
Cita) -
{ 
public 

class 

AgendaCita 
{ 
public 
bool 
TieneAgendamiento %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool '
TieneAgendamientoCalificado /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
int 

NumeroCita 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Mensaje		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
}

 
} Ö	
PD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Cita\ICitaQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
Cita) -
{ 
public 

	interface 
ICitaQueries !
{ 
Task		 
<		 
ResponseModel		 
<		 

AgendaCita		 %
>		% &
>		& '
ObtenerNumeroCita		( 9
(		9 :
string		: @
idProspecto		A L
,		L M
int		N Q
codigoIntermediario		R e
)		e f
;		f g
Task

 
<

 
ResponseModel

 
<

 

AgendaCita

 %
>

% &
>

& '+
ValidarFechaHorarioAgendamiento

( G
(

G H
int

H K
codigoIntermediario

L _
,

_ `
string

a g
	fechaCita

h q
,

q r
string

s y

horaInicio	

z Ñ
,


Ñ Ö
string


Ü å
horaFin


ç î
)


î ï
;


ï ñ
} 
} Á
wD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\ConsolidadoIntermediario\ConsolidadoIntermediarioQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )$
ConsolidadoIntermediario) A
{		 
public

 

class

 +
ConsolidadoIntermediarioQueries

 0
:

1 2,
 IConsolidadoIntermediarioQueries

3 S
{ 
private 
readonly 
string 
_connectionString  1
;1 2
public +
ConsolidadoIntermediarioQueries .
(. /
string/ 5
constr6 <
)< =
{ 	
_connectionString 
= 
!  !
string! '
.' (
IsNullOrWhiteSpace( :
(: ;
constr; A
)A B
?C D
constrE K
:L M
throwN S
newT W!
ArgumentNullExceptionX m
(m n
nameofn t
(t u
constru {
){ |
)| }
;} ~
} 	
public 
async 
Task 
< 
int 
> -
!ObtenerIdConsolidadoIntermediario @
(@ A
intA D
codigointermediarioE X
)X Y
{ 	
using 
( 
var 

connection !
=" #
new$ '
SqlConnection( 5
(5 6
_connectionString6 G
)G H
)H I
{ 
await 

connection  
.  !
	OpenAsync! *
(* +
)+ ,
;, -
var 
result 
= 
( 
await #

connection$ .
.. /

QueryAsync/ 9
<9 :
int: =
>= >
(> ?
$str I
, 
new 
{ 
codigointermediario  3
}4 5
) 
) 
. 
AsEnumerable #
(# $
)$ %
.% &
FirstOrDefault& 4
(4 5
)5 6
;6 7
return 
result 
; 
} 
}   	
}!! 
}"" §
xD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\ConsolidadoIntermediario\IConsolidadoIntermediarioQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )$
ConsolidadoIntermediario) A
{ 
public 

	interface ,
 IConsolidadoIntermediarioQueries 5
{ 
Task 
< 
int 
> -
!ObtenerIdConsolidadoIntermediario 3
(3 4
int4 7
codigointermediario8 K
)K L
;L M
} 
}		 õ
YD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Generales\GeneralesQueries.cs
	namespace		 	
Agenda		
 
.		 
API		 
.		 
Application		  
.		  !
Queries		! (
.		( )
	Generales		) 2
{

 
public 

class 
GeneralesQueries !
:" #
IGeneralesQueries$ 5
{ 
private 
readonly 
string 
_connectionString  1
;1 2
public 
GeneralesQueries 
(  
IConfiguration  .
configuration/ <
)< =
{ 	
_connectionString 
= 
configuration  -
.- .
GetConnectionString. A
(A B
$strB N
)N O
;O P
} 	
public 
async 
Task 
< 
short 
>  "
ObtenerCodigoRangoEdad! 7
(7 8
DateTime8 @
fechanacimientoA P
,P Q
intQ T
codigointermediarioU h
)h i
{ 	
using 
( 
var 

connection !
=" #
new$ '
SqlConnection( 5
(5 6
_connectionString6 G
)G H
)H I
{ 
await 

connection  
.  !
	OpenAsync! *
(* +
)+ ,
;, -
var 
result 
= 
( 
await #

connection$ .
.. /

QueryAsync/ 9
<9 :
short: ?
>? @
(@ A
$str L
, 
new 
{ 
fechanacimiento  /
,/ 0
codigointermediario0 C
}D E
) 
) 
. 
AsEnumerable #
(# $
)$ %
.% &
FirstOrDefault& 4
(4 5
)5 6
;6 7
return!! 
result!! 
;!! 
}"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
short%%  
>%%  !#
ObtenerCodigoRangoFondo%%" 9
(%%9 :
decimal%%: A
monto%%B G
,%%G H
int%%I L
codigointermediario%%M `
)%%` a
{&& 	
using'' 
('' 
var'' 

connection'' !
=''" #
new''$ '
SqlConnection''( 5
(''5 6
_connectionString''6 G
)''G H
)''H I
{(( 
await)) 

connection))  
.))  !
	OpenAsync))! *
())* +
)))+ ,
;)), -
var++ 
result++ 
=++ 
(++ 
await++ #

connection++$ .
.++. /

QueryAsync++/ 9
<++9 :
short++: ?
>++? @
(++@ A
$str,. N
,// 
new// 
{// 
monto//  %
,//% &
codigointermediario//& 9
}//: ;
)00 
)00 
.00 
AsEnumerable00 #
(00# $
)00$ %
.00% &
FirstOrDefault00& 4
(004 5
)005 6
;006 7
return22 
result22 
;22 
}33 
}44 	
}55 
}66 ü
ZD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Generales\IGeneralesQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
	Generales) 2
{ 
public 

	interface 
IGeneralesQueries &
{ 
Task		 
<		 
short		 
>		 #
ObtenerCodigoRangoFondo		 +
(		+ ,
decimal		, 3
monto		4 9
,		9 :
int		: =
codigointermediario		> Q
)		Q R
;		R S
Task

 
<

 
short

 
>

 "
ObtenerCodigoRangoEdad

 *
(

* +
DateTime

+ 3
fechanacimiento

4 C
,

C D
int

D G
codigointermediario

H [
)

[ \
;

\ ]
} 
} ˇ	
ZD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Prospecto\IProspectoQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
	Prospecto) 2
{ 
public		 

	interface		 
IProspectoQueries		 &
{

 
Task 
< 
ResponseModel 
< 
List 
<  
	Prospecto  )
>) *
>* +
>+ ,%
ObtenerProspectoPorFiltro- F
(F G 
ProspectoQueryFilterG [ 
prospectoQueryFilter\ p
)p q
;q r
Task 
< 
ResponseModel 
< &
ActualizarProspectoCommand 5
>5 6
>6 71
%ObtenerProspectoDetallePorIdProspecto8 ]
(] ^
string^ d
idProspectoe p
)p q
;q r
Task 
< 
ResponseModel 
< 
	Prospecto $
>$ %
>% &'
ObtenerProspectoVistaPrevia' B
(B C
intC F
idProspectoG R
)R S
;S T
} 
} Î‹
YD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Prospecto\ProspectoQueries.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
	Prospecto) 2
{ 
public 

class 
ProspectoQueries !
:" #
IProspectoQueries$ 5
{ 
private 
readonly 
AgendaContext &
_context' /
;/ 0
public 
ProspectoQueries	 
( 
AgendaContext '
context( /
)/ 0
=>1 3
_context4 <
== >
context? F
;F G
public 
async 
Task 
< 
ResponseModel '
<' (
List( ,
<, -
	Prospecto- 6
>6 7
>7 8
>8 9%
ObtenerProspectoPorFiltro: S
(S T 
ProspectoQueryFilterT h 
prospectoQueryFilteri }
)} ~
{ 	
ConfigurationHelper 
configurationHelper  3
=4 5
new6 9
ConfigurationHelper: M
(M N
)N O
;O P
ResponseService 
responseService +
;+ ,
ResponseModel 
< 
List 
< 
	Prospecto (
>( )
>) *
response+ 3
=4 5
new6 9
ResponseModel: G
<G H
ListH L
<L M
	ProspectoM V
>V W
>W X
(X Y
)Y Z
;Z [
List 
< 
	Prospecto 
> 
result "
=# $
new% (
List) -
<- .
	Prospecto. 7
>7 8
(8 9
)9 :
;: ;
List 
< 
Referido 
> 
	referidos $
;$ % 
prospectoQueryFilter 
. 
	parametro !
=" # 
prospectoQueryFilter$ 8
.8 9
	parametro9 B
??C E
$strF H
;H I
switch 	
(
  
prospectoQueryFilter 
.  
tab  #
)# $
{ 
case   
$str   %
:  % &
if!! 
(!! 	 
prospectoQueryFilter!!	 
.!! 
	parametro!! '
==!!' )
$str!!) +
)!!+ ,
{"" 
result$$ 
=$$ 
await$$ 
($$ #
ObtenerProspectosDelDia$$ -
($$- . 
prospectoQueryFilter$$. B
)$$B C
.$$C D
Where$$D I
($$I J
x$$J K
=>$$L N
!$$O P
x$$P Q
.$$Q R
FlagDescarte$$R ^
.$$^ _
HasValue$$_ g
)$$g h
)$$h i
.$$i j
ToListAsync$$j u
($$u v
)$$v w
;$$w x
}%% 
else&& 	
{'' 
result)) 
.)) 
AddRange)) 
()) #
ObtenerProspectosDelDia)) -
())- . 
prospectoQueryFilter)). B
)))B C
)))C D
;))D E
result,, 
.,, 
AddRange,, 
(,, !
ObtenerAgendadosCitas,, +
(,,+ , 
prospectoQueryFilter,,, @
),,@ A
),,A B
;,,B C
result// 
.// 
AddRange// 
(// !
ObtenerCitaCalificada// +
(//+ , 
prospectoQueryFilter//, @
)//@ A
)//A B
;//B C
result22 
.22 
AddRange22 
(22 /
#ObtenerAgendadosRecordatorioLlamada22 9
(229 : 
prospectoQueryFilter22: N
,22N O
result22P V
.22V W
Select22W ]
(22] ^
x22^ _
=>22` b
x22c d
.22d e
IdProspecto22e p
)22p q
.22q r
ToList22r x
(22x y
)22y z
)22z {
)22{ |
;22| }
}33 
break44 

;44
 
case66 
$str66 $
:66$ %
if77 
(77  
prospectoQueryFilter77 
.77 
	parametro77 &
==77& (
$str77( *
)77* +
{88  
prospectoQueryFilter:: 
.:: 
fechacreacioncita:: ,
=::- .
DateTime::/ 7
.::7 8
Now::8 ;
;::; <
result;; 
=;; 
await;; 
(;; !
ObtenerAgendadosCitas;; +
(;;+ , 
prospectoQueryFilter;;, @
);;@ A
);;A B
.;;B C
ToListAsync;;C N
(;;N O
);;O P
;;;P Q
}<< 
else== 	
{>> 
result?? 
.?? 
AddRange?? 
(?? #
ObtenerProspectosDelDia?? -
(??- . 
prospectoQueryFilter??. B
)??B C
)??C D
;??D E
result@@ 
.@@ 
AddRange@@ 
(@@ !
ObtenerAgendadosCitas@@ +
(@@+ , 
prospectoQueryFilter@@, @
)@@@ A
)@@A B
;@@B C
resultAA 
.AA 
AddRangeAA 
(AA !
ObtenerCitaCalificadaAA +
(AA+ , 
prospectoQueryFilterAA, @
)AA@ A
)AAA B
;AAB C
resultBB 
.BB 
AddRangeBB 
(BB /
#ObtenerAgendadosRecordatorioLlamadaBB 9
(BB9 : 
prospectoQueryFilterBB: N
,BBN O
resultBBP V
.BBV W
SelectBBW ]
(BB] ^
xBB^ _
=>BB` b
xBBc d
.BBd e
IdProspectoBBe p
)BBp q
.BBq r
ToListBBr x
(BBx y
)BBy z
)BBz {
)BB{ |
;BB| }
}CC 
breakDD 

;DD
 
caseFF 
$strFF .
:FF. /
ifGG 
(GG  
prospectoQueryFilterGG 
.GG 
	parametroGG &
==GG& (
$strGG( *
)GG* +
{HH 
ListJJ 

<JJ
 
intJJ 
>JJ 
idsprospectoJJ 
=JJ 
newJJ "
ListJJ# '
<JJ' (
intJJ( +
>JJ+ ,
(JJ, -
)JJ- .
{JJ. /
$numJJ0 1
}JJ2 3
;JJ3 4
resultKK 
=KK 
awaitKK 
(KK /
#ObtenerAgendadosRecordatorioLlamadaKK 9
(KK9 : 
prospectoQueryFilterKK: N
,KKN O
idsprospectoKKP \
)KK\ ]
)KK] ^
.KK^ _
ToListAsyncKK_ j
(KKj k
)KKk l
;KKl m
}LL 
elseMM 	
{NN 
resultOO 
.OO 
AddRangeOO 
(OO #
ObtenerProspectosDelDiaOO -
(OO- . 
prospectoQueryFilterOO. B
)OOB C
)OOC D
;OOD E
resultPP 
.PP 
AddRangePP 
(PP !
ObtenerAgendadosCitasPP +
(PP+ , 
prospectoQueryFilterPP, @
)PP@ A
)PPA B
;PPB C
resultQQ 
.QQ 
AddRangeQQ 
(QQ !
ObtenerCitaCalificadaQQ +
(QQ+ , 
prospectoQueryFilterQQ, @
)QQ@ A
)QQA B
;QQB C
resultRR 
.RR 
AddRangeRR 
(RR /
#ObtenerAgendadosRecordatorioLlamadaRR 9
(RR9 : 
prospectoQueryFilterRR: N
,RRN O
resultRRP V
.RRV W
SelectRRW ]
(RR] ^
xRR^ _
=>RR` b
xRRc d
.RRd e
IdProspectoRRe p
)RRp q
.RRq r
ToListRRr x
(RRx y
)RRy z
)RRz {
)RR{ |
;RR| }
}SS 
breakTT 

;TT
 
}UU 
	referidosXX 
=XX 
resultXX "
.XX" #
WhereXX# (
(XX( )
xXX) *
=>XX+ -
xXX. /
.XX/ 0
IdReferenciadorXX0 ?
!=XX@ B
$numXXC D
)XXD E
.XXE F
SelectXXF L
(XXL M
xXXM N
=>XXO Q
newXXR U
ReferidoXXV ^
{YY 
NombresApellidosZZ $
=ZZ% &
xZZ' (
.ZZ( )
NombresApellidosZZ) 9
,ZZ9 :
NombresZZ: A
=ZZB C
xZZD E
.ZZE F
NombresZZF M
,ZZM N
CodigoTipoDocumento[[ '
=[[( )
x[[* +
.[[+ ,
CodigoTipoDocumento[[, ?
,[[? @
NumeroDocumento\\ #
=\\$ %
x\\& '
.\\' (
NumeroDocumento\\( 7
,\\7 8
ApellidoPaterno]] #
=]]$ %
x]]& '
.]]' (
ApellidoPaterno]]( 7
,]]7 8
ApellidoMaterno^^ #
=^^$ %
x^^& '
.^^' (
ApellidoMaterno^^( 7
,^^7 8
Fuente__ 
=__ 
x__ 
.__ 
Fuente__ %
,__% &
CodigoFuente__& 2
=__3 4
x__5 6
.__6 7
CodigoFuente__7 C
,__C D
CodigoSubFuente__D S
=__T U
x__V W
.__W X
CodigoSubFuente__X g
,__g h
NombreFuente``  
=``! "
x``# $
.``$ %
NombreFuente``% 1
,``1 2
NombreSubFuente``2 A
=``B C
x``D E
.``E F
NombreSubFuente``F U
,``U V
Edadaa 
=aa 
xaa 
.aa 
Edadaa !
,aa! "
FechaNacimientobb #
=bb$ %
xbb& '
.bb' (
FechaNacimientobb( 7
,bb7 8
IdProspectocc 
=cc  !
xcc" #
.cc# $
IdReferenciadorcc$ 3
,cc3 4
TelefonoFijodd  
=dd! "
xdd# $
.dd$ %
TelefonoFijodd% 1
,dd1 2
TelefonoCelularee #
=ee$ %
xee& '
.ee' (
TelefonoCelularee( 7
,ee7 8
Hijosff 
=ff 
xff 
.ff 
Hijosff #
,ff# $

CodigoSexogg 
=gg  
xgg! "
.gg" #

CodigoSexogg# -
,gg- .
Sexohh 
=hh 
xhh 
.hh 
Sexohh !
,hh! "
	Direccionii 
=ii 
xii  !
.ii! "
	Direccionii" +
,ii+ ,
Departamento_Idjj #
=jj$ %
xjj& '
.jj' (
Departamento_Idjj( 7
,jj7 8
Provincia_Idjj8 D
=jjE F
xjjG H
.jjH I
Provincia_IdjjI U
,jjU V
Distrito_IdjjV a
=jjb c
xjjd e
.jje f
Distrito_Idjjf q
,jjq r
Departamentokk  
=kk! "
xkk# $
.kk$ %
Departamentokk% 1
,kk1 2
	Provinciakk2 ;
=kk< =
xkk> ?
.kk? @
	Provinciakk@ I
,kkI J
DistritokkJ R
=kkR S
xkkT U
.kkU V
DistritokkV ^
,kk^ _
Correoll 
=ll 
xll 
.ll 
Correoll %
,ll% &
Empresamm 
=mm 
xmm 
.mm  
Empresamm  '
,mm' (
CodigoCargonn 
=nn  !
xnn" #
.nn# $
CodigoCargonn$ /
,nn/ 0
NombreCargonn0 ;
=nn< =
xnn> ?
.nn? @
NombreCargonn@ K
,nnK L
	OtroCargonnL U
=nnV W
xnnX Y
.nnY Z
	OtroCargonnZ c
,nnc d
MonedaFondooo 
=oo  !
xoo" #
.oo# $
MonedaFondooo$ /
,oo/ 0

MontoFondooo0 :
=oo; <
xoo= >
.oo> ?

MontoFondooo? I
,ooI J
IdReferenciadorpp #
=pp$ %
xpp& '
.pp' (
IdReferenciadorpp( 7
,pp7 8
FlagDescarteqq  
=qq! "
xqq# $
.qq$ %
FlagDescarteqq% 1
,qq1 2
TextoMotivoDescarteqq2 E
=qqF G
xqqH I
.qqI J
TextoMotivoDescarteqqJ ]
,qq] ^
VisibleDescarterr #
=rr$ %
xrr& '
.rr' (
VisibleDescarterr( 7
,rr7 8
VisibleAgendarrr8 F
=rrG H
xrrI J
.rrJ K
VisibleAgendarrrK Y
,rrY Z
PorcentajeAvancess $
=ss% &
xss' (
.ss( )
PorcentajeAvancess) 9
,ss9 :
DescripcionAvancett %
=tt& '
xtt( )
.tt) *
DescripcionAvancett* ;
,tt; <
FechaEstimadaCierreuu '
=uu( )
xuu* +
.uu+ ,
FechaEstimadaCierreuu, ?
,uu? @
FechaCreacionvv !
=vv" #
xvv$ %
.vv% &
FechaCreacionvv& 3
,vv3 4 
FechaUltimaActividadww 
=ww 
xww 
.ww  
FechaUltimaActividadww 2
}xx 
)xx 
.xx 
ToListxx 
(xx 
)xx 
;xx 
foreachzz 
(zz 
varzz 
	prospectozz &
inzz' )
resultzz* 0
)zz0 1
	prospecto{{ 
.{{ 
	Referidos{{ '
={{( )
	referidos{{* 3
.{{3 4
Where{{4 9
({{9 :
x{{: ;
=>{{< >
x{{? @
.{{@ A
IdProspecto{{A L
=={{M O
	prospecto{{P Y
.{{Y Z
IdProspecto{{Z e
){{e f
.{{f g
ToList{{g m
({{m n
){{n o
;{{o p
responseService}} 
=}}  !
result}}" (
.}}( )
Any}}) ,
(}}, -
)}}- .
?}}/ 0
configurationHelper}}1 D
.}}D E*
ObtenerCodigoRespuestaServicio}}E c
(}}c d#
CodigoRespuestaServicio}}d {
.}}{ |
Exito	}}| Å
,
}}Å Ç
$str
}}É Ö
)
}}Ö Ü
:~~/ 0
configurationHelper~~1 D
.~~D E*
ObtenerCodigoRespuestaServicio~~E c
(~~c d#
CodigoRespuestaServicio~~d {
.~~{ |
SinDatos	~~| Ñ
,
~~Ñ Ö
$str
~~Ü à
)
~~à â
;
~~â ä
response
ÄÄ 
.
ÄÄ 
auditResponse
ÄÄ &
=
ÄÄ' (
new
ÄÄ) ,
AuditResponse
ÄÄ- :
{
ÄÄ; <
codigoRespuesta
ÄÄ= L
=
ÄÄM N
responseService
ÄÄO ^
.
ÄÄ^ _
codigoRespuesta
ÄÄ_ n
,
ÄÄn o
mensajeRespuestaÄÄp Ä
=ÄÄÅ Ç
responseServiceÄÄÉ í
.ÄÄí ì 
mensajeRespuestaÄÄì £
}ÄÄ§ •
;ÄÄ• ¶
response
ÅÅ 
.
ÅÅ 
Entity
ÅÅ 
=
ÅÅ  !
result
ÅÅ" (
.
ÅÅ( )
OrderByDescending
ÅÅ) :
(
ÅÅ: ;
x
ÅÅ; <
=>
ÅÅ= ?
x
ÅÅ@ A
.
ÅÅA B
IdProspecto
ÅÅB M
)
ÅÅM N
.
ÅÅN O
OrderByDescending
ÅÅO `
(
ÅÅ` a
x
ÅÅa b
=>
ÅÅc e
x
ÅÅf g
.
ÅÅg h
CodigoFuente
ÅÅh t
)
ÅÅt u
.
ÅÅu v
ToList
ÅÅv |
(
ÅÅ| }
)
ÅÅ} ~
;
ÅÅ~ 
return
ÉÉ 	
response
ÉÉ
 
;
ÉÉ 
}
ÑÑ 
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
ResponseModel
ÖÖ '
<
ÖÖ' ((
ActualizarProspectoCommand
ÖÖ( B
>
ÖÖB C
>
ÖÖC D3
%ObtenerProspectoDetallePorIdProspecto
ÖÖE j
(
ÖÖj k
string
ÖÖk q
idProspecto
ÖÖr }
)
ÖÖ} ~
{
ÜÜ 	
ResponseModel
áá 
<
áá (
ActualizarProspectoCommand
áá 4
>
áá4 5
response
áá6 >
=
áá? @
new
ááA D
ResponseModel
ááE R
<
ááR S(
ActualizarProspectoCommand
ááS m
>
áám n
(
áán o
)
ááo p
;
ááp q(
ActualizarProspectoCommand
àà &
result
àà' -
;
àà- .!
ConfigurationHelper
ââ !
configurationHelper
ââ  3
=
ââ4 5
new
ââ6 9!
ConfigurationHelper
ââ: M
(
ââM N
)
ââN O
;
ââO P
ResponseService
ää 
responseService
ää +
;
ää+ ,
result
åå 	
=
åå
 
await
åå *
ObtenerProspectoDetallePorId
åå .
(
åå. /
int
åå/ 2
.
åå2 3
Parse
åå3 8
(
åå8 9
idProspecto
åå9 D
)
ååD E
)
ååE F
.
ååF G!
FirstOrDefaultAsync
ååG Z
(
ååZ [
)
åå[ \
;
åå\ ]
responseService
éé 
=
éé 
result
éé $
!=
éé% '
null
éé( ,
?
éé- .!
configurationHelper
éé/ B
.
ééB C,
ObtenerCodigoRespuestaServicio
ééC a
(
ééa b%
CodigoRespuestaServicio
ééb y
.
ééy z
Exito
ééz 
,éé Ä
$strééÅ É
)ééÉ Ñ
:
èè/ 0!
configurationHelper
èè1 D
.
èèD E,
ObtenerCodigoRespuestaServicio
èèE c
(
èèc d%
CodigoRespuestaServicio
èèd {
.
èè{ |
SinDatosèè| Ñ
,èèÑ Ö
$strèèÜ à
)èèà â
;èèâ ä
response
ëë 
.
ëë 
auditResponse
ëë "
=
ëë# $
new
ëë% (
AuditResponse
ëë) 6
{
ëë7 8
codigoRespuesta
ëë9 H
=
ëëI J
responseService
ëëK Z
.
ëëZ [
codigoRespuesta
ëë[ j
,
ëëj k
mensajeRespuesta
ëël |
=
ëë} ~
responseServiceëë é
.ëëé è 
mensajeRespuestaëëè ü
}ëë† °
;ëë° ¢
response
íí 
.
íí 
Entity
íí 
=
íí 
result
íí $
;
íí$ %
return
îî 
response
îî 
;
îî 
}
ïï 	
public
ññ 
async
ññ 
Task
ññ 
<
ññ 
ResponseModel
ññ '
<
ññ' (
	Prospecto
ññ( 1
>
ññ1 2
>
ññ2 3)
ObtenerProspectoVistaPrevia
ññ4 O
(
ññO P
int
ññP S
idProspecto
ññT _
)
ññ_ `
{
óó 	
ResponseModel
òò 
<
òò 
	Prospecto
òò #
>
òò# $
response
òò% -
=
òò. /
new
òò0 3
ResponseModel
òò4 A
<
òòA B
	Prospecto
òòB K
>
òòK L
(
òòL M
)
òòM N
;
òòN O!
ConfigurationHelper
ôô !
configurationHelper
ôô  3
=
ôô4 5
new
ôô6 9!
ConfigurationHelper
ôô: M
(
ôôM N
)
ôôN O
;
ôôO P
ResponseService
öö 
responseService
öö +
;
öö+ ,
	Prospecto
õõ 
result
õõ 
;
õõ 
result
ùù 	
=
ùù
 
await
ùù .
 ObtenerProspectoVistaPreviaPorId
ùù 3
(
ùù3 4
idProspecto
ùù4 ?
)
ùù? @
.
ùù@ A!
FirstOrDefaultAsync
ùùA T
(
ùùT U
)
ùùU V
;
ùùV W
responseService
üü 
=
üü 
result
üü 
!=
üü 
null
üü #
?
üü$ %!
configurationHelper
üü& 9
.
üü9 :,
ObtenerCodigoRespuestaServicio
üü: X
(
üüX Y%
CodigoRespuestaServicio
üüY p
.
üüp q
Exito
üüq v
,
üüv w
$str
üüx z
)
üüz {
:
†† !
configurationHelper
†† !
.
††! ",
ObtenerCodigoRespuestaServicio
††" @
(
††@ A%
CodigoRespuestaServicio
††A X
.
††X Y
SinDatos
††Y a
,
††a b
$str
††c e
)
††e f
;
††f g
response
¢¢ 
.
¢¢ 
auditResponse
¢¢ 
=
¢¢ 
new
¢¢ 
AuditResponse
¢¢  -
{
¢¢. /
codigoRespuesta
¢¢0 ?
=
¢¢@ A
responseService
¢¢B Q
.
¢¢Q R
codigoRespuesta
¢¢R a
,
¢¢a b
mensajeRespuesta
¢¢c s
=
¢¢t u
responseService¢¢v Ö
.¢¢Ö Ü 
mensajeRespuesta¢¢Ü ñ
}¢¢ó ò
;¢¢ò ô
response
££ 
.
££ 
Entity
££ 
=
££ 
result
££ 
;
££ 
return
•• 	
response
•• 
;
•• 
}
¶¶ 	
public
™™ 

IQueryable
™™ 
<
™™ (
ActualizarProspectoCommand
™™ 4
>
™™4 5*
ObtenerProspectoDetallePorId
™™6 R
(
™™R S
int
™™S V
idProspecto
™™W b
)
™™b c
{
´´ 
var
¨¨ 
result
¨¨ 
=
¨¨ 
(
¨¨ 
from
¨¨ 
p
¨¨ 
in
¨¨ 
_context
¨¨ #
.
¨¨# $

Prospectos
¨¨$ .
join
≠≠ 
a
≠≠ 
in
≠≠ 
_context
≠≠ 
.
≠≠ 
	AdnRentas
≠≠ #
on
≠≠$ &
p
≠≠' (
.
≠≠( )
IdProspecto
≠≠) 4
equals
≠≠5 ;
a
≠≠< =
.
≠≠= >
IdProspecto
≠≠> I
into
≠≠J N
ProspectoAdn
≠≠O [
from
ÆÆ 
pa
ÆÆ 
in
ÆÆ 
ProspectoAdn
ÆÆ 
.
ÆÆ 
DefaultIfEmpty
ÆÆ -
(
ÆÆ- .
)
ÆÆ. /
join
ØØ 
f
ØØ 
in
ØØ 
_context
ØØ 
.
ØØ 
ListaTablas
ØØ %
on
ØØ& (
p
ØØ) *
.
ØØ* +
CodigoFuente
ØØ+ 7
equals
ØØ8 >
f
ØØ? @
.
ØØ@ A
CodigoCampo
ØØA L
into
ØØM Q
ProspectoFuente
ØØR a
from
∞∞ 
pf
∞∞ 
in
∞∞ 
ProspectoFuente
∞∞ !
.
∞∞! "
DefaultIfEmpty
∞∞" 0
(
∞∞0 1
)
∞∞1 2
join
±± 
d
±± 
in
±± 
_context
±± 
.
±± !
DireccionProspectos
±± -
on
±±. 0
p
±±1 2
.
±±2 3
IdProspecto
±±3 >
equals
±±? E
d
±±F G
.
±±G H
IdProspecto
±±H S
into
±±T X 
ProspectoDireccion
±±Y k
from
≤≤ 
pd
≤≤ 
in
≤≤  
ProspectoDireccion
≤≤ $
.
≤≤$ %
DefaultIfEmpty
≤≤% 3
(
≤≤3 4
)
≤≤4 5
join
≥≥ 
r
≥≥ 
in
≥≥ 
_context
≥≥ 
.
≥≥ 

Prospectos
≥≥ $
on
≥≥% '
p
≥≥( )
.
≥≥) *
IdReferenciador
≥≥* 9
equals
≥≥: @
r
≥≥A B
.
≥≥B C
IdProspecto
≥≥C N
into
≥≥O S$
ProspectoReferenciador
≥≥T j
from
¥¥ 
pr
¥¥ 
in
¥¥ $
ProspectoReferenciador
¥¥ (
.
¥¥( )
DefaultIfEmpty
¥¥) 7
(
¥¥7 8
)
¥¥8 9
where
µµ 
p
µµ 
.
µµ 
IdProspecto
µµ 
==
µµ 
idProspecto
µµ )
select
∂∂ 
new
∂∂ 
{
∑∑ 
p
∏∏ 	
,
∏∏	 

pa
ππ 

,
ππ
 
pf
∫∫ 

,
∫∫
 
pd
ªª 

,
ªª
 
pr
ºº 

}
ΩΩ 
)
ΩΩ 	
.
ΩΩ	 

AsNoTracking
ΩΩ
 
(
ΩΩ 
)
ΩΩ 
.
ΩΩ 
Select
ΩΩ 
(
ΩΩ  
x
ΩΩ  !
=>
ΩΩ" $
new
ΩΩ% ((
ActualizarProspectoCommand
ΩΩ) C
{
ææ 
IdProspecto
øø 
=
øø 
x
øø 
.
øø 
p
øø 
.
øø 
IdProspecto
øø %
,
øø% &!
CodigoTipoDocumento
¿¿ 
=
¿¿ 
x
¿¿ 
.
¿¿  
p
¿¿  !
.
¿¿! "!
CodigoTipoDocumento
¿¿" 5
,
¿¿5 6
NumeroDocumento
¡¡ 
=
¡¡ 
x
¡¡ 
.
¡¡ 
p
¡¡ 
.
¡¡ 
NumeroDocumento
¡¡ -
,
¡¡- .
Nombres
¬¬ 
=
¬¬ 
x
¬¬ 
.
¬¬ 
p
¬¬ 
.
¬¬ 
Nombres
¬¬ 
,
¬¬ 
ApellidoPaterno
√√ 
=
√√ 
x
√√ 
.
√√ 
p
√√ 
.
√√ 
ApellidoPaterno
√√ -
,
√√- .
ApellidoMaterno
ƒƒ 
=
ƒƒ 
x
ƒƒ 
.
ƒƒ 
p
ƒƒ 
.
ƒƒ 
ApellidoMaterno
ƒƒ -
,
ƒƒ- .
FechaNacimiento
≈≈ 
=
≈≈ 
x
≈≈ 
.
≈≈ 
p
≈≈ 
.
≈≈ 
FechaNacimiento
≈≈ -
,
≈≈- .

CodigoSexo
∆∆ 
=
∆∆ 
x
∆∆ 
.
∆∆ 
p
∆∆ 
.
∆∆ 

CodigoSexo
∆∆ #
,
∆∆# $
FlagHijo
«« 
=
«« 
x
«« 
.
«« 
p
«« 
.
«« 
FlagHijo
«« 
,
««  
Empresa
»» 
=
»» 
x
»» 
.
»» 
p
»» 
.
»» 
Empresa
»» 
,
»» 
CodigoCargo
…… 
=
…… 
x
…… 
.
…… 
p
…… 
.
…… 
CodigoCargo
…… %
,
……% &
	OtroCargo
   
=
   
x
   
.
   
p
   
.
   
	OtroCargo
   !
,
  ! "
Referenciador
ÀÀ 
=
ÀÀ 
x
ÀÀ 
.
ÀÀ 
p
ÀÀ 
.
ÀÀ 
Referenciador
ÀÀ )
,
ÀÀ) *
CodigoFuente
ÃÃ 
=
ÃÃ 
x
ÃÃ 
.
ÃÃ 
p
ÃÃ 
.
ÃÃ 
CodigoFuente
ÃÃ '
,
ÃÃ' (
CodigoSubFuente
ÕÕ 
=
ÕÕ 
x
ÕÕ 
.
ÕÕ 
p
ÕÕ 
.
ÕÕ 
CodigoSubFuente
ÕÕ -
,
ÕÕ- .$
ProspectoReferenciador
ŒŒ 
=
ŒŒ  
x
ŒŒ! "
.
ŒŒ" #
p
ŒŒ# $
.
ŒŒ$ %
IdReferenciador
ŒŒ% 4
.
ŒŒ4 5
HasValue
ŒŒ5 =
?
ŒŒ> ?
string
ŒŒ@ F
.
ŒŒF G
Format
ŒŒG M
(
ŒŒM N
$str
ŒŒN [
,
ŒŒ[ \
x
ŒŒ] ^
.
ŒŒ^ _
pr
ŒŒ_ a
.
ŒŒa b
Nombres
ŒŒb i
,
ŒŒi j
x
ŒŒk l
.
ŒŒl m
pr
ŒŒm o
.
ŒŒo p
ApellidoPaterno
ŒŒp 
,ŒŒ Ä
xŒŒÅ Ç
.ŒŒÇ É
prŒŒÉ Ö
.ŒŒÖ Ü
ApellidoMaternoŒŒÜ ï
)ŒŒï ñ
:
œœ 
$str
œœ 
,
œœ 
TelefonoFijo
–– 
=
–– 
x
–– 
.
–– 
p
–– 
.
–– 
TelefonoFijo
–– '
,
––' (
TelefonoCelular
—— 
=
—— 
x
—— 
.
—— 
p
—— 
.
—— 
TelefonoCelular
—— -
,
——- . 
CorreoElectronico1
““ 
=
““ 
x
““ 
.
““ 
p
““  
.
““  ! 
CorreoElectronico1
““! 3
,
““3 4
CodigoEtapa
”” 
=
”” 
x
”” 
.
”” 
p
”” 
.
”” 
CodigoEtapa
”” %
,
””% &
CodigoEstado
‘‘ 
=
‘‘ 
x
‘‘ 
.
‘‘ 
p
‘‘ 
.
‘‘ 
CodigoEstado
‘‘ '
,
‘‘' ('
ProspectoDireccionCommand
’’ !
=
’’" #
new
’’$ ''
ProspectoDireccionCommand
’’( A
{
÷÷ 	
IdDireccion
◊◊	 
=
◊◊ 
x
◊◊ 
.
◊◊ 
pd
◊◊ 
.
◊◊ 
IdDireccion
◊◊ '
,
◊◊' (
IdProspecto
ÿÿ	 
=
ÿÿ 
x
ÿÿ 
.
ÿÿ 
pd
ÿÿ 
.
ÿÿ 
IdProspecto
ÿÿ '
,
ÿÿ' (
	Direccion
ŸŸ	 
=
ŸŸ 
x
ŸŸ 
.
ŸŸ 
pd
ŸŸ 
.
ŸŸ 
	Direccion
ŸŸ #
,
ŸŸ# $
Departamento_Id
⁄⁄	 
=
⁄⁄ 
x
⁄⁄ 
.
⁄⁄ 
pd
⁄⁄ 
.
⁄⁄  
Departamento_Id
⁄⁄  /
,
⁄⁄/ 0
Provincia_Id
€€	 
=
€€ 
x
€€ 
.
€€ 
pd
€€ 
.
€€ 
Provincia_Id
€€ )
,
€€) *
Distrito_Id
‹‹	 
=
‹‹ 
x
‹‹ 
.
‹‹ 
pd
‹‹ 
.
‹‹ 
Distrito_Id
‹‹ '
,
‹‹' (

FlagActivo
››	 
=
›› 
x
›› 
.
›› 
pd
›› 
.
›› 

FlagActivo
›› %
,
››% &
TipoDireccion
ﬁﬁ	 
=
ﬁﬁ 
x
ﬁﬁ 
.
ﬁﬁ 
pd
ﬁﬁ 
.
ﬁﬁ 
TipoDireccion
ﬁﬁ +
}
ﬂﬂ 	
,
ﬂﬂ	 
&
ProspectoAdnRentaCommand
‡‡  
=
‡‡! "
new
‡‡# &&
ProspectoAdnRentaCommand
‡‡' ?
{
·· 	!
MonedaPatrimonioAfp
‚‚	 
=
‚‚ 
x
‚‚  
.
‚‚  !
pa
‚‚! #
.
‚‚# $!
MonedaPatrimonioAfp
‚‚$ 7
,
‚‚7 8 
MontoPatrimonioAfp
„„	 
=
„„ 
x
„„ 
.
„„  
pa
„„  "
.
„„" # 
MontoPatrimonioAfp
„„# 5
,
„„5 6
PorcentajeAvance
‰‰	 
=
‰‰ 
x
‰‰ 
.
‰‰ 
pa
‰‰  
.
‰‰  !
PorcentajeAvance
‰‰! 1
,
‰‰1 2&
PorcentajeAvanceCompleto
ÂÂ	 !
=
ÂÂ" #
x
ÂÂ$ %
.
ÂÂ% &
pa
ÂÂ& (
.
ÂÂ( )&
PorcentajeAvanceCompleto
ÂÂ) A
}
ÊÊ 	
}
ËË 
)
ËË 	
;
ËË	 

return
ÈÈ 	
result
ÈÈ
 
;
ÈÈ 
}
ÍÍ 
public
ÏÏ 

IQueryable
ÏÏ	 
<
ÏÏ 
	Prospecto
ÏÏ 
>
ÏÏ .
 ObtenerProspectoVistaPreviaPorId
ÏÏ ?
(
ÏÏ? @
int
ÏÏ@ C
idProspecto
ÏÏD O
)
ÏÏO P
{
ÌÌ 
var
ÓÓ 
result
ÓÓ 
=
ÓÓ 
(
ÓÓ 
from
ÓÓ 
p
ÓÓ 
in
ÓÓ 
_context
ÓÓ $
.
ÓÓ$ %

Prospectos
ÓÓ% /
join
ÔÔ 
intermediario
ÔÔ 
in
ÔÔ 
_context
ÔÔ &
.
ÔÔ& ''
ConsolidadoIntermediarios
ÔÔ' @
on
ÔÔA C
p
ÔÔD E
.
ÔÔE F(
IdConsolidadoIntermediario
ÔÔF `
equals
ÔÔa g
intermediario
ÔÔh u
.
ÔÔu v)
IdConsolidadoIntermediarioÔÔv ê
join
 
adn
 
in
 
_context
 
.
 
	AdnRentas
 &
on
' )
p
* +
.
+ ,
IdProspecto
, 7
equals
8 >
adn
? B
.
B C
IdProspecto
C N
into
O S
ProspectoAdn
T `
from
ÒÒ 
padn
ÒÒ 
in
ÒÒ 
ProspectoAdn
ÒÒ !
.
ÒÒ! "
DefaultIfEmpty
ÒÒ" 0
(
ÒÒ0 1
)
ÒÒ1 2
join
ÚÚ 
fuente
ÚÚ 
in
ÚÚ 
_context
ÚÚ 
.
ÚÚ  
ListaTablas
ÚÚ  +
on
ÚÚ, .
new
ÚÚ/ 2
{
ÚÚ3 4
p
ÚÚ5 6
.
ÚÚ6 7
CodigoFuente
ÚÚ7 C
,
ÚÚC D
idtablafuente
ÚÚE R
=
ÚÚS T

TablaTabla
ÚÚU _
.
ÚÚ_ `
FuenteProspecto
ÚÚ` o
,
ÚÚo p
lnegocio
ÚÚq y
=
ÚÚz {
LineaNegocioÚÚ| à
.ÚÚà â
RentaÚÚâ é
}ÚÚè ê
equals
ÛÛ 
new
ÛÛ 
{
ÛÛ 
CodigoFuente
ÛÛ *
=
ÛÛ+ ,
(
ÛÛ- .
short
ÛÛ. 3
?
ÛÛ3 4
)
ÛÛ4 5
fuente
ÛÛ5 ;
.
ÛÛ; <
CodigoCampo
ÛÛ< G
,
ÛÛG H
idtablafuente
ÛÛI V
=
ÛÛW X
fuente
ÛÛY _
.
ÛÛ_ `
IdTabla
ÛÛ` g
,
ÛÛg h
lnegocio
ÛÛi q
=
ÛÛr s
fuente
ÛÛt z
.
ÛÛz {!
CodigoLineaNegocioÛÛ{ ç
}ÛÛé è
intoÛÛê î
ProspectoFuenteÛÛï §
from
ÙÙ 
pfuente
ÙÙ 
in
ÙÙ 
ProspectoFuente
ÙÙ '
.
ÙÙ' (
DefaultIfEmpty
ÙÙ( 6
(
ÙÙ6 7
)
ÙÙ7 8
join
ıı 
	subfuente
ıı 
in
ıı 
_context
ıı "
.
ıı" #
ListaTablas
ıı# .
on
ıı/ 1
new
ıı2 5
{
ıı6 7
p
ıı8 9
.
ıı9 :
CodigoSubFuente
ıı: I
,
ııI J
idtablaSubfuente
ııK [
=
ıı\ ]

TablaTabla
ıı^ h
.
ııh i
FuenteProspecto
ııi x
,
ııx y
lnegocioıız Ç
=ııÉ Ñ
LineaNegocioııÖ ë
.ııë í
Rentaııí ó
}ııò ô
equals
ˆˆ 
new
ˆˆ 
{
ˆˆ 
CodigoSubFuente
ˆˆ -
=
ˆˆ. /
(
ˆˆ0 1
short
ˆˆ1 6
?
ˆˆ6 7
)
ˆˆ7 8
	subfuente
ˆˆ8 A
.
ˆˆA B
CodigoCampo
ˆˆB M
,
ˆˆM N
idtablaSubfuente
ˆˆO _
=
ˆˆ` a
	subfuente
ˆˆb k
.
ˆˆk l
IdTabla
ˆˆl s
,
ˆˆs t
lnegocio
ˆˆu }
=
ˆˆ~ 
	subfuenteˆˆÄ â
.ˆˆâ ä"
CodigoLineaNegocioˆˆä ú
}ˆˆù û
intoˆˆü £"
ProspectoSubFuenteˆˆ§ ∂
from
˜˜ 

psubfuente
˜˜ 
in
˜˜  
ProspectoSubFuente
˜˜ -
.
˜˜- .
DefaultIfEmpty
˜˜. <
(
˜˜< =
)
˜˜= >
join
¯¯ 
referido
¯¯ 
in
¯¯ 
_context
¯¯ !
.
¯¯! "

Prospectos
¯¯" ,
on
¯¯- /
p
¯¯0 1
.
¯¯1 2
IdReferenciador
¯¯2 A
equals
¯¯B H
referido
¯¯I Q
.
¯¯Q R
IdProspecto
¯¯R ]
into
¯¯^ b
ProspectoReferido
¯¯c t
from
˘˘ 
	preferido
˘˘ 
in
˘˘ 
ProspectoReferido
˘˘ +
.
˘˘+ ,
DefaultIfEmpty
˘˘, :
(
˘˘: ;
)
˘˘; <
join
˙˙ 
cargo
˙˙ 
in
˙˙ 
_context
˙˙ 
.
˙˙ 
TablaTablas
˙˙ *
on
˙˙+ -
new
˙˙. 1
{
˙˙2 3
p
˙˙4 5
.
˙˙5 6
CodigoCargo
˙˙6 A
,
˙˙A B
idtablacargo
˙˙C O
=
˙˙P Q

TablaTabla
˙˙R \
.
˙˙\ ]
PersonaCargo
˙˙] i
}
˙˙j k
equals
˚˚ 
new
˚˚ 
{
˚˚ 
CodigoCargo
˚˚ (
=
˚˚) *
(
˚˚+ ,
short
˚˚, 1
?
˚˚1 2
)
˚˚2 3
cargo
˚˚3 8
.
˚˚8 9
CodigoCampo
˚˚9 D
,
˚˚D E
idtablacargo
˚˚F R
=
˚˚S T
cargo
˚˚U Z
.
˚˚Z [
IdTabla
˚˚[ b
}
˚˚c d
into
˚˚e i
ProspectoCargo
˚˚j x
from
¸¸ 
pcargo
¸¸ 
in
¸¸ 
ProspectoCargo
¸¸ %
.
¸¸% &
DefaultIfEmpty
¸¸& 4
(
¸¸4 5
)
¸¸5 6
join
˝˝ 
sexo
˝˝ 
in
˝˝ 
_context
˝˝ 
.
˝˝ 
TablaTablas
˝˝ )
on
˝˝* ,
new
˝˝- 0
{
˝˝1 2
p
˝˝3 4
.
˝˝4 5

CodigoSexo
˝˝5 ?
,
˝˝? @
idtablasexo
˝˝A L
=
˝˝M N

TablaTabla
˝˝O Y
.
˝˝Y Z
Sexo
˝˝Z ^
}
˝˝_ `
equals
˛˛ 
new
˛˛ 
{
˛˛ 

CodigoSexo
˛˛ &
=
˛˛' (
(
˛˛) *
short
˛˛* /
?
˛˛/ 0
)
˛˛0 1
sexo
˛˛1 5
.
˛˛5 6
CodigoCampo
˛˛6 A
,
˛˛A B
idtablasexo
˛˛C N
=
˛˛O P
sexo
˛˛Q U
.
˛˛U V
IdTabla
˛˛V ]
}
˛˛^ _
into
˛˛` d
ProspectoSexo
˛˛e r
from
ˇˇ 
psexo
ˇˇ 
in
ˇˇ 
ProspectoSexo
ˇˇ #
.
ˇˇ# $
DefaultIfEmpty
ˇˇ$ 2
(
ˇˇ2 3
)
ˇˇ3 4
join
ÄÄ 
	direccion
ÄÄ 
in
ÄÄ 
_context
ÄÄ "
.
ÄÄ" #!
DireccionProspectos
ÄÄ# 6
on
ÄÄ7 9
p
ÄÄ: ;
.
ÄÄ; <
IdProspecto
ÄÄ< G
equals
ÄÄH N
	direccion
ÄÄO X
.
ÄÄX Y
IdProspecto
ÄÄY d
into
ÄÄe i 
ProspectoDireccion
ÄÄj |
from
ÅÅ 

pdireccion
ÅÅ 
in
ÅÅ  
ProspectoDireccion
ÅÅ -
.
ÅÅ- .
DefaultIfEmpty
ÅÅ. <
(
ÅÅ< =
)
ÅÅ= >
join
ÇÇ 
distrito
ÇÇ 
in
ÇÇ 
_context
ÇÇ !
.
ÇÇ! "
	Distritos
ÇÇ" +
on
ÇÇ, .
new
ÇÇ/ 2
{
ÇÇ3 4

pdireccion
ÇÇ5 ?
.
ÇÇ? @
Departamento_Id
ÇÇ@ O
,
ÇÇO P

pdireccion
ÇÇQ [
.
ÇÇ[ \
Provincia_Id
ÇÇ\ h
,
ÇÇh i

pdireccion
ÇÇj t
.
ÇÇt u
Distrito_IdÇÇu Ä
}ÇÇÅ Ç
equals
ÉÉ 
new
ÉÉ 
{
ÉÉ 
distrito
ÉÉ &
.
ÉÉ& '
Departamento_Id
ÉÉ' 6
,
ÉÉ6 7
distrito
ÉÉ8 @
.
ÉÉ@ A
Provincia_Id
ÉÉA M
,
ÉÉM N
distrito
ÉÉO W
.
ÉÉW X
Distrito_Id
ÉÉX c
}
ÉÉd e
into
ÉÉf j
DireccionDistrito
ÉÉk |
from
ÑÑ 
	ddistrito
ÑÑ 
in
ÑÑ 
DireccionDistrito
ÑÑ +
.
ÑÑ+ ,
DefaultIfEmpty
ÑÑ, :
(
ÑÑ: ;
)
ÑÑ; <
join
ÖÖ 
	provincia
ÖÖ 
in
ÖÖ 
_context
ÖÖ "
.
ÖÖ" #

Provincias
ÖÖ# -
on
ÖÖ. 0
new
ÖÖ1 4
{
ÖÖ5 6

pdireccion
ÖÖ7 A
.
ÖÖA B
Provincia_Id
ÖÖB N
,
ÖÖN O

pdireccion
ÖÖP Z
.
ÖÖZ [
Departamento_Id
ÖÖ[ j
}
ÖÖk l
equals
ÜÜ 
new
ÜÜ 
{
ÜÜ 
	provincia
ÜÜ &
.
ÜÜ& '
Provincia_Id
ÜÜ' 3
,
ÜÜ3 4
	provincia
ÜÜ5 >
.
ÜÜ> ?
Departamento_Id
ÜÜ? N
}
ÜÜO P
into
ÜÜQ U 
DireccionProvincia
ÜÜV h
from
áá 

dprovincia
áá 
in
áá  
DireccionProvincia
áá -
.
áá- .
DefaultIfEmpty
áá. <
(
áá< =
)
áá= >
join
àà 
departamento
àà 
in
àà 
_context
àà %
.
àà% &
Departamentos
àà& 3
on
àà4 6

pdireccion
àà7 A
.
ààA B
Departamento_Id
ààB Q
equals
ààR X
departamento
ààY e
.
ààe f
Departamento_Id
ààf u
into
ààv z$
DireccionDepartamentoàà{ ê
from
ââ 
ddepartamento
ââ 
in
ââ #
DireccionDepartamento
ââ 3
.
ââ3 4
DefaultIfEmpty
ââ4 B
(
ââB C
)
ââC D
where
ää 
(
ää 
p
ää 
.
ää 
IdProspecto
ää 
==
ää 
idProspecto
ää  +
)
ää+ ,
select
ãã 
new
ãã 
{
åå 	
p
çç	 

,
çç
 
padn
éé	 
,
éé 
pfuente
èè	 
,
èè 

psubfuente
êê	 
,
êê 
	preferido
ëë	 
,
ëë 
psexo
íí	 
,
íí 
pcargo
ìì	 
,
ìì 

pdireccion
îî	 
,
îî 
	ddistrito
ïï	 
,
ïï 

dprovincia
ññ	 
,
ññ 
ddepartamento
óó	 
}
ôô 	
)
ôô	 

.
ôô
 
AsNoTracking
ôô 
(
ôô 
)
ôô 
.
ôô 
Select
ôô  
(
ôô  !
x
ôô! "
=>
ôô# %
new
ôô& )
	Prospecto
ôô* 3
{
öö 	
IdProspecto
õõ	 
=
õõ 
x
õõ 
.
õõ 
p
õõ 
.
õõ 
IdProspecto
õõ &
,
õõ& '
NombresApellidos
úú	 
=
úú 
string
úú "
.
úú" #
Format
úú# )
(
úú) *
$str
úú* 7
,
úú7 8
x
úú9 :
.
úú: ;
p
úú; <
.
úú< =
Nombres
úú= D
,
úúD E
x
úúF G
.
úúG H
p
úúH I
.
úúI J
ApellidoPaterno
úúJ Y
,
úúY Z
x
úú[ \
.
úú\ ]
p
úú] ^
.
úú^ _
ApellidoMaterno
úú_ n
)
úún o
,
úúo p!
CodigoTipoDocumento
ùù	 
=
ùù 
x
ùù  
.
ùù  !
p
ùù! "
.
ùù" #!
CodigoTipoDocumento
ùù# 6
.
ùù6 7
Value
ùù7 <
,
ùù< =
NumeroDocumento
ûû	 
=
ûû 
x
ûû 
.
ûû 
p
ûû 
.
ûû 
NumeroDocumento
ûû .
,
ûû. /
Nombres
üü	 
=
üü 
x
üü 
.
üü 
p
üü 
.
üü 
Nombres
üü 
,
üü 
ApellidoPaterno
††	 
=
†† 
x
†† 
.
†† 
p
†† 
.
†† 
ApellidoPaterno
†† .
,
††. /
ApellidoMaterno
°°	 
=
°° 
x
°° 
.
°° 
p
°° 
.
°° 
ApellidoMaterno
°° .
,
°°. /
CodigoFuente
¢¢	 
=
¢¢ 
x
¢¢ 
.
¢¢ 
p
¢¢ 
.
¢¢ 
CodigoFuente
¢¢ (
.
¢¢( )
Value
¢¢) .
,
¢¢. /
CodigoSubFuente
££	 
=
££ 
x
££ 
.
££ 
p
££ 
.
££ 
CodigoSubFuente
££ .
.
££. /
Value
££/ 4
,
££4 5
NombreFuente
§§	 
=
§§ 
x
§§ 
.
§§ 
pfuente
§§ !
.
§§! "
ValorCadena
§§" -
,
§§- .
NombreSubFuente
••	 
=
•• 
x
•• 
.
•• 

psubfuente
•• '
.
••' (
ValorCadena
••( 3
,
••3 4
TelefonoFijo
¶¶	 
=
¶¶ 
x
¶¶ 
.
¶¶ 
p
¶¶ 
.
¶¶ 
TelefonoFijo
¶¶ (
,
¶¶( )
TelefonoCelular
ßß	 
=
ßß 
x
ßß 
.
ßß 
p
ßß 
.
ßß 
TelefonoCelular
ßß .
,
ßß. /
FechaNacimiento
®®	 
=
®® 
x
®® 
.
®® 
p
®® 
.
®® 
FechaNacimiento
®® .
.
®®. /
Value
®®/ 4
,
®®4 5
	Direccion
©©	 
=
©© 
x
©© 
.
©© 

pdireccion
©© !
.
©©! "
	Direccion
©©" +
,
©©+ ,
Departamento_Id
™™	 
=
™™ 
x
™™ 
.
™™ 

pdireccion
™™ '
.
™™' (
Departamento_Id
™™( 7
,
™™7 8
Provincia_Id
´´	 
=
´´ 
x
´´ 
.
´´ 

pdireccion
´´ $
.
´´$ %
Provincia_Id
´´% 1
,
´´1 2
Distrito_Id
¨¨	 
=
¨¨ 
x
¨¨ 
.
¨¨ 

pdireccion
¨¨ #
.
¨¨# $
Distrito_Id
¨¨$ /
,
¨¨/ 0
Departamento
≠≠	 
=
≠≠ 
x
≠≠ 
.
≠≠ 
ddepartamento
≠≠ '
.
≠≠' (
Nombre
≠≠( .
,
≠≠. /
	Provincia
ÆÆ	 
=
ÆÆ 
x
ÆÆ 
.
ÆÆ 

dprovincia
ÆÆ !
.
ÆÆ! "
Nombre
ÆÆ" (
,
ÆÆ( )
Distrito
ØØ	 
=
ØØ 
x
ØØ 
.
ØØ 
	ddistrito
ØØ 
.
ØØ  
Nombre
ØØ  &
,
ØØ& '
Edad
∞∞	 
=
∞∞ 
DateTime
∞∞ 
.
∞∞ 
Now
∞∞ 
.
∞∞ 
Year
∞∞ !
-
∞∞" #
x
∞∞$ %
.
∞∞% &
p
∞∞& '
.
∞∞' (
FechaNacimiento
∞∞( 7
.
∞∞7 8
Value
∞∞8 =
.
∞∞= >
Year
∞∞> B
,
∞∞B C

CodigoSexo
±±	 
=
±± 
x
±± 
.
±± 
p
±± 
.
±± 

CodigoSexo
±± $
.
±±$ %
Value
±±% *
,
±±* +
Sexo
≤≤	 
=
≤≤ 
x
≤≤ 
.
≤≤ 
psexo
≤≤ 
.
≤≤ !
ValorAuxiliarCadena
≤≤ +
,
≤≤+ ,
Empresa
≥≥	 
=
≥≥ 
x
≥≥ 
.
≥≥ 
p
≥≥ 
.
≥≥ 
Empresa
≥≥ 
,
≥≥ 
CodigoCargo
¥¥	 
=
¥¥ 
x
¥¥ 
.
¥¥ 
p
¥¥ 
.
¥¥ 
CodigoCargo
¥¥ &
.
¥¥& '
Value
¥¥' ,
,
¥¥, -
NombreCargo
µµ	 
=
µµ 
x
µµ 
.
µµ 
pcargo
µµ 
.
µµ  
ValorCadena
µµ  +
,
µµ+ ,
	OtroCargo
∂∂	 
=
∂∂ 
x
∂∂ 
.
∂∂ 
p
∂∂ 
.
∂∂ 
	OtroCargo
∂∂ "
,
∂∂" #
Referenciador
∑∑	 
=
∑∑ 
x
∑∑ 
.
∑∑ 
p
∑∑ 
.
∑∑ 
Referenciador
∑∑ *
,
∑∑* +
Hijos
∏∏	 
=
∏∏ 
x
∏∏ 
.
∏∏ 
padn
∏∏ 
.
∏∏ $
NumeroHijosDependiente
∏∏ .
.
∏∏. /
Value
∏∏/ 4
,
∏∏4 5
Correo
ππ	 
=
ππ 
x
ππ 
.
ππ 
p
ππ 
.
ππ  
CorreoElectronico1
ππ (
,
ππ( )
MonedaFondo
∫∫	 
=
∫∫ 
x
∫∫ 
.
∫∫ 
padn
∫∫ 
.
∫∫ !
MonedaPatrimonioAfp
∫∫ 1
.
∫∫1 2
Value
∫∫2 7
,
∫∫7 8

MontoFondo
ªª	 
=
ªª 
x
ªª 
.
ªª 
padn
ªª 
.
ªª  
MontoPatrimonioAfp
ªª /
.
ªª/ 0
Value
ªª0 5
,
ªª5 6
Fuente
ºº	 
=
ºº 
string
ºº 
.
ºº 
Format
ºº 
(
ºº  
$str
ºº  ,
,
ºº, -
x
ºº. /
.
ºº/ 0
pfuente
ºº0 7
.
ºº7 8
ValorCadena
ºº8 C
,
ººC D
string
ººE K
.
ººK L
IsNullOrEmpty
ººL Y
(
ººY Z
x
ººZ [
.
ºº[ \

psubfuente
ºº\ f
.
ººf g
ValorCadena
ººg r
)
ººr s
?
ººt u
$str
ººv x
:
ººy z
$str
ºº{ ~
+ºº Ä
xººÅ Ç
.ººÇ É

psubfuenteººÉ ç
.ººç é
ValorCadenaººé ô
,ººô ö
x
ΩΩ 
.
ΩΩ 
p
ΩΩ 
.
ΩΩ 
IdReferenciador
ΩΩ $
.
ΩΩ$ %
HasValue
ΩΩ% -
?
ΩΩ. /
x
ΩΩ0 1
.
ΩΩ1 2
	preferido
ΩΩ2 ;
.
ΩΩ; <
Nombres
ΩΩ< C
+
ΩΩD E
$str
ΩΩF I
+
ΩΩJ K
x
ΩΩL M
.
ΩΩM N
	preferido
ΩΩN W
.
ΩΩW X
ApellidoPaterno
ΩΩX g
+
ΩΩh i
$str
ΩΩj m
+
ΩΩn o
x
ΩΩp q
.
ΩΩq r
	preferido
ΩΩr {
.
ΩΩ{ |
ApellidoMaternoΩΩ| ã
:ΩΩå ç
xΩΩé è
.ΩΩè ê
pΩΩê ë
.ΩΩë í
ReferenciadorΩΩí ü
)ΩΩü †
,ΩΩ† °
IdReferenciador
ææ	 
=
ææ 
x
ææ 
.
ææ 
p
ææ 
.
ææ 
IdReferenciador
ææ .
.
ææ. /
Value
ææ/ 4
,
ææ4 5
FlagDescarte
øø	 
=
øø 
x
øø 
.
øø 
p
øø 
.
øø 
FlagDescarte
øø (
,
øø( )
VisibleDescarte
¿¿	 
=
¿¿ 
true
¿¿ 
,
¿¿  
VisibleAgendar
¡¡	 
=
¡¡ 
true
¡¡ 
,
¡¡ 
FechaCreacion
¬¬	 
=
¬¬ 
x
¬¬ 
.
¬¬ 
p
¬¬ 
.
¬¬ $
AuditoriaFechaCreacion
¬¬ 3
}
√√ 	
)
√√	 

;
√√
 
return
≈≈ 	
result
≈≈
 
;
≈≈ 
}
∆∆ 
public
   

IQueryable
   
<
   
	Prospecto
   #
>
  # $%
ObtenerProspectosDelDia
  % <
(
  < ="
ProspectoQueryFilter
  = Q"
prospectoQueryFilter
  R f
)
  f g
{
ÀÀ 	
var
ÕÕ !
listcodigorangosexo
ÕÕ #
=
ÕÕ$ %"
prospectoQueryFilter
ÕÕ& :
.
ÕÕ: ;

codigosexo
ÕÕ; E
!=
ÕÕE G
null
ÕÕG K
?
ÕÕK L"
prospectoQueryFilter
ÕÕM a
.
ÕÕa b

codigosexo
ÕÕb l
.
ÕÕl m
Split
ÕÕm r
(
ÕÕr s
$char
ÕÕs v
)
ÕÕv w
.
ÕÕw x
Select
ÕÕx ~
(
ÕÕ~ 
shortÕÕ Ñ
.ÕÕÑ Ö
ParseÕÕÖ ä
)ÕÕä ã
.ÕÕã å
ToListÕÕå í
(ÕÕí ì
)ÕÕì î
:ÕÕî ï
nullÕÕï ô
;ÕÕô ö
var
ŒŒ !
listcodigorangoedad
ŒŒ 
=
ŒŒ "
prospectoQueryFilter
ŒŒ 1
.
ŒŒ1 2
codigorangoedad
ŒŒ2 A
!=
ŒŒA C
null
ŒŒC G
?
ŒŒG H"
prospectoQueryFilter
ŒŒI ]
.
ŒŒ] ^
codigorangoedad
ŒŒ^ m
.
ŒŒm n
Split
ŒŒn s
(
ŒŒs t
$char
ŒŒt w
)
ŒŒw x
.
ŒŒx y
Select
ŒŒy 
(ŒŒ Ä
shortŒŒÄ Ö
.ŒŒÖ Ü
ParseŒŒÜ ã
)ŒŒã å
.ŒŒå ç
ToListŒŒç ì
(ŒŒì î
)ŒŒî ï
:ŒŒï ñ
nullŒŒñ ö
;ŒŒö õ
var
œœ #
listcodigorangofuente
œœ 
=
œœ "
prospectoQueryFilter
œœ 3
.
œœ3 4
codigofuente
œœ4 @
!=
œœ@ B
null
œœC G
?
œœH I"
prospectoQueryFilter
œœJ ^
.
œœ^ _
codigofuente
œœ_ k
.
œœk l
Split
œœl q
(
œœq r
$char
œœr u
)
œœu v
.
œœv w
Select
œœw }
(
œœ} ~
shortœœ~ É
.œœÉ Ñ
ParseœœÑ â
)œœâ ä
.œœä ã
ToListœœã ë
(œœë í
)œœí ì
:œœî ï
nullœœñ ö
;œœö õ
var
–– &
listcodigorangosubfuente
–– 
=
––  !"
prospectoQueryFilter
––" 6
.
––6 7
codigosubfuente
––7 F
!=
––G I
null
––J N
?
––O P"
prospectoQueryFilter
––Q e
.
––e f
codigosubfuente
––f u
.
––u v
Split
––v {
(
––{ |
$char
––| 
)–– Ä
.––Ä Å
Select––Å á
(––á à
short––à ç
.––ç é
Parse––é ì
)––ì î
.––î ï
ToList––ï õ
(––õ ú
)––ú ù
:––û ü
null––† §
;––§ •
var
—— $
listcodigorangoingreso
—— 
=
—— "
prospectoQueryFilter
——  4
.
——4 5 
codigorangoingreso
——5 G
!=
——H J
null
——K O
?
——P Q"
prospectoQueryFilter
——R f
.
——f g 
codigorangoingreso
——g y
.
——y z
Split
——z 
(—— Ä
$char——Ä É
)——É Ñ
.——Ñ Ö
Select——Ö ã
(——ã å
short——å ë
.——ë í
Parse——í ó
)——ó ò
.——ò ô
ToList——ô ü
(——ü †
)——† °
:——¢ £
null——§ ®
;——® ©
var
““ "
listcodigorangofondo
““ 
=
““ "
prospectoQueryFilter
““ 2
.
““2 3
codigorangofondo
““3 C
!=
““D F
null
““G K
?
““L M"
prospectoQueryFilter
““N b
.
““b c
codigorangofondo
““c s
.
““s t
Split
““t y
(
““y z
$char
““z }
)
““} ~
.
““~ 
Select““ Ö
(““Ö Ü
short““Ü ã
.““ã å
Parse““å ë
)““ë í
.““í ì
ToList““ì ô
(““ô ö
)““ö õ
:““ú ù
null““û ¢
;““¢ £
var
ÿÿ 
result
ÿÿ 
=
ÿÿ 
(
ÿÿ 
from
ÿÿ 
p
ÿÿ 
in
ÿÿ 
_context
ÿÿ #
.
ÿÿ# $

Prospectos
ÿÿ$ .
join
ŸŸ 
intermediario
ŸŸ  
in
ŸŸ! #
_context
ŸŸ$ ,
.
ŸŸ, -'
ConsolidadoIntermediarios
ŸŸ- F
on
ŸŸG I
p
ŸŸJ K
.
ŸŸK L(
IdConsolidadoIntermediario
ŸŸL f
equals
ŸŸg m
intermediario
ŸŸn {
.
ŸŸ{ |)
IdConsolidadoIntermediarioŸŸ| ñ
join
⁄⁄ 
adn
⁄⁄ 
in
⁄⁄ 
_context
⁄⁄ 
.
⁄⁄ 
	AdnRentas
⁄⁄ &
on
⁄⁄' )
p
⁄⁄* +
.
⁄⁄+ ,
IdProspecto
⁄⁄, 7
equals
⁄⁄8 >
adn
⁄⁄? B
.
⁄⁄B C
IdProspecto
⁄⁄C N
into
⁄⁄O S
ProspectoAdn
⁄⁄T `
from
€€ 
padn
€€ 
in
€€ 
ProspectoAdn
€€ !
.
€€! "
DefaultIfEmpty
€€" 0
(
€€0 1
)
€€1 2
join
‹‹ 
fuente
‹‹ 
in
‹‹ 
_context
‹‹ 
.
‹‹  
ListaTablas
‹‹  +
on
‹‹, .
new
‹‹/ 2
{
‹‹3 4
p
‹‹5 6
.
‹‹6 7
CodigoFuente
‹‹7 C
,
‹‹C D
idtablafuente
‹‹E R
=
‹‹S T

TablaTabla
‹‹U _
.
‹‹_ `
FuenteProspecto
‹‹` o
,
‹‹o p
lnegocio
‹‹q y
=
‹‹z {
LineaNegocio‹‹| à
.‹‹à â
Renta‹‹â é
}‹‹è ê
equals
›› 
new
›› 
{
›› 
CodigoFuente
›› *
=
››+ ,
(
››- .
short
››. 3
?
››3 4
)
››4 5
fuente
››5 ;
.
››; <
CodigoCampo
››< G
,
››G H
idtablafuente
››I V
=
››W X
fuente
››Y _
.
››_ `
IdTabla
››` g
,
››g h
lnegocio
››i q
=
››r s
fuente
››t z
.
››z {!
CodigoLineaNegocio››{ ç
}››é è
into››ê î
ProspectoFuente››ï §
from
ﬁﬁ 
pfuente
ﬁﬁ 
in
ﬁﬁ 
ProspectoFuente
ﬁﬁ '
.
ﬁﬁ' (
DefaultIfEmpty
ﬁﬁ( 6
(
ﬁﬁ6 7
)
ﬁﬁ7 8
join
ﬂﬂ 
	subfuente
ﬂﬂ 
in
ﬂﬂ 
_context
ﬂﬂ "
.
ﬂﬂ" #
ListaTablas
ﬂﬂ# .
on
ﬂﬂ/ 1
new
ﬂﬂ2 5
{
ﬂﬂ6 7
p
ﬂﬂ7 8
.
ﬂﬂ8 9
CodigoSubFuente
ﬂﬂ9 H
,
ﬂﬂH I
idtablaSubfuente
ﬂﬂJ Z
=
ﬂﬂ[ \

TablaTabla
ﬂﬂ] g
.
ﬂﬂg h
FuenteProspecto
ﬂﬂh w
,
ﬂﬂw x
lnegocioﬂﬂy Å
=ﬂﬂÇ É
LineaNegocioﬂﬂÑ ê
.ﬂﬂê ë
Rentaﬂﬂë ñ
}ﬂﬂó ò
equals
‡‡, 2
new
‡‡3 6
{
‡‡7 8
CodigoSubFuente
‡‡9 H
=
‡‡I J
(
‡‡K L
short
‡‡L Q
?
‡‡Q R
)
‡‡R S
	subfuente
‡‡S \
.
‡‡\ ]
CodigoCampo
‡‡] h
,
‡‡h i
idtablaSubfuente
‡‡j z
=
‡‡{ |
	subfuente‡‡} Ü
.‡‡Ü á
IdTabla‡‡á é
,‡‡é è
lnegocio‡‡ê ò
=‡‡ô ö
	subfuente‡‡õ §
.‡‡§ •"
CodigoLineaNegocio‡‡• ∑
}‡‡∏ π
into‡‡∫ æ"
ProspectoSubFuente‡‡ø —
from
·· 

psubfuente
·· 
in
··  
ProspectoSubFuente
·· -
.
··- .
DefaultIfEmpty
··. <
(
··< =
)
··= >
join
‚‚ 
motivounodescarte
‚‚ 
in
‚‚ !
_context
‚‚" *
.
‚‚* +
ListaTablas
‚‚+ 6
on
‚‚7 9
new
‚‚: =
{
‚‚> ?
p
‚‚? @
.
‚‚@ A%
CodigoMotivoUnoDescarte
‚‚A X
,
‚‚X Y#
idtablamotivodescarte
‚‚Y n
=
‚‚o p

TablaTabla
‚‚q {
.
‚‚{ |
MotivoDescarte‚‚| ä
}‚‚ä ã
equals
„„, 2
new
„„3 6
{
„„7 8%
CodigoMotivoUnoDescarte
„„9 P
=
„„R S
(
„„T U
short
„„U Z
?
„„Z [
)
„„[ \
motivounodescarte
„„\ m
.
„„m n
CodigoCampo
„„n y
,
„„y z$
idtablamotivodescarte„„{ ê
=„„í ì!
motivounodescarte„„î •
.„„• ¶
IdTabla„„¶ ≠
}„„≠ Æ
into„„Ø ≥*
ProspectoMotivoUnoDescarte„„¥ Œ
from
‰‰  
pmotivounodescarte
‰‰ 
in
‰‰  "(
ProspectoMotivoUnoDescarte
‰‰# =
.
‰‰= >
DefaultIfEmpty
‰‰> L
(
‰‰L M
)
‰‰M N
join
ÂÂ 
motivodosdescarte
ÂÂ 
in
ÂÂ !
_context
ÂÂ" *
.
ÂÂ* +
ListaTablas
ÂÂ+ 6
on
ÂÂ7 9
new
ÂÂ: =
{
ÂÂ> ?
p
ÂÂ@ A
.
ÂÂA B%
CodigoMotivoDosDescarte
ÂÂB Y
,
ÂÂY Z#
idtablamotivodescarte
ÂÂ[ p
=
ÂÂq r

TablaTabla
ÂÂs }
.
ÂÂ} ~
MotivoDescarteÂÂ~ å
}ÂÂç é
equals
ÊÊ 
new
ÊÊ 
{
ÊÊ %
CodigoMotivoDosDescarte
ÊÊ 5
=
ÊÊ6 7
(
ÊÊ8 9
short
ÊÊ9 >
?
ÊÊ> ?
)
ÊÊ? @
motivodosdescarte
ÊÊ@ Q
.
ÊÊQ R
CodigoCampo
ÊÊR ]
,
ÊÊ] ^#
idtablamotivodescarte
ÊÊ_ t
=
ÊÊu v 
motivodosdescarteÊÊw à
.ÊÊà â
IdTablaÊÊâ ê
}ÊÊë í
intoÊÊì ó*
ProspectoMotivoDosDescarteÊÊò ≤
from
ÁÁ  
pmotivodosdescarte
ÁÁ 
in
ÁÁ  "(
ProspectoMotivoDosDescarte
ÁÁ# =
.
ÁÁ= >
DefaultIfEmpty
ÁÁ> L
(
ÁÁL M
)
ÁÁM N
join
ËË 
referido
ËË 
in
ËË 
_context
ËË !
.
ËË! "

Prospectos
ËË" ,
on
ËË- /
p
ËË0 1
.
ËË1 2
IdReferenciador
ËË2 A
equals
ËËB H
referido
ËËI Q
.
ËËQ R
IdProspecto
ËËR ]
into
ËË^ b
ProspectoReferido
ËËc t
from
ÈÈ 
	preferido
ÈÈ 
in
ÈÈ 
ProspectoReferido
ÈÈ +
.
ÈÈ+ ,
DefaultIfEmpty
ÈÈ, :
(
ÈÈ: ;
)
ÈÈ; <
join
ÍÍ 
cargo
ÍÍ 
in
ÍÍ 
_context
ÍÍ 
.
ÍÍ 
TablaTablas
ÍÍ *
on
ÍÍ+ -
new
ÍÍ. 1
{
ÍÍ2 3
p
ÍÍ3 4
.
ÍÍ4 5
CodigoCargo
ÍÍ5 @
,
ÍÍ@ A
idtablacargo
ÍÍA M
=
ÍÍN O

TablaTabla
ÍÍP Z
.
ÍÍZ [
PersonaCargo
ÍÍ[ g
}
ÍÍg h
equals
ÎÎ+ 1
new
ÎÎ2 5
{
ÎÎ6 7
CodigoCargo
ÎÎ8 C
=
ÎÎD E
(
ÎÎF G
short
ÎÎG L
?
ÎÎL M
)
ÎÎM N
cargo
ÎÎN S
.
ÎÎS T
CodigoCampo
ÎÎT _
,
ÎÎ_ `
idtablacargo
ÎÎa m
=
ÎÎn o
cargo
ÎÎp u
.
ÎÎu v
IdTabla
ÎÎv }
}
ÎÎ} ~
intoÎÎ É
ProspectoCargoÎÎÑ í
from
ÏÏ 
pcargo
ÏÏ 
in
ÏÏ 
ProspectoCargo
ÏÏ %
.
ÏÏ% &
DefaultIfEmpty
ÏÏ& 4
(
ÏÏ4 5
)
ÏÏ5 6
join
ÌÌ 
sexo
ÌÌ 
in
ÌÌ 
_context
ÌÌ 
.
ÌÌ 
TablaTablas
ÌÌ )
on
ÌÌ* ,
new
ÌÌ- 0
{
ÌÌ1 2
p
ÌÌ2 3
.
ÌÌ3 4

CodigoSexo
ÌÌ4 >
,
ÌÌ> ?
idtablasexo
ÌÌ? J
=
ÌÌK L

TablaTabla
ÌÌM W
.
ÌÌW X
Sexo
ÌÌX \
}
ÌÌ\ ]
equals
ÓÓ* 0
new
ÓÓ1 4
{
ÓÓ5 6

CodigoSexo
ÓÓ7 A
=
ÓÓC D
(
ÓÓE F
short
ÓÓF K
?
ÓÓK L
)
ÓÓL M
sexo
ÓÓM Q
.
ÓÓQ R
CodigoCampo
ÓÓR ]
,
ÓÓ] ^
idtablasexo
ÓÓ_ j
=
ÓÓk l
sexo
ÓÓm q
.
ÓÓq r
IdTabla
ÓÓr y
}
ÓÓy z
into
ÓÓ{ 
ProspectoSexoÓÓÄ ç
from
ÔÔ 
psexo
ÔÔ 
in
ÔÔ 
ProspectoSexo
ÔÔ #
.
ÔÔ# $
DefaultIfEmpty
ÔÔ$ 2
(
ÔÔ2 3
)
ÔÔ3 4
join
 
	direccion
 
in
 
_context
 "
.
" #!
DireccionProspectos
# 6
on
7 9
p
: ;
.
; <
IdProspecto
< G
equals
H N
	direccion
O X
.
X Y
IdProspecto
Y d
into
e i 
ProspectoDireccion
j |
from
ÒÒ 

pdireccion
ÒÒ 
in
ÒÒ  
ProspectoDireccion
ÒÒ -
.
ÒÒ- .
DefaultIfEmpty
ÒÒ. <
(
ÒÒ< =
)
ÒÒ= >
join
ÚÚ 
distrito
ÚÚ 
in
ÚÚ 
_context
ÚÚ !
.
ÚÚ! "
	Distritos
ÚÚ" +
on
ÚÚ, .
new
ÚÚ/ 2
{
ÚÚ3 4

pdireccion
ÚÚ4 >
.
ÚÚ> ?
Departamento_Id
ÚÚ? N
,
ÚÚN O

pdireccion
ÚÚO Y
.
ÚÚY Z
Provincia_Id
ÚÚZ f
,
ÚÚf g

pdireccion
ÚÚg q
.
ÚÚq r
Distrito_Id
ÚÚr }
}
ÚÚ} ~
equals
ÛÛ, 2
new
ÛÛ3 6
{
ÛÛ7 8
distrito
ÛÛ8 @
.
ÛÛ@ A
Departamento_Id
ÛÛA P
,
ÛÛP Q
distrito
ÛÛQ Y
.
ÛÛY Z
Provincia_Id
ÛÛZ f
,
ÛÛf g
distrito
ÛÛg o
.
ÛÛo p
Distrito_Id
ÛÛp {
}
ÛÛ| }
intoÛÛ~ Ç!
DireccionDistritoÛÛÉ î
from
ÙÙ 
	ddistrito
ÙÙ 
in
ÙÙ 
DireccionDistrito
ÙÙ .
.
ÙÙ. /
DefaultIfEmpty
ÙÙ/ =
(
ÙÙ= >
)
ÙÙ> ?
join
ıı 
	provincia
ıı 
in
ıı 
_context
ıı "
.
ıı" #

Provincias
ıı# -
on
ıı. 0
new
ıı1 4
{
ıı5 6

pdireccion
ıı7 A
.
ııA B
Provincia_Id
ııB N
,
ııN O

pdireccion
ııO Y
.
ııY Z
Departamento_Id
ııZ i
}
ııi j
equals
ˆˆ. 4
new
ˆˆ5 8
{
ˆˆ9 :
	provincia
ˆˆ: C
.
ˆˆC D
Provincia_Id
ˆˆD P
,
ˆˆP Q
	provincia
ˆˆQ Z
.
ˆˆZ [
Departamento_Id
ˆˆ[ j
}
ˆˆj k
into
ˆˆl p!
DireccionProvinciaˆˆq É
from
˜˜ 

dprovincia
˜˜ 
in
˜˜  
DireccionProvincia
˜˜ -
.
˜˜- .
DefaultIfEmpty
˜˜. <
(
˜˜< =
)
˜˜= >
join
¯¯ 
departamento
¯¯ 
in
¯¯ 
_context
¯¯ %
.
¯¯% &
Departamentos
¯¯& 3
on
¯¯4 6

pdireccion
¯¯7 A
.
¯¯A B
Departamento_Id
¯¯B Q
equals
¯¯R X
departamento
¯¯Y e
.
¯¯e f
Departamento_Id
¯¯f u
into
¯¯v z$
DireccionDepartamento¯¯{ ê
from
˘˘ 
ddepartamento
˘˘ 
in
˘˘ #
DireccionDepartamento
˘˘ 3
.
˘˘3 4
DefaultIfEmpty
˘˘4 B
(
˘˘B C
)
˘˘C D
where
˙˙ 
(
˙˙ 
intermediario
˙˙ 
.
˙˙ !
CodigoIntermediario
˙˙ 0
==
˙˙1 3"
prospectoQueryFilter
˙˙4 H
.
˙˙H I!
codigointermediario
˙˙I \
)
˙˙\ ]
&&
˙˙^ `
(
˚˚
 
p
˚˚ 
.
˚˚ 
Nombres
˚˚ 
.
˚˚ 
Contains
˚˚ 
(
˚˚ "
prospectoQueryFilter
˚˚ 2
.
˚˚2 3
	parametro
˚˚3 <
)
˚˚< =
||
˚˚> @
p
˚˚A B
.
˚˚B C
ApellidoPaterno
˚˚C R
.
˚˚R S
Contains
˚˚S [
(
˚˚[ \"
prospectoQueryFilter
˚˚\ p
.
˚˚p q
	parametro
˚˚q z
)
˚˚z {
||
˚˚| ~
p
¸¸ 
.
¸¸ 
ApellidoMaterno
¸¸ 
.
¸¸ 
Contains
¸¸ %
(
¸¸% &"
prospectoQueryFilter
¸¸& :
.
¸¸: ;
	parametro
¸¸; D
)
¸¸D E
||
¸¸F H
p
¸¸I J
.
¸¸J K
Referenciador
¸¸K X
.
¸¸X Y
Contains
¸¸Y a
(
¸¸a b"
prospectoQueryFilter
¸¸b v
.
¸¸v w
	parametro¸¸w Ä
)¸¸Ä Å
||¸¸Ç Ñ
p¸¸Ö Ü
.¸¸Ü á
NumeroDocumento¸¸á ñ
.¸¸ñ ó
Contains¸¸ó ü
(¸¸ü †$
prospectoQueryFilter¸¸† ¥
.¸¸¥ µ
	parametro¸¸µ æ
)¸¸æ ø
)¸¸ø ¿
&&¸¸¡ √
(
˝˝ 
(
˝˝ 
p
˝˝ 
.
˝˝ $
AuditoriaFechaCreacion
˝˝ %
>=
˝˝% '"
prospectoQueryFilter
˝˝' ;
.
˝˝; <!
fechacreacioninicio
˝˝< O
||
˝˝P R"
prospectoQueryFilter
˝˝S g
.
˝˝g h!
fechacreacioninicio
˝˝h {
==
˝˝{ }
null˝˝} Å
)˝˝Å Ç
&&˝˝É Ö
(
˛˛ 
p
˛˛ 
.
˛˛ $
AuditoriaFechaCreacion
˛˛ %
<=
˛˛% '"
prospectoQueryFilter
˛˛' ;
.
˛˛; <
fechacreacionfin
˛˛< L
||
˛˛M O"
prospectoQueryFilter
˛˛P d
.
˛˛d e
fechacreacionfin
˛˛e u
==
˛˛u w
null
˛˛w {
)
˛˛{ |
)
˛˛| }
&&˛˛~ Ä
(
ˇˇ !
listcodigorangoedad
ˇˇ 
.
ˇˇ  
Contains
ˇˇ  (
(
ˇˇ( )
p
ˇˇ) *
.
ˇˇ* +
CodigoRangoEdad
ˇˇ+ :
.
ˇˇ: ;
Value
ˇˇ; @
)
ˇˇ@ A
||
ˇˇB D!
listcodigorangoedad
ˇˇE X
==
ˇˇY [
null
ˇˇ[ _
)
ˇˇ_ `
&&
ˇˇa c
(
ÄÄ !
listcodigorangosexo
ÄÄ 
.
ÄÄ  
Contains
ÄÄ  (
(
ÄÄ( )
p
ÄÄ) *
.
ÄÄ* +
CodigoRangoEdad
ÄÄ+ :
.
ÄÄ: ;
Value
ÄÄ; @
)
ÄÄ@ A
||
ÄÄB D!
listcodigorangosexo
ÄÄE X
==
ÄÄY [
null
ÄÄ\ `
)
ÄÄ` a
&&
ÄÄb d
(
ÅÅ #
listcodigorangofuente
ÅÅ !
.
ÅÅ! "
Contains
ÅÅ" *
(
ÅÅ* +
p
ÅÅ+ ,
.
ÅÅ, -
CodigoRangoEdad
ÅÅ- <
.
ÅÅ< =
Value
ÅÅ= B
)
ÅÅB C
||
ÅÅD F#
listcodigorangofuente
ÅÅG \
==
ÅÅ] _
null
ÅÅ` d
)
ÅÅd e
&&
ÅÅf h
(
ÇÇ &
listcodigorangosubfuente
ÇÇ $
.
ÇÇ$ %
Contains
ÇÇ% -
(
ÇÇ- .
p
ÇÇ. /
.
ÇÇ/ 0
CodigoRangoEdad
ÇÇ0 ?
.
ÇÇ? @
Value
ÇÇ@ E
)
ÇÇE F
||
ÇÇG I&
listcodigorangosubfuente
ÇÇJ b
==
ÇÇc e
null
ÇÇf j
)
ÇÇj k
&&
ÇÇl n
(
ÉÉ $
listcodigorangoingreso
ÉÉ "
.
ÉÉ" #
Contains
ÉÉ# +
(
ÉÉ+ ,
p
ÉÉ, -
.
ÉÉ- .
CodigoRangoEdad
ÉÉ. =
.
ÉÉ= >
Value
ÉÉ> C
)
ÉÉC D
||
ÉÉE G$
listcodigorangoingreso
ÉÉH ^
==
ÉÉ_ a
null
ÉÉb f
)
ÉÉf g
&&
ÉÉh j
(
ÑÑ "
listcodigorangofondo
ÑÑ  
.
ÑÑ  !
Contains
ÑÑ! )
(
ÑÑ) *
p
ÑÑ* +
.
ÑÑ+ ,
CodigoRangoEdad
ÑÑ, ;
.
ÑÑ; <
Value
ÑÑ< A
)
ÑÑA B
||
ÑÑC E"
listcodigorangofondo
ÑÑF Z
==
ÑÑ[ ]
null
ÑÑ^ b
)
ÑÑb c
&&
ÑÑd f
(
ÖÖ 
!
ÖÖ 
_context
ÖÖ 
.
ÖÖ 
Citas
ÖÖ 
.
ÖÖ 
Where
ÖÖ !
(
ÖÖ! "
x
ÖÖ" #
=>
ÖÖ$ &
x
ÖÖ' (
.
ÖÖ( )
IdProspecto
ÖÖ) 4
==
ÖÖ5 7
p
ÖÖ8 9
.
ÖÖ9 :
IdProspecto
ÖÖ: E
)
ÖÖE F
.
ÖÖF G
Select
ÖÖG M
(
ÖÖM N
x
ÖÖN O
=>
ÖÖP R
x
ÖÖS T
.
ÖÖT U
IdProspecto
ÖÖU `
)
ÖÖ` a
.
ÖÖa b
Contains
ÖÖb j
(
ÖÖj k
p
ÖÖk l
.
ÖÖl m
IdProspecto
ÖÖm x
)
ÖÖx y
)
ÖÖy z
&&
ÖÖ{ }
(
ÜÜ 
!
ÜÜ 
_context
ÜÜ 
.
ÜÜ "
RecordatorioLlamadas
ÜÜ *
.
ÜÜ* +
Where
ÜÜ+ 0
(
ÜÜ0 1
x
ÜÜ1 2
=>
ÜÜ3 5
x
ÜÜ6 7
.
ÜÜ7 8
IdProspecto
ÜÜ8 C
==
ÜÜD F
p
ÜÜG H
.
ÜÜH I
IdProspecto
ÜÜI T
)
ÜÜT U
.
ÜÜU V
Select
ÜÜV \
(
ÜÜ\ ]
x
ÜÜ] ^
=>
ÜÜ_ a
x
ÜÜa b
.
ÜÜb c
IdProspecto
ÜÜc n
)
ÜÜn o
.
ÜÜo p
Contains
ÜÜp x
(
ÜÜx y
p
ÜÜy z
.
ÜÜz {
IdProspectoÜÜ{ Ü
)ÜÜÜ á
)ÜÜá à
select
àà 
new
àà 
{
ââ 	
p
ää	 

,
ää
 
padn
ãã	 
,
ãã 
pfuente
åå	 
,
åå 

psubfuente
çç	 
,
çç 
	preferido
éé	 
,
éé 
psexo
èè	 
,
èè 
pcargo
êê	 
,
êê 

pdireccion
ëë	 
,
ëë 
	ddistrito
íí	 
,
íí 

dprovincia
ìì	 
,
ìì 
ddepartamento
îî	 
,
îî  
pmotivounodescarte
ïï	 
,
ïï  
pmotivodosdescarte
ññ	 
}
òò 	
)
òò	 

.
òò
 
AsNoTracking
òò 
(
òò 
)
òò 
.
òò 
Select
òò  
(
òò  !
x
òò! "
=>
òò# %
new
òò& )
	Prospecto
òò* 3
{
ôô 	
IdProspecto
öö	 
=
öö 
x
öö 
.
öö 
p
öö 
.
öö 
IdProspecto
öö &
,
öö& '
NombresApellidos
õõ	 
=
õõ 
string
õõ "
.
õõ" #
Format
õõ# )
(
õõ) *
$str
õõ* 7
,
õõ7 8
x
õõ9 :
.
õõ: ;
p
õõ; <
.
õõ< =
Nombres
õõ= D
,
õõD E
x
õõF G
.
õõG H
p
õõH I
.
õõI J
ApellidoPaterno
õõJ Y
,
õõY Z
x
õõ[ \
.
õõ\ ]
p
õõ] ^
.
õõ^ _
ApellidoMaterno
õõ_ n
)
õõn o
,
õõo p!
CodigoTipoDocumento
úú	 
=
úú 
x
úú  
.
úú  !
p
úú! "
.
úú" #!
CodigoTipoDocumento
úú# 6
.
úú6 7
Value
úú7 <
,
úú< =
NumeroDocumento
ùù	 
=
ùù 
x
ùù 
.
ùù 
p
ùù 
.
ùù 
NumeroDocumento
ùù .
,
ùù. /
Nombres
ûû	 
=
ûû 
x
ûû 
.
ûû 
p
ûû 
.
ûû 
Nombres
ûû 
,
ûû 
ApellidoPaterno
üü	 
=
üü 
x
üü 
.
üü 
p
üü 
.
üü 
ApellidoPaterno
üü .
,
üü. /
ApellidoMaterno
††	 
=
†† 
x
†† 
.
†† 
p
†† 
.
†† 
ApellidoMaterno
†† .
,
††. /
CodigoFuente
°°	 
=
°° 
x
°° 
.
°° 
p
°° 
.
°° 
CodigoFuente
°° (
.
°°( )
Value
°°) .
,
°°. /
CodigoSubFuente
¢¢	 
=
¢¢ 
x
¢¢ 
.
¢¢ 
p
¢¢ 
.
¢¢ 
CodigoSubFuente
¢¢ .
.
¢¢. /
Value
¢¢/ 4
,
¢¢4 5
NombreFuente
££	 
=
££ 
x
££ 
.
££ 
pfuente
££ !
.
££! "
ValorCadena
££" -
,
££- .
NombreSubFuente
§§	 
=
§§ 
x
§§ 
.
§§ 

psubfuente
§§ '
.
§§' (
ValorCadena
§§( 3
,
§§3 4
TelefonoFijo
••	 
=
•• 
x
•• 
.
•• 
p
•• 
.
•• 
TelefonoFijo
•• (
,
••( )
TelefonoCelular
¶¶	 
=
¶¶ 
x
¶¶ 
.
¶¶ 
p
¶¶ 
.
¶¶ 
TelefonoCelular
¶¶ .
,
¶¶. /
FechaNacimiento
ßß	 
=
ßß 
x
ßß 
.
ßß 
p
ßß 
.
ßß 
FechaNacimiento
ßß .
.
ßß. /
Value
ßß/ 4
,
ßß4 5
	Direccion
®®	 
=
®® 
x
®® 
.
®® 

pdireccion
®® !
.
®®! "
	Direccion
®®" +
,
®®+ ,
Departamento_Id
©©	 
=
©© 
x
©© 
.
©© 

pdireccion
©© '
.
©©' (
Departamento_Id
©©( 7
,
©©7 8
Provincia_Id
™™	 
=
™™ 
x
™™ 
.
™™ 

pdireccion
™™ $
.
™™$ %
Provincia_Id
™™% 1
,
™™1 2
Distrito_Id
´´	 
=
´´ 
x
´´ 
.
´´ 

pdireccion
´´ #
.
´´# $
Distrito_Id
´´$ /
,
´´/ 0
Departamento
¨¨	 
=
¨¨ 
x
¨¨ 
.
¨¨ 
ddepartamento
¨¨ '
.
¨¨' (
Nombre
¨¨( .
,
¨¨. /
	Provincia
≠≠	 
=
≠≠ 
x
≠≠ 
.
≠≠ 

dprovincia
≠≠ !
.
≠≠! "
Nombre
≠≠" (
,
≠≠( )
Distrito
ÆÆ	 
=
ÆÆ 
x
ÆÆ 
.
ÆÆ 
	ddistrito
ÆÆ 
.
ÆÆ  
Nombre
ÆÆ  &
,
ÆÆ& '
Edad
ØØ	 
=
ØØ 
DateTime
ØØ 
.
ØØ 
Now
ØØ 
.
ØØ 
Year
ØØ "
-
ØØ# $
x
ØØ% &
.
ØØ& '
p
ØØ' (
.
ØØ( )
FechaNacimiento
ØØ) 8
.
ØØ8 9
Value
ØØ9 >
.
ØØ> ?
Year
ØØ? C
,
ØØC D

CodigoSexo
∞∞	 
=
∞∞ 
x
∞∞ 
.
∞∞ 
p
∞∞ 
.
∞∞ 

CodigoSexo
∞∞ $
.
∞∞$ %
Value
∞∞% *
,
∞∞* +
Sexo
±±	 
=
±± 
x
±± 
.
±± 
psexo
±± 
.
±± !
ValorAuxiliarCadena
±± +
,
±±+ ,
Empresa
≤≤	 
=
≤≤ 
x
≤≤ 
.
≤≤ 
p
≤≤ 
.
≤≤ 
Empresa
≤≤ 
,
≤≤ 
CodigoCargo
≥≥	 
=
≥≥ 
x
≥≥ 
.
≥≥ 
p
≥≥ 
.
≥≥ 
CodigoCargo
≥≥ &
.
≥≥& '
Value
≥≥' ,
,
≥≥, -
NombreCargo
¥¥	 
=
¥¥ 
x
¥¥ 
.
¥¥ 
pcargo
¥¥ 
.
¥¥  
ValorCadena
¥¥  +
,
¥¥+ ,
	OtroCargo
µµ	 
=
µµ 
x
µµ 
.
µµ 
p
µµ 
.
µµ 
	OtroCargo
µµ "
,
µµ" #
Referenciador
∂∂	 
=
∂∂ 
x
∂∂ 
.
∂∂ 
p
∂∂ 
.
∂∂ 
Referenciador
∂∂ *
,
∂∂* +
Hijos
∑∑	 
=
∑∑ 
x
∑∑ 
.
∑∑ 
padn
∑∑ 
.
∑∑ $
NumeroHijosDependiente
∑∑ .
.
∑∑. /
Value
∑∑/ 4
,
∑∑4 5
Correo
∏∏	 
=
∏∏ 
x
∏∏ 
.
∏∏ 
p
∏∏ 
.
∏∏  
CorreoElectronico1
∏∏ (
,
∏∏( )
MonedaFondo
ππ	 
=
ππ 
x
ππ 
.
ππ 
padn
ππ 
.
ππ !
MonedaPatrimonioAfp
ππ 1
.
ππ1 2
Value
ππ2 7
,
ππ7 8

MontoFondo
∫∫	 
=
∫∫ 
x
∫∫ 
.
∫∫ 
padn
∫∫ 
.
∫∫  
MontoPatrimonioAfp
∫∫ /
.
∫∫/ 0
Value
∫∫0 5
,
∫∫5 6
Fuente
ªª	 
=
ªª 
string
ªª 
.
ªª 
Format
ªª 
(
ªª  
$str
ªª  ,
,
ªª, -
x
ªª. /
.
ªª/ 0
pfuente
ªª0 7
.
ªª7 8
ValorCadena
ªª8 C
,
ªªC D
string
ªªE K
.
ªªK L
IsNullOrEmpty
ªªL Y
(
ªªY Z
x
ªªZ [
.
ªª[ \

psubfuente
ªª\ f
.
ªªf g
ValorCadena
ªªg r
)
ªªr s
?
ªªt u
$str
ªªv x
:
ªªy z
$str
ªª{ ~
+ªª Ä
xªªÅ Ç
.ªªÇ É

psubfuenteªªÉ ç
.ªªç é
ValorCadenaªªé ô
,ªªô ö
x
ºº 
.
ºº 
p
ºº 
.
ºº 
IdReferenciador
ºº $
.
ºº$ %
HasValue
ºº% -
?
ºº. /
x
ºº0 1
.
ºº1 2
	preferido
ºº2 ;
.
ºº; <
Nombres
ºº< C
+
ººD E
$str
ººF I
+
ººJ K
x
ººL M
.
ººM N
	preferido
ººN W
.
ººW X
ApellidoPaterno
ººX g
+
ººh i
$str
ººj m
+
ººn o
x
ººp q
.
ººq r
	preferido
ººr {
.
ºº{ |
ApellidoMaternoºº| ã
:ººå ç
xººé è
.ººè ê
pººê ë
.ººë í
Referenciadorººí ü
)ººü †
,ºº† °
IdReferenciador
ΩΩ	 
=
ΩΩ 
x
ΩΩ 
.
ΩΩ 
p
ΩΩ 
.
ΩΩ 
IdReferenciador
ΩΩ .
.
ΩΩ. /
Value
ΩΩ/ 4
,
ΩΩ4 5
FlagDescarte
ææ	 
=
ææ 
x
ææ 
.
ææ 
p
ææ 
.
ææ 
FlagDescarte
ææ (
,
ææ( )!
TextoMotivoDescarte
øø	 
=
øø 
string
øø %
.
øø% &
IsNullOrEmpty
øø& 3
(
øø3 4
x
øø4 5
.
øø5 6 
pmotivodosdescarte
øø6 H
.
øøH I
ValorCadena
øøI T
)
øøT U
?
øøV W
x
øøX Y
.
øøY Z 
pmotivounodescarte
øøZ l
.
øøl m
ValorCadena
øøm x
:
¿¿/ 0
string
¿¿1 7
.
¿¿7 8
Format
¿¿8 >
(
¿¿> ?
$str
¿¿? H
,
¿¿H I
x
¿¿J K
.
¿¿K L 
pmotivounodescarte
¿¿L ^
.
¿¿^ _
ValorCadena
¿¿_ j
,
¿¿j k
x
¿¿l m
.
¿¿m n!
pmotivodosdescarte¿¿n Ä
.¿¿Ä Å
ValorCadena¿¿Å å
)¿¿å ç
,¿¿ç é
VisibleDescarte
¡¡	 
=
¡¡ 
x
¡¡ 
.
¡¡ 
p
¡¡ 
.
¡¡ 
FlagDescarte
¡¡ +
==
¡¡, .
true
¡¡/ 3
?
¡¡4 5
false
¡¡6 ;
:
¡¡< =
true
¡¡> B
,
¡¡B C
VisibleAgendar
¬¬	 
=
¬¬ 
true
¬¬ 
,
¬¬ 
FechaCreacion
√√	 
=
√√ 
x
√√ 
.
√√ 
p
√√ 
.
√√ $
AuditoriaFechaCreacion
√√ 3
}
ƒƒ 	
)
ƒƒ	 

;
ƒƒ
 
return
∆∆ 
result
∆∆ 
;
∆∆ 
}
«« 
public
…… 

IQueryable
…… 
<
…… 
	Prospecto
…… #
>
……# $#
ObtenerCitaCalificada
……% :
(
……: ;"
ProspectoQueryFilter
……; O"
prospectoQueryFilter
……P d
)
……d e
{
   	
var
ÀÀ !
listcodigorangosexo
ÀÀ #
=
ÀÀ$ %"
prospectoQueryFilter
ÀÀ& :
.
ÀÀ: ;

codigosexo
ÀÀ; E
!=
ÀÀF H
null
ÀÀI M
?
ÀÀN O"
prospectoQueryFilter
ÀÀP d
.
ÀÀd e

codigosexo
ÀÀe o
.
ÀÀo p
Split
ÀÀp u
(
ÀÀu v
$char
ÀÀv y
)
ÀÀy z
.
ÀÀz {
SelectÀÀ{ Å
(ÀÀÅ Ç
shortÀÀÇ á
.ÀÀá à
ParseÀÀà ç
)ÀÀç é
.ÀÀé è
ToListÀÀè ï
(ÀÀï ñ
)ÀÀñ ó
:ÀÀò ô
nullÀÀö û
;ÀÀû ü
var
ÃÃ !
listcodigorangoedad
ÃÃ 
=
ÃÃ "
prospectoQueryFilter
ÃÃ 1
.
ÃÃ1 2
codigorangoedad
ÃÃ2 A
!=
ÃÃB D
null
ÃÃE I
?
ÃÃJ K"
prospectoQueryFilter
ÃÃL `
.
ÃÃ` a
codigorangoedad
ÃÃa p
.
ÃÃp q
Split
ÃÃq v
(
ÃÃv w
$char
ÃÃw z
)
ÃÃz {
.
ÃÃ{ |
SelectÃÃ| Ç
(ÃÃÇ É
shortÃÃÉ à
.ÃÃà â
ParseÃÃâ é
)ÃÃé è
.ÃÃè ê
ToListÃÃê ñ
(ÃÃñ ó
)ÃÃó ò
:ÃÃô ö
nullÃÃõ ü
;ÃÃü †
var
ÕÕ #
listcodigorangofuente
ÕÕ 
=
ÕÕ "
prospectoQueryFilter
ÕÕ 3
.
ÕÕ3 4
codigofuente
ÕÕ4 @
!=
ÕÕA C
null
ÕÕD H
?
ÕÕI J"
prospectoQueryFilter
ÕÕK _
.
ÕÕ_ `
codigofuente
ÕÕ` l
.
ÕÕl m
Split
ÕÕm r
(
ÕÕr s
$char
ÕÕs v
)
ÕÕv w
.
ÕÕw x
Select
ÕÕx ~
(
ÕÕ~ 
shortÕÕ Ñ
.ÕÕÑ Ö
ParseÕÕÖ ä
)ÕÕä ã
.ÕÕã å
ToListÕÕå í
(ÕÕí ì
)ÕÕì î
:ÕÕï ñ
nullÕÕó õ
;ÕÕõ ú
var
ŒŒ &
listcodigorangosubfuente
ŒŒ 
=
ŒŒ  !"
prospectoQueryFilter
ŒŒ" 6
.
ŒŒ6 7
codigosubfuente
ŒŒ7 F
!=
ŒŒG I
null
ŒŒJ N
?
ŒŒO P"
prospectoQueryFilter
ŒŒQ e
.
ŒŒe f
codigosubfuente
ŒŒf u
.
ŒŒu v
Split
ŒŒv {
(
ŒŒ{ |
$char
ŒŒ| 
)ŒŒ Ä
.ŒŒÄ Å
SelectŒŒÅ á
(ŒŒá à
shortŒŒà ç
.ŒŒç é
ParseŒŒé ì
)ŒŒì î
.ŒŒî ï
ToListŒŒï õ
(ŒŒõ ú
)ŒŒú ù
:ŒŒû ü
nullŒŒ† §
;ŒŒ§ •
var
œœ $
listcodigorangoingreso
œœ 
=
œœ "
prospectoQueryFilter
œœ  4
.
œœ4 5 
codigorangoingreso
œœ5 G
!=
œœH J
null
œœK O
?
œœP Q"
prospectoQueryFilter
œœR f
.
œœf g 
codigorangoingreso
œœg y
.
œœy z
Split
œœz 
(œœ Ä
$charœœÄ É
)œœÉ Ñ
.œœÑ Ö
SelectœœÖ ã
(œœã å
shortœœå ë
.œœë í
Parseœœí ó
)œœó ò
.œœò ô
ToListœœô ü
(œœü †
)œœ† °
:œœ¢ £
nullœœ§ ®
;œœ® ©
var
–– "
listcodigorangofondo
–– 
=
–– "
prospectoQueryFilter
–– 2
.
––2 3
codigorangofondo
––3 C
!=
––D F
null
––G K
?
––L M"
prospectoQueryFilter
––N b
.
––b c
codigorangofondo
––c s
.
––s t
Split
––t y
(
––y z
$char
––z }
)
––} ~
.
––~ 
Select–– Ö
(––Ö Ü
short––Ü ã
.––ã å
Parse––å ë
)––ë í
.––í ì
ToList––ì ô
(––ô ö
)––ö õ
:––ú ù
null––û ¢
;––¢ £
var
”” 
result
”” 
=
”” 
(
”” 
from
”” 
c
”” 
in
”” !
_context
””" *
.
””* +
Citas
””+ 0
join
‘‘ 
p
‘‘ 
in
‘‘ 
_context
‘‘ 
.
‘‘ 

Prospectos
‘‘ %
on
‘‘& (
c
‘‘) *
.
‘‘* +
IdProspecto
‘‘+ 6
equals
‘‘7 =
p
‘‘> ?
.
‘‘? @
IdProspecto
‘‘@ K
join
’’ 
intermediario
’’ 
in
’’ 
_context
’’ &
.
’’& ''
ConsolidadoIntermediarios
’’' @
on
’’A C
p
’’D E
.
’’E F(
IdConsolidadoIntermediario
’’F `
equals
’’a g
intermediario
’’h u
.
’’u v)
IdConsolidadoIntermediario’’v ê
join
÷÷ 
adn
÷÷ 
in
÷÷ 
_context
÷÷ 
.
÷÷ 
	AdnRentas
÷÷ &
on
÷÷' )
p
÷÷* +
.
÷÷+ ,
IdProspecto
÷÷, 7
equals
÷÷8 >
adn
÷÷? B
.
÷÷B C
IdProspecto
÷÷C N
into
÷÷O S
ProspectoAdn
÷÷T `
from
◊◊ 
padn
◊◊ 
in
◊◊ 
ProspectoAdn
◊◊ !
.
◊◊! "
DefaultIfEmpty
◊◊" 0
(
◊◊0 1
)
◊◊1 2
join
ÿÿ 
fuente
ÿÿ 
in
ÿÿ 
_context
ÿÿ 
.
ÿÿ  
ListaTablas
ÿÿ  +
on
ÿÿ, .
new
ÿÿ/ 2
{
ÿÿ3 4
p
ÿÿ5 6
.
ÿÿ6 7
CodigoFuente
ÿÿ7 C
,
ÿÿC D
idtablafuente
ÿÿE R
=
ÿÿS T

TablaTabla
ÿÿU _
.
ÿÿ_ `
FuenteProspecto
ÿÿ` o
,
ÿÿo p
lnegocio
ÿÿq y
=
ÿÿz {
LineaNegocioÿÿ| à
.ÿÿà â
Rentaÿÿâ é
}ÿÿè ê
equals
ŸŸ 
new
ŸŸ 
{
ŸŸ 
CodigoFuente
ŸŸ *
=
ŸŸ+ ,
(
ŸŸ- .
short
ŸŸ. 3
?
ŸŸ3 4
)
ŸŸ4 5
fuente
ŸŸ5 ;
.
ŸŸ; <
CodigoCampo
ŸŸ< G
,
ŸŸG H
idtablafuente
ŸŸI V
=
ŸŸW X
fuente
ŸŸY _
.
ŸŸ_ `
IdTabla
ŸŸ` g
,
ŸŸg h
lnegocio
ŸŸi q
=
ŸŸr s
fuente
ŸŸt z
.
ŸŸz {!
CodigoLineaNegocioŸŸ{ ç
}ŸŸé è
intoŸŸê î
ProspectoFuenteŸŸï §
from
⁄⁄ 
pfuente
⁄⁄ 
in
⁄⁄ 
ProspectoFuente
⁄⁄ '
.
⁄⁄' (
DefaultIfEmpty
⁄⁄( 6
(
⁄⁄6 7
)
⁄⁄7 8
join
€€ 
	subfuente
€€ 
in
€€ 
_context
€€ "
.
€€" #
ListaTablas
€€# .
on
€€/ 1
new
€€2 5
{
€€6 7
p
€€8 9
.
€€9 :
CodigoSubFuente
€€: I
,
€€I J
idtablaSubfuente
€€K [
=
€€\ ]

TablaTabla
€€^ h
.
€€h i
FuenteProspecto
€€i x
,
€€x y
lnegocio€€z Ç
=€€É Ñ
LineaNegocio€€Ö ë
.€€ë í
Renta€€í ó
}€€ò ô
equals
‹‹ 
new
‹‹ 
{
‹‹ 
CodigoSubFuente
‹‹ -
=
‹‹. /
(
‹‹0 1
short
‹‹1 6
?
‹‹6 7
)
‹‹7 8
	subfuente
‹‹8 A
.
‹‹A B
CodigoCampo
‹‹B M
,
‹‹M N
idtablaSubfuente
‹‹O _
=
‹‹` a
	subfuente
‹‹b k
.
‹‹k l
IdTabla
‹‹l s
,
‹‹s t
lnegocio
‹‹u }
=
‹‹~ 
	subfuente‹‹Ä â
.‹‹â ä"
CodigoLineaNegocio‹‹ä ú
}‹‹ù û
into‹‹ü £"
ProspectoSubFuente‹‹§ ∂
from
›› 

psubfuente
›› 
in
››  
ProspectoSubFuente
›› -
.
››- .
DefaultIfEmpty
››. <
(
››< =
)
››= >
join
ﬁﬁ 
motivounodescarte
ﬁﬁ 
in
ﬁﬁ !
_context
ﬁﬁ" *
.
ﬁﬁ* +
ListaTablas
ﬁﬁ+ 6
on
ﬁﬁ7 9
new
ﬁﬁ: =
{
ﬁﬁ> ?
p
ﬁﬁ@ A
.
ﬁﬁA B%
CodigoMotivoUnoDescarte
ﬁﬁB Y
,
ﬁﬁY Z#
idtablamotivodescarte
ﬁﬁ[ p
=
ﬁﬁq r

TablaTabla
ﬁﬁs }
.
ﬁﬁ} ~
MotivoDescarteﬁﬁ~ å
}ﬁﬁç é
equals
ﬂﬂ 
new
ﬂﬂ 
{
ﬂﬂ %
CodigoMotivoUnoDescarte
ﬂﬂ 5
=
ﬂﬂ6 7
(
ﬂﬂ8 9
short
ﬂﬂ9 >
?
ﬂﬂ> ?
)
ﬂﬂ? @
motivounodescarte
ﬂﬂ@ Q
.
ﬂﬂQ R
CodigoCampo
ﬂﬂR ]
,
ﬂﬂ] ^#
idtablamotivodescarte
ﬂﬂ_ t
=
ﬂﬂu v 
motivounodescarteﬂﬂw à
.ﬂﬂà â
IdTablaﬂﬂâ ê
}ﬂﬂë í
intoﬂﬂì ó*
ProspectoMotivoUnoDescarteﬂﬂò ≤
from
‡‡  
pmotivounodescarte
‡‡ 
in
‡‡  "(
ProspectoMotivoUnoDescarte
‡‡# =
.
‡‡= >
DefaultIfEmpty
‡‡> L
(
‡‡L M
)
‡‡M N
join
·· 
motivodosdescarte
·· 
in
·· !
_context
··" *
.
··* +
ListaTablas
··+ 6
on
··7 9
new
··: =
{
··> ?
p
··@ A
.
··A B%
CodigoMotivoDosDescarte
··B Y
,
··Y Z#
idtablamotivodescarte
··[ p
=
··q r

TablaTabla
··s }
.
··} ~
MotivoDescarte··~ å
}··ç é
equals
‚‚ 
new
‚‚ 
{
‚‚ %
CodigoMotivoDosDescarte
‚‚ 5
=
‚‚6 7
(
‚‚8 9
short
‚‚9 >
?
‚‚> ?
)
‚‚? @
motivodosdescarte
‚‚@ Q
.
‚‚Q R
CodigoCampo
‚‚R ]
,
‚‚] ^#
idtablamotivodescarte
‚‚_ t
=
‚‚u v 
motivodosdescarte‚‚w à
.‚‚à â
IdTabla‚‚â ê
}‚‚ë í
into‚‚ì ó*
ProspectoMotivoDosDescarte‚‚ò ≤
from
„„  
pmotivodosdescarte
„„ 
in
„„  "(
ProspectoMotivoDosDescarte
„„# =
.
„„= >
DefaultIfEmpty
„„> L
(
„„L M
)
„„M N
join
‰‰ 
referido
‰‰ 
in
‰‰ 
_context
‰‰ !
.
‰‰! "

Prospectos
‰‰" ,
on
‰‰- /
p
‰‰0 1
.
‰‰1 2
IdReferenciador
‰‰2 A
equals
‰‰B H
referido
‰‰I Q
.
‰‰Q R
IdProspecto
‰‰R ]
into
‰‰^ b
ProspectoReferido
‰‰c t
from
ÂÂ 
	preferido
ÂÂ 
in
ÂÂ 
ProspectoReferido
ÂÂ +
.
ÂÂ+ ,
DefaultIfEmpty
ÂÂ, :
(
ÂÂ: ;
)
ÂÂ; <
join
ÊÊ 
cargo
ÊÊ 
in
ÊÊ 
_context
ÊÊ 
.
ÊÊ 
TablaTablas
ÊÊ *
on
ÊÊ+ -
new
ÊÊ. 1
{
ÊÊ2 3
p
ÊÊ4 5
.
ÊÊ5 6
CodigoCargo
ÊÊ6 A
,
ÊÊA B
idtablacargo
ÊÊC O
=
ÊÊP Q

TablaTabla
ÊÊR \
.
ÊÊ\ ]
PersonaCargo
ÊÊ] i
}
ÊÊj k
equals
ÁÁ 
new
ÁÁ 
{
ÁÁ 
CodigoCargo
ÁÁ  +
=
ÁÁ, -
(
ÁÁ. /
short
ÁÁ/ 4
?
ÁÁ4 5
)
ÁÁ5 6
cargo
ÁÁ6 ;
.
ÁÁ; <
CodigoCampo
ÁÁ< G
,
ÁÁG H
idtablacargo
ÁÁI U
=
ÁÁV W
cargo
ÁÁX ]
.
ÁÁ] ^
IdTabla
ÁÁ^ e
}
ÁÁf g
into
ÁÁh l
ProspectoCargo
ÁÁm {
from
ËË 
pcargo
ËË 
in
ËË 
ProspectoCargo
ËË %
.
ËË% &
DefaultIfEmpty
ËË& 4
(
ËË4 5
)
ËË5 6
join
ÈÈ 
sexo
ÈÈ 
in
ÈÈ 
_context
ÈÈ 
.
ÈÈ 
TablaTablas
ÈÈ )
on
ÈÈ* ,
new
ÈÈ- 0
{
ÈÈ1 2
p
ÈÈ3 4
.
ÈÈ4 5

CodigoSexo
ÈÈ5 ?
,
ÈÈ? @
idtablasexo
ÈÈA L
=
ÈÈM N

TablaTabla
ÈÈO Y
.
ÈÈY Z
Sexo
ÈÈZ ^
}
ÈÈ_ `
equals
ÍÍ 
new
ÍÍ 
{
ÍÍ 

CodigoSexo
ÍÍ )
=
ÍÍ* +
(
ÍÍ, -
short
ÍÍ- 2
?
ÍÍ2 3
)
ÍÍ3 4
sexo
ÍÍ4 8
.
ÍÍ8 9
CodigoCampo
ÍÍ9 D
,
ÍÍD E
idtablasexo
ÍÍF Q
=
ÍÍR S
sexo
ÍÍT X
.
ÍÍX Y
IdTabla
ÍÍY `
}
ÍÍa b
into
ÍÍc g
ProspectoSexo
ÍÍh u
from
ÎÎ 
psexo
ÎÎ 
in
ÎÎ 
ProspectoSexo
ÎÎ #
.
ÎÎ# $
DefaultIfEmpty
ÎÎ$ 2
(
ÎÎ2 3
)
ÎÎ3 4
join
ÏÏ 
	direccion
ÏÏ 
in
ÏÏ 
_context
ÏÏ "
.
ÏÏ" #!
DireccionProspectos
ÏÏ# 6
on
ÏÏ7 9
p
ÏÏ: ;
.
ÏÏ; <
IdProspecto
ÏÏ< G
equals
ÏÏH N
	direccion
ÏÏO X
.
ÏÏX Y
IdProspecto
ÏÏY d
into
ÏÏe i 
ProspectoDireccion
ÏÏj |
from
ÌÌ 

pdireccion
ÌÌ 
in
ÌÌ  
ProspectoDireccion
ÌÌ -
.
ÌÌ- .
DefaultIfEmpty
ÌÌ. <
(
ÌÌ< =
)
ÌÌ= >
join
ÓÓ 
distrito
ÓÓ 
in
ÓÓ 
_context
ÓÓ !
.
ÓÓ! "
	Distritos
ÓÓ" +
on
ÓÓ, .
new
ÓÓ/ 2
{
ÓÓ3 4

pdireccion
ÓÓ5 ?
.
ÓÓ? @
Departamento_Id
ÓÓ@ O
,
ÓÓO P

pdireccion
ÓÓQ [
.
ÓÓ[ \
Provincia_Id
ÓÓ\ h
,
ÓÓh i

pdireccion
ÓÓj t
.
ÓÓt u
Distrito_IdÓÓu Ä
}ÓÓÅ Ç
equals
ÔÔ 
new
ÔÔ 
{
ÔÔ 
distrito
ÔÔ &
.
ÔÔ& '
Departamento_Id
ÔÔ' 6
,
ÔÔ6 7
distrito
ÔÔ8 @
.
ÔÔ@ A
Provincia_Id
ÔÔA M
,
ÔÔM N
distrito
ÔÔO W
.
ÔÔW X
Distrito_Id
ÔÔX c
}
ÔÔd e
into
ÔÔf j
DireccionDistrito
ÔÔk |
from
 
	ddistrito
 
in
 
DireccionDistrito
 +
.
+ ,
DefaultIfEmpty
, :
(
: ;
)
; <
join
ÒÒ 
	provincia
ÒÒ 
in
ÒÒ 
_context
ÒÒ "
.
ÒÒ" #

Provincias
ÒÒ# -
on
ÒÒ. 0
new
ÒÒ1 4
{
ÒÒ5 6

pdireccion
ÒÒ7 A
.
ÒÒA B
Provincia_Id
ÒÒB N
,
ÒÒN O

pdireccion
ÒÒP Z
.
ÒÒZ [
Departamento_Id
ÒÒ[ j
}
ÒÒk l
equals
ÚÚ 
new
ÚÚ 
{
ÚÚ 
	provincia
ÚÚ  )
.
ÚÚ) *
Provincia_Id
ÚÚ* 6
,
ÚÚ6 7
	provincia
ÚÚ8 A
.
ÚÚA B
Departamento_Id
ÚÚB Q
}
ÚÚR S
into
ÚÚT X 
DireccionProvincia
ÚÚY k
from
ÛÛ 

dprovincia
ÛÛ 
in
ÛÛ  
DireccionProvincia
ÛÛ -
.
ÛÛ- .
DefaultIfEmpty
ÛÛ. <
(
ÛÛ< =
)
ÛÛ= >
join
ÙÙ 
departamento
ÙÙ 
in
ÙÙ 
_context
ÙÙ %
.
ÙÙ% &
Departamentos
ÙÙ& 3
on
ÙÙ4 6

pdireccion
ÙÙ7 A
.
ÙÙA B
Departamento_Id
ÙÙB Q
equals
ÙÙR X
departamento
ÙÙY e
.
ÙÙe f
Departamento_Id
ÙÙf u
into
ÙÙv z$
DireccionDepartamentoÙÙ{ ê
from
ıı 
ddepartamento
ıı 
in
ıı #
DireccionDepartamento
ıı 3
.
ıı3 4
DefaultIfEmpty
ıı4 B
(
ııB C
)
ııC D
join
ˆˆ 
lineanegocio
ˆˆ 
in
ˆˆ 
_context
ˆˆ %
.
ˆˆ% &
TablaTablas
ˆˆ& 1
on
ˆˆ2 4
new
ˆˆ5 8
{
ˆˆ9 :
c
ˆˆ; <
.
ˆˆ< = 
CodigoLineaNegocio
ˆˆ= O
,
ˆˆO P!
idtablalineanegocio
ˆˆQ d
=
ˆˆe f

TablaTabla
ˆˆg q
.
ˆˆq r
LineaNegocio
ˆˆr ~
}ˆˆ Ä
equals
˜˜ 
new
˜˜ 
{
˜˜  
CodigoLineaNegocio
˜˜ 1
=
˜˜2 3
(
˜˜4 5
short
˜˜5 :
?
˜˜: ;
)
˜˜; <
lineanegocio
˜˜< H
.
˜˜H I
CodigoCampo
˜˜I T
,
˜˜T U!
idtablalineanegocio
˜˜V i
=
˜˜j k
lineanegocio
˜˜l x
.
˜˜x y
IdTabla˜˜y Ä
}˜˜Å Ç
into˜˜É á%
ProspectoLineaNegocio˜˜à ù
from
¯¯ 
plineanegocio
¯¯ 
in
¯¯ #
ProspectoLineaNegocio
¯¯ 3
.
¯¯3 4
DefaultIfEmpty
¯¯4 B
(
¯¯B C
)
¯¯C D
join
˘˘ 
porcentajeavance
˘˘ 
in
˘˘  
_context
˘˘! )
.
˘˘) *
TablaTablas
˘˘* 5
on
˘˘6 8
new
˘˘9 <
{
˘˘= >
c
˘˘? @
.
˘˘@ A0
"CodigoPorcentajeAvanceCalificacion
˘˘A c
,
˘˘c d%
idtablaporcentajeavance
˘˘e |
=
˘˘} ~

TablaTabla˘˘ â
.˘˘â ä,
PorcentajeAvanceCalificacion˘˘ä ¶
}˘˘ß ®
equals
˙˙ 
new
˙˙ 
{
˙˙ 0
"CodigoPorcentajeAvanceCalificacion
˙˙ A
=
˙˙B C
(
˙˙D E
short
˙˙E J
?
˙˙J K
)
˙˙K L
porcentajeavance
˙˙L \
.
˙˙\ ]
CodigoCampo
˙˙] h
,
˙˙h i&
idtablaporcentajeavance˙˙j Å
=˙˙Ç É 
porcentajeavance˙˙Ñ î
.˙˙î ï
IdTabla˙˙ï ú
}˙˙ù û
into˙˙ü £
CitaPorcentaje˙˙§ ≤
from
˚˚ 
cporcentajeavance
˚˚ 
in
˚˚ !
CitaPorcentaje
˚˚" 0
.
˚˚0 1
DefaultIfEmpty
˚˚1 ?
(
˚˚? @
)
˚˚@ A
where
¸¸ 
(
¸¸ 
intermediario
¸¸ 
.
¸¸ !
CodigoIntermediario
¸¸ 0
==
¸¸1 3"
prospectoQueryFilter
¸¸4 H
.
¸¸H I!
codigointermediario
¸¸I \
)
¸¸\ ]
&&
¸¸^ `
(
˝˝ 
c
˝˝ 
.
˝˝ 
FlagCalificacion
˝˝ 
.
˝˝ 
Value
˝˝ $
)
˝˝$ %
&&
˝˝& (
(
˛˛ 
p
˛˛ 
.
˛˛ 
Nombres
˛˛ 
.
˛˛ 
Contains
˛˛ 
(
˛˛ "
prospectoQueryFilter
˛˛ 3
.
˛˛3 4
	parametro
˛˛4 =
)
˛˛= >
||
˛˛? A
p
˛˛B C
.
˛˛C D
ApellidoPaterno
˛˛D S
.
˛˛S T
Contains
˛˛T \
(
˛˛\ ]"
prospectoQueryFilter
˛˛] q
.
˛˛q r
	parametro
˛˛r {
)
˛˛{ |
||
˛˛} 
p
ˇˇ 
.
ˇˇ 
ApellidoMaterno
ˇˇ 
.
ˇˇ 
Contains
ˇˇ %
(
ˇˇ% &"
prospectoQueryFilter
ˇˇ& :
.
ˇˇ: ;
	parametro
ˇˇ; D
)
ˇˇD E
||
ˇˇF H
p
ˇˇI J
.
ˇˇJ K
Referenciador
ˇˇK X
.
ˇˇX Y
Contains
ˇˇY a
(
ˇˇa b"
prospectoQueryFilter
ˇˇb v
.
ˇˇv w
	parametroˇˇw Ä
)ˇˇÄ Å
||ˇˇÇ Ñ
pˇˇÖ Ü
.ˇˇÜ á
NumeroDocumentoˇˇá ñ
.ˇˇñ ó
Containsˇˇó ü
(ˇˇü †$
prospectoQueryFilterˇˇ† ¥
.ˇˇ¥ µ
	parametroˇˇµ æ
)ˇˇæ ø
)ˇˇø ¿
&&ˇˇ¡ √
(
ÄÄ 
(
ÄÄ 
p
ÄÄ 
.
ÄÄ $
AuditoriaFechaCreacion
ÄÄ %
>=
ÄÄ& ("
prospectoQueryFilter
ÄÄ) =
.
ÄÄ= >!
fechacreacioninicio
ÄÄ> Q
||
ÄÄR T"
prospectoQueryFilter
ÄÄU i
.
ÄÄi j!
fechacreacioninicio
ÄÄj }
==ÄÄ~ Ä
nullÄÄÅ Ö
)ÄÄÖ Ü
&&ÄÄá â
(
ÅÅ 
p
ÅÅ 
.
ÅÅ $
AuditoriaFechaCreacion
ÅÅ %
<=
ÅÅ& ("
prospectoQueryFilter
ÅÅ) =
.
ÅÅ= >
fechacreacionfin
ÅÅ> N
||
ÅÅO Q"
prospectoQueryFilter
ÅÅR f
.
ÅÅf g
fechacreacionfin
ÅÅg w
==
ÅÅx z
null
ÅÅ{ 
)ÅÅ Ä
)ÅÅÄ Å
&&ÅÅÇ Ñ
(
ÇÇ 
(
ÇÇ 
c
ÇÇ 
.
ÇÇ !
FechaEstimadaCierre
ÇÇ #
>=
ÇÇ$ &"
prospectoQueryFilter
ÇÇ' ;
.
ÇÇ; <'
fechaestimadacierreinicio
ÇÇ< U
||
ÇÇV X"
prospectoQueryFilter
ÇÇY m
.
ÇÇm n(
fechaestimadacierreinicioÇÇn á
==ÇÇà ä
nullÇÇã è
)ÇÇè ê
&&ÇÇë ì
(
ÉÉ 
c
ÉÉ 
.
ÉÉ !
FechaEstimadaCierre
ÉÉ "
<=
ÉÉ# %"
prospectoQueryFilter
ÉÉ& :
.
ÉÉ: ;$
fechaestimadacierrefin
ÉÉ; Q
||
ÉÉR T"
prospectoQueryFilter
ÉÉU i
.
ÉÉi j%
fechaestimadacierrefinÉÉj Ä
==ÉÉÅ É
nullÉÉÑ à
)ÉÉà â
)ÉÉâ ä
&&ÉÉã ç
(
ÑÑ 
(
ÑÑ 
c
ÑÑ 
.
ÑÑ $
AuditoriaFechaCreacion
ÑÑ &
>=
ÑÑ' )"
prospectoQueryFilter
ÑÑ* >
.
ÑÑ> ?(
fechaultimaactividadinicio
ÑÑ? Y
||
ÑÑZ \"
prospectoQueryFilter
ÑÑ] q
.
ÑÑq r)
fechaultimaactividadinicioÑÑr å
==ÑÑç è
nullÑÑê î
)ÑÑî ï
&&ÑÑñ ò
(
ÖÖ 
c
ÖÖ 
.
ÖÖ $
AuditoriaFechaCreacion
ÖÖ %
<=
ÖÖ& ("
prospectoQueryFilter
ÖÖ) =
.
ÖÖ= >%
fechaultimaactividadfin
ÖÖ> U
||
ÖÖV X"
prospectoQueryFilter
ÖÖY m
.
ÖÖm n&
fechaultimaactividadfinÖÖn Ö
==ÖÖÜ à
nullÖÖâ ç
)ÖÖç é
)ÖÖé è
&&ÖÖê í
(
ÜÜ !
listcodigorangoedad
ÜÜ  
.
ÜÜ  !
Contains
ÜÜ! )
(
ÜÜ) *
p
ÜÜ* +
.
ÜÜ+ ,
CodigoRangoEdad
ÜÜ, ;
.
ÜÜ; <
Value
ÜÜ< A
)
ÜÜA B
||
ÜÜC E!
listcodigorangoedad
ÜÜF Y
==
ÜÜZ \
null
ÜÜ] a
)
ÜÜa b
&&
ÜÜc e
(
áá !
listcodigorangosexo
áá 
.
áá  
Contains
áá  (
(
áá( )
p
áá) *
.
áá* +

CodigoSexo
áá+ 5
.
áá5 6
Value
áá6 ;
)
áá; <
||
áá= ?!
listcodigorangosexo
áá@ S
==
ááT V
null
ááW [
)
áá[ \
&&
áá] _
(
àà #
listcodigorangofuente
àà !
.
àà! "
Contains
àà" *
(
àà* +
p
àà+ ,
.
àà, -
CodigoFuente
àà- 9
.
àà9 :
Value
àà: ?
)
àà? @
||
ààA C#
listcodigorangofuente
ààD Y
==
ààZ \
null
àà] a
)
ààa b
&&
ààc e
(
ââ &
listcodigorangosubfuente
ââ $
.
ââ$ %
Contains
ââ% -
(
ââ- .
p
ââ. /
.
ââ/ 0
CodigoSubFuente
ââ0 ?
.
ââ? @
Value
ââ@ E
)
ââE F
||
ââG I&
listcodigorangosubfuente
ââJ b
==
ââc e
null
ââf j
)
ââj k
&&
ââl n
(
ää $
listcodigorangoingreso
ää "
.
ää" #
Contains
ää# +
(
ää+ ,
p
ää, -
.
ää- . 
CodigoRangoIngreso
ää. @
.
ää@ A
Value
ääA F
)
ääF G
||
ääH J$
listcodigorangoingreso
ääK a
==
ääb d
null
ääe i
)
ääi j
&&
ääk m
(
ãã "
listcodigorangofondo
ãã  
.
ãã  !
Contains
ãã! )
(
ãã) *
p
ãã* +
.
ãã+ ,
CodigoRangoFondo
ãã, <
.
ãã< =
Value
ãã= B
)
ããB C
||
ããD F"
listcodigorangofondo
ããG [
==
ãã\ ^
null
ãã_ c
)
ããc d
&&
ããe g
(
åå 
!
åå 
_context
åå 
.
åå 
Citas
åå 
.
åå 
Where
åå !
(
åå! "
x
åå" #
=>
åå$ &
x
åå' (
.
åå( )
IdProspecto
åå) 4
==
åå5 7
p
åå8 9
.
åå9 :
IdProspecto
åå: E
&&
ååF H
x
ååI J
.
ååJ K
FlagCalificacion
ååK [
==
åå\ ^
null
åå_ c
)
ååc d
.
ååd e
Select
ååe k
(
ååk l
x
åål m
=>
åån p
x
ååq r
.
åår s
IdProspecto
åås ~
)
åå~ 
.åå Ä
ContainsååÄ à
(ååà â
pååâ ä
.ååä ã
IdProspectoååã ñ
)ååñ ó
)ååó ò
select
èè 
new
èè 
{
êê 	
p
ëë	 

,
ëë
 
c
íí	 

,
íí
 
padn
ìì	 
,
ìì 
	preferido
îî	 
,
îî 
pfuente
ïï	 
,
ïï 

psubfuente
ññ	 
,
ññ 
psexo
óó	 
,
óó 
pcargo
òò	 
,
òò 

pdireccion
ôô	 
,
ôô 
	ddistrito
öö	 
,
öö 

dprovincia
õõ	 
,
õõ 
ddepartamento
úú	 
,
úú  
pmotivounodescarte
ùù	 
,
ùù  
pmotivodosdescarte
ûû	 
,
ûû 
plineanegocio
üü	 
,
üü 
cporcentajeavance
††	 
}
¢¢ 	
)
¢¢	 

.
¢¢
 
GroupBy
¢¢ 
(
¢¢ 
x
¢¢ 
=>
¢¢ 
new
¢¢ 
{
¢¢ 
x
¢¢ 
.
¢¢ 
p
¢¢  
.
¢¢  !
IdProspecto
¢¢! ,
,
¢¢, -
x
¢¢- .
.
¢¢. /
p
¢¢/ 0
.
¢¢0 1
Nombres
¢¢1 8
,
¢¢8 9
x
¢¢9 :
.
¢¢: ;
p
¢¢; <
.
¢¢< =
ApellidoPaterno
¢¢= L
,
¢¢L M
x
¢¢M N
.
¢¢N O
p
¢¢O P
.
¢¢P Q
ApellidoMaterno
¢¢Q `
,
¢¢` a
x
££ 	
.
££	 

p
££
 
.
££ !
CodigoTipoDocumento
££ 
,
££  
x
££  !
.
££! "
p
££" #
.
££# $
NumeroDocumento
££$ 3
,
££3 4
x
££4 5
.
££5 6
p
££6 7
.
££7 8
CodigoFuente
££8 D
,
££D E
x
££E F
.
££F G
p
££G H
.
££H I
CodigoSubFuente
££I X
,
££X Y
NombreFuente
££Y e
=
££e f
x
££f g
.
££g h
pfuente
££h o
.
££o p
ValorCadena
££p {
,
££{ |
NombreSubfuente
§§ 
=
§§ 
x
§§ 
.
§§ 

psubfuente
§§ %
.
§§% &
ValorCadena
§§& 1
,
§§1 2
x
§§2 3
.
§§3 4
p
§§4 5
.
§§5 6
TelefonoFijo
§§6 B
,
§§B C
x
§§C D
.
§§D E
p
§§E F
.
§§F G
TelefonoCelular
§§G V
,
§§V W
x
§§W X
.
§§X Y
p
§§Y Z
.
§§Z [
FechaNacimiento
§§[ j
,
§§j k
x
•• 	
.
••	 


pdireccion
••
 
.
•• 
	Direccion
•• 
,
•• 
x
••  
.
••  !

pdireccion
••! +
.
••+ ,
Departamento_Id
••, ;
,
••; <
x
••< =
.
••= >

pdireccion
••> H
.
••H I
Provincia_Id
••I U
,
••U V
x
••V W
.
••W X

pdireccion
••X b
.
••b c
Distrito_Id
••c n
,
••n o
Departamento
¶¶ 
=
¶¶ 
x
¶¶ 
.
¶¶ 
ddepartamento
¶¶ %
.
¶¶% &
Nombre
¶¶& ,
,
¶¶, -
	Provincia
¶¶- 6
=
¶¶7 8
x
¶¶9 :
.
¶¶: ;

dprovincia
¶¶; E
.
¶¶E F
Nombre
¶¶F L
,
¶¶L M
Distrito
¶¶M U
=
¶¶U V
x
¶¶W X
.
¶¶X Y
	ddistrito
¶¶Y b
.
¶¶b c
Nombre
¶¶c i
,
¶¶i j
NombreReferido
ßß 
=
ßß 
x
ßß 
.
ßß 
	preferido
ßß $
.
ßß$ %
Nombres
ßß% ,
,
ßß, -%
ApellidoPaternoReferido
ßß- D
=
ßßE F
x
ßßG H
.
ßßH I
	preferido
ßßI R
.
ßßR S
ApellidoPaterno
ßßS b
,
ßßb c%
ApellidoMaternoReferido
ßßd {
=
ßß| }
x
ßß~ 
.ßß Ä
	preferidoßßÄ â
.ßßâ ä
ApellidoMaternoßßä ô
,ßßô ö
x
®® 	
.
®®	 

p
®®
 
.
®® 

CodigoSexo
®® 
,
®® 
Sexo
®® 
=
®® 
x
®® 
.
®® 
psexo
®® $
.
®®$ %!
ValorAuxiliarCadena
®®% 8
,
®®8 9
x
®®9 :
.
®®: ;
p
®®; <
.
®®< =
Empresa
®®= D
,
®®D E
x
®®E F
.
®®F G
p
®®G H
.
®®H I
CodigoCargo
®®I T
,
®®T U
NombreCargo
®®U `
=
®®a b
x
®®b c
.
®®c d
pcargo
®®d j
.
®®j k
ValorCadena
®®k v
,
®®v w
x
®®w x
.
®®x y
p
®®y z
.
®®z {
	OtroCargo®®{ Ñ
,®®Ñ Ö
x®®Ö Ü
.®®Ü á
p®®á à
.®®à â
Referenciador®®â ñ
,®®ñ ó
x
©© 	
.
©©	 

padn
©©
 
.
©© $
NumeroHijosDependiente
©© %
,
©©% &
x
©©& '
.
©©' (
p
©©( )
.
©©) * 
CorreoElectronico1
©©* <
,
©©< =
x
©©= >
.
©©> ?
p
©©? @
.
©©@ A
MonedaFondo
©©A L
,
©©L M
x
©©M N
.
©©N O
p
©©O P
.
©©P Q

MontoFondo
©©Q [
,
©©[ \
x
©©\ ]
.
©©] ^
p
©©^ _
.
©©_ `
IdReferenciador
©©` o
,
©©o p
x
™™ 	
.
™™	 

p
™™
 
.
™™ 
FlagDescarte
™™ 
,
™™ 
MotivoDescarteUno
™™ *
=
™™+ ,
x
™™- .
.
™™. / 
pmotivodosdescarte
™™/ A
.
™™A B
ValorCadena
™™B M
,
™™M N
MotivoDescarteDos
™™N _
=
™™` a
x
™™a b
.
™™b c 
pmotivounodescarte
™™c u
.
™™u v
ValorCadena™™v Å
,™™Å Ç
Producto
´´ 
=
´´ 
x
´´ 
.
´´ 
plineanegocio
´´ !
.
´´! "
ValorCadena
´´" -
,
´´- .
x
´´. /
.
´´/ 0
padn
´´0 4
.
´´4 5!
MonedaPatrimonioAfp
´´5 H
,
´´H I
x
´´I J
.
´´J K
padn
´´K O
.
´´O P 
MontoPatrimonioAfp
´´P b
}
¨¨ 	
)
¨¨	 

.
¨¨
 
Select
¨¨ 
(
¨¨ 
y
¨¨ 
=>
¨¨ 
new
¨¨ 
	Prospecto
¨¨ $
(
¨¨$ %
)
¨¨% &
{
≠≠ 	
IdProspecto
ÆÆ	 
=
ÆÆ 
y
ÆÆ 
.
ÆÆ 
Key
ÆÆ 
.
ÆÆ 
IdProspecto
ÆÆ (
,
ÆÆ( )
Nombres
ØØ	 
=
ØØ 
y
ØØ 
.
ØØ 
Key
ØØ 
.
ØØ 
Nombres
ØØ  
,
ØØ  !
ApellidoPaterno
∞∞	 
=
∞∞ 
y
∞∞ 
.
∞∞ 
Key
∞∞  
.
∞∞  !
ApellidoPaterno
∞∞! 0
,
∞∞0 1
ApellidoMaterno
±±	 
=
±± 
y
±± 
.
±± 
Key
±±  
.
±±  !
ApellidoMaterno
±±! 0
,
±±0 1
NombresApellidos
≤≤	 
=
≤≤ 
string
≤≤ "
.
≤≤" #
Format
≤≤# )
(
≤≤) *
$str
≤≤* 7
,
≤≤7 8
y
≤≤9 :
.
≤≤: ;
Key
≤≤; >
.
≤≤> ?
Nombres
≤≤? F
,
≤≤F G
y
≤≤H I
.
≤≤I J
Key
≤≤J M
.
≤≤M N
ApellidoPaterno
≤≤N ]
,
≤≤] ^
y
≤≤_ `
.
≤≤` a
Key
≤≤a d
.
≤≤d e
ApellidoMaterno
≤≤e t
)
≤≤t u
,
≤≤u v!
CodigoTipoDocumento
≥≥	 
=
≥≥ 
y
≥≥  
.
≥≥  !
Key
≥≥! $
.
≥≥$ %!
CodigoTipoDocumento
≥≥% 8
.
≥≥8 9
Value
≥≥9 >
,
≥≥> ?
NumeroDocumento
¥¥	 
=
¥¥ 
y
¥¥ 
.
¥¥ 
Key
¥¥  
.
¥¥  !
NumeroDocumento
¥¥! 0
,
¥¥0 1
CodigoFuente
µµ	 
=
µµ 
y
µµ 
.
µµ 
Key
µµ 
.
µµ 
CodigoFuente
µµ *
.
µµ* +
Value
µµ+ 0
,
µµ0 1
CodigoSubFuente
∂∂	 
=
∂∂ 
y
∂∂ 
.
∂∂ 
Key
∂∂  
.
∂∂  !
CodigoSubFuente
∂∂! 0
.
∂∂0 1
Value
∂∂1 6
,
∂∂6 7
NombreFuente
∑∑	 
=
∑∑ 
y
∑∑ 
.
∑∑ 
Key
∑∑ 
.
∑∑ 
NombreFuente
∑∑ *
,
∑∑* +
NombreSubFuente
∏∏	 
=
∏∏ 
y
∏∏ 
.
∏∏ 
Key
∏∏  
.
∏∏  !
NombreSubfuente
∏∏! 0
,
∏∏0 1
TelefonoFijo
ππ	 
=
ππ 
y
ππ 
.
ππ 
Key
ππ 
.
ππ 
TelefonoFijo
ππ *
,
ππ* +
TelefonoCelular
∫∫	 
=
∫∫ 
y
∫∫ 
.
∫∫ 
Key
∫∫  
.
∫∫  !
TelefonoCelular
∫∫! 0
,
∫∫0 1
FechaNacimiento
ªª	 
=
ªª 
y
ªª 
.
ªª 
Key
ªª  
.
ªª  !
FechaNacimiento
ªª! 0
.
ªª0 1
Value
ªª1 6
,
ªª6 7
	Direccion
ºº	 
=
ºº 
y
ºº 
.
ºº 
Key
ºº 
.
ºº 
	Direccion
ºº $
,
ºº$ %
Departamento_Id
ΩΩ	 
=
ΩΩ 
y
ΩΩ 
.
ΩΩ 
Key
ΩΩ  
.
ΩΩ  !
Departamento_Id
ΩΩ! 0
,
ΩΩ0 1
Provincia_Id
ææ	 
=
ææ 
y
ææ 
.
ææ 
Key
ææ 
.
ææ 
Provincia_Id
ææ *
,
ææ* +
Distrito_Id
øø	 
=
øø 
y
øø 
.
øø 
Key
øø 
.
øø 
Distrito_Id
øø (
,
øø( )
Departamento
¿¿	 
=
¿¿ 
y
¿¿ 
.
¿¿ 
Key
¿¿ 
.
¿¿ 
Departamento
¿¿ *
,
¿¿* +
	Provincia
¡¡	 
=
¡¡ 
y
¡¡ 
.
¡¡ 
Key
¡¡ 
.
¡¡ 
	Provincia
¡¡ $
,
¡¡$ %
Distrito
¬¬	 
=
¬¬ 
y
¬¬ 
.
¬¬ 
Key
¬¬ 
.
¬¬ 
Distrito
¬¬ "
,
¬¬" #
Edad
√√	 
=
√√ 
DateTime
√√ 
.
√√ 
Now
√√ 
.
√√ 
Year
√√ !
-
√√" #
y
√√$ %
.
√√% &
Key
√√& )
.
√√) *
FechaNacimiento
√√* 9
.
√√9 :
Value
√√: ?
.
√√? @
Year
√√@ D
,
√√D E

CodigoSexo
ƒƒ	 
=
ƒƒ 
y
ƒƒ 
.
ƒƒ 
Key
ƒƒ 
.
ƒƒ 

CodigoSexo
ƒƒ &
.
ƒƒ& '
Value
ƒƒ' ,
,
ƒƒ, -
Sexo
≈≈	 
=
≈≈ 
y
≈≈ 
.
≈≈ 
Key
≈≈ 
.
≈≈ 
Sexo
≈≈ 
,
≈≈ 
Empresa
∆∆	 
=
∆∆ 
y
∆∆ 
.
∆∆ 
Key
∆∆ 
.
∆∆ 
Empresa
∆∆  
,
∆∆  !
CodigoCargo
««	 
=
«« 
y
«« 
.
«« 
Key
«« 
.
«« 
CodigoCargo
«« (
.
««( )
Value
««) .
,
««. /
NombreCargo
»»	 
=
»» 
y
»» 
.
»» 
Key
»» 
.
»» 
NombreCargo
»» (
,
»»( )
	OtroCargo
……	 
=
…… 
y
…… 
.
…… 
Key
…… 
.
…… 
	OtroCargo
…… $
,
……$ %
Referenciador
  	 
=
   
y
   
.
   
Key
   
.
   
Referenciador
   ,
,
  , -
Hijos
ÀÀ	 
=
ÀÀ 
y
ÀÀ 
.
ÀÀ 
Key
ÀÀ 
.
ÀÀ $
NumeroHijosDependiente
ÀÀ -
.
ÀÀ- .
Value
ÀÀ. 3
,
ÀÀ3 4
Correo
ÃÃ	 
=
ÃÃ 
y
ÃÃ 
.
ÃÃ 
Key
ÃÃ 
.
ÃÃ  
CorreoElectronico1
ÃÃ *
,
ÃÃ* +
MonedaFondo
ÕÕ	 
=
ÕÕ 
y
ÕÕ 
.
ÕÕ 
Key
ÕÕ 
.
ÕÕ !
MonedaPatrimonioAfp
ÕÕ 0
.
ÕÕ0 1
Value
ÕÕ1 6
,
ÕÕ6 7

MontoFondo
ŒŒ	 
=
ŒŒ 
y
ŒŒ 
.
ŒŒ 
Key
ŒŒ 
.
ŒŒ  
MontoPatrimonioAfp
ŒŒ .
.
ŒŒ. /
Value
ŒŒ/ 4
,
ŒŒ4 5
Fuente
œœ	 
=
œœ 
string
œœ 
.
œœ 
Format
œœ 
(
œœ  
$str
œœ  ,
,
œœ, -
y
œœ. /
.
œœ/ 0
Key
œœ0 3
.
œœ3 4
NombreFuente
œœ4 @
,
œœ@ A
string
œœB H
.
œœH I
IsNullOrEmpty
œœI V
(
œœV W
y
œœW X
.
œœX Y
Key
œœY \
.
œœ\ ]
NombreSubfuente
œœ] l
)
œœl m
?
œœn o
$str
œœp r
:
œœs t
$str
œœu x
+
œœy z
y
œœ{ |
.
œœ| }
Keyœœ} Ä
.œœÄ Å
NombreSubfuenteœœÅ ê
,œœê ë
y
–– 
.
–– 
Key
–– 
.
–– 
IdReferenciador
–– &
.
––& '
HasValue
––' /
?
––0 1
y
––2 3
.
––3 4
Key
––4 7
.
––7 8
NombreReferido
––8 F
+
––G H
$str
––I L
+
––M N
y
––O P
.
––P Q
Key
––Q T
.
––T U%
ApellidoPaternoReferido
––U l
+
––m n
$str
––o r
+
––s t
y
––u v
.
––v w
Key
––w z
.
––z {&
ApellidoMaternoReferido––{ í
:––ì î
y––ï ñ
.––ñ ó
Key––ó ö
.––ö õ
Referenciador––õ ®
)––® ©
,––© ™
IdReferenciador
——	 
=
—— 
y
—— 
.
—— 
Key
——  
.
——  !
IdReferenciador
——! 0
.
——0 1
Value
——1 6
,
——6 7
FlagDescarte
““	 
=
““ 
y
““ 
.
““ 
Key
““ 
.
““ 
FlagDescarte
““ *
,
““* +!
TextoMotivoDescarte
””	 
=
”” 
string
”” %
.
””% &
IsNullOrEmpty
””& 3
(
””3 4
y
””4 5
.
””5 6
Key
””6 9
.
””9 :
MotivoDescarteDos
””: K
)
””K L
?
””M N
y
””O P
.
””P Q
Key
””Q T
.
””T U
MotivoDescarteUno
””U f
:
‘‘ 
string
‘‘ 
.
‘‘ 
Format
‘‘ #
(
‘‘# $
$str
‘‘$ -
,
‘‘- .
y
‘‘/ 0
.
‘‘0 1
Key
‘‘1 4
.
‘‘4 5
MotivoDescarteUno
‘‘5 F
,
‘‘F G
y
‘‘H I
.
‘‘I J
Key
‘‘J M
.
‘‘M N
MotivoDescarteDos
‘‘N _
)
‘‘_ `
,
‘‘` a
PorcentajeAvance
’’	 
=
’’ 
(
’’ 
int
’’  
)
’’  !
y
’’! "
.
’’" #
Max
’’# &
(
’’& '
x
’’' (
=>
’’) +
x
’’, -
.
’’- .
cporcentajeavance
’’. ?
.
’’? @
ValorNumerico
’’@ M
)
’’M N
,
’’N O
DescripcionAvance
÷÷	 
=
÷÷ 
y
÷÷ 
.
÷÷ 
Max
÷÷ "
(
÷÷" #
x
÷÷# $
=>
÷÷% '
x
÷÷( )
.
÷÷) *
cporcentajeavance
÷÷* ;
.
÷÷; <
ValorNumerico
÷÷< I
)
÷÷I J
==
÷÷K M
$num
÷÷N Q
?
÷÷R S
$str
÷÷T \
:
÷÷] ^
y
◊◊ 
.
◊◊ 
Max
◊◊ "
(
◊◊" #
x
◊◊# $
=>
◊◊% '
x
◊◊( )
.
◊◊) *
cporcentajeavance
◊◊* ;
.
◊◊; <
ValorNumerico
◊◊< I
)
◊◊I J
==
◊◊K M
$num
◊◊N P
?
◊◊Q R
$str
◊◊S d
:
◊◊e f
y
ÿÿ 
.
ÿÿ 
Max
ÿÿ 
(
ÿÿ 
x
ÿÿ 
=>
ÿÿ 
x
ÿÿ 
.
ÿÿ 
cporcentajeavance
ÿÿ ,
.
ÿÿ, -
ValorNumerico
ÿÿ- :
)
ÿÿ: ;
==
ÿÿ< >
$num
ÿÿ? A
?
ÿÿB C
$str
ÿÿD P
:
ÿÿQ R
y
ŸŸ 
.
ŸŸ 
Max
ŸŸ 
(
ŸŸ 
x
ŸŸ 
=>
ŸŸ 
x
ŸŸ 
.
ŸŸ 
cporcentajeavance
ŸŸ ,
.
ŸŸ, -
ValorNumerico
ŸŸ- :
)
ŸŸ: ;
==
ŸŸ< >
$num
ŸŸ? A
?
ŸŸB C
$str
ŸŸD J
:
ŸŸJ K
y
⁄⁄ 
.
⁄⁄ 
Max
⁄⁄ 
(
⁄⁄ 
x
⁄⁄ 
=>
⁄⁄ 
x
⁄⁄ 
.
⁄⁄ 
cporcentajeavance
⁄⁄ ,
.
⁄⁄, -
ValorNumerico
⁄⁄- :
)
⁄⁄: ;
==
⁄⁄< >
$num
⁄⁄? A
?
⁄⁄B C
$str
⁄⁄D P
:
⁄⁄Q R
y
€€ 
.
€€ 
Max
€€ 
(
€€ 
x
€€ 
=>
€€ 
x
€€ 
.
€€ 
cporcentajeavance
€€ ,
.
€€, -
ValorNumerico
€€- :
)
€€: ;
==
€€< >
$num
€€? @
?
€€A B
$str
€€C R
:
€€S T
$str
€€U W
,
€€W X&
PorcentajeAvanceAnterior
‹‹	 !
=
‹‹" #
(
‹‹$ %
int
‹‹% (
)
‹‹( )
(
‹‹) *
(
‹‹* +
(
‹‹+ ,
from
‹‹, 0
citamax
‹‹1 8
in
‹‹9 ;
_context
‹‹< D
.
‹‹D E
Citas
‹‹E J
join
›› 
porcentajeavance
›› )
in
››* ,
_context
››- 5
.
››5 6
TablaTablas
››6 A
on
››B D
new
››E H
{
››I J
citamax
››K R
.
››R S0
"CodigoPorcentajeAvanceCalificacion
››S u
,
››u v&
idtablaporcentajeavance››w é
=››è ê

TablaTabla››ë õ
.››õ ú,
PorcentajeAvanceCalificacion››ú ∏
}››π ∫
equals
ﬁﬁ 
new
ﬁﬁ 
{
ﬁﬁ  0
"CodigoPorcentajeAvanceCalificacion
ﬁﬁ! C
=
ﬁﬁD E
(
ﬁﬁF G
short
ﬁﬁG L
?
ﬁﬁL M
)
ﬁﬁM N
porcentajeavance
ﬁﬁN ^
.
ﬁﬁ^ _
CodigoCampo
ﬁﬁ_ j
,
ﬁﬁj k&
idtablaporcentajeavanceﬁﬁl É
=ﬁﬁÑ Ö 
porcentajeavanceﬁﬁÜ ñ
.ﬁﬁñ ó
IdTablaﬁﬁó û
}ﬁﬁü †
intoﬁﬁ° •!
CitaMaxPorcentajeﬁﬁ¶ ∑
from
ﬂﬂ %
citamaxporcentajeavance
ﬂﬂ 0
in
ﬂﬂ1 3
CitaMaxPorcentaje
ﬂﬂ4 E
.
ﬂﬂE F
DefaultIfEmpty
ﬂﬂF T
(
ﬂﬂT U
)
ﬂﬂU V
where
‡‡ 
citamax
‡‡ !
.
‡‡! "
IdProspecto
‡‡" -
==
‡‡. 0
y
‡‡1 2
.
‡‡2 3
Key
‡‡3 6
.
‡‡6 7
IdProspecto
‡‡7 B
select
·· 
new
·· 
{
··  
citamax
··! (
,
··( )%
citamaxporcentajeavance
··* A
}
··B C
)
‚‚ 
.
‚‚ 
GroupBy
‚‚ 
(
‚‚ 
x
‚‚ 
=>
‚‚  
new
‚‚! $
{
‚‚% &
x
‚‚' (
.
‚‚( )
citamax
‚‚) 0
.
‚‚0 1
IdProspecto
‚‚1 <
}
‚‚= >
)
‚‚> ?
.
„„ 
Select
„„ 
(
„„ 
y
„„ 
=>
„„ 
new
„„ "
{
„„# $
PorcentajeMaximo
‰‰ #
=
‰‰$ %
y
‰‰& '
.
‰‰' (
Max
‰‰( +
(
‰‰+ ,
x
‰‰, -
=>
‰‰. 0
x
‰‰1 2
.
‰‰2 3%
citamaxporcentajeavance
‰‰3 J
.
‰‰J K
ValorNumerico
‰‰K X
.
‰‰X Y
Value
‰‰Y ^
)
‰‰^ _
}
ÂÂ 
)
ÂÂ 
)
ÂÂ 
.
ÂÂ 
First
ÂÂ 
(
ÂÂ 
)
ÂÂ 
.
ÂÂ 
PorcentajeMaximo
ÂÂ .
)
ÂÂ. /
,
ÂÂ/ 0
VisibleDescarte
ÊÊ	 
=
ÊÊ 
(
ÊÊ 
y
ÊÊ 
.
ÊÊ 
Key
ÊÊ !
.
ÊÊ! "
FlagDescarte
ÊÊ" .
.
ÊÊ. /
Value
ÊÊ/ 4
||
ÊÊ5 7
y
ÊÊ8 9
.
ÊÊ9 :
Max
ÊÊ: =
(
ÊÊ= >
x
ÊÊ> ?
=>
ÊÊ@ B
x
ÊÊC D
.
ÊÊD E
cporcentajeavance
ÊÊE V
.
ÊÊV W
ValorNumerico
ÊÊW d
)
ÊÊd e
==
ÊÊf h
$num
ÊÊi l
)
ÊÊl m
?
ÊÊn o
false
ÊÊp u
:
ÊÊv w
true
ÊÊx |
,
ÊÊ| }
VisibleAgendar
ÁÁ	 
=
ÁÁ 
y
ÁÁ 
.
ÁÁ 
Max
ÁÁ 
(
ÁÁ  
x
ÁÁ  !
=>
ÁÁ" $
x
ÁÁ% &
.
ÁÁ& '
cporcentajeavance
ÁÁ' 8
.
ÁÁ8 9
ValorNumerico
ÁÁ9 F
)
ÁÁF G
==
ÁÁH J
$num
ÁÁK N
?
ÁÁO P
false
ÁÁQ V
:
ÁÁW X
true
ÁÁY ]
,
ÁÁ] ^
FechaCreacion
ËË	 
=
ËË 
y
ËË 
.
ËË 
Max
ËË 
(
ËË 
x
ËË  
=>
ËË! #
x
ËË$ %
.
ËË% &
p
ËË& '
.
ËË' ($
AuditoriaFechaCreacion
ËË( >
)
ËË> ?
,
ËË? @!
FechaEstimadaCierre
ÈÈ	 
=
ÈÈ 
y
ÈÈ  
.
ÈÈ  !
Max
ÈÈ! $
(
ÈÈ$ %
x
ÈÈ% &
=>
ÈÈ' )
x
ÈÈ* +
.
ÈÈ+ ,
c
ÈÈ, -
.
ÈÈ- .!
FechaEstimadaCierre
ÈÈ. A
)
ÈÈA B
,
ÈÈB C"
FechaUltimaActividad
ÍÍ	 
=
ÍÍ 
y
ÍÍ  !
.
ÍÍ! "
Max
ÍÍ" %
(
ÍÍ% &
x
ÍÍ& '
=>
ÍÍ( *
x
ÍÍ+ ,
.
ÍÍ, -
c
ÍÍ- .
.
ÍÍ. /$
AuditoriaFechaCreacion
ÍÍ/ E
)
ÍÍE F
,
ÍÍF G
Producto
ÎÎ	 
=
ÎÎ 
y
ÎÎ 
.
ÎÎ 
Key
ÎÎ 
.
ÎÎ 
Producto
ÎÎ "
}
ÌÌ 	
)
ÌÌ	 

;
ÌÌ
 
return
ÔÔ 
result
ÔÔ 
;
ÔÔ 
}
 
public
ÚÚ 

IQueryable
ÚÚ	 
<
ÚÚ 
	Prospecto
ÚÚ 
>
ÚÚ #
ObtenerAgendadosCitas
ÚÚ 4
(
ÚÚ4 5"
ProspectoQueryFilter
ÚÚ5 I"
prospectoQueryFilter
ÚÚJ ^
)
ÚÚ^ _
{
ÛÛ 
var
ÙÙ !
listcodigorangosexo
ÙÙ 
=
ÙÙ "
prospectoQueryFilter
ÙÙ 1
.
ÙÙ1 2

codigosexo
ÙÙ2 <
!=
ÙÙ= ?
null
ÙÙ@ D
?
ÙÙE F"
prospectoQueryFilter
ÙÙG [
.
ÙÙ[ \

codigosexo
ÙÙ\ f
.
ÙÙf g
Split
ÙÙg l
(
ÙÙl m
$char
ÙÙm p
)
ÙÙp q
.
ÙÙq r
Select
ÙÙr x
(
ÙÙx y
short
ÙÙy ~
.
ÙÙ~ 
ParseÙÙ Ñ
)ÙÙÑ Ö
.ÙÙÖ Ü
ToListÙÙÜ å
(ÙÙå ç
)ÙÙç é
:ÙÙè ê
nullÙÙë ï
;ÙÙï ñ
var
ıı !
listcodigorangoedad
ıı 
=
ıı "
prospectoQueryFilter
ıı 1
.
ıı1 2
codigorangoedad
ıı2 A
!=
ııB D
null
ııE I
?
ııJ K"
prospectoQueryFilter
ııL `
.
ıı` a
codigorangoedad
ııa p
.
ııp q
Split
ııq v
(
ııv w
$char
ııw z
)
ıız {
.
ıı{ |
Selectıı| Ç
(ııÇ É
shortııÉ à
.ııà â
Parseııâ é
)ııé è
.ııè ê
ToListııê ñ
(ııñ ó
)ııó ò
:ııô ö
nullııõ ü
;ııü †
var
ˆˆ #
listcodigorangofuente
ˆˆ 
=
ˆˆ "
prospectoQueryFilter
ˆˆ 3
.
ˆˆ3 4
codigofuente
ˆˆ4 @
!=
ˆˆA C
null
ˆˆD H
?
ˆˆI J"
prospectoQueryFilter
ˆˆK _
.
ˆˆ_ `
codigofuente
ˆˆ` l
.
ˆˆl m
Split
ˆˆm r
(
ˆˆr s
$char
ˆˆs v
)
ˆˆv w
.
ˆˆw x
Select
ˆˆx ~
(
ˆˆ~ 
shortˆˆ Ñ
.ˆˆÑ Ö
ParseˆˆÖ ä
)ˆˆä ã
.ˆˆã å
ToListˆˆå í
(ˆˆí ì
)ˆˆì î
:ˆˆï ñ
nullˆˆó õ
;ˆˆõ ú
var
˜˜ &
listcodigorangosubfuente
˜˜ 
=
˜˜  !"
prospectoQueryFilter
˜˜" 6
.
˜˜6 7
codigosubfuente
˜˜7 F
!=
˜˜G I
null
˜˜J N
?
˜˜O P"
prospectoQueryFilter
˜˜Q e
.
˜˜e f
codigosubfuente
˜˜f u
.
˜˜u v
Split
˜˜v {
(
˜˜{ |
$char
˜˜| 
)˜˜ Ä
.˜˜Ä Å
Select˜˜Å á
(˜˜á à
short˜˜à ç
.˜˜ç é
Parse˜˜é ì
)˜˜ì î
.˜˜î ï
ToList˜˜ï õ
(˜˜õ ú
)˜˜ú ù
:˜˜û ü
null˜˜† §
;˜˜§ •
var
¯¯ $
listcodigorangoingreso
¯¯ 
=
¯¯ "
prospectoQueryFilter
¯¯  4
.
¯¯4 5 
codigorangoingreso
¯¯5 G
!=
¯¯H J
null
¯¯K O
?
¯¯P Q"
prospectoQueryFilter
¯¯R f
.
¯¯f g 
codigorangoingreso
¯¯g y
.
¯¯y z
Split
¯¯z 
(¯¯ Ä
$char¯¯Ä É
)¯¯É Ñ
.¯¯Ñ Ö
Select¯¯Ö ã
(¯¯ã å
short¯¯å ë
.¯¯ë í
Parse¯¯í ó
)¯¯ó ò
.¯¯ò ô
ToList¯¯ô ü
(¯¯ü †
)¯¯† °
:¯¯¢ £
null¯¯§ ®
;¯¯® ©
var
˘˘ "
listcodigorangofondo
˘˘ 
=
˘˘ "
prospectoQueryFilter
˘˘ 2
.
˘˘2 3
codigorangofondo
˘˘3 C
!=
˘˘D F
null
˘˘G K
?
˘˘L M"
prospectoQueryFilter
˘˘N b
.
˘˘b c
codigorangofondo
˘˘c s
.
˘˘s t
Split
˘˘t y
(
˘˘y z
$char
˘˘z }
)
˘˘} ~
.
˘˘~ 
Select˘˘ Ö
(˘˘Ö Ü
short˘˘Ü ã
.˘˘ã å
Parse˘˘å ë
)˘˘ë í
.˘˘í ì
ToList˘˘ì ô
(˘˘ô ö
)˘˘ö õ
:˘˘ú ù
null˘˘û ¢
;˘˘¢ £
var
¸¸ 
result
¸¸ 
=
¸¸ 
(
¸¸  !
from
¸¸! %
c
¸¸& '
in
¸¸( *
_context
¸¸+ 3
.
¸¸3 4
Citas
¸¸4 9
join
˝˝	 
p
˝˝ 
in
˝˝ 
_context
˝˝ 
.
˝˝ 

Prospectos
˝˝ &
on
˝˝' )
c
˝˝* +
.
˝˝+ ,
IdProspecto
˝˝, 7
equals
˝˝8 >
p
˝˝? @
.
˝˝@ A
IdProspecto
˝˝A L
join
˛˛	 
intermediario
˛˛ 
in
˛˛ 
_context
˛˛ '
.
˛˛' ('
ConsolidadoIntermediarios
˛˛( A
on
˛˛B D
p
˛˛E F
.
˛˛F G(
IdConsolidadoIntermediario
˛˛G a
equals
˛˛b h
intermediario
˛˛i v
.
˛˛v w)
IdConsolidadoIntermediario˛˛w ë
join
ˇˇ	 
adn
ˇˇ 
in
ˇˇ 
_context
ˇˇ 
.
ˇˇ 
	AdnRentas
ˇˇ '
on
ˇˇ( *
p
ˇˇ+ ,
.
ˇˇ, -
IdProspecto
ˇˇ- 8
equals
ˇˇ9 ?
adn
ˇˇ@ C
.
ˇˇC D
IdProspecto
ˇˇD O
into
ˇˇP T
ProspectoAdn
ˇˇU a
from
ÄÄ	 
padn
ÄÄ 
in
ÄÄ 
ProspectoAdn
ÄÄ "
.
ÄÄ" #
DefaultIfEmpty
ÄÄ# 1
(
ÄÄ1 2
)
ÄÄ2 3
join
ÅÅ	 
fuente
ÅÅ 
in
ÅÅ 
_context
ÅÅ  
.
ÅÅ  !
ListaTablas
ÅÅ! ,
on
ÅÅ- /
new
ÅÅ0 3
{
ÅÅ4 5
p
ÅÅ6 7
.
ÅÅ7 8
CodigoFuente
ÅÅ8 D
,
ÅÅD E
idtablafuente
ÅÅF S
=
ÅÅT U

TablaTabla
ÅÅV `
.
ÅÅ` a
FuenteProspecto
ÅÅa p
,
ÅÅp q
lnegocio
ÅÅr z
=
ÅÅ{ |
LineaNegocioÅÅ} â
.ÅÅâ ä
RentaÅÅä è
}ÅÅê ë
equals
ÇÇ 
new
ÇÇ 
{
ÇÇ 
CodigoFuente
ÇÇ +
=
ÇÇ, -
(
ÇÇ. /
short
ÇÇ/ 4
?
ÇÇ4 5
)
ÇÇ5 6
fuente
ÇÇ6 <
.
ÇÇ< =
CodigoCampo
ÇÇ= H
,
ÇÇH I
idtablafuente
ÇÇJ W
=
ÇÇX Y
fuente
ÇÇZ `
.
ÇÇ` a
IdTabla
ÇÇa h
,
ÇÇh i
lnegocio
ÇÇj r
=
ÇÇs t
fuente
ÇÇu {
.
ÇÇ{ |!
CodigoLineaNegocioÇÇ| é
}ÇÇè ê
intoÇÇë ï
ProspectoFuenteÇÇñ •
from
ÉÉ	 
pfuente
ÉÉ 
in
ÉÉ 
ProspectoFuente
ÉÉ (
.
ÉÉ( )
DefaultIfEmpty
ÉÉ) 7
(
ÉÉ7 8
)
ÉÉ8 9
join
ÑÑ	 
	subfuente
ÑÑ 
in
ÑÑ 
_context
ÑÑ #
.
ÑÑ# $
ListaTablas
ÑÑ$ /
on
ÑÑ0 2
new
ÑÑ3 6
{
ÑÑ7 8
p
ÑÑ9 :
.
ÑÑ: ;
CodigoSubFuente
ÑÑ; J
,
ÑÑJ K
idtablaSubfuente
ÑÑL \
=
ÑÑ] ^

TablaTabla
ÑÑ_ i
.
ÑÑi j
FuenteProspecto
ÑÑj y
,
ÑÑy z
lnegocioÑÑ{ É
=ÑÑÑ Ö
LineaNegocioÑÑÜ í
.ÑÑí ì
RentaÑÑì ò
}ÑÑô ö
equals
ÖÖ 
new
ÖÖ 
{
ÖÖ 
CodigoSubFuente
ÖÖ .
=
ÖÖ/ 0
(
ÖÖ1 2
short
ÖÖ2 7
?
ÖÖ7 8
)
ÖÖ8 9
	subfuente
ÖÖ9 B
.
ÖÖB C
CodigoCampo
ÖÖC N
,
ÖÖN O
idtablaSubfuente
ÖÖP `
=
ÖÖa b
	subfuente
ÖÖc l
.
ÖÖl m
IdTabla
ÖÖm t
,
ÖÖt u
lnegocio
ÖÖv ~
=ÖÖ Ä
	subfuenteÖÖÅ ä
.ÖÖä ã"
CodigoLineaNegocioÖÖã ù
}ÖÖû ü
intoÖÖ† §"
ProspectoSubFuenteÖÖ• ∑
from
ÜÜ	 

psubfuente
ÜÜ 
in
ÜÜ  
ProspectoSubFuente
ÜÜ .
.
ÜÜ. /
DefaultIfEmpty
ÜÜ/ =
(
ÜÜ= >
)
ÜÜ> ?
join
áá	 
motivounodescarte
áá 
in
áá  "
_context
áá# +
.
áá+ ,
ListaTablas
áá, 7
on
áá8 :
new
áá; >
{
áá? @
p
ááA B
.
ááB C%
CodigoMotivoUnoDescarte
ááC Z
,
ááZ [#
idtablamotivodescarte
áá\ q
=
áár s

TablaTabla
áát ~
.
áá~ 
MotivoDescarteáá ç
}ááé è
equals
àà 
new
àà 
{
àà %
CodigoMotivoUnoDescarte
àà 6
=
àà7 8
(
àà9 :
short
àà: ?
?
àà? @
)
àà@ A
motivounodescarte
ààA R
.
ààR S
CodigoCampo
ààS ^
,
àà^ _#
idtablamotivodescarte
àà` u
=
ààv w 
motivounodescarteààx â
.ààâ ä
IdTablaààä ë
}ààí ì
intoààî ò*
ProspectoMotivoUnoDescarteààô ≥
from
ââ	  
pmotivounodescarte
ââ  
in
ââ! #(
ProspectoMotivoUnoDescarte
ââ$ >
.
ââ> ?
DefaultIfEmpty
ââ? M
(
ââM N
)
ââN O
join
ää	 
motivodosdescarte
ää 
in
ää  "
_context
ää# +
.
ää+ ,
ListaTablas
ää, 7
on
ää8 :
new
ää; >
{
ää? @
p
ääA B
.
ääB C%
CodigoMotivoDosDescarte
ääC Z
,
ääZ [#
idtablamotivodescarte
ää\ q
=
äär s

TablaTabla
äät ~
.
ää~ 
MotivoDescarteää ç
}ääé è
equals
ãã 
new
ãã 
{
ãã %
CodigoMotivoDosDescarte
ãã 6
=
ãã7 8
(
ãã9 :
short
ãã: ?
?
ãã? @
)
ãã@ A
motivodosdescarte
ããA R
.
ããR S
CodigoCampo
ããS ^
,
ãã^ _#
idtablamotivodescarte
ãã` u
=
ããv w 
motivodosdescarteããx â
.ããâ ä
IdTablaããä ë
}ããí ì
intoããî ò*
ProspectoMotivoDosDescarteããô ≥
from
åå	  
pmotivodosdescarte
åå  
in
åå! #(
ProspectoMotivoDosDescarte
åå$ >
.
åå> ?
DefaultIfEmpty
åå? M
(
ååM N
)
ååN O
join
çç	 
referido
çç 
in
çç 
_context
çç "
.
çç" #

Prospectos
çç# -
on
çç. 0
p
çç1 2
.
çç2 3
IdReferenciador
çç3 B
equals
ççC I
referido
ççJ R
.
ççR S
IdProspecto
ççS ^
into
çç_ c
ProspectoReferido
ççd u
from
éé	 
	preferido
éé 
in
éé 
ProspectoReferido
éé ,
.
éé, -
DefaultIfEmpty
éé- ;
(
éé; <
)
éé< =
join
èè	 
cargo
èè 
in
èè 
_context
èè 
.
èè  
TablaTablas
èè  +
on
èè, .
new
èè/ 2
{
èè3 4
p
èè5 6
.
èè6 7
CodigoCargo
èè7 B
,
èèB C
idtablacargo
èèD P
=
èèQ R

TablaTabla
èèS ]
.
èè] ^
PersonaCargo
èè^ j
}
èèk l
equals
êê 
new
êê 
{
êê 
CodigoCargo
êê )
=
êê* +
(
êê, -
short
êê- 2
?
êê2 3
)
êê3 4
cargo
êê4 9
.
êê9 :
CodigoCampo
êê: E
,
êêE F
idtablacargo
êêG S
=
êêT U
cargo
êêV [
.
êê[ \
IdTabla
êê\ c
}
êêd e
into
êêf j
ProspectoCargo
êêk y
from
ëë	 
pcargo
ëë 
in
ëë 
ProspectoCargo
ëë &
.
ëë& '
DefaultIfEmpty
ëë' 5
(
ëë5 6
)
ëë6 7
join
íí	 
sexo
íí 
in
íí 
_context
íí 
.
íí 
TablaTablas
íí *
on
íí+ -
new
íí. 1
{
íí2 3
p
íí4 5
.
íí5 6

CodigoSexo
íí6 @
,
íí@ A
idtablasexo
ííB M
=
ííN O

TablaTabla
ííP Z
.
ííZ [
Sexo
íí[ _
}
íí` a
equals
ìì 
new
ìì 
{
ìì 

CodigoSexo
ìì  *
=
ìì+ ,
(
ìì- .
short
ìì. 3
?
ìì3 4
)
ìì4 5
sexo
ìì5 9
.
ìì9 :
CodigoCampo
ìì: E
,
ììE F
idtablasexo
ììG R
=
ììS T
sexo
ììU Y
.
ììY Z
IdTabla
ììZ a
}
ììb c
into
ììd h
ProspectoSexo
ììi v
from
îî	 
psexo
îî 
in
îî 
ProspectoSexo
îî $
.
îî$ %
DefaultIfEmpty
îî% 3
(
îî3 4
)
îî4 5
join
ïï	 
	direccion
ïï 
in
ïï 
_context
ïï #
.
ïï# $!
DireccionProspectos
ïï$ 7
on
ïï8 :
p
ïï; <
.
ïï< =
IdProspecto
ïï= H
equals
ïïI O
	direccion
ïïP Y
.
ïïY Z
IdProspecto
ïïZ e
into
ïïf j 
ProspectoDireccion
ïïk }
from
ññ	 

pdireccion
ññ 
in
ññ  
ProspectoDireccion
ññ .
.
ññ. /
DefaultIfEmpty
ññ/ =
(
ññ= >
)
ññ> ?
join
óó	 
distrito
óó 
in
óó 
_context
óó "
.
óó" #
	Distritos
óó# ,
on
óó- /
new
óó0 3
{
óó4 5

pdireccion
óó6 @
.
óó@ A
Departamento_Id
óóA P
,
óóP Q

pdireccion
óóR \
.
óó\ ]
Provincia_Id
óó] i
,
óói j

pdireccion
óók u
.
óóu v
Distrito_Idóóv Å
}óóÇ É
equals
òò 
new
òò 
{
òò 
distrito
òò '
.
òò' (
Departamento_Id
òò( 7
,
òò7 8
distrito
òò9 A
.
òòA B
Provincia_Id
òòB N
,
òòN O
distrito
òòP X
.
òòX Y
Distrito_Id
òòY d
}
òòe f
into
òòg k
DireccionDistrito
òòl }
from
ôô	 
	ddistrito
ôô 
in
ôô 
DireccionDistrito
ôô ,
.
ôô, -
DefaultIfEmpty
ôô- ;
(
ôô; <
)
ôô< =
join
öö	 
	provincia
öö 
in
öö 
_context
öö #
.
öö# $

Provincias
öö$ .
on
öö/ 1
new
öö2 5
{
öö6 7

pdireccion
öö8 B
.
ööB C
Provincia_Id
ööC O
,
ööO P

pdireccion
ööQ [
.
öö[ \
Departamento_Id
öö\ k
}
ööl m
equals
õõ 
new
õõ 
{
õõ  
	provincia
õõ! *
.
õõ* +
Provincia_Id
õõ+ 7
,
õõ7 8
	provincia
õõ9 B
.
õõB C
Departamento_Id
õõC R
}
õõS T
into
õõU Y 
DireccionProvincia
õõZ l
from
úú	 

dprovincia
úú 
in
úú  
DireccionProvincia
úú .
.
úú. /
DefaultIfEmpty
úú/ =
(
úú= >
)
úú> ?
join
ùù	 
departamento
ùù 
in
ùù 
_context
ùù &
.
ùù& '
Departamentos
ùù' 4
on
ùù5 7

pdireccion
ùù8 B
.
ùùB C
Departamento_Id
ùùC R
equals
ùùS Y
departamento
ùùZ f
.
ùùf g
Departamento_Id
ùùg v
into
ùùw {$
DireccionDepartamentoùù| ë
from
ûû	 
ddepartamento
ûû 
in
ûû #
DireccionDepartamento
ûû 4
.
ûû4 5
DefaultIfEmpty
ûû5 C
(
ûûC D
)
ûûD E
join
üü	 
lineanegocio
üü 
in
üü 
_context
üü &
.
üü& '
TablaTablas
üü' 2
on
üü3 5
new
üü6 9
{
üü: ;
c
üü< =
.
üü= > 
CodigoLineaNegocio
üü> P
,
üüP Q!
idtablalineanegocio
üüR e
=
üüf g

TablaTabla
üüh r
.
üür s
LineaNegocio
üüs 
}üüÄ Å
equals
†† 
new
†† 
{
††  
CodigoLineaNegocio
††  2
=
††3 4
(
††5 6
short
††6 ;
?
††; <
)
††< =
lineanegocio
††= I
.
††I J
CodigoCampo
††J U
,
††U V!
idtablalineanegocio
††W j
=
††k l
lineanegocio
††m y
.
††y z
IdTabla††z Å
}††Ç É
into††Ñ à%
ProspectoLineaNegocio††â û
from
°°	 
plineanegocio
°° 
in
°° #
ProspectoLineaNegocio
°° 4
.
°°4 5
DefaultIfEmpty
°°5 C
(
°°C D
)
°°D E
join
¢¢	 
porcentajeavance
¢¢ 
in
¢¢ !
_context
¢¢" *
.
¢¢* +
TablaTablas
¢¢+ 6
on
¢¢7 9
new
¢¢: =
{
¢¢> ?
c
¢¢@ A
.
¢¢A B0
"CodigoPorcentajeAvanceCalificacion
¢¢B d
,
¢¢d e%
idtablaporcentajeavance
¢¢f }
=
¢¢~ 

TablaTabla¢¢Ä ä
.¢¢ä ã,
PorcentajeAvanceCalificacion¢¢ã ß
}¢¢® ©
equals
££ 
new
££ 
{
££ 0
"CodigoPorcentajeAvanceCalificacion
££  B
=
££C D
(
££E F
short
££F K
?
££K L
)
££L M
porcentajeavance
££M ]
.
££] ^
CodigoCampo
££^ i
,
££i j&
idtablaporcentajeavance££k Ç
=££É Ñ 
porcentajeavance££Ö ï
.££ï ñ
IdTabla££ñ ù
}££û ü
into££† §
CitaPorcentaje££• ≥
from
§§	 
cporcentajeavance
§§ 
in
§§  "
CitaPorcentaje
§§# 1
.
§§1 2
DefaultIfEmpty
§§2 @
(
§§@ A
)
§§A B
where
••	 
(
•• 
intermediario
•• 
.
•• !
CodigoIntermediario
•• 1
==
••2 4"
prospectoQueryFilter
••5 I
.
••I J!
codigointermediario
••J ]
)
••] ^
&&
••_ a
(
¶¶ 
p
¶¶ 
.
¶¶ 
Nombres
¶¶ 
.
¶¶ 
Contains
¶¶ 
(
¶¶ "
prospectoQueryFilter
¶¶ 3
.
¶¶3 4
	parametro
¶¶4 =
)
¶¶= >
||
¶¶? A
p
¶¶B C
.
¶¶C D
ApellidoPaterno
¶¶D S
.
¶¶S T
Contains
¶¶T \
(
¶¶\ ]"
prospectoQueryFilter
¶¶] q
.
¶¶q r
	parametro
¶¶r {
)
¶¶{ |
||
¶¶} 
p
ßß 
.
ßß 
ApellidoMaterno
ßß 
.
ßß 
Contains
ßß &
(
ßß& '"
prospectoQueryFilter
ßß' ;
.
ßß; <
	parametro
ßß< E
)
ßßE F
||
ßßG I
p
ßßJ K
.
ßßK L
Referenciador
ßßL Y
.
ßßY Z
Contains
ßßZ b
(
ßßb c"
prospectoQueryFilter
ßßc w
.
ßßw x
	parametroßßx Å
)ßßÅ Ç
||ßßÉ Ö
pßßÜ á
.ßßá à
NumeroDocumentoßßà ó
.ßßó ò
Containsßßò †
(ßß† °$
prospectoQueryFilterßß° µ
.ßßµ ∂
	parametroßß∂ ø
)ßßø ¿
)ßß¿ ¡
&&ßß¬ ƒ
(
®® 
(
®® 
p
®® 
.
®® $
AuditoriaFechaCreacion
®® &
>=
®®' )"
prospectoQueryFilter
®®* >
.
®®> ?!
fechacreacioninicio
®®? R
||
®®S U"
prospectoQueryFilter
®®V j
.
®®j k!
fechacreacioninicio
®®k ~
==®® Å
null®®Ç Ü
)®®Ü á
&&®®à ä
(
©©
 
p
©© 
.
©© $
AuditoriaFechaCreacion
©© #
<=
©©$ &"
prospectoQueryFilter
©©' ;
.
©©; <
fechacreacionfin
©©< L
||
©©M O"
prospectoQueryFilter
©©P d
.
©©d e
fechacreacionfin
©©e u
==
©©v x
null
©©y }
)
©©} ~
)
©©~ 
&&©©Ä Ç
(
™™
 
(
™™ 
c
™™ 
.
™™ !
FechaEstimadaCierre
™™ !
>=
™™" $"
prospectoQueryFilter
™™% 9
.
™™9 :'
fechaestimadacierreinicio
™™: S
||
™™T V"
prospectoQueryFilter
™™W k
.
™™k l(
fechaestimadacierreinicio™™l Ö
==™™Ü à
null™™â ç
)™™ç é
&&™™è ë
(
´´
 
c
´´ 
.
´´ !
FechaEstimadaCierre
´´  
<=
´´! #"
prospectoQueryFilter
´´$ 8
.
´´8 9$
fechaestimadacierrefin
´´9 O
||
´´P R"
prospectoQueryFilter
´´S g
.
´´g h$
fechaestimadacierrefin
´´h ~
==´´ Å
null´´Ç Ü
)´´Ü á
)´´á à
&&´´â ã
(
ÆÆ 
(
ÆÆ "
prospectoQueryFilter
ÆÆ "
.
ÆÆ" #
fechacreacioncita
ÆÆ# 4
==
ÆÆ5 7
null
ÆÆ7 ;
)
ÆÆ; <
||
ÆÆ= ?
(
ÆÆ@ A
c
ÆÆA B
.
ÆÆB C$
AuditoriaFechaCreacion
ÆÆC Y
.
ÆÆY Z
Value
ÆÆZ _
.
ÆÆ_ `
Date
ÆÆ` d
==
ÆÆe g"
prospectoQueryFilter
ÆÆh |
.
ÆÆ| } 
fechacreacioncitaÆÆ} é
.ÆÆé è
ValueÆÆè î
.ÆÆî ï
DateÆÆï ô
)ÆÆô ö
)ÆÆö õ
&&ÆÆú û
(
ØØ 
c
ØØ 
.
ØØ 
FlagCalificacion
ØØ 
==
ØØ  "
null
ØØ# '
)
ØØ' (
&&
ØØ) +
(
ØØ, -
c
ØØ- .
.
ØØ. /$
CodigoMotivoReagendado
ØØ/ E
==
ØØF H
null
ØØI M
||
ØØN P
c
ØØQ R
.
ØØR S$
CodigoMotivoReagendado
ØØS i
==
ØØj l
$num
ØØm n
||
ØØo q
c
ØØr s
.
ØØs t%
CodigoMotivoReagendadoØØt ä
==ØØã ç
$numØØé è
)ØØè ê
&&ØØë ì
(
∞∞ !
listcodigorangoedad
∞∞  
.
∞∞  !
Contains
∞∞! )
(
∞∞) *
p
∞∞* +
.
∞∞+ ,
CodigoRangoEdad
∞∞, ;
.
∞∞; <
Value
∞∞< A
)
∞∞A B
||
∞∞C E!
listcodigorangoedad
∞∞F Y
==
∞∞Z \
null
∞∞] a
)
∞∞a b
&&
∞∞c e
(
±± !
listcodigorangosexo
±±  
.
±±  !
Contains
±±! )
(
±±) *
p
±±* +
.
±±+ ,

CodigoSexo
±±, 6
.
±±6 7
Value
±±7 <
)
±±< =
||
±±> @!
listcodigorangosexo
±±A T
==
±±U W
null
±±X \
)
±±\ ]
&&
±±^ `
(
≤≤ #
listcodigorangofuente
≤≤ "
.
≤≤" #
Contains
≤≤# +
(
≤≤+ ,
p
≤≤, -
.
≤≤- .
CodigoFuente
≤≤. :
.
≤≤: ;
Value
≤≤; @
)
≤≤@ A
||
≤≤B D#
listcodigorangofuente
≤≤E Z
==
≤≤[ ]
null
≤≤^ b
)
≤≤b c
&&
≤≤d f
(
≥≥ &
listcodigorangosubfuente
≥≥ %
.
≥≥% &
Contains
≥≥& .
(
≥≥. /
p
≥≥/ 0
.
≥≥0 1
CodigoSubFuente
≥≥1 @
.
≥≥@ A
Value
≥≥A F
)
≥≥F G
||
≥≥H J&
listcodigorangosubfuente
≥≥K c
==
≥≥d f
null
≥≥g k
)
≥≥k l
&&
≥≥m o
(
¥¥ $
listcodigorangoingreso
¥¥ #
.
¥¥# $
Contains
¥¥$ ,
(
¥¥, -
p
¥¥- .
.
¥¥. / 
CodigoRangoIngreso
¥¥/ A
.
¥¥A B
Value
¥¥B G
)
¥¥G H
||
¥¥I K$
listcodigorangoingreso
¥¥L b
==
¥¥c e
null
¥¥f j
)
¥¥j k
&&
¥¥l n
(
µµ "
listcodigorangofondo
µµ !
.
µµ! "
Contains
µµ" *
(
µµ* +
p
µµ+ ,
.
µµ, -
CodigoRangoFondo
µµ- =
.
µµ= >
Value
µµ> C
)
µµC D
||
µµE G"
listcodigorangofondo
µµH \
==
µµ] _
null
µµ` d
)
µµd e
select
∏∏	 
new
∏∏ 
{
ππ	 

p
∫∫
 
,
∫∫ 
c
ªª
 
,
ªª 
padn
ºº
 
,
ºº 
	preferido
ΩΩ
 
,
ΩΩ 
pfuente
ææ
 
,
ææ 

psubfuente
øø
 
,
øø 
psexo
¿¿
 
,
¿¿ 
pcargo
¡¡
 
,
¡¡ 

pdireccion
¬¬
 
,
¬¬ 
	ddistrito
√√
 
,
√√ 

dprovincia
ƒƒ
 
,
ƒƒ 
ddepartamento
≈≈
 
,
≈≈  
pmotivounodescarte
∆∆
 
,
∆∆  
pmotivodosdescarte
««
 
,
«« 
plineanegocio
»»
 
,
»» 
cporcentajeavance
……
 
}
ÀÀ	 

)
ÀÀ
 
.
ÀÀ 
AsNoTracking
ÀÀ 
(
ÀÀ 
)
ÀÀ 
.
ÀÀ 
GroupBy
ÀÀ "
(
ÀÀ" #
x
ÀÀ# $
=>
ÀÀ% '
new
ÀÀ( +
{
ÀÀ, -
x
ÀÀ- .
.
ÀÀ. /
p
ÀÀ/ 0
.
ÀÀ0 1
IdProspecto
ÀÀ1 <
,
ÀÀ< =
x
ÀÀ= >
.
ÀÀ> ?
p
ÀÀ? @
.
ÀÀ@ A
Nombres
ÀÀA H
,
ÀÀH I
x
ÀÀI J
.
ÀÀJ K
p
ÀÀK L
.
ÀÀL M
ApellidoPaterno
ÀÀM \
,
ÀÀ\ ]
x
ÀÀ] ^
.
ÀÀ^ _
p
ÀÀ_ `
.
ÀÀ` a
ApellidoMaterno
ÀÀa p
,
ÀÀp q
x
ÃÃ 	
.
ÃÃ	 

p
ÃÃ
 
.
ÃÃ !
CodigoTipoDocumento
ÃÃ 
,
ÃÃ  
x
ÃÃ  !
.
ÃÃ! "
p
ÃÃ" #
.
ÃÃ# $
NumeroDocumento
ÃÃ$ 3
,
ÃÃ3 4
x
ÃÃ4 5
.
ÃÃ5 6
p
ÃÃ6 7
.
ÃÃ7 8
CodigoFuente
ÃÃ8 D
,
ÃÃD E
x
ÃÃE F
.
ÃÃF G
p
ÃÃG H
.
ÃÃH I
CodigoSubFuente
ÃÃI X
,
ÃÃX Y
NombreFuente
ÃÃY e
=
ÃÃe f
x
ÃÃf g
.
ÃÃg h
pfuente
ÃÃh o
.
ÃÃo p
ValorCadena
ÃÃp {
,
ÃÃ{ |
NombreSubfuente
ÕÕ 
=
ÕÕ 
x
ÕÕ 
.
ÕÕ 

psubfuente
ÕÕ %
.
ÕÕ% &
ValorCadena
ÕÕ& 1
,
ÕÕ1 2
x
ÕÕ2 3
.
ÕÕ3 4
p
ÕÕ4 5
.
ÕÕ5 6
TelefonoFijo
ÕÕ6 B
,
ÕÕB C
x
ÕÕC D
.
ÕÕD E
p
ÕÕE F
.
ÕÕF G
TelefonoCelular
ÕÕG V
,
ÕÕV W
x
ÕÕW X
.
ÕÕX Y
p
ÕÕY Z
.
ÕÕZ [
FechaNacimiento
ÕÕ[ j
,
ÕÕj k
NombreReferido
ŒŒ 
=
ŒŒ 
x
ŒŒ 
.
ŒŒ 
	preferido
ŒŒ $
.
ŒŒ$ %
Nombres
ŒŒ% ,
,
ŒŒ, -%
ApellidoPaternoReferido
ŒŒ- D
=
ŒŒE F
x
ŒŒG H
.
ŒŒH I
	preferido
ŒŒI R
.
ŒŒR S
ApellidoPaterno
ŒŒS b
,
ŒŒb c%
ApellidoMaternoReferido
ŒŒd {
=
ŒŒ| }
x
ŒŒ~ 
.ŒŒ Ä
	preferidoŒŒÄ â
.ŒŒâ ä
ApellidoMaternoŒŒä ô
,ŒŒô ö
x
œœ 
.
œœ 

pdireccion
œœ 
.
œœ 
	Direccion
œœ !
,
œœ! "
x
œœ" #
.
œœ# $

pdireccion
œœ$ .
.
œœ. /
Departamento_Id
œœ/ >
,
œœ> ?
x
œœ? @
.
œœ@ A

pdireccion
œœA K
.
œœK L
Provincia_Id
œœL X
,
œœX Y
x
œœY Z
.
œœZ [

pdireccion
œœ[ e
.
œœe f
Distrito_Id
œœf q
,
œœq r
Departamento
–– 
=
–– 
x
–– 
.
–– 
ddepartamento
–– %
.
––% &
Nombre
––& ,
,
––, -
	Provincia
––- 6
=
––7 8
x
––9 :
.
––: ;

dprovincia
––; E
.
––E F
Nombre
––F L
,
––L M
Distrito
––M U
=
––U V
x
––W X
.
––X Y
	ddistrito
––Y b
.
––b c
Nombre
––c i
,
––i j
x
—— 	
.
——	 

p
——
 
.
—— 

CodigoSexo
—— 
,
—— 
Sexo
—— 
=
—— 
x
—— 
.
—— 
psexo
—— $
.
——$ %!
ValorAuxiliarCadena
——% 8
,
——8 9
x
——9 :
.
——: ;
p
——; <
.
——< =
Empresa
——= D
,
——D E
x
——E F
.
——F G
p
——G H
.
——H I
CodigoCargo
——I T
,
——T U
NombreCargo
——U `
=
——a b
x
——b c
.
——c d
pcargo
——d j
.
——j k
ValorCadena
——k v
,
——v w
x
——w x
.
——x y
p
——y z
.
——z {
	OtroCargo——{ Ñ
,——Ñ Ö
x——Ö Ü
.——Ü á
p——á à
.——à â
Referenciador——â ñ
,——ñ ó
x
““ 	
.
““	 

padn
““
 
.
““ $
NumeroHijosDependiente
““ %
,
““% &
x
““& '
.
““' (
p
““( )
.
““) * 
CorreoElectronico1
““* <
,
““< =
x
““= >
.
““> ?
p
““? @
.
““@ A
MonedaFondo
““A L
,
““L M
x
““M N
.
““N O
p
““O P
.
““P Q

MontoFondo
““Q [
,
““[ \
x
““\ ]
.
““] ^
p
““^ _
.
““_ `
IdReferenciador
““` o
,
““o p
x
”” 	
.
””	 

p
””
 
.
”” 
FlagDescarte
”” 
,
”” 
MotivoDescarteUno
”” *
=
””+ ,
x
””- .
.
””. / 
pmotivodosdescarte
””/ A
.
””A B
ValorCadena
””B M
,
””M N
MotivoDescarteDos
””N _
=
””` a
x
””a b
.
””b c 
pmotivounodescarte
””c u
.
””u v
ValorCadena””v Å
,””Å Ç
Producto
‘‘ 
=
‘‘ 
x
‘‘ 
.
‘‘ 
plineanegocio
‘‘ !
.
‘‘! "
ValorCadena
‘‘" -
,
‘‘- .
x
‘‘. /
.
‘‘/ 0
padn
‘‘0 4
.
‘‘4 5!
MonedaPatrimonioAfp
‘‘5 H
,
‘‘H I
x
‘‘I J
.
‘‘J K
padn
‘‘K O
.
‘‘O P 
MontoPatrimonioAfp
‘‘P b
}
‘‘c d
)
‘‘d e
.
‘‘e f
Select
‘‘f l
(
‘‘l m
y
‘‘m n
=>
‘‘o q
new
‘‘r u
	Prospecto
‘‘v 
(‘‘ Ä
)‘‘Ä Å
{
’’	 

IdProspecto
÷÷	 
=
÷÷ 
y
÷÷ 
.
÷÷ 
Key
÷÷ 
.
÷÷ 
IdProspecto
÷÷ (
,
÷÷( )
Nombres
◊◊	 
=
◊◊ 
y
◊◊ 
.
◊◊ 
Key
◊◊ 
.
◊◊ 
Nombres
◊◊  
,
◊◊  !
ApellidoPaterno
ÿÿ	 
=
ÿÿ 
y
ÿÿ 
.
ÿÿ 
Key
ÿÿ  
.
ÿÿ  !
ApellidoPaterno
ÿÿ! 0
,
ÿÿ0 1
ApellidoMaterno
ŸŸ	 
=
ŸŸ 
y
ŸŸ 
.
ŸŸ 
Key
ŸŸ  
.
ŸŸ  !
ApellidoMaterno
ŸŸ! 0
,
ŸŸ0 1
NombresApellidos
⁄⁄	 
=
⁄⁄ 
string
⁄⁄ "
.
⁄⁄" #
Format
⁄⁄# )
(
⁄⁄) *
$str
⁄⁄* 7
,
⁄⁄7 8
y
⁄⁄9 :
.
⁄⁄: ;
Key
⁄⁄; >
.
⁄⁄> ?
Nombres
⁄⁄? F
,
⁄⁄F G
y
⁄⁄H I
.
⁄⁄I J
Key
⁄⁄J M
.
⁄⁄M N
ApellidoPaterno
⁄⁄N ]
,
⁄⁄] ^
y
⁄⁄_ `
.
⁄⁄` a
Key
⁄⁄a d
.
⁄⁄d e
ApellidoMaterno
⁄⁄e t
)
⁄⁄t u
,
⁄⁄u v!
CodigoTipoDocumento
€€	 
=
€€ 
y
€€  
.
€€  !
Key
€€! $
.
€€$ %!
CodigoTipoDocumento
€€% 8
.
€€8 9
Value
€€9 >
,
€€> ?
NumeroDocumento
‹‹	 
=
‹‹ 
y
‹‹ 
.
‹‹ 
Key
‹‹  
.
‹‹  !
NumeroDocumento
‹‹! 0
,
‹‹0 1
CodigoFuente
››	 
=
›› 
y
›› 
.
›› 
Key
›› 
.
›› 
CodigoFuente
›› *
.
››* +
Value
››+ 0
,
››0 1
CodigoSubFuente
ﬁﬁ	 
=
ﬁﬁ 
y
ﬁﬁ 
.
ﬁﬁ 
Key
ﬁﬁ  
.
ﬁﬁ  !
CodigoSubFuente
ﬁﬁ! 0
.
ﬁﬁ0 1
Value
ﬁﬁ1 6
,
ﬁﬁ6 7
NombreFuente
ﬂﬂ	 
=
ﬂﬂ 
y
ﬂﬂ 
.
ﬂﬂ 
Key
ﬂﬂ 
.
ﬂﬂ 
NombreFuente
ﬂﬂ *
,
ﬂﬂ* +
NombreSubFuente
‡‡	 
=
‡‡ 
y
‡‡ 
.
‡‡ 
Key
‡‡  
.
‡‡  !
NombreSubfuente
‡‡! 0
,
‡‡0 1
TelefonoFijo
··	 
=
·· 
y
·· 
.
·· 
Key
·· 
.
·· 
TelefonoFijo
·· *
,
··* +
TelefonoCelular
‚‚	 
=
‚‚ 
y
‚‚ 
.
‚‚ 
Key
‚‚  
.
‚‚  !
TelefonoCelular
‚‚! 0
,
‚‚0 1
FechaNacimiento
„„	 
=
„„ 
y
„„ 
.
„„ 
Key
„„  
.
„„  !
FechaNacimiento
„„! 0
.
„„0 1
Value
„„1 6
,
„„6 7
	Direccion
‰‰	 
=
‰‰ 
y
‰‰ 
.
‰‰ 
Key
‰‰ 
.
‰‰ 
	Direccion
‰‰ $
,
‰‰$ %
Departamento_Id
ÂÂ	 
=
ÂÂ 
y
ÂÂ 
.
ÂÂ 
Key
ÂÂ  
.
ÂÂ  !
Departamento_Id
ÂÂ! 0
,
ÂÂ0 1
Provincia_Id
ÊÊ	 
=
ÊÊ 
y
ÊÊ 
.
ÊÊ 
Key
ÊÊ 
.
ÊÊ 
Provincia_Id
ÊÊ *
,
ÊÊ* +
Distrito_Id
ÁÁ	 
=
ÁÁ 
y
ÁÁ 
.
ÁÁ 
Key
ÁÁ 
.
ÁÁ 
Distrito_Id
ÁÁ (
,
ÁÁ( )
Departamento
ËË	 
=
ËË 
y
ËË 
.
ËË 
Key
ËË 
.
ËË 
Departamento
ËË *
,
ËË* +
	Provincia
ÈÈ	 
=
ÈÈ 
y
ÈÈ 
.
ÈÈ 
Key
ÈÈ 
.
ÈÈ 
	Provincia
ÈÈ $
,
ÈÈ$ %
Distrito
ÍÍ	 
=
ÍÍ 
y
ÍÍ 
.
ÍÍ 
Key
ÍÍ 
.
ÍÍ 
Distrito
ÍÍ "
,
ÍÍ" #
Edad
ÎÎ	 
=
ÎÎ 
DateTime
ÎÎ 
.
ÎÎ 
Now
ÎÎ 
.
ÎÎ 
Year
ÎÎ !
-
ÎÎ" #
y
ÎÎ$ %
.
ÎÎ% &
Key
ÎÎ& )
.
ÎÎ) *
FechaNacimiento
ÎÎ* 9
.
ÎÎ9 :
Value
ÎÎ: ?
.
ÎÎ? @
Year
ÎÎ@ D
,
ÎÎD E

CodigoSexo
ÏÏ	 
=
ÏÏ 
y
ÏÏ 
.
ÏÏ 
Key
ÏÏ 
.
ÏÏ 

CodigoSexo
ÏÏ &
.
ÏÏ& '
Value
ÏÏ' ,
,
ÏÏ, -
Sexo
ÌÌ	 
=
ÌÌ 
y
ÌÌ 
.
ÌÌ 
Key
ÌÌ 
.
ÌÌ 
Sexo
ÌÌ 
,
ÌÌ 
Empresa
ÓÓ	 
=
ÓÓ 
y
ÓÓ 
.
ÓÓ 
Key
ÓÓ 
.
ÓÓ 
Empresa
ÓÓ  
,
ÓÓ  !
CodigoCargo
ÔÔ	 
=
ÔÔ 
y
ÔÔ 
.
ÔÔ 
Key
ÔÔ 
.
ÔÔ 
CodigoCargo
ÔÔ (
.
ÔÔ( )
Value
ÔÔ) .
,
ÔÔ. /
NombreCargo
	 
=
 
y
 
.
 
Key
 
.
 
NombreCargo
 (
,
( )
	OtroCargo
ÒÒ	 
=
ÒÒ 
y
ÒÒ 
.
ÒÒ 
Key
ÒÒ 
.
ÒÒ 
	OtroCargo
ÒÒ $
,
ÒÒ$ %
Referenciador
ÚÚ	 
=
ÚÚ 
y
ÚÚ 
.
ÚÚ 
Key
ÚÚ 
.
ÚÚ 
Referenciador
ÚÚ ,
,
ÚÚ, -
Hijos
ÛÛ	 
=
ÛÛ 
y
ÛÛ 
.
ÛÛ 
Key
ÛÛ 
.
ÛÛ $
NumeroHijosDependiente
ÛÛ -
.
ÛÛ- .
Value
ÛÛ. 3
,
ÛÛ3 4
Correo
ÙÙ	 
=
ÙÙ 
y
ÙÙ 
.
ÙÙ 
Key
ÙÙ 
.
ÙÙ  
CorreoElectronico1
ÙÙ *
,
ÙÙ* +
MonedaFondo
ıı	 
=
ıı 
y
ıı 
.
ıı 
Key
ıı 
.
ıı !
MonedaPatrimonioAfp
ıı 0
.
ıı0 1
Value
ıı1 6
,
ıı6 7

MontoFondo
ˆˆ	 
=
ˆˆ 
y
ˆˆ 
.
ˆˆ 
Key
ˆˆ 
.
ˆˆ  
MontoPatrimonioAfp
ˆˆ .
.
ˆˆ. /
Value
ˆˆ/ 4
,
ˆˆ4 5
Fuente
˜˜	 
=
˜˜ 
string
˜˜ 
.
˜˜ 
Format
˜˜ 
(
˜˜  
$str
˜˜  ,
,
˜˜, -
y
˜˜. /
.
˜˜/ 0
Key
˜˜0 3
.
˜˜3 4
NombreFuente
˜˜4 @
,
˜˜@ A
string
˜˜B H
.
˜˜H I
IsNullOrEmpty
˜˜I V
(
˜˜V W
y
˜˜W X
.
˜˜X Y
Key
˜˜Y \
.
˜˜\ ]
NombreSubfuente
˜˜] l
)
˜˜l m
?
˜˜n o
$str
˜˜p r
:
˜˜s t
$str
˜˜u x
+
˜˜y z
y
˜˜{ |
.
˜˜| }
Key˜˜} Ä
.˜˜Ä Å
NombreSubfuente˜˜Å ê
,˜˜ê ë
y
¯¯ 
.
¯¯ 
Key
¯¯ 
.
¯¯ 
IdReferenciador
¯¯ &
.
¯¯& '
HasValue
¯¯' /
?
¯¯0 1
y
¯¯2 3
.
¯¯3 4
Key
¯¯4 7
.
¯¯7 8
NombreReferido
¯¯8 F
+
¯¯G H
$str
¯¯I L
+
¯¯M N
y
¯¯O P
.
¯¯P Q
Key
¯¯Q T
.
¯¯T U%
ApellidoPaternoReferido
¯¯U l
+
¯¯m n
$str
¯¯o r
+
¯¯s t
y
¯¯u v
.
¯¯v w
Key
¯¯w z
.
¯¯z {&
ApellidoMaternoReferido¯¯{ í
:¯¯ì î
y¯¯ï ñ
.¯¯ñ ó
Key¯¯ó ö
.¯¯ö õ
Referenciador¯¯õ ®
)¯¯® ©
,¯¯© ™
IdReferenciador
˘˘	 
=
˘˘ 
y
˘˘ 
.
˘˘ 
Key
˘˘  
.
˘˘  !
IdReferenciador
˘˘! 0
.
˘˘0 1
Value
˘˘1 6
,
˘˘6 7
FlagDescarte
˙˙	 
=
˙˙ 
y
˙˙ 
.
˙˙ 
Key
˙˙ 
.
˙˙ 
FlagDescarte
˙˙ *
,
˙˙* +&
PorcentajeAvanceAnterior
˚˚	 !
=
˚˚# $
(
˚˚% &
int
˚˚& )
)
˚˚) *
(
˚˚* +
(
˚˚+ ,
(
˚˚, -
from
˚˚- 1
citamax
˚˚2 9
in
˚˚: <
_context
˚˚= E
.
˚˚E F
Citas
˚˚F K
join
¸¸ 
porcentajeavance
¸¸ /
in
¸¸0 2
_context
¸¸3 ;
.
¸¸; <
TablaTablas
¸¸< G
on
¸¸H J
new
¸¸K N
{
¸¸O P
citamax
¸¸Q X
.
¸¸X Y0
"CodigoPorcentajeAvanceCalificacion
¸¸Y {
,
¸¸{ |&
idtablaporcentajeavance¸¸} î
=¸¸ï ñ

TablaTabla¸¸ó °
.¸¸° ¢,
PorcentajeAvanceCalificacion¸¸¢ æ
}¸¸ø ¿
equals
˝˝  
new
˝˝! $
{
˝˝% &0
"CodigoPorcentajeAvanceCalificacion
˝˝' I
=
˝˝J K
(
˝˝L M
short
˝˝M R
?
˝˝R S
)
˝˝S T
porcentajeavance
˝˝T d
.
˝˝d e
CodigoCampo
˝˝e p
,
˝˝p q&
idtablaporcentajeavance˝˝r â
=˝˝ä ã 
porcentajeavance˝˝å ú
.˝˝ú ù
IdTabla˝˝ù §
}˝˝• ¶
into˝˝ß ´!
CitaMaxPorcentaje˝˝¨ Ω
from
˛˛ %
citamaxporcentajeavance
˛˛ 6
in
˛˛7 9
CitaMaxPorcentaje
˛˛: K
.
˛˛K L
DefaultIfEmpty
˛˛L Z
(
˛˛Z [
)
˛˛[ \
where
ˇˇ 
citamax
ˇˇ  '
.
ˇˇ' (
IdProspecto
ˇˇ( 3
==
ˇˇ4 6
y
ˇˇ7 8
.
ˇˇ8 9
Key
ˇˇ9 <
.
ˇˇ< =
IdProspecto
ˇˇ= H
select
ÄÄ  
new
ÄÄ! $
{
ÄÄ% &
citamax
ÄÄ' .
,
ÄÄ. /%
citamaxporcentajeavance
ÄÄ0 G
}
ÄÄH I
)
ÅÅ 
.
ÅÅ 
GroupBy
ÅÅ 
(
ÅÅ 
x
ÅÅ 
=>
ÅÅ  
new
ÅÅ! $
{
ÅÅ% &
x
ÅÅ' (
.
ÅÅ( )
citamax
ÅÅ) 0
.
ÅÅ0 1
IdProspecto
ÅÅ1 <
}
ÅÅ= >
)
ÅÅ> ?
.
ÇÇ 
Select
ÇÇ 
(
ÇÇ 
y
ÇÇ 
=>
ÇÇ 
new
ÇÇ "
{
ÇÇ# $
PorcentajeMaximo
ÉÉ #
=
ÉÉ$ %
y
ÉÉ& '
.
ÉÉ' (
Max
ÉÉ( +
(
ÉÉ+ ,
x
ÉÉ, -
=>
ÉÉ. 0
x
ÉÉ1 2
.
ÉÉ2 3%
citamaxporcentajeavance
ÉÉ3 J
.
ÉÉJ K
ValorNumerico
ÉÉK X
.
ÉÉX Y
Value
ÉÉY ^
)
ÉÉ^ _
}
ÑÑ 
)
ÑÑ 
)
ÑÑ 
.
ÑÑ 
First
ÑÑ 
(
ÑÑ 
)
ÑÑ 
.
ÑÑ 
PorcentajeMaximo
ÑÑ .
)
ÑÑ. /
,
ÑÑ/ 0!
TextoMotivoDescarte
ÖÖ	 
=
ÖÖ 
string
ÖÖ %
.
ÖÖ% &
IsNullOrEmpty
ÖÖ& 3
(
ÖÖ3 4
y
ÖÖ4 5
.
ÖÖ5 6
Key
ÖÖ6 9
.
ÖÖ9 :
MotivoDescarteDos
ÖÖ: K
)
ÖÖK L
?
ÖÖM N
y
ÖÖO P
.
ÖÖP Q
Key
ÖÖQ T
.
ÖÖT U
MotivoDescarteUno
ÖÖU f
:
ÜÜ 
string
ÜÜ 
.
ÜÜ 
Format
ÜÜ #
(
ÜÜ# $
$str
ÜÜ$ -
,
ÜÜ- .
y
ÜÜ/ 0
.
ÜÜ0 1
Key
ÜÜ1 4
.
ÜÜ4 5
MotivoDescarteUno
ÜÜ5 F
,
ÜÜF G
y
ÜÜH I
.
ÜÜI J
Key
ÜÜJ M
.
ÜÜM N
MotivoDescarteDos
ÜÜN _
)
ÜÜ_ `
,
ÜÜ` a
VisibleDescarte
áá	 
=
áá 
y
áá 
.
áá 
Key
áá  
.
áá  !
FlagDescarte
áá! -
.
áá- .
Value
áá. 3
?
áá4 5
false
áá6 ;
:
áá< =
true
áá> B
,
ááB C
VisibleAgendar
àà	 
=
àà 
(
àà 
y
àà 
.
àà 
Key
àà  
.
àà  !
FlagDescarte
àà! -
.
àà- .
Value
àà. 3
||
àà4 6"
prospectoQueryFilter
àà7 K
.
ààK L
tab
ààL O
==
ààP R
$str
ààS h
)
ààh i
?
ààj k
true
ààl p
:
ààq r
false
ààs x
,
ààx y
FechaCreacion
ââ	 
=
ââ 
y
ââ 
.
ââ 
Max
ââ 
(
ââ 
x
ââ  
=>
ââ! #
x
ââ$ %
.
ââ% &
p
ââ& '
.
ââ' ($
AuditoriaFechaCreacion
ââ( >
)
ââ> ?
,
ââ? @"
FechaUltimaActividad
ää	 
=
ää 
y
ää  !
.
ää! "
Max
ää" %
(
ää% &
x
ää& '
=>
ää( *
x
ää+ ,
.
ää, -
c
ää- .
.
ää. /$
AuditoriaFechaCreacion
ää/ E
)
ääE F
,
ääF G
Producto
ãã	 
=
ãã 
y
ãã 
.
ãã 
Key
ãã 
.
ãã 
Producto
ãã "
}
åå 	
)
åå	 

;
åå
 
return
èè 
result
èè 
;
èè 
}
êê 
public
íí 

IQueryable
íí	 
<
íí 
	Prospecto
íí 
>
íí 1
#ObtenerAgendadosRecordatorioLlamada
íí B
(
ííB C"
ProspectoQueryFilter
ííC W"
prospectoQueryFilter
ííX l
,
ííl m
List
íín r
<
íír s
int
íís v
>
íív w
idsprospectoííx Ñ
)ííÑ Ö
{
ìì 
var
îî !
listcodigorangosexo
îî 
=
îî "
prospectoQueryFilter
îî 1
.
îî1 2

codigosexo
îî2 <
!=
îî= ?
null
îî@ D
?
îîE F"
prospectoQueryFilter
îîG [
.
îî[ \

codigosexo
îî\ f
.
îîf g
Split
îîg l
(
îîl m
$char
îîm p
)
îîp q
.
îîq r
Select
îîr x
(
îîx y
short
îîy ~
.
îî~ 
Parseîî Ñ
)îîÑ Ö
.îîÖ Ü
ToListîîÜ å
(îîå ç
)îîç é
:îîè ê
nullîîë ï
;îîï ñ
var
ïï !
listcodigorangoedad
ïï 
=
ïï "
prospectoQueryFilter
ïï 1
.
ïï1 2
codigorangoedad
ïï2 A
!=
ïïB D
null
ïïE I
?
ïïJ K"
prospectoQueryFilter
ïïL `
.
ïï` a
codigorangoedad
ïïa p
.
ïïp q
Split
ïïq v
(
ïïv w
$char
ïïw z
)
ïïz {
.
ïï{ |
Selectïï| Ç
(ïïÇ É
shortïïÉ à
.ïïà â
Parseïïâ é
)ïïé è
.ïïè ê
ToListïïê ñ
(ïïñ ó
)ïïó ò
:ïïô ö
nullïïõ ü
;ïïü †
var
ññ #
listcodigorangofuente
ññ 
=
ññ "
prospectoQueryFilter
ññ 3
.
ññ3 4
codigofuente
ññ4 @
!=
ññA C
null
ññD H
?
ññI J"
prospectoQueryFilter
ññK _
.
ññ_ `
codigofuente
ññ` l
.
ññl m
Split
ññm r
(
ññr s
$char
ññs v
)
ññv w
.
ññw x
Select
ññx ~
(
ññ~ 
shortññ Ñ
.ññÑ Ö
ParseññÖ ä
)ññä ã
.ññã å
ToListññå í
(ññí ì
)ññì î
:ññï ñ
nullññó õ
;ññõ ú
var
óó &
listcodigorangosubfuente
óó 
=
óó  !"
prospectoQueryFilter
óó" 6
.
óó6 7
codigosubfuente
óó7 F
!=
óóG I
null
óóJ N
?
óóO P"
prospectoQueryFilter
óóQ e
.
óóe f
codigosubfuente
óóf u
.
óóu v
Split
óóv {
(
óó{ |
$char
óó| 
)óó Ä
.óóÄ Å
SelectóóÅ á
(óóá à
shortóóà ç
.óóç é
Parseóóé ì
)óóì î
.óóî ï
ToListóóï õ
(óóõ ú
)óóú ù
:óóû ü
nullóó† §
;óó§ •
var
òò $
listcodigorangoingreso
òò 
=
òò "
prospectoQueryFilter
òò  4
.
òò4 5 
codigorangoingreso
òò5 G
!=
òòH J
null
òòK O
?
òòP Q"
prospectoQueryFilter
òòR f
.
òòf g 
codigorangoingreso
òòg y
.
òòy z
Split
òòz 
(òò Ä
$charòòÄ É
)òòÉ Ñ
.òòÑ Ö
SelectòòÖ ã
(òòã å
shortòòå ë
.òòë í
Parseòòí ó
)òòó ò
.òòò ô
ToListòòô ü
(òòü †
)òò† °
:òò¢ £
nullòò§ ®
;òò® ©
var
ôô "
listcodigorangofondo
ôô 
=
ôô "
prospectoQueryFilter
ôô 2
.
ôô2 3
codigorangofondo
ôô3 C
!=
ôôD F
null
ôôG K
?
ôôL M"
prospectoQueryFilter
ôôN b
.
ôôb c
codigorangofondo
ôôc s
.
ôôs t
Split
ôôt y
(
ôôy z
$char
ôôz }
)
ôô} ~
.
ôô~ 
Selectôô Ö
(ôôÖ Ü
shortôôÜ ã
.ôôã å
Parseôôå ë
)ôôë í
.ôôí ì
ToListôôì ô
(ôôô ö
)ôôö õ
:ôôú ù
nullôôû ¢
;ôô¢ £
var
úú 
result
úú 
=
úú 
(
úú  !
from
ùù 
r
ùù 
in
ùù 
_context
ùù 
.
ùù "
RecordatorioLlamadas
ùù /
join
ûû 
p
ûû 
in
ûû 
_context
ûû 
.
ûû 

Prospectos
ûû %
on
ûû& (
r
ûû) *
.
ûû* +
IdProspecto
ûû+ 6
equals
ûû7 =
p
ûû> ?
.
ûû? @
IdProspecto
ûû@ K
join
üü 
intermediario
üü 
in
üü 
_context
üü &
.
üü& ''
ConsolidadoIntermediarios
üü' @
on
üüA C
p
üüD E
.
üüE F(
IdConsolidadoIntermediario
üüF `
equals
üüa g
intermediario
üüh u
.
üüu v)
IdConsolidadoIntermediarioüüv ê
join
†† 
adn
†† 
in
†† 
_context
†† 
.
†† 
	AdnRentas
†† &
on
††' )
p
††* +
.
††+ ,
IdProspecto
††, 7
equals
††8 >
adn
††? B
.
††B C
IdProspecto
††C N
into
††O S
ProspectoAdn
††T `
from
°° 
padn
°° 
in
°° 
ProspectoAdn
°° !
.
°°! "
DefaultIfEmpty
°°" 0
(
°°0 1
)
°°1 2
join
¢¢ 
fuente
¢¢ 
in
¢¢ 
_context
¢¢ 
.
¢¢  
ListaTablas
¢¢  +
on
¢¢, .
new
¢¢/ 2
{
¢¢3 4
p
¢¢5 6
.
¢¢6 7
CodigoFuente
¢¢7 C
,
¢¢C D
idtablafuente
¢¢E R
=
¢¢S T

TablaTabla
¢¢U _
.
¢¢_ `
FuenteProspecto
¢¢` o
,
¢¢o p
lnegocio
¢¢q y
=
¢¢z {
LineaNegocio¢¢| à
.¢¢à â
Renta¢¢â é
}¢¢è ê
equals
££ 
new
££ 
{
££ 
CodigoFuente
££ *
=
££+ ,
(
££- .
short
££. 3
?
££3 4
)
££4 5
fuente
££5 ;
.
££; <
CodigoCampo
££< G
,
££G H
idtablafuente
££I V
=
££W X
fuente
££Y _
.
££_ `
IdTabla
££` g
,
££g h
lnegocio
££i q
=
££r s
fuente
££t z
.
££z {!
CodigoLineaNegocio££{ ç
}££é è
into££ê î
ProspectoFuente££ï §
from
§§ 
pfuente
§§ 
in
§§ 
ProspectoFuente
§§ '
.
§§' (
DefaultIfEmpty
§§( 6
(
§§6 7
)
§§7 8
join
•• 
	subfuente
•• 
in
•• 
_context
•• "
.
••" #
ListaTablas
••# .
on
••/ 1
new
••2 5
{
••6 7
p
••8 9
.
••9 :
CodigoSubFuente
••: I
,
••I J
idtablaSubfuente
••K [
=
••\ ]

TablaTabla
••^ h
.
••h i
FuenteProspecto
••i x
,
••x y
lnegocio••z Ç
=••É Ñ
LineaNegocio••Ö ë
.••ë í
Renta••í ó
}••ò ô
equals
¶¶ 
new
¶¶ 
{
¶¶ 
CodigoSubFuente
¶¶ -
=
¶¶. /
(
¶¶0 1
short
¶¶1 6
?
¶¶6 7
)
¶¶7 8
	subfuente
¶¶8 A
.
¶¶A B
CodigoCampo
¶¶B M
,
¶¶M N
idtablaSubfuente
¶¶O _
=
¶¶` a
	subfuente
¶¶b k
.
¶¶k l
IdTabla
¶¶l s
,
¶¶s t
lnegocio
¶¶u }
=
¶¶~ 
	subfuente¶¶Ä â
.¶¶â ä"
CodigoLineaNegocio¶¶ä ú
}¶¶ù û
into¶¶ü £"
ProspectoSubFuente¶¶§ ∂
from
ßß 

psubfuente
ßß 
in
ßß  
ProspectoSubFuente
ßß -
.
ßß- .
DefaultIfEmpty
ßß. <
(
ßß< =
)
ßß= >
join
®® 
motivounodescarte
®® 
in
®® !
_context
®®" *
.
®®* +
ListaTablas
®®+ 6
on
®®7 9
new
®®: =
{
®®> ?
p
®®@ A
.
®®A B%
CodigoMotivoUnoDescarte
®®B Y
,
®®Y Z#
idtablamotivodescarte
®®[ p
=
®®q r

TablaTabla
®®s }
.
®®} ~
MotivoDescarte®®~ å
}®®ç é
equals
©© 
new
©© 
{
©© %
CodigoMotivoUnoDescarte
©© 5
=
©©6 7
(
©©8 9
short
©©9 >
?
©©> ?
)
©©? @
motivounodescarte
©©@ Q
.
©©Q R
CodigoCampo
©©R ]
,
©©] ^#
idtablamotivodescarte
©©_ t
=
©©u v 
motivounodescarte©©w à
.©©à â
IdTabla©©â ê
}©©ë í
into©©ì ó*
ProspectoMotivoUnoDescarte©©ò ≤
from
™™  
pmotivounodescarte
™™ 
in
™™  "(
ProspectoMotivoUnoDescarte
™™# =
.
™™= >
DefaultIfEmpty
™™> L
(
™™L M
)
™™M N
join
´´ 
motivodosdescarte
´´ 
in
´´ !
_context
´´" *
.
´´* +
ListaTablas
´´+ 6
on
´´7 9
new
´´: =
{
´´> ?
p
´´@ A
.
´´A B%
CodigoMotivoDosDescarte
´´B Y
,
´´Y Z#
idtablamotivodescarte
´´[ p
=
´´q r

TablaTabla
´´s }
.
´´} ~
MotivoDescarte´´~ å
}´´ç é
equals
¨¨ 
new
¨¨ 
{
¨¨ %
CodigoMotivoDosDescarte
¨¨ 5
=
¨¨6 7
(
¨¨8 9
short
¨¨9 >
?
¨¨> ?
)
¨¨? @
motivodosdescarte
¨¨@ Q
.
¨¨Q R
CodigoCampo
¨¨R ]
,
¨¨] ^#
idtablamotivodescarte
¨¨_ t
=
¨¨u v 
motivodosdescarte¨¨w à
.¨¨à â
IdTabla¨¨â ê
}¨¨ë í
into¨¨ì ó*
ProspectoMotivoDosDescarte¨¨ò ≤
from
≠≠  
pmotivodosdescarte
≠≠ 
in
≠≠  "(
ProspectoMotivoDosDescarte
≠≠# =
.
≠≠= >
DefaultIfEmpty
≠≠> L
(
≠≠L M
)
≠≠M N
join
ÆÆ 
referido
ÆÆ 
in
ÆÆ 
_context
ÆÆ !
.
ÆÆ! "

Prospectos
ÆÆ" ,
on
ÆÆ- /
p
ÆÆ0 1
.
ÆÆ1 2
IdReferenciador
ÆÆ2 A
equals
ÆÆB H
referido
ÆÆI Q
.
ÆÆQ R
IdProspecto
ÆÆR ]
into
ÆÆ^ b
ProspectoReferido
ÆÆc t
from
ØØ 
	preferido
ØØ 
in
ØØ 
ProspectoReferido
ØØ +
.
ØØ+ ,
DefaultIfEmpty
ØØ, :
(
ØØ: ;
)
ØØ; <
join
∞∞ 
cargo
∞∞ 
in
∞∞ 
_context
∞∞ 
.
∞∞ 
TablaTablas
∞∞ *
on
∞∞+ -
new
∞∞. 1
{
∞∞2 3
p
∞∞4 5
.
∞∞5 6
CodigoCargo
∞∞6 A
,
∞∞A B
idtablacargo
∞∞C O
=
∞∞P Q

TablaTabla
∞∞R \
.
∞∞\ ]
PersonaCargo
∞∞] i
}
∞∞j k
equals
±± 
new
±± 
{
±± 
CodigoCargo
±±  +
=
±±, -
(
±±. /
short
±±/ 4
?
±±4 5
)
±±5 6
cargo
±±6 ;
.
±±; <
CodigoCampo
±±< G
,
±±G H
idtablacargo
±±I U
=
±±V W
cargo
±±X ]
.
±±] ^
IdTabla
±±^ e
}
±±f g
into
±±h l
ProspectoCargo
±±m {
from
≤≤ 
pcargo
≤≤ 
in
≤≤ 
ProspectoCargo
≤≤ %
.
≤≤% &
DefaultIfEmpty
≤≤& 4
(
≤≤4 5
)
≤≤5 6
join
≥≥ 
sexo
≥≥ 
in
≥≥ 
_context
≥≥ 
.
≥≥ 
TablaTablas
≥≥ )
on
≥≥* ,
new
≥≥- 0
{
≥≥1 2
p
≥≥3 4
.
≥≥4 5

CodigoSexo
≥≥5 ?
,
≥≥? @
idtablasexo
≥≥A L
=
≥≥M N

TablaTabla
≥≥O Y
.
≥≥Y Z
Sexo
≥≥Z ^
}
≥≥_ `
equals
¥¥ 
new
¥¥ 
{
¥¥ 

CodigoSexo
¥¥ )
=
¥¥* +
(
¥¥, -
short
¥¥- 2
?
¥¥2 3
)
¥¥3 4
sexo
¥¥4 8
.
¥¥8 9
CodigoCampo
¥¥9 D
,
¥¥D E
idtablasexo
¥¥F Q
=
¥¥R S
sexo
¥¥T X
.
¥¥X Y
IdTabla
¥¥Y `
}
¥¥a b
into
¥¥c g
ProspectoSexo
¥¥h u
from
µµ 
psexo
µµ 
in
µµ 
ProspectoSexo
µµ #
.
µµ# $
DefaultIfEmpty
µµ$ 2
(
µµ2 3
)
µµ3 4
join
∂∂ 
	direccion
∂∂ 
in
∂∂ 
_context
∂∂ "
.
∂∂" #!
DireccionProspectos
∂∂# 6
on
∂∂7 9
p
∂∂: ;
.
∂∂; <
IdProspecto
∂∂< G
equals
∂∂H N
	direccion
∂∂O X
.
∂∂X Y
IdProspecto
∂∂Y d
into
∂∂e i 
ProspectoDireccion
∂∂j |
from
∑∑ 

pdireccion
∑∑ 
in
∑∑  
ProspectoDireccion
∑∑ -
.
∑∑- .
DefaultIfEmpty
∑∑. <
(
∑∑< =
)
∑∑= >
join
∏∏ 
distrito
∏∏ 
in
∏∏ 
_context
∏∏ !
.
∏∏! "
	Distritos
∏∏" +
on
∏∏, .
new
∏∏/ 2
{
∏∏3 4

pdireccion
∏∏5 ?
.
∏∏? @
Departamento_Id
∏∏@ O
,
∏∏O P

pdireccion
∏∏Q [
.
∏∏[ \
Provincia_Id
∏∏\ h
,
∏∏h i

pdireccion
∏∏j t
.
∏∏t u
Distrito_Id∏∏u Ä
}∏∏Å Ç
equals
ππ 
new
ππ 
{
ππ 
distrito
ππ &
.
ππ& '
Departamento_Id
ππ' 6
,
ππ6 7
distrito
ππ8 @
.
ππ@ A
Provincia_Id
ππA M
,
ππM N
distrito
ππO W
.
ππW X
Distrito_Id
ππX c
}
ππd e
into
ππf j
DireccionDistrito
ππk |
from
∫∫ 
	ddistrito
∫∫ 
in
∫∫ 
DireccionDistrito
∫∫ +
.
∫∫+ ,
DefaultIfEmpty
∫∫, :
(
∫∫: ;
)
∫∫; <
join
ªª 
	provincia
ªª 
in
ªª 
_context
ªª "
.
ªª" #

Provincias
ªª# -
on
ªª. 0
new
ªª1 4
{
ªª5 6

pdireccion
ªª7 A
.
ªªA B
Provincia_Id
ªªB N
,
ªªN O

pdireccion
ªªP Z
.
ªªZ [
Departamento_Id
ªª[ j
}
ªªk l
equals
ºº 
new
ºº 
{
ºº 
	provincia
ºº  )
.
ºº) *
Provincia_Id
ºº* 6
,
ºº6 7
	provincia
ºº8 A
.
ººA B
Departamento_Id
ººB Q
}
ººR S
into
ººT X 
DireccionProvincia
ººY k
from
ΩΩ 

dprovincia
ΩΩ 
in
ΩΩ  
DireccionProvincia
ΩΩ -
.
ΩΩ- .
DefaultIfEmpty
ΩΩ. <
(
ΩΩ< =
)
ΩΩ= >
join
ææ 
departamento
ææ 
in
ææ 
_context
ææ %
.
ææ% &
Departamentos
ææ& 3
on
ææ4 6

pdireccion
ææ7 A
.
ææA B
Departamento_Id
ææB Q
equals
ææR X
departamento
ææY e
.
ææe f
Departamento_Id
ææf u
into
ææv z$
DireccionDepartamentoææ{ ê
from
øø 
ddepartamento
øø 
in
øø #
DireccionDepartamento
øø 3
.
øø3 4
DefaultIfEmpty
øø4 B
(
øøB C
)
øøC D
join
¿¿ 
lineanegocio
¿¿ 
in
¿¿ 
_context
¿¿ %
.
¿¿% &
TablaTablas
¿¿& 1
on
¿¿2 4
new
¿¿5 8
{
¿¿9 :
r
¿¿; <
.
¿¿< = 
CodigoLineaNegocio
¿¿= O
,
¿¿O P!
idtablalineanegocio
¿¿Q d
=
¿¿e f

TablaTabla
¿¿g q
.
¿¿q r
LineaNegocio
¿¿r ~
}¿¿ Ä
equals
¡¡ 
new
¡¡ 
{
¡¡  
CodigoLineaNegocio
¡¡ 1
=
¡¡2 3
(
¡¡4 5
short
¡¡5 :
?
¡¡: ;
)
¡¡; <
lineanegocio
¡¡< H
.
¡¡H I
CodigoCampo
¡¡I T
,
¡¡T U!
idtablalineanegocio
¡¡V i
=
¡¡j k
lineanegocio
¡¡l x
.
¡¡x y
IdTabla¡¡y Ä
}¡¡Å Ç
into¡¡É á%
ProspectoLineaNegocio¡¡à ù
from
¬¬ 
plineanegocio
¬¬ 
in
¬¬ #
ProspectoLineaNegocio
¬¬ 3
.
¬¬3 4
DefaultIfEmpty
¬¬4 B
(
¬¬B C
)
¬¬C D
where
√√ 
(
√√ 
intermediario
√√ 
.
√√ !
CodigoIntermediario
√√ 0
==
√√1 3"
prospectoQueryFilter
√√4 H
.
√√H I!
codigointermediario
√√I \
)
√√\ ]
&&
√√^ `
(
ƒƒ
 
p
ƒƒ 
.
ƒƒ 
Nombres
ƒƒ 
.
ƒƒ 
Contains
ƒƒ 
(
ƒƒ "
prospectoQueryFilter
ƒƒ 2
.
ƒƒ2 3
	parametro
ƒƒ3 <
)
ƒƒ< =
||
ƒƒ> @
p
ƒƒA B
.
ƒƒB C
ApellidoPaterno
ƒƒC R
.
ƒƒR S
Contains
ƒƒS [
(
ƒƒ[ \"
prospectoQueryFilter
ƒƒ\ p
.
ƒƒp q
	parametro
ƒƒq z
)
ƒƒz {
||
ƒƒ| ~
p
≈≈ 
.
≈≈ 
ApellidoMaterno
≈≈ 
.
≈≈ 
Contains
≈≈ %
(
≈≈% &"
prospectoQueryFilter
≈≈& :
.
≈≈: ;
	parametro
≈≈; D
)
≈≈D E
||
≈≈F H
p
≈≈I J
.
≈≈J K
Referenciador
≈≈K X
.
≈≈X Y
Contains
≈≈Y a
(
≈≈a b"
prospectoQueryFilter
≈≈b v
.
≈≈v w
	parametro≈≈w Ä
)≈≈Ä Å
||≈≈Ç Ñ
p≈≈Ö Ü
.≈≈Ü á
NumeroDocumento≈≈á ñ
.≈≈ñ ó
Contains≈≈ó ü
(≈≈ü †$
prospectoQueryFilter≈≈† ¥
.≈≈¥ µ
	parametro≈≈µ æ
)≈≈æ ø
)≈≈ø ¿
&&≈≈¡ √
(
∆∆ 
(
∆∆ 
p
∆∆ 
.
∆∆ $
AuditoriaFechaCreacion
∆∆ %
>=
∆∆& ("
prospectoQueryFilter
∆∆) =
.
∆∆= >!
fechacreacioninicio
∆∆> Q
||
∆∆R T"
prospectoQueryFilter
∆∆U i
.
∆∆i j!
fechacreacioninicio
∆∆j }
==∆∆~ Ä
null∆∆Å Ö
)∆∆Ö Ü
&&∆∆á â
(
«« 
p
«« 
.
«« $
AuditoriaFechaCreacion
«« %
<=
««& ("
prospectoQueryFilter
««) =
.
««= >
fechacreacionfin
««> N
||
««O Q"
prospectoQueryFilter
««R f
.
««f g
fechacreacionfin
««g w
==
««x z
null
««{ 
)«« Ä
)««Ä Å
&&««Ç Ñ
(
ÃÃ 
r
ÃÃ 
.
ÃÃ $
AuditoriaFechaCreacion
ÃÃ $
.
ÃÃ$ %
Value
ÃÃ% *
.
ÃÃ* +
Date
ÃÃ+ /
==
ÃÃ0 2
DateTime
ÃÃ3 ;
.
ÃÃ; <
Now
ÃÃ< ?
.
ÃÃ? @
Date
ÃÃ@ D
)
ÃÃD E
&&
ÃÃF H
(
ÕÕ 
r
ÕÕ 
.
ÕÕ 

FlagActivo
ÕÕ 
.
ÕÕ 
Value
ÕÕ 
)
ÕÕ 
&&
ÕÕ  "
!
ŒŒ 
idsprospecto
ŒŒ 
.
ŒŒ 
Contains
ŒŒ !
(
ŒŒ! "
p
ŒŒ" #
.
ŒŒ# $
IdProspecto
ŒŒ$ /
)
ŒŒ/ 0
&&
ŒŒ1 3
(
œœ !
listcodigorangoedad
œœ 
.
œœ  
Contains
œœ  (
(
œœ( )
p
œœ) *
.
œœ* +
CodigoRangoEdad
œœ+ :
.
œœ: ;
Value
œœ; @
)
œœ@ A
||
œœB D!
listcodigorangoedad
œœE X
==
œœY [
null
œœ\ `
)
œœ` a
&&
œœb d
(
–– !
listcodigorangosexo
–– 
.
––  
Contains
––  (
(
––( )
p
––) *
.
––* +

CodigoSexo
––+ 5
.
––5 6
Value
––6 ;
)
––; <
||
––= ?!
listcodigorangosexo
––@ S
==
––T V
null
––W [
)
––[ \
&&
––] _
(
—— #
listcodigorangofuente
—— !
.
——! "
Contains
——" *
(
——* +
p
——+ ,
.
——, -
CodigoFuente
——- 9
.
——9 :
Value
——: ?
)
——? @
||
——A C#
listcodigorangofuente
——D Y
==
——Z \
null
——] a
)
——a b
&&
——c e
(
““ &
listcodigorangosubfuente
““ $
.
““$ %
Contains
““% -
(
““- .
p
““. /
.
““/ 0
CodigoSubFuente
““0 ?
.
““? @
Value
““@ E
)
““E F
||
““G I&
listcodigorangosubfuente
““J b
==
““c e
null
““f j
)
““j k
&&
““l n
(
”” $
listcodigorangoingreso
”” "
.
””" #
Contains
””# +
(
””+ ,
p
””, -
.
””- . 
CodigoRangoIngreso
””. @
.
””@ A
Value
””A F
)
””F G
||
””H J$
listcodigorangoingreso
””K a
==
””b d
null
””e i
)
””i j
&&
””k m
(
‘‘ "
listcodigorangofondo
‘‘  
.
‘‘  !
Contains
‘‘! )
(
‘‘) *
p
‘‘* +
.
‘‘+ ,
CodigoRangoFondo
‘‘, <
.
‘‘< =
Value
‘‘= B
)
‘‘B C
||
‘‘D F"
listcodigorangofondo
‘‘G [
==
‘‘\ ^
null
‘‘_ c
)
‘‘c d
select
◊◊ 
new
◊◊ 
{
ÿÿ 	
p
ŸŸ	 

,
ŸŸ
 
r
⁄⁄	 

,
⁄⁄
 
padn
€€	 
,
€€ 
	preferido
‹‹	 
,
‹‹ 
pfuente
››	 
,
›› 

psubfuente
ﬁﬁ	 
,
ﬁﬁ 
psexo
ﬂﬂ	 
,
ﬂﬂ 
pcargo
‡‡	 
,
‡‡ 

pdireccion
··	 
,
·· 
	ddistrito
‚‚	 
,
‚‚ 

dprovincia
„„	 
,
„„ 
ddepartamento
‰‰	 
,
‰‰  
pmotivounodescarte
ÂÂ	 
,
ÂÂ  
pmotivodosdescarte
ÊÊ	 
,
ÊÊ 
plineanegocio
ÁÁ	 
}
ÈÈ 	
)
ÈÈ	 

.
ÈÈ
 
AsNoTracking
ÈÈ 
(
ÈÈ 
)
ÈÈ 
.
ÈÈ 
Select
ÈÈ  
(
ÈÈ  !
x
ÈÈ! "
=>
ÈÈ# %
new
ÈÈ& )
	Prospecto
ÈÈ* 3
{
ÍÍ 	
IdProspecto
ÎÎ	 
=
ÎÎ 
x
ÎÎ 
.
ÎÎ 
p
ÎÎ 
.
ÎÎ 
IdProspecto
ÎÎ &
,
ÎÎ& '
NombresApellidos
ÏÏ	 
=
ÏÏ 
string
ÏÏ "
.
ÏÏ" #
Format
ÏÏ# )
(
ÏÏ) *
$str
ÏÏ* 7
,
ÏÏ7 8
x
ÏÏ9 :
.
ÏÏ: ;
p
ÏÏ; <
.
ÏÏ< =
Nombres
ÏÏ= D
,
ÏÏD E
x
ÏÏF G
.
ÏÏG H
p
ÏÏH I
.
ÏÏI J
ApellidoPaterno
ÏÏJ Y
,
ÏÏY Z
x
ÏÏ[ \
.
ÏÏ\ ]
p
ÏÏ] ^
.
ÏÏ^ _
ApellidoMaterno
ÏÏ_ n
)
ÏÏn o
,
ÏÏo p!
CodigoTipoDocumento
ÌÌ	 
=
ÌÌ 
x
ÌÌ  
.
ÌÌ  !
p
ÌÌ! "
.
ÌÌ" #!
CodigoTipoDocumento
ÌÌ# 6
.
ÌÌ6 7
Value
ÌÌ7 <
,
ÌÌ< =
NumeroDocumento
ÓÓ	 
=
ÓÓ 
x
ÓÓ 
.
ÓÓ 
p
ÓÓ 
.
ÓÓ 
NumeroDocumento
ÓÓ .
,
ÓÓ. /
Nombres
ÔÔ	 
=
ÔÔ 
x
ÔÔ 
.
ÔÔ 
p
ÔÔ 
.
ÔÔ 
Nombres
ÔÔ 
,
ÔÔ 
ApellidoPaterno
	 
=
 
x
 
.
 
p
 
.
 
ApellidoPaterno
 .
,
. /
ApellidoMaterno
ÒÒ	 
=
ÒÒ 
x
ÒÒ 
.
ÒÒ 
p
ÒÒ 
.
ÒÒ 
ApellidoMaterno
ÒÒ .
,
ÒÒ. /
CodigoFuente
ÚÚ	 
=
ÚÚ 
x
ÚÚ 
.
ÚÚ 
p
ÚÚ 
.
ÚÚ 
CodigoFuente
ÚÚ (
.
ÚÚ( )
Value
ÚÚ) .
,
ÚÚ. /
CodigoSubFuente
ÛÛ	 
=
ÛÛ 
x
ÛÛ 
.
ÛÛ 
p
ÛÛ 
.
ÛÛ 
CodigoSubFuente
ÛÛ .
.
ÛÛ. /
Value
ÛÛ/ 4
,
ÛÛ4 5
NombreFuente
ÙÙ	 
=
ÙÙ 
x
ÙÙ 
.
ÙÙ 
pfuente
ÙÙ !
.
ÙÙ! "
ValorCadena
ÙÙ" -
,
ÙÙ- .
NombreSubFuente
ıı	 
=
ıı 
x
ıı 
.
ıı 

psubfuente
ıı '
.
ıı' (
ValorCadena
ıı( 3
,
ıı3 4
TelefonoFijo
ˆˆ	 
=
ˆˆ 
x
ˆˆ 
.
ˆˆ 
p
ˆˆ 
.
ˆˆ 
TelefonoFijo
ˆˆ (
,
ˆˆ( )
TelefonoCelular
˜˜	 
=
˜˜ 
x
˜˜ 
.
˜˜ 
p
˜˜ 
.
˜˜ 
TelefonoCelular
˜˜ .
,
˜˜. /
FechaNacimiento
¯¯	 
=
¯¯ 
x
¯¯ 
.
¯¯ 
p
¯¯ 
.
¯¯ 
FechaNacimiento
¯¯ .
.
¯¯. /
Value
¯¯/ 4
,
¯¯4 5
	Direccion
˘˘	 
=
˘˘ 
x
˘˘ 
.
˘˘ 

pdireccion
˘˘ !
.
˘˘! "
	Direccion
˘˘" +
,
˘˘+ ,
Departamento_Id
˙˙	 
=
˙˙ 
x
˙˙ 
.
˙˙ 

pdireccion
˙˙ '
.
˙˙' (
Departamento_Id
˙˙( 7
,
˙˙7 8
Provincia_Id
˚˚	 
=
˚˚ 
x
˚˚ 
.
˚˚ 

pdireccion
˚˚ $
.
˚˚$ %
Provincia_Id
˚˚% 1
,
˚˚1 2
Distrito_Id
¸¸	 
=
¸¸ 
x
¸¸ 
.
¸¸ 

pdireccion
¸¸ #
.
¸¸# $
Distrito_Id
¸¸$ /
,
¸¸/ 0
Departamento
˝˝	 
=
˝˝ 
x
˝˝ 
.
˝˝ 
ddepartamento
˝˝ '
.
˝˝' (
Nombre
˝˝( .
,
˝˝. /
	Provincia
˛˛	 
=
˛˛ 
x
˛˛ 
.
˛˛ 

dprovincia
˛˛ !
.
˛˛! "
Nombre
˛˛" (
,
˛˛( )
Distrito
ˇˇ	 
=
ˇˇ 
x
ˇˇ 
.
ˇˇ 
	ddistrito
ˇˇ 
.
ˇˇ  
Nombre
ˇˇ  &
,
ˇˇ& '
Edad
ÄÄ	 
=
ÄÄ 
DateTime
ÄÄ 
.
ÄÄ 
Now
ÄÄ 
.
ÄÄ 
Year
ÄÄ !
-
ÄÄ" #
x
ÄÄ$ %
.
ÄÄ% &
p
ÄÄ& '
.
ÄÄ' (
FechaNacimiento
ÄÄ( 7
.
ÄÄ7 8
Value
ÄÄ8 =
.
ÄÄ= >
Year
ÄÄ> B
,
ÄÄB C

CodigoSexo
ÅÅ	 
=
ÅÅ 
x
ÅÅ 
.
ÅÅ 
p
ÅÅ 
.
ÅÅ 

CodigoSexo
ÅÅ $
.
ÅÅ$ %
Value
ÅÅ% *
,
ÅÅ* +
Sexo
ÇÇ	 
=
ÇÇ 
x
ÇÇ 
.
ÇÇ 
psexo
ÇÇ 
.
ÇÇ !
ValorAuxiliarCadena
ÇÇ +
,
ÇÇ+ ,
Empresa
ÉÉ	 
=
ÉÉ 
x
ÉÉ 
.
ÉÉ 
p
ÉÉ 
.
ÉÉ 
Empresa
ÉÉ 
,
ÉÉ 
CodigoCargo
ÑÑ	 
=
ÑÑ 
x
ÑÑ 
.
ÑÑ 
p
ÑÑ 
.
ÑÑ 
CodigoCargo
ÑÑ &
.
ÑÑ& '
Value
ÑÑ' ,
,
ÑÑ, -
NombreCargo
ÖÖ	 
=
ÖÖ 
x
ÖÖ 
.
ÖÖ 
pcargo
ÖÖ 
.
ÖÖ  
ValorCadena
ÖÖ  +
,
ÖÖ+ ,
	OtroCargo
ÜÜ	 
=
ÜÜ 
x
ÜÜ 
.
ÜÜ 
p
ÜÜ 
.
ÜÜ 
	OtroCargo
ÜÜ "
,
ÜÜ" #
Referenciador
áá	 
=
áá 
x
áá 
.
áá 
p
áá 
.
áá 
Referenciador
áá *
,
áá* +
Hijos
àà	 
=
àà 
x
àà 
.
àà 
padn
àà 
.
àà $
NumeroHijosDependiente
àà .
.
àà. /
Value
àà/ 4
,
àà4 5
Correo
ââ	 
=
ââ 
x
ââ 
.
ââ 
p
ââ 
.
ââ  
CorreoElectronico1
ââ (
,
ââ( )&
PorcentajeAvanceAnterior
ää	 !
=
ää# $
(
ää% &
int
ää& )
)
ää) *
(
ää* +
(
ää+ ,
(
ää, -
from
ää- 1
citamax
ää2 9
in
ää: <
_context
ää= E
.
ääE F
Citas
ääF K
join
ãã 
porcentajeavance
ãã /
in
ãã0 2
_context
ãã3 ;
.
ãã; <
TablaTablas
ãã< G
on
ããH J
new
ããK N
{
ããO P
citamax
ããQ X
.
ããX Y0
"CodigoPorcentajeAvanceCalificacion
ããY {
,
ãã{ |&
idtablaporcentajeavanceãã} î
=ããï ñ

TablaTablaããó °
.ãã° ¢,
PorcentajeAvanceCalificacionãã¢ æ
}ããø ¿
equals
åå  
new
åå! $
{
åå% &0
"CodigoPorcentajeAvanceCalificacion
åå' I
=
ååJ K
(
ååL M
short
ååM R
?
ååR S
)
ååS T
porcentajeavance
ååT d
.
ååd e
CodigoCampo
ååe p
,
ååp q&
idtablaporcentajeavanceåår â
=ååä ã 
porcentajeavanceååå ú
.ååú ù
IdTablaååù §
}åå• ¶
intoååß ´!
CitaMaxPorcentajeåå¨ Ω
from
çç %
citamaxporcentajeavance
çç 6
in
çç7 9
CitaMaxPorcentaje
çç: K
.
ççK L
DefaultIfEmpty
ççL Z
(
ççZ [
)
çç[ \
where
éé 
citamax
éé  '
.
éé' (
IdProspecto
éé( 3
==
éé4 6
x
éé7 8
.
éé8 9
p
éé9 :
.
éé: ;
IdProspecto
éé; F
select
èè  
new
èè! $
{
èè% &
citamax
èè' .
,
èè. /%
citamaxporcentajeavance
èè0 G
}
èèH I
)
êê 
.
êê 
GroupBy
êê 
(
êê 
x
êê 
=>
êê  
new
êê! $
{
êê% &
x
êê' (
.
êê( )
citamax
êê) 0
.
êê0 1
IdProspecto
êê1 <
}
êê= >
)
êê> ?
.
ëë 
Select
ëë 
(
ëë 
y
ëë 
=>
ëë 
new
ëë "
{
ëë# $
PorcentajeMaximo
íí #
=
íí$ %
y
íí& '
.
íí' (
Max
íí( +
(
íí+ ,
x
íí, -
=>
íí. 0
x
íí1 2
.
íí2 3%
citamaxporcentajeavance
íí3 J
.
ííJ K
ValorNumerico
ííK X
.
ííX Y
Value
ííY ^
)
íí^ _
}
ìì 
)
ìì 
)
ìì 
.
ìì 
First
ìì 
(
ìì 
)
ìì 
.
ìì 
PorcentajeMaximo
ìì .
)
ìì. /
,
ìì/ 0
MonedaFondo
îî	 
=
îî 
x
îî 
.
îî 
padn
îî 
.
îî !
MonedaPatrimonioAfp
îî 1
.
îî1 2
Value
îî2 7
,
îî7 8

MontoFondo
ïï	 
=
ïï 
x
ïï 
.
ïï 
padn
ïï 
.
ïï  
MontoPatrimonioAfp
ïï /
.
ïï/ 0
Value
ïï0 5
,
ïï5 6
Fuente
ññ	 
=
ññ 
string
ññ 
.
ññ 
Format
ññ 
(
ññ  
$str
ññ  ,
,
ññ, -
x
ññ. /
.
ññ/ 0
pfuente
ññ0 7
.
ññ7 8
ValorCadena
ññ8 C
,
ññC D
string
ññE K
.
ññK L
IsNullOrEmpty
ññL Y
(
ññY Z
x
ññZ [
.
ññ[ \

psubfuente
ññ\ f
.
ññf g
ValorCadena
ññg r
)
ññr s
?
ññt u
$str
ññv x
:
ññy z
$str
ññ{ ~
+ññ Ä
xññÅ Ç
.ññÇ É

psubfuenteññÉ ç
.ññç é
ValorCadenaññé ô
,ññô ö
x
óó 
.
óó 
p
óó 
.
óó 
IdReferenciador
óó $
.
óó$ %
HasValue
óó% -
?
óó. /
x
óó0 1
.
óó1 2
	preferido
óó2 ;
.
óó; <
Nombres
óó< C
+
óóD E
$str
óóF I
+
óóJ K
x
óóL M
.
óóM N
	preferido
óóN W
.
óóW X
ApellidoPaterno
óóX g
+
óóh i
$str
óój m
+
óón o
x
óóp q
.
óóq r
	preferido
óór {
.
óó{ |
ApellidoMaternoóó| ã
:óóå ç
xóóé è
.óóè ê
póóê ë
.óóë í
Referenciadoróóí ü
)óóü †
,óó† °
IdReferenciador
òò	 
=
òò 
x
òò 
.
òò 
p
òò 
.
òò 
IdReferenciador
òò .
.
òò. /
Value
òò/ 4
,
òò4 5
FlagDescarte
ôô	 
=
ôô 
x
ôô 
.
ôô 
p
ôô 
.
ôô 
FlagDescarte
ôô (
,
ôô( )!
TextoMotivoDescarte
öö	 
=
öö 
string
öö %
.
öö% &
IsNullOrEmpty
öö& 3
(
öö3 4
x
öö4 5
.
öö5 6 
pmotivodosdescarte
öö6 H
.
ööH I
ValorCadena
ööI T
)
ööT U
?
ööV W
x
ööX Y
.
ööY Z 
pmotivounodescarte
ööZ l
.
ööl m
ValorCadena
ööm x
:
õõ 
string
õõ 
.
õõ 
Format
õõ #
(
õõ# $
$str
õõ$ -
,
õõ- .
x
õõ/ 0
.
õõ0 1 
pmotivounodescarte
õõ1 C
.
õõC D
ValorCadena
õõD O
,
õõO P
x
õõQ R
.
õõR S 
pmotivodosdescarte
õõS e
.
õõe f
ValorCadena
õõf q
)
õõq r
,
õõr s
VisibleDescarte
úú	 
=
úú 
x
úú 
.
úú 
p
úú 
.
úú 
FlagDescarte
úú +
==
úú, .
true
úú/ 3
?
úú4 5
false
úú6 ;
:
úú< =
true
úú> B
,
úúB C
VisibleAgendar
ùù	 
=
ùù 
true
ùù 
,
ùù 
FechaCreacion
ûû	 
=
ûû 
x
ûû 
.
ûû 
p
ûû 
.
ûû $
AuditoriaFechaCreacion
ûû 3
,
ûû3 4"
FechaUltimaActividad
üü	 
=
üü 
x
üü  !
.
üü! "
r
üü" #
.
üü# $$
AuditoriaFechaCreacion
üü$ :
,
üü: ;
Producto
††	 
=
†† 
x
†† 
.
†† 
plineanegocio
†† #
.
††# $
ValorCadena
††$ /
,
††/ 0
}
¢¢ 	
)
¢¢	 

;
¢¢
 
return
•• 
result
•• 
;
•• 
}
¶¶ 
}
®® 
}©© ñ[
`D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Prospecto\ProspectoQueriesExample.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
	Prospecto) 2
{		 
public

 

class

 1
%ResponseObtenerProspectosQueryExample

 6
:

7 8
IExamplesProvider

9 J
<

J K1
%ResponseObtenerProspectosQueryExample

K p
>

p q
{ 
public 1
%ResponseObtenerProspectosQueryExample 4
(4 5
)5 6
=>7 9
responseModel: G
=H I
newJ M
ResponseModelN [
<[ \
List\ `
<` a
	Prospectoa j
>j k
>k l
(l m
)m n
;n o
public 
ResponseModel 
< 
List !
<! "
	Prospecto" +
>+ ,
>, -
responseModel. ;
{< =
get> A
;A B
setC F
;F G
}H I
public 1
%ResponseObtenerProspectosQueryExample 4
GetExamples5 @
(@ A
)A B
{ 	
string 
mensajeRespuesta #
=$ %
string& ,
., -
Empty- 2
;2 3
int 
status 
= 
$num 
; 
AuditResponse 
auditResponse '
=( )
new* -
AuditResponse. ;
(; <
)< =
;= >
List 
< 
	Prospecto 
> 

prospectos &
=' (
new) ,
List- 1
<1 2
	Prospecto2 ;
>; <
(< =
)= >
;> ?

prospectos 
. 
Add 
( 
new 
	Prospecto (
{) *
NombresApellidos+ ;
=< =
$str> [
,[ \
Fuente] c
=d e
$strf k
,k l
Edadm q
=r s
$numt v
}w x
)x y
;y z

prospectos 
. 
Add 
( 
new 
	Prospecto (
{) *
NombresApellidos+ ;
=< =
$str> T
,T U
FuenteV \
=] ^
$str_ p
,p q
Edadr v
=w x
$numy {
}| }
)} ~
;~ 
auditResponse 
. 
idTransaccion '
=( )
$str* 5
;5 6
auditResponse 
. 
codigoRespuesta )
=* +#
CodigoRespuestaServicio, C
.C D
ExitoD I
;I J
new 
ConfigurationHelper #
(# $
)$ %
.% &+
ObtenerMensajeRespuestaServicio& E
(E F
auditResponseF S
.S T
codigoRespuestaT c
,c d
refe h
mensajeRespuestai y
,y z
ref{ ~
status	 Ö
)
Ö Ü
;
Ü á
auditResponse 
. 
mensajeRespuesta *
=+ ,
mensajeRespuesta- =
;= >
return 
new 1
%ResponseObtenerProspectosQueryExample <
(< =
)= >
{ 
responseModel 
= 
new  #
ResponseModel$ 1
<1 2
List2 6
<6 7
	Prospecto7 @
>@ A
>A B
(B C
)C D
{ 
auditResponse !
=" #
auditResponse$ 1
,1 2
Entity 
= 

prospectos '
}   
}!! 
;!! 
}"" 	
}## 
public%% 

class%% 7
+ResponseObtenerProspectoDetalleQueryExample%% <
:%%= >
IExamplesProvider%%? P
<%%P Q7
+ResponseObtenerProspectoDetalleQueryExample%%Q |
>%%| }
{&& 
public'' 7
+ResponseObtenerProspectoDetalleQueryExample'' :
('': ;
)''; <
=>''= ?
responseModel''@ M
=''N O
new''P S
ResponseModel''T a
<''a b&
ActualizarProspectoCommand''b |
>''| }
(''} ~
)''~ 
;	'' Ä
public(( 
ResponseModel(( 
<(( &
ActualizarProspectoCommand(( 7
>((7 8
responseModel((9 F
{((G H
get((I L
;((L M
set((N Q
;((Q R
}((S T
public** 7
+ResponseObtenerProspectoDetalleQueryExample** :
GetExamples**; F
(**F G
)**G H
{++ 	&
ActualizarProspectoCommand,, &&
actualizarProspectoCommand,,' A
=,,B C
new,,D G&
ActualizarProspectoCommand,,H b
(,,b c
),,c d
;,,d e$
ProspectoAdnRentaCommand-- $$
prospectoAdnRentaCommand--% =
=--> ?
new--@ C$
ProspectoAdnRentaCommand--D \
(--\ ]
)--] ^
;--^ _%
ProspectoDireccionCommand.. %%
prospectoDireccionCommand..& ?
=..@ A
new..B E%
ProspectoDireccionCommand..F _
(.._ `
)..` a
;..a b&
actualizarProspectoCommand22 &
.22& '
CodigoTipoDocumento22' :
=22; <
$num22= >
;22> ?&
actualizarProspectoCommand33 &
.33& '
NumeroDocumento33' 6
=337 8
$str339 C
;33C D&
actualizarProspectoCommand44 &
.44& '
Nombres44' .
=44/ 0
$str441 A
;44A B&
actualizarProspectoCommand55 &
.55& '
ApellidoPaterno55' 6
=557 8
$str559 A
;55A B&
actualizarProspectoCommand66 &
.66& '
ApellidoMaterno66' 6
=667 8
$str669 @
;66@ A&
actualizarProspectoCommand77 &
.77& '
FechaNacimiento77' 6
=777 8
DateTime779 A
.77A B
Parse77B G
(77G H
$str77H T
)77T U
;77U V&
actualizarProspectoCommand88 &
.88& '

CodigoSexo88' 1
=882 3
$num884 5
;885 6&
actualizarProspectoCommand99 &
.99& '
CodigoFuente99' 3
=994 5
$num996 7
;997 8&
actualizarProspectoCommand:: &
.::& '
CodigoEtapa::' 2
=::3 4
$num::5 6
;::6 7&
actualizarProspectoCommand;; &
.;;& '
CodigoEstado;;' 3
=;;4 5
$num;;6 7
;;;7 8&
actualizarProspectoCommand<< &
.<<& '
Empresa<<' .
=<</ 0
$str<<1 B
;<<B C&
actualizarProspectoCommand== &
.==& '
CodigoCargo==' 2
===3 4
$num==5 6
;==6 7&
actualizarProspectoCommand>> &
.>>& '
	OtroCargo>>' 0
=>>1 2
$str>>3 ?
;>>? @&
actualizarProspectoCommand?? &
.??& '
FlagHijo??' /
=??0 1
true??2 6
;??6 7&
actualizarProspectoCommand@@ &
.@@& '
TelefonoCelular@@' 6
=@@7 8
$str@@9 D
;@@D E&
actualizarProspectoCommandAA &
.AA& '
TelefonoFijoAA' 3
=AA4 5
$strAA6 B
;AAB C&
actualizarProspectoCommandBB &
.BB& '
CorreoElectronico1BB' 9
=BB: ;
$strBB< Y
;BBY Z&
actualizarProspectoCommandCC &
.CC& '&
AuditoriaFechaModificacionCC' A
=CCB C
DateTimeCCD L
.CCL M
NowCCM P
;CCP Q&
actualizarProspectoCommandDD &
.DD& '(
AuditoriaUsuarioModificacionDD' C
=DDD E
$strDDF P
;DDP Q$
prospectoAdnRentaCommandFF $
.FF$ %
MonedaPatrimonioAfpFF% 8
=FF9 :
$numFF; <
;FF< =$
prospectoAdnRentaCommandGG $
.GG$ %
MontoPatrimonioAfpGG% 7
=GG8 9
decimalGG: A
.GGA B
ParseGGB G
(GGG H
$strGGH Q
)GGQ R
;GGR S$
prospectoAdnRentaCommandHH $
.HH$ %
PorcentajeAvanceHH% 5
=HH6 7
$numHH8 :
;HH: ;$
prospectoAdnRentaCommandII $
.II$ %$
PorcentajeAvanceCompletoII% =
=II> ?
$numII@ A
;IIA B$
prospectoAdnRentaCommandJJ $
.JJ$ %&
AuditoriaFechaModificacionJJ% ?
=JJ@ A
DateTimeJJB J
.JJJ K
NowJJK N
;JJN O$
prospectoAdnRentaCommandKK $
.KK$ %(
AuditoriaUsuarioModificacionKK% A
=KKB C
$strKKD N
;KKN O%
prospectoDireccionCommandMM %
.MM% &
	DireccionMM& /
=MM0 1
$strMM2 E
;MME F%
prospectoDireccionCommandNN %
.NN% &
Departamento_IdNN& 5
=NN6 7
$numNN8 9
;NN9 :%
prospectoDireccionCommandOO %
.OO% &
Provincia_IdOO& 2
=OO3 4
$numOO5 6
;OO6 7%
prospectoDireccionCommandPP %
.PP% &
Distrito_IdPP& 1
=PP2 3
$numPP4 5
;PP5 6%
prospectoDireccionCommandQQ %
.QQ% &

FlagActivoQQ& 0
=QQ1 2
trueQQ3 7
;QQ7 8&
actualizarProspectoCommandSS &
.SS& '$
ProspectoAdnRentaCommandSS' ?
=SS@ A$
prospectoAdnRentaCommandSSB Z
;SSZ [
stringTT 
mensajeRespuestaTT #
=TT$ %
stringTT& ,
.TT, -
EmptyTT- 2
;TT2 3
intUU 
statusUU 
=UU 
$numUU 
;UU 
AuditResponseVV 
auditResponseVV '
=VV( )
newVV* -
AuditResponseVV. ;
(VV; <
)VV< =
;VV= >
auditResponseWW 
.WW 
idTransaccionWW '
=WW( )
$strWW* 5
;WW5 6
auditResponseXX 
.XX 
codigoRespuestaXX )
=XX* +#
CodigoRespuestaServicioXX, C
.XXC D
ExitoXXD I
;XXI J
newYY 
ConfigurationHelperYY #
(YY# $
)YY$ %
.YY% &+
ObtenerMensajeRespuestaServicioYY& E
(YYE F
auditResponseYYF S
.YYS T
codigoRespuestaYYT c
,YYc d
refYYe h
mensajeRespuestaYYi y
,YYy z
refYY{ ~
status	YY Ö
)
YYÖ Ü
;
YYÜ á
auditResponseZZ 
.ZZ 
mensajeRespuestaZZ *
=ZZ+ ,
mensajeRespuestaZZ- =
;ZZ= >
return[[ 
new[[ 7
+ResponseObtenerProspectoDetalleQueryExample[[ B
([[B C
)[[C D
{\\ 
responseModel]] 
=]] 
new]]  #
ResponseModel]]$ 1
<]]1 2&
ActualizarProspectoCommand]]2 L
>]]L M
(]]M N
)]]N O
{^^ 
auditResponse__ !
=__" #
auditResponse__$ 1
,__1 2
Entity`` 
=`` &
actualizarProspectoCommand`` 7
}aa 
}bb 
;bb 
}cc 	
}dd 
}ff ıà
[D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Queries\Prospecto\ProspectoViewModel.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Queries! (
.( )
	Prospecto) 2
{ 
public 

class 
	Prospecto 
{ 
public		 
int		 
IdProspecto		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
NombresApellidos

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
short 
CodigoTipoDocumento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
NumeroDocumento %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ApellidoPaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ApellidoMaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Fuente 
{ 
get "
;" #
set$ '
;' (
}) *
public 
short 
CodigoFuente !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
CodigoSubFuente $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
NombreFuente "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
NombreSubFuente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Producto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
TelefonoFijo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
TelefonoCelular %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaNacimiento '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
decimal 
Edad 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Hijos 
{ 
get 
; 
set  #
;# $
}% &
public 
short 

CodigoSexo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Sexo 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
Departamento_Id $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
short 
Provincia_Id !
{" #
get$ '
;' (
set) ,
;, -
}. /
public   
short   
Distrito_Id    
{  ! "
get  # &
;  & '
set  ( +
;  + ,
}  - .
public!! 
string!! 
Departamento!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
public"" 
string"" 
	Provincia"" 
{""  !
get""" %
;""% &
set""' *
;""* +
}"", -
public## 
string## 
Distrito## 
{##  
get##! $
;##$ %
set##& )
;##) *
}##+ ,
public$$ 
string$$ 
Correo$$ 
{$$ 
get$$ "
;$$" #
set$$$ '
;$$' (
}$$) *
public%% 
short%% 
CodigoCargo%%  
{%%! "
get%%# &
;%%& '
set%%( +
;%%+ ,
}%%- .
public&& 
string&& 
Empresa&& 
{&& 
get&&  #
;&&# $
set&&% (
;&&( )
}&&* +
public'' 
string'' 
NombreCargo'' !
{''" #
get''$ '
;''' (
set'') ,
;'', -
}''. /
public(( 
string(( 
	OtroCargo(( 
{((  !
get((" %
;((% &
set((' *
;((* +
}((, -
public)) 
string)) 
Referenciador)) #
{))$ %
get))& )
;))) *
set))+ .
;)). /
}))0 1
public** 
short** 
MonedaFondo**  
{**! "
get**# &
;**& '
set**( +
;**+ ,
}**- .
public++ 
decimal++ 

MontoFondo++ !
{++" #
get++$ '
;++' (
set++) ,
;++, -
}++. /
public,, 
int,, 
IdReferenciador,, "
{,,# $
get,,% (
;,,( )
set,,* -
;,,- .
},,/ 0
public-- 
bool-- 
?-- 
FlagDescarte-- !
{--" #
get--$ '
;--' (
set--) ,
;--, -
}--. /
public.. 
string.. 
TextoMotivoDescarte.. )
{..* +
get.., /
;../ 0
set..1 4
;..4 5
}..6 7
public// 
bool// 
VisibleDescarte// #
{//$ %
get//& )
;//) *
set//+ .
;//. /
}//0 1
public00 
bool00 
VisibleAgendar00 "
{00# $
get00% (
;00( )
set00* -
;00- .
}00/ 0
public11 
int11 
PorcentajeAvance11 #
{11$ %
get11& )
;11) *
set11+ .
;11. /
}110 1
public22 
int22 $
PorcentajeAvanceAnterior22 +
{22, -
get22. 1
;221 2
set223 6
;226 7
}228 9
public33 
string33 
DescripcionAvance33 '
{33( )
get33* -
;33- .
set33/ 2
;332 3
}334 5
public44 
DateTime44 
?44 
FechaEstimadaCierre44 ,
{44- .
get44/ 2
;442 3
set444 7
;447 8
}449 :
public55 
DateTime55 
?55 
FechaCreacion55 &
{55' (
get55) ,
;55, -
set55. 1
;551 2
}553 4
public66 
DateTime66 
?66  
FechaUltimaActividad66 -
{66. /
get660 3
;663 4
set665 8
;668 9
}66: ;
public77 
List77 
<77 
Referido77 
>77 
	Referidos77 '
{77( )
get77* -
;77- .
set77/ 2
;772 3
}774 5
}88 
public:: 

class:: 
ProspectoDetalle:: !
{;; 
public<< 
int<< 
IdProspecto<< 
{<<  
get<<! $
;<<$ %
set<<& )
;<<) *
}<<+ ,
public== 
string== 
NombresApellidos== &
{==' (
get==) ,
;==, -
set==. 1
;==1 2
}==3 4
public>> 
string>> 
TelefonoFijo>> "
{>># $
get>>% (
;>>( )
set>>* -
;>>- .
}>>/ 0
public?? 
string?? 
TelefonoCelular?? %
{??& '
get??( +
;??+ ,
set??- 0
;??0 1
}??2 3
public@@ 
string@@ 
Fuente@@ 
{@@ 
get@@ "
;@@" #
set@@$ '
;@@' (
}@@) *
publicAA 
DateTimeAA 
FechaNacimientoAA '
{AA( )
getAA* -
;AA- .
setAA/ 2
;AA2 3
}AA4 5
publicBB 
decimalBB 
EdadBB 
{BB 
getBB !
;BB! "
setBB# &
;BB& '
}BB( )
publicCC 
intCC 
HijosCC 
{CC 
getCC 
;CC 
setCC  #
;CC# $
}CC% &
publicDD 
stringDD 
CorreoDD 
{DD 
getDD "
;DD" #
setDD$ '
;DD' (
}DD) *
publicEE 
stringEE 
EmpresaEE 
{EE 
getEE  #
;EE# $
setEE% (
;EE( )
}EE* +
publicFF 
stringFF 
NombreCargoFF !
{FF" #
getFF$ '
;FF' (
setFF) ,
;FF, -
}FF. /
publicGG 
stringGG 
	OtroCargoGG 
{GG  !
getGG" %
;GG% &
setGG' *
;GG* +
}GG, -
publicHH 
shortHH 
MonedaFondoHH  
{HH! "
getHH# &
;HH& '
setHH( +
;HH+ ,
}HH- .
publicII 
decimalII 

MontoFondoII !
{II" #
getII$ '
;II' (
setII) ,
;II, -
}II. /
publicJJ 
intJJ 
IdReferenciadorJJ "
{JJ# $
getJJ% (
;JJ( )
setJJ* -
;JJ- .
}JJ/ 0
}KK 
publicMM 

classMM 
ReferidoMM 
{NN 
publicOO 
stringOO 
NombresApellidosOO &
{OO' (
getOO) ,
;OO, -
setOO. 1
;OO1 2
}OO3 4
publicPP 
shortPP 
CodigoTipoDocumentoPP (
{PP) *
getPP+ .
;PP. /
setPP0 3
;PP3 4
}PP5 6
publicQQ 
stringQQ 
NumeroDocumentoQQ %
{QQ& '
getQQ( +
;QQ+ ,
setQQ- 0
;QQ0 1
}QQ2 3
publicRR 
stringRR 
NombresRR 
{RR 
getRR  #
;RR# $
setRR% (
;RR( )
}RR* +
publicSS 
stringSS 
ApellidoPaternoSS %
{SS& '
getSS( +
;SS+ ,
setSS- 0
;SS0 1
}SS2 3
publicTT 
stringTT 
ApellidoMaternoTT %
{TT& '
getTT( +
;TT+ ,
setTT- 0
;TT0 1
}TT2 3
publicUU 
stringUU 
FuenteUU 
{UU 
getUU "
;UU" #
setUU$ '
;UU' (
}UU) *
publicVV 
shortVV 
CodigoFuenteVV !
{VV" #
getVV$ '
;VV' (
setVV) ,
;VV, -
}VV. /
publicWW 
shortWW 
CodigoSubFuenteWW $
{WW% &
getWW' *
;WW* +
setWW, /
;WW/ 0
}WW1 2
publicXX 
stringXX 
NombreFuenteXX "
{XX# $
getXX% (
;XX( )
setXX* -
;XX- .
}XX/ 0
publicYY 
stringYY 
NombreSubFuenteYY %
{YY& '
getYY( +
;YY+ ,
setYY- 0
;YY0 1
}YY2 3
publicZZ 
DateTimeZZ 
?ZZ 
FechaNacimientoZZ (
{ZZ) *
getZZ+ .
;ZZ. /
setZZ0 3
;ZZ3 4
}ZZ5 6
public[[ 
decimal[[ 
Edad[[ 
{[[ 
get[[ !
;[[! "
set[[# &
;[[& '
}[[( )
public\\ 
int\\ 
IdProspecto\\ 
{\\  
get\\! $
;\\$ %
set\\& )
;\\) *
}\\+ ,
public]] 
string]] 
TelefonoFijo]] "
{]]# $
get]]% (
;]]( )
set]]* -
;]]- .
}]]/ 0
public^^ 
string^^ 
TelefonoCelular^^ %
{^^& '
get^^( +
;^^+ ,
set^^- 0
;^^0 1
}^^2 3
public__ 
int__ 
Hijos__ 
{__ 
get__ 
;__ 
set__  #
;__# $
}__% &
public`` 
short`` 

CodigoSexo`` 
{``  !
get``" %
;``% &
set``' *
;``* +
}``, -
publicaa 
stringaa 
Sexoaa 
{aa 
getaa  
;aa  !
setaa" %
;aa% &
}aa' (
publicbb 
stringbb 
	Direccionbb 
{bb  !
getbb" %
;bb% &
setbb' *
;bb* +
}bb, -
publiccc 
shortcc 
Departamento_Idcc $
{cc% &
getcc' *
;cc* +
setcc, /
;cc/ 0
}cc1 2
publicdd 
shortdd 
Provincia_Iddd !
{dd" #
getdd$ '
;dd' (
setdd) ,
;dd, -
}dd. /
publicee 
shortee 
Distrito_Idee  
{ee! "
getee# &
;ee& '
setee( +
;ee+ ,
}ee- .
publicff 
stringff 
Departamentoff "
{ff# $
getff% (
;ff( )
setff* -
;ff- .
}ff/ 0
publicgg 
stringgg 
	Provinciagg 
{gg  !
getgg" %
;gg% &
setgg' *
;gg* +
}gg, -
publichh 
stringhh 
Distritohh 
{hh  
gethh! $
;hh$ %
sethh& )
;hh) *
}hh+ ,
publicii 
stringii 
Correoii 
{ii 
getii "
;ii" #
setii$ '
;ii' (
}ii) *
publicjj 
shortjj 
CodigoCargojj  
{jj! "
getjj# &
;jj& '
setjj( +
;jj+ ,
}jj- .
publickk 
stringkk 
Empresakk 
{kk 
getkk  #
;kk# $
setkk% (
;kk( )
}kk* +
publicll 
stringll 
NombreCargoll !
{ll" #
getll$ '
;ll' (
setll) ,
;ll, -
}ll. /
publicmm 
stringmm 
	OtroCargomm 
{mm  !
getmm" %
;mm% &
setmm' *
;mm* +
}mm, -
publicnn 
shortnn 
MonedaFondonn  
{nn! "
getnn# &
;nn& '
setnn( +
;nn+ ,
}nn- .
publicoo 
decimaloo 

MontoFondooo !
{oo" #
getoo$ '
;oo' (
setoo) ,
;oo, -
}oo. /
publicpp 
intpp 
IdReferenciadorpp "
{pp# $
getpp% (
;pp( )
setpp* -
;pp- .
}pp/ 0
publicqq 
boolqq 
?qq 
FlagDescarteqq !
{qq" #
getqq$ '
;qq' (
setqq) ,
;qq, -
}qq. /
publicrr 
stringrr 
TextoMotivoDescarterr )
{rr* +
getrr, /
;rr/ 0
setrr1 4
;rr4 5
}rr6 7
publicss 
boolss 
VisibleDescartess #
{ss$ %
getss& )
;ss) *
setss+ .
;ss. /
}ss0 1
publictt 
booltt 
VisibleAgendartt "
{tt# $
gettt% (
;tt( )
settt* -
;tt- .
}tt/ 0
publicuu 
intuu 
PorcentajeAvanceuu #
{uu$ %
getuu& )
;uu) *
setuu+ .
;uu. /
}uu0 1
publicvv 
stringvv 
DescripcionAvancevv '
{vv( )
getvv* -
;vv- .
setvv/ 2
;vv2 3
}vv4 5
publicww 
DateTimeww 
?ww 
FechaEstimadaCierreww ,
{ww- .
getww/ 2
;ww2 3
setww4 7
;ww7 8
}ww9 :
publicxx 
DateTimexx 
?xx 
FechaCreacionxx &
{xx' (
getxx) ,
;xx, -
setxx. 1
;xx1 2
}xx3 4
publicyy 
DateTimeyy 
?yy  
FechaUltimaActividadyy -
{yy. /
getyy0 3
;yy3 4
setyy5 8
;yy8 9
}yy: ;
}zz 
}{{ áì
WD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Validations\CitaCommandValidator.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Validations! ,
{		 
public

 

class

 %
CrearCitaCommandValidator

 *
:

+ ,
AbstractValidator

- >
<

> ?
CrearCitaCommand

? O
>

O P
{ 
public %
CrearCitaCommandValidator (
(( )
ILogger) 0
<0 1%
CrearCitaCommandValidator1 J
>J K
loggerL R
)R S
{ 	
RuleFor 
( 
command 
=> 
command &
.& '
IdProspecto' 2
)2 3
.3 4
NotEmpty4 <
(< =
)= >
;> ?
RuleFor 
( 
command 
=> 
command &
.& '
CodigoEstado' 3
)3 4
.4 5
NotEmpty5 =
(= >
)> ?
;? @
RuleFor 
( 
command 
=> 
command &
.& '
CodigoLineaNegocio' 9
)9 :
.: ;
NotEmpty; C
(C D
)D E
;E F
RuleFor 
( 
command 
=> 
command &
.& '
NumeroEntrevista' 7
)7 8
.8 9
NotEmpty9 A
(A B
)B C
;C D
RuleFor 
( 
command 
=> 
command &
.& '
	FechaCita' 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
.< = 
GreaterThanOrEqualTo= Q
(Q R
DateTimeR Z
.Z [
Today[ `
)` a
;a b
RuleFor 
( 
command 
=> 
command &
.& '
NumeroEntrevista' 7
)7 8
.8 9
NotEmpty9 A
(A B
)B C
;C D
RuleFor 
( 
command 
=> 
command &
.& '
CodigoEstado' 3
)3 4
.4 5
NotEmpty5 =
(= >
)> ?
.? @
Must@ D
(D E
xE F
=>G I
xJ K
==L N
$numO P
)P Q
. 
WithMessage 
( 
$str	 Ä
)
Ä Å
;
Å Ç
When 
( 
command 
=> 
command #
.# $
NumeroEntrevista$ 4
==5 7
$num8 9
,9 :
(; <
)< =
=>> @
{A B
RuleFor 
( 
command 
=>  "
command# *
.* +
CodigoResultado+ :
): ;
.; <
Must< @
(@ A
xA B
=>C E
xF G
==H J
$numK L
)L M
. 
WithMessage 
( 
$str	 à
)
à â
;
â ä
} 
) 
; 
When 
( 
command 
=> 
command #
.# $
NumeroEntrevista$ 4
>=5 7
$num8 9
,9 :
(; <
)< =
=>> @
{A B
RuleFor 
( 
command 
=>  "
command# *
.* +
CodigoResultado+ :
): ;
.; <
NotEmpty< D
(D E
)E F
.F G
MustG K
(K L
xL M
=>N P
xQ R
==S U
$numV W
)W X
. 
WithMessage 
( 
$str	 ñ
)
ñ ó
;
ó ò
} 
) 
; 
RuleFor   
(   
command   
=>   
command   &
.  & '

HoraInicio  ' 1
)  1 2
.  2 3
NotEmpty  3 ;
(  ; <
)  < =
;  = >
RuleFor!! 
(!! 
command!! 
=>!! 
command!! &
.!!& '
HoraFin!!' .
)!!. /
.!!/ 0
NotEmpty!!0 8
(!!8 9
)!!9 :
.!!: ;
GreaterThan!!; F
(!!F G
command!!G N
=>!!O Q
command!!R Y
.!!Y Z

HoraInicio!!Z d
)!!d e
;!!e f
When## 
(## 
commmand## 
=>## 
commmand## %
.##% & 
CitaProspectoCommand##& :
!=##; =
null##> B
,##B C
(##D E
)##E F
=>##G I
{$$ 
RuleFor%% 
(%% 
command%% 
=>%%  "
command%%# *
.%%* + 
CitaProspectoCommand%%+ ?
.%%? @
TelefonoCelular%%@ O
)%%O P
.%%P Q
NotEmpty%%Q Y
(%%Y Z
)%%Z [
.&&3 4
When&&4 8
(&&8 9
command&&9 @
=>&&A C
string&&D J
.&&J K
IsNullOrEmpty&&K X
(&&X Y
command&&Y `
.&&` a 
CitaProspectoCommand&&a u
.&&u v
TelefonoFijo	&&v Ç
)
&&Ç É
)
&&É Ñ
;
&&Ñ Ö
RuleFor'' 
('' 
command'' 
=>''  "
command''# *
.''* + 
CitaProspectoCommand''+ ?
.''? @
TelefonoFijo''@ L
)''L M
.''M N
NotEmpty''N V
(''V W
)''W X
.((7 8
When((8 <
(((< =
command((= D
=>((E G
string((H N
.((N O
IsNullOrEmpty((O \
(((\ ]
command((] d
.((d e 
CitaProspectoCommand((e y
.((y z
TelefonoCelular	((z â
)
((â ä
)
((ä ã
;
((ã å
})) 
))) 
;)) 
RuleFor,, 
(,, 
command,, 
=>,, 
command,, &
.,,& '
	Ubicacion,,' 0
),,0 1
.,,1 2
MaximumLength,,2 ?
(,,? @
$num,,@ C
),,C D
;,,D E
RuleFor-- 
(-- 
command-- 
=>-- 
command-- &
.--& '
ReferenciaUbicacion--' :
)--: ;
.--; <
MaximumLength--< I
(--I J
$num--J M
)--M N
;--N O
RuleFor.. 
(.. 
command.. 
=>.. 
command.. &
...& '
Descripcion..' 2
)..2 3
...3 4
MaximumLength..4 A
(..A B
$num..B E
)..E F
;..F G
RuleFor// 
(// 
command// 
=>// 
command// &
.//& '"
AuditoriaFechaCreacion//' =
)//= >
.//> ?
NotEmpty//? G
(//G H
)//H I
;//I J
RuleFor00 
(00 
command00 
=>00 
command00 &
.00& '$
AuditoriaUsuarioCreacion00' ?
)00? @
.00@ A
NotEmpty00A I
(00I J
)00J K
;00K L
RuleFor11 
(11 
command11 
=>11 
command11 &
.11& ''
CodigoIntermediarioCreacion11' B
)11B C
.11C D
NotEmpty11D L
(11L M
)11M N
.11N O
WithMessage11O Z
(11Z [
$str	11[ ò
)
11ò ô
;
11ô ö
}22 	
}33 
public44 

class44 *
ActualizarCitaCommandValidator44 /
:440 1
AbstractValidator442 C
<44C D!
ActualizarCitaCommand44D Y
>44Y Z
{55 
public66 *
ActualizarCitaCommandValidator66 -
(66- .
ILogger66. 5
<665 6*
ActualizarCitaCommandValidator666 T
>66T U
logger66V \
)66\ ]
{77 	
RuleFor88 
(88 
command88 
=>88 
command88 &
.88& '
IdCita88' -
)88- .
.88. /
NotEmpty88/ 7
(887 8
)888 9
;889 :
RuleFor99 
(99 
command99 
=>99 
command99 &
.99& '&
AuditoriaFechaModificacion99' A
)99A B
.99B C
NotEmpty99C K
(99K L
)99L M
;99M N
RuleFor:: 
(:: 
command:: 
=>:: 
command:: &
.::& '(
AuditoriaUsuarioModificacion::' C
)::C D
.::D E
NotEmpty::E M
(::M N
)::N O
;::O P
When;; 
(;; 
command;; 
=>;; 
!;; 
string;; #
.;;# $
IsNullOrEmpty;;$ 1
(;;1 2
command;;2 9
.;;9 :
Accion;;: @
);;@ A
,;;A B
(;;C D
);;D E
=>;;F H
{<< 
RuleFor== 
(== 
command== 
=>==  "
command==# *
.==* +
Accion==+ 1
)==1 2
.==2 3
Equal==3 8
(==8 9
$str==9 E
)==E F
.==F G
WithMessage==G R
(==R S
$str==S y
)==y z
;==z {
RuleFor>> 
(>> 
command>> 
=>>>  "
command>># *
.>>* +"
CodigoMotivoReagendado>>+ A
)>>A B
.>>B C
NotEmpty>>C K
(>>K L
)>>L M
.?? 
Must?? 
(?? 
x?? 
=>?? 
(?? 
new?? 
List??  $
<??$ %
short??% *
>??* +
{??, -
$num??. /
,??/ 0
$num??0 1
}??1 2
)??2 3
.??3 4
Contains??4 <
(??< =
x??= >
.??> ?
Value??? D
)??D E
)??E F
.@@ 
WithMessage@@ 
(@@ 
$str@@ l
)@@l m
;@@m n
}AA 
)AA 
;AA 
}BB 	
}CC 
publicEE 

classEE )
CalificarCitaCommandValidatorEE .
:EE/ 0
AbstractValidatorEE1 B
<EEB C 
CalificarCitaCommandEEC W
>EEW X
{FF 
publicGG )
CalificarCitaCommandValidatorGG ,
(GG, -
ILoggerGG- 4
<GG4 5 
CalificarCitaCommandGG5 I
>GGI J
loggerGGK Q
)GGQ R
{HH 	
RuleForII 
(II 
commandII 
=>II 
commandII &
.II& '
IdCitaII' -
)II- .
.II. /
NotEmptyII/ 7
(II7 8
)II8 9
;II9 :
RuleForJJ 
(JJ 
commandJJ 
=>JJ 
commandJJ &
.JJ& '
FlagCalificacionJJ' 7
)JJ7 8
.JJ8 9
NotEmptyJJ9 A
(JJA B
)JJB C
;JJC D
RuleForKK 
(KK 
commandKK 
=>KK 
commandKK &
.KK& '"
CodigoTipoCalificacionKK' =
)KK= >
.LL 
NotEmptyLL 
(LL 
)LL 
.LL 
MustLL  
(LL  !
xLL! "
=>LL# %
(LL& '
newLL' *
ListLL+ /
<LL/ 0
shortLL0 5
>LL5 6
{LL7 8
$numLL9 :
,LL: ;
$numLL< =
}LL> ?
)LL? @
.LL@ A
ContainsLLA I
(LLI J
xLLJ K
.LLK L
ValueLLL Q
)LLQ R
)LLR S
.MM 
WithMessageMM 
(MM 
$strMM p
)MMp q
;MMq r
WhenNN 
(NN 
commandNN 
=>NN 
commandNN #
.NN# $"
CodigoTipoCalificacionNN$ :
==NN; =
$numNN> ?
,NN? @
(NNA B
)NNB C
=>NND F
{OO 
RuleForPP 
(PP 
commandPP 
=>PP  "
commandPP# *
.PP* +
FechaEstimadaCierrePP+ >
)PP> ?
.PP? @
NotEmptyPP@ H
(PPH I
)PPI J
;PPJ K
RuleForQQ 
(QQ 
commandQQ 
=>QQ  "
commandQQ# *
.QQ* +-
!CodigoTipoExperienciaCalificacionQQ+ L
)QQL M
.RR 
NotEmptyRR 
(RR 
)RR 
.RR 
MustRR  
(RR  !
xRR! "
=>RR# %
(RR& '
newRR' *
ListRR+ /
<RR/ 0
shortRR0 5
>RR5 6
{RR7 8
$numRR9 :
,RR: ;
$numRR< =
,RR= >
$numRR? @
,RR@ A
$numRRB C
,RRC D
$numRRE F
}RRG H
)RRH I
.RRI J
ContainsRRJ R
(RRR S
xRRS T
.RRT U
ValueRRU Z
)RRZ [
)RR[ \
;RR\ ]
RuleForSS 
(SS 
commandSS 
=>SS  "
commandSS# *
.SS* +.
"CodigoPorcentajeAvanceCalificacionSS+ M
)SSM N
.TT 
NotEmptyTT 
(TT 
)TT 
.TT  
MustTT  $
(TT$ %
xTT% &
=>TT' )
(TT* +
newTT+ .
ListTT/ 3
<TT3 4
shortTT4 9
>TT9 :
{TT; <
$numTT= >
,TT> ?
$numTT@ A
,TTA B
$numTTC D
,TTD E
$numTTF G
,TTG H
$numTTI J
,TTJ K
$numTTL M
}TTN O
)TTO P
.TTP Q
ContainsTTQ Y
(TTY Z
xTTZ [
.TT[ \
ValueTT\ a
)TTa b
)TTb c
;TTc d
RuleForUU 
(UU 
commandUU 
=>UU  "
commandUU# *
.UU* +(
CodigoMotivoCitaNoConcretadaUU+ G
)UUG H
.UUH I
EmptyUUI N
(UUN O
)UUO P
;UUP Q
RuleForVV 
(VV 
commandVV 
=>VV  "
commandVV# *
.VV* +
CodigoEstadoVV+ 7
)VV7 8
.VV8 9
NotEmptyVV9 A
(VVA B
)VVB C
.VVC D
MustVVD H
(VVH I
xVVI J
=>VVK M
xVVN O
==VVP R
$numVVS T
)VVT U
.WW 
WithMessageWW 
(WW 
$strWW i
)WWi j
;WWj k
RuleForXX 
(XX 
commandXX 
=>XX  "
commandXX# *
.XX* +
CodigoResultadoXX+ :
)XX: ;
.XX; <
NotEmptyXX< D
(XXD E
)XXE F
.XXF G
MustXXG K
(XXK L
xXXL M
=>XXN P
xXXQ R
==XXS U
$numXXV W
)XXW X
.YY 
WithMessageYY 
(YY 
$strYY o
)YYo p
;YYp q
}[[ 
)[[ 
;[[ 
When]] 
(]] 
command]] 
=>]] 
command]] #
.]]# $"
CodigoTipoCalificacion]]$ :
==]]; =
$num]]> ?
,]]? @
(]]A B
)]]B C
=>]]D F
{^^ 
RuleFor__ 
(__ 
command__ 
=>__  "
command__# *
.__* +
FechaEstimadaCierre__+ >
)__> ?
.__? @
Empty__@ E
(__E F
)__F G
;__G H
RuleFor`` 
(`` 
command`` 
=>``  "
command``# *
.``* +-
!CodigoTipoExperienciaCalificacion``+ L
)``L M
.``M N
Empty``N S
(``S T
)``T U
;``U V
RuleForaa 
(aa 
commandaa 
=>aa  "
commandaa# *
.aa* +.
"CodigoPorcentajeAvanceCalificacionaa+ M
)aaM N
.aaN O
EmptyaaO T
(aaT U
)aaU V
;aaV W
RuleForbb 
(bb 
commandbb 
=>bb  "
commandbb# *
.bb* +(
CodigoMotivoCitaNoConcretadabb+ G
)bbG H
.cc 
NotEmptycc 
(cc 
)cc 
.cc 
Mustcc  
(cc  !
xcc! "
=>cc# %
(cc& '
newcc' *
Listcc+ /
<cc/ 0
shortcc0 5
>cc5 6
{cc7 8
$numcc9 :
,cc: ;
$numcc< =
,cc= >
$numcc? @
,cc@ A
$numccB C
}ccD E
)ccE F
.ccF G
ContainsccG O
(ccO P
xccP Q
.ccQ R
ValueccR W
)ccW X
)ccX Y
;ccY Z
RuleFordd 
(dd 
commanddd 
=>dd  "
commanddd# *
.dd* +
CodigoEstadodd+ 7
)dd7 8
.dd8 9
NotEmptydd9 A
(ddA B
)ddB C
.ddC D
MustddD H
(ddH I
xddI J
=>ddK M
xddN O
==ddP R
$numddS T
)ddT U
.ee 
WithMessageee 
(ee 
$stree t
)eet u
;eeu v
RuleForff 
(ff 
commandff 
=>ff  "
commandff# *
.ff* +
CodigoResultadoff+ :
)ff: ;
.ff; <
NotEmptyff< D
(ffD E
)ffE F
.ffF G
MustffG K
(ffK L
xffL M
=>ffN P
xffQ R
==ffS U
$numffV W
)ffW X
.gg 
WithMessagegg 
(gg 
$strgg {
)gg{ |
;gg| }
}hh 
)hh 
;hh 
RuleForjj 
(jj 
commandjj 
=>jj 
commandjj &
.jj& '"
ComentarioCalificacionjj' =
)jj= >
.jj> ?
MaximumLengthjj? L
(jjL M
$numjjM P
)jjP Q
;jjQ R
RuleForkk 
(kk 
commandkk 
=>kk 
commandkk &
.kk& '&
AuditoriaFechaModificacionkk' A
)kkA B
.kkB C
NotEmptykkC K
(kkK L
)kkL M
;kkM N
RuleForll 
(ll 
commandll 
=>ll 
commandll &
.ll& '(
AuditoriaUsuarioModificacionll' C
)llC D
.llD E
NotEmptyllE M
(llM N
)llN O
;llO P
}mm 	
}nn 
}oo ≈´
\D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Validations\ProspectoCommandValidator.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Validations! ,
{ 
public 

class *
CrearProspectoCommandValidator /
:0 1
AbstractValidator2 C
<C D!
CrearProspectoCommandD Y
>Y Z
{		 
public

 *
CrearProspectoCommandValidator

 -
(

- .
ILogger

. 5
<

5 6*
CrearProspectoCommandValidator

6 T
>

T U
logger

V \
)

\ ]
{ 	
RuleFor 
( 
command 
=> 
command &
.& '
NumeroDocumento' 6
)6 7
.7 8
MaximumLength8 E
(E F
$numF H
)H I
;I J
RuleFor 
( 
command 
=> 
command &
.& '
Nombres' .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
WithMessage; F
(F G
$strG o
)o p
.p q
MaximumLengthq ~
(~ 
$num	 Å
)
Å Ç
;
Ç É
RuleFor 
( 
command 
=> 
command &
.& '
ApellidoPaterno' 6
)6 7
.7 8
NotEmpty8 @
(@ A
)A B
.B C
MaximumLengthC P
(P Q
$numQ S
)S T
;T U
RuleFor 
( 
command 
=> 
command &
.& '
ApellidoMaterno' 6
)6 7
.7 8
MaximumLength8 E
(E F
$numF H
)H I
;I J
RuleFor 
( 
command 
=> 
command &
.& '
CodigoFuente' 3
)3 4
.4 5
NotEmpty5 =
(= >
)> ?
;? @
RuleFor 
( 
command 
=> 
command &
.& '
Empresa' .
). /
./ 0
MaximumLength0 =
(= >
$num> @
)@ A
;A B
RuleFor 
( 
command 
=> 
command &
.& '
	OtroCargo' 0
)0 1
.1 2
MaximumLength2 ?
(? @
$num@ B
)B C
;C D
RuleFor 
( 
command 
=> 
command &
.& '
TelefonoFijo' 3
)3 4
.4 5
MaximumLength5 B
(B C
$numC E
)E F
;F G
RuleFor 
( 
command 
=> 
command &
.& '
TelefonoCelular' 6
)6 7
.7 8
MaximumLength8 E
(E F
$numF H
)H I
;I J
RuleFor 
( 
command 
=> 
command &
.& '
CorreoElectronico1' 9
)9 :
.: ;
MaximumLength; H
(H I
$numI K
)K L
;L M
RuleFor 
( 
command 
=> 
command &
.& '"
AuditoriaFechaCreacion' =
)= >
.> ?
NotEmpty? G
(G H
)H I
;I J
RuleFor 
( 
command 
=> 
command &
.& '$
AuditoriaUsuarioCreacion' ?
)? @
.@ A
NotEmptyA I
(I J
)J K
;K L
RuleFor 
( 
command 
=> 
command &
.& '
CodigoIntermediario' :
): ;
.; <
NotEmpty< D
(D E
)E F
.F G
WithMessageG R
(R S
$str	S ê
)
ê ë
;
ë í
When 
( 
command 
=> 
command #
.# $$
ProspectoAdnRentaCommand$ <
!== ?
null@ D
,D E
(F G
)G H
=>I K
{L M
RuleFor 
( 
command 
=>  "
command# *
.* +$
ProspectoAdnRentaCommand+ C
.C D
PorcentajeAvanceD T
)T U
.U V
NotEmptyV ^
(^ _
)_ `
;` a
RuleFor 
( 
command 
=>  "
command# *
.* +$
ProspectoAdnRentaCommand+ C
.C D$
PorcentajeAvanceCompletoD \
)\ ]
.] ^
NotEmpty^ f
(f g
)g h
;h i
RuleFor 
( 
command 
=>  "
command# *
.* +$
ProspectoAdnRentaCommand+ C
.C D"
AuditoriaFechaCreacionD Z
)Z [
.[ \
NotEmpty\ d
(d e
)e f
;f g
RuleFor 
( 
command 
=>  "
command# *
.* +$
ProspectoAdnRentaCommand+ C
.C D$
AuditoriaUsuarioCreacionD \
)\ ]
.] ^
NotEmpty^ f
(f g
)g h
;h i
}   
)   
;   
When"" 
("" 
command"" 
=>"" 
command"" #
.""# $%
ProspectoDireccionCommand""$ =
!=""> @
null""A E
,""E F
(""G H
)""H I
=>""J L
{""M N
RuleFor## 
(## 
command## 
=>##  "
command### *
.##* +%
ProspectoDireccionCommand##+ D
.##D E
	Direccion##E N
)##N O
.##O P
NotEmpty##P X
(##X Y
)##Y Z
;##Z [
RuleFor$$ 
($$ 
command$$ 
=>$$  "
command$$# *
.$$* +%
ProspectoDireccionCommand$$+ D
.$$D E
Departamento_Id$$E T
)$$T U
.$$U V
NotEmpty$$V ^
($$^ _
)$$_ `
;$$` a
RuleFor%% 
(%% 
command%% 
=>%%  "
command%%# *
.%%* +%
ProspectoDireccionCommand%%+ D
.%%D E
Provincia_Id%%E Q
)%%Q R
.%%R S
NotEmpty%%S [
(%%[ \
)%%\ ]
;%%] ^
RuleFor&& 
(&& 
command&& 
=>&&  "
command&&# *
.&&* +%
ProspectoDireccionCommand&&+ D
.&&D E
Distrito_Id&&E P
)&&P Q
.&&Q R
NotEmpty&&R Z
(&&Z [
)&&[ \
;&&\ ]
RuleFor'' 
('' 
command'' 
=>''  "
command''# *
.''* +%
ProspectoDireccionCommand''+ D
.''D E

FlagActivo''E O
)''O P
.''P Q
NotEmpty''Q Y
(''Y Z
)''Z [
;''[ \
RuleFor(( 
((( 
command(( 
=>((  "
command((# *
.((* +%
ProspectoDireccionCommand((+ D
.((D E"
AuditoriaFechaCreacion((E [
)(([ \
.((\ ]
NotEmpty((] e
(((e f
)((f g
;((g h
RuleFor)) 
()) 
command)) 
=>))  "
command))# *
.))* +%
ProspectoDireccionCommand))+ D
.))D E$
AuditoriaUsuarioCreacion))E ]
)))] ^
.))^ _
NotEmpty))_ g
())g h
)))h i
;))i j
}** 
)** 
;** 
}++ 	
},, 
public.. 

class.. /
#ActualizarProspectoCommandValidator.. 4
:..5 6
AbstractValidator..7 H
<..H I&
ActualizarProspectoCommand..I c
>..c d
{// 
public00 /
#ActualizarProspectoCommandValidator00 2
(002 3
ILogger003 :
<00: ;/
#ActualizarProspectoCommandValidator00; ^
>00^ _
logger00` f
)00f g
{11 	
RuleFor22 
(22 
command22 
=>22 
command22 &
.22& '
IdProspecto22' 2
)222 3
.223 4
NotEmpty224 <
(22< =
)22= >
;22> ?
RuleFor33 
(33 
command33 
=>33 
command33 &
.33& '
NumeroDocumento33' 6
)336 7
.337 8
MaximumLength338 E
(33E F
$num33F H
)33H I
;33I J
RuleFor44 
(44 
command44 
=>44 
command44 &
.44& '
Nombres44' .
)44. /
.44/ 0
NotEmpty440 8
(448 9
)449 :
.44: ;
MaximumLength44; H
(44H I
$num44I K
)44K L
;44L M
RuleFor55 
(55 
command55 
=>55 
command55 &
.55& '
ApellidoPaterno55' 6
)556 7
.557 8
NotEmpty558 @
(55@ A
)55A B
.55B C
MaximumLength55C P
(55P Q
$num55Q S
)55S T
;55T U
RuleFor66 
(66 
command66 
=>66 
command66 &
.66& '
ApellidoMaterno66' 6
)666 7
.667 8
MaximumLength668 E
(66E F
$num66F H
)66H I
;66I J
RuleFor77 
(77 
command77 
=>77 
command77 &
.77& '
CodigoFuente77' 3
)773 4
.774 5
NotEmpty775 =
(77= >
)77> ?
;77? @
RuleFor88 
(88 
command88 
=>88 
command88 &
.88& '
Empresa88' .
)88. /
.88/ 0
MaximumLength880 =
(88= >
$num88> @
)88@ A
;88A B
RuleFor99 
(99 
command99 
=>99 
command99 &
.99& '
	OtroCargo99' 0
)990 1
.991 2
MaximumLength992 ?
(99? @
$num99@ B
)99B C
;99C D
RuleFor:: 
(:: 
command:: 
=>:: 
command:: &
.::& '
TelefonoFijo::' 3
)::3 4
.::4 5
MaximumLength::5 B
(::B C
$num::C E
)::E F
;::F G
RuleFor;; 
(;; 
command;; 
=>;; 
command;; &
.;;& '
TelefonoCelular;;' 6
);;6 7
.;;7 8
MaximumLength;;8 E
(;;E F
$num;;F H
);;H I
;;;I J
RuleFor<< 
(<< 
command<< 
=><< 
command<< &
.<<& '
CorreoElectronico1<<' 9
)<<9 :
.<<: ;
MaximumLength<<; H
(<<H I
$num<<I K
)<<K L
;<<L M
RuleFor== 
(== 
command== 
=>== 
command== &
.==& '&
AuditoriaFechaModificacion==' A
)==A B
.==B C
NotEmpty==C K
(==K L
)==L M
;==M N
RuleFor>> 
(>> 
command>> 
=>>> 
command>> &
.>>& '(
AuditoriaUsuarioModificacion>>' C
)>>C D
.>>D E
NotEmpty>>E M
(>>M N
)>>N O
;>>O P
WhenAA 
(AA 
commandAA 
=>AA 
commandAA #
.AA# $$
ProspectoAdnRentaCommandAA$ <
!=AA= ?
nullAA@ D
,AAD E
(AAF G
)AAG H
=>AAI K
{AAL M
RuleForBB 
(BB 
commandBB 
=>BB  "
commandBB# *
.BB* +$
ProspectoAdnRentaCommandBB+ C
.BBC D
PorcentajeAvanceBBD T
)BBT U
.BBU V
NotEmptyBBV ^
(BB^ _
)BB_ `
;BB` a
RuleForCC 
(CC 
commandCC 
=>CC  "
commandCC# *
.CC* +$
ProspectoAdnRentaCommandCC+ C
.CCC D$
PorcentajeAvanceCompletoCCD \
)CC\ ]
.CC] ^
NotEmptyCC^ f
(CCf g
)CCg h
;CCh i
RuleForDD 
(DD 
commandDD 
=>DD  "
commandDD# *
.DD* +$
ProspectoAdnRentaCommandDD+ C
.DDC D&
AuditoriaFechaModificacionDDD ^
)DD^ _
.DD_ `
NotEmptyDD` h
(DDh i
)DDi j
;DDj k
RuleForEE 
(EE 
commandEE 
=>EE  "
commandEE# *
.EE* +$
ProspectoAdnRentaCommandEE+ C
.EEC D(
AuditoriaUsuarioModificacionEED `
)EE` a
.EEa b
NotEmptyEEb j
(EEj k
)EEk l
;EEl m
}FF 
)FF 
;FF 
WhenHH 
(HH 
commandHH 
=>HH 
commandHH #
.HH# $%
ProspectoDireccionCommandHH$ =
!=HH> @
nullHHA E
,HHE F
(HHG H
)HHH I
=>HHJ L
{HHM N
RuleForII 
(II 
commandII 
=>II  "
commandII# *
.II* +%
ProspectoDireccionCommandII+ D
.IID E
IdProspectoIIE P
)IIP Q
.IIQ R
NotEmptyIIR Z
(IIZ [
)II[ \
;II\ ]
RuleForJJ 
(JJ 
commandJJ 
=>JJ  "
commandJJ# *
.JJ* +%
ProspectoDireccionCommandJJ+ D
.JJD E
	DireccionJJE N
)JJN O
.JJO P
NotEmptyJJP X
(JJX Y
)JJY Z
;JJZ [
RuleForKK 
(KK 
commandKK 
=>KK  "
commandKK# *
.KK* +%
ProspectoDireccionCommandKK+ D
.KKD E
Departamento_IdKKE T
)KKT U
.KKU V
NotEmptyKKV ^
(KK^ _
)KK_ `
;KK` a
RuleForLL 
(LL 
commandLL 
=>LL  "
commandLL# *
.LL* +%
ProspectoDireccionCommandLL+ D
.LLD E
Provincia_IdLLE Q
)LLQ R
.LLR S
NotEmptyLLS [
(LL[ \
)LL\ ]
;LL] ^
RuleForMM 
(MM 
commandMM 
=>MM  "
commandMM# *
.MM* +%
ProspectoDireccionCommandMM+ D
.MMD E
Distrito_IdMME P
)MMP Q
.MMQ R
NotEmptyMMR Z
(MMZ [
)MM[ \
;MM\ ]
RuleForNN 
(NN 
commandNN 
=>NN  "
commandNN# *
.NN* +%
ProspectoDireccionCommandNN+ D
.NND E
TipoDireccionNNE R
)NNR S
.NNS T
NotEmptyNNT \
(NN\ ]
)NN] ^
.OO 
MustOO 
(OO 
xOO 
=>OO 
(OO 
newOO 
ListOO  $
<OO$ %
shortOO% *
>OO* +
{OO, -
$numOO. /
,OO/ 0
$numOO0 1
}OO2 3
)OO3 4
.OO4 5
ContainsOO5 =
(OO= >
xOO> ?
.OO? @
ValueOO@ E
)OOE F
)OOF G
;OOG H
WhenQQ 
(QQ 
commandQQ 
=>QQ 
commandQQ  '
.QQ' (%
ProspectoDireccionCommandQQ( A
.QQA B
IdDireccionQQB M
==QQN P
$numQQQ R
,QQR S
(QQT U
)QQU V
=>QQW Y
{QQZ [
RuleForRR 
(RR 
commandRR #
=>RR$ &
commandRR' .
.RR. /%
ProspectoDireccionCommandRR/ H
.RRH I"
AuditoriaFechaCreacionRRI _
)RR_ `
.RR` a
NotEmptyRRa i
(RRi j
)RRj k
;RRk l
RuleForSS 
(SS 
commandSS #
=>SS$ &
commandSS' .
.SS. /%
ProspectoDireccionCommandSS/ H
.SSH I$
AuditoriaUsuarioCreacionSSI a
)SSa b
.SSb c
NotEmptySSc k
(SSk l
)SSl m
;SSm n
RuleForTT 
(TT 
commandTT #
=>TT$ &
commandTT' .
.TT. /%
ProspectoDireccionCommandTT/ H
.TTH I

FlagActivoTTI S
)TTS T
.TTT U
NotEmptyTTU ]
(TT] ^
)TT^ _
;TT_ `
}UU 
)UU 
;UU 
}VV 
)VV 
;VV 
}WW 	
}XX 
publicZZ 

classZZ .
"DescartarProspectoCommandValidatorZZ 3
:ZZ4 5
AbstractValidatorZZ6 G
<ZZG H%
DescartarProspectoCommandZZH a
>ZZa b
{[[ 
public\\ .
"DescartarProspectoCommandValidator\\ 1
(\\1 2
ILogger\\2 9
<\\9 :%
DescartarProspectoCommand\\: S
>\\S T
logger\\U [
)\\[ \
{]] 	
RuleFor^^ 
(^^ 
command^^ 
=>^^ 
command^^ &
.^^& '
IdProspecto^^' 2
)^^2 3
.^^3 4
NotEmpty^^4 <
(^^< =
)^^= >
;^^> ?
RuleFor__ 
(__ 
command__ 
=>__ 
command__ &
.__& '
FlagDescarte__' 3
)__3 4
.__4 5
NotEmpty__5 =
(__= >
)__> ?
;__? @
When`` 
(`` 
command`` 
=>`` 
command`` #
.``# $#
CodigoMotivoUnoDescarte``$ ;
==``< >
$num``? @
,``@ A
(``B C
)``C D
=>``E G
{aa 
RuleForbb 
(bb 
commandbb "
=>bb# %
commandbb& -
.bb- .#
CodigoMotivoDosDescartebb. E
)bbE F
.cc 
NotEmptycc 
(cc 
)cc 
.cc 
Mustcc  
(cc  !
xcc! "
=>cc# %
(cc& '
newcc' *
Listcc+ /
<cc/ 0
shortcc0 5
>cc5 6
{cc7 8
$numcc9 ;
,cc; <
$numcc= ?
,cc? @
$numcc@ B
}ccC D
)ccD E
.ccE F
ContainsccF N
(ccN O
xccO P
.ccP Q
ValueccQ V
)ccV W
)ccW X
;ccX Y
}dd 
)dd 
;dd 
Whenff 
(ff 
commandff 
=>ff 
commandff #
.ff# $#
CodigoMotivoUnoDescarteff$ ;
==ff< >
$numff? @
,ff@ A
(ffB C
)ffC D
=>ffE G
{gg 
RuleForhh 
(hh 
commandhh 
=>hh  "
commandhh# *
.hh* +#
CodigoMotivoDosDescartehh+ B
)hhB C
.ii 
NotEmptyii 
(ii 
)ii 
.ii 
Mustii  
(ii  !
xii! "
=>ii# %
(ii& '
newii' *
Listii+ /
<ii/ 0
shortii0 5
>ii5 6
{ii7 8
$numii9 ;
,ii; <
$numii= ?
}ii@ A
)iiA B
.iiB C
ContainsiiC K
(iiK L
xiiL M
.iiM N
ValueiiN S
)iiS T
)iiT U
;iiU V
}jj 
)jj 
;jj 
Whenll 
(ll 
commandll 
=>ll 
commandll #
.ll# $#
CodigoMotivoUnoDescartell$ ;
==ll< >
$numll? @
,ll@ A
(llB C
)llC D
=>llE G
{mm 
RuleFornn 
(nn 
commandnn 
=>nn  "
commandnn# *
.nn* +#
CodigoMotivoDosDescartenn+ B
)nnB C
.oo 
NotEmptyoo 
(oo 
)oo 
.oo 
Mustoo  
(oo  !
xoo! "
=>oo# %
(oo& '
newoo' *
Listoo+ /
<oo/ 0
shortoo0 5
>oo5 6
{oo7 8
$numoo9 ;
,oo; <
$numoo= ?
,oo? @
$numoo@ B
,ooB C
$numooC E
}ooF G
)ooG H
.ooH I
ContainsooI Q
(ooQ R
xooR S
.ooS T
ValueooT Y
)ooY Z
)ooZ [
;oo[ \
}pp 
)pp 
;pp 
Whenrr 
(rr 
commandrr 
=>rr 
commandrr #
.rr# $#
CodigoMotivoUnoDescarterr$ ;
==rr< >
$numrr? @
,rr@ A
(rrB C
)rrC D
=>rrE G
{ss 
RuleFortt 
(tt 
commandtt 
=>tt  "
commandtt# *
.tt* +#
CodigoMotivoDosDescartett+ B
)ttB C
.uu 
NotEmptyuu 
(uu 
)uu 
.uu 
Mustuu  
(uu  !
xuu! "
=>uu# %
(uu& '
newuu' *
Listuu+ /
<uu/ 0
shortuu0 5
>uu5 6
{uu7 8
$numuu9 ;
,uu; <
$numuu= ?
,uu? @
$numuuA C
}uuC D
)uuD E
.uuE F
ContainsuuF N
(uuN O
xuuO P
.uuP Q
ValueuuQ V
)uuV W
)uuW X
;uuX Y
}vv 
)vv 
;vv 
}zz 	
}{{ 
}|| ˆ2
fD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Validations\RecordatorioLlamadaCommandValidator.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Validations! ,
{ 
public 

class 4
(CrearRecordatorioLlamadaCommandValidator 9
:: ;
AbstractValidator< M
<M N+
CrearRecordatorioLlamadaCommandN m
>m n
{ 
public		 4
(CrearRecordatorioLlamadaCommandValidator		 7
(		7 8
ILogger		8 ?
<		? @+
CrearRecordatorioLlamadaCommand		@ _
>		_ `
logger		a g
)		g h
{

 	
RuleFor 
( 
command 
=> 
command &
.& '
IdProspecto' 2
)2 3
.3 4
NotEmpty4 <
(< =
)= >
;> ?
RuleFor 
( 
command 
=> 
command &
.& '
CodigoLineaNegocio' 9
)9 :
.: ;
NotEmpty; C
(C D
)D E
;E F
RuleFor 
( 
command 
=> 
command &
.& '
FechaRecordatorio' 8
)8 9
.9 :
NotEmpty: B
(B C
)C D
;D E
RuleFor 
( 
command 
=> 
command &
.& '

HoraInicio' 1
)1 2
.2 3
NotEmpty3 ;
(; <
)< =
;= >
RuleFor 
( 
command 
=> 
command &
.& '
HoraFin' .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
;: ;
RuleFor 
( 
command 
=> 
command &
.& '/
#RecordatorioLlamadaProspectoCommand' J
.J K
TelefonoFijoK W
)W X
.X Y
MaximumLengthY f
(f g
$numg i
)i j
;j k
RuleFor 
( 
command 
=> 
command &
.& '/
#RecordatorioLlamadaProspectoCommand' J
.J K
TelefonoCelularK Z
)Z [
.[ \
MaximumLength\ i
(i j
$numj l
)l m
;m n
RuleFor 
( 
command 
=> 
command &
.& '
Descripcion' 2
)2 3
.3 4
MaximumLength4 A
(A B
$numB E
)E F
;F G
RuleFor 
( 
command 
=> 
command &
.& '"
AuditoriaFechaCreacion' =
)= >
.> ?
NotEmpty? G
(G H
)H I
;I J
RuleFor 
( 
command 
=> 
command &
.& '$
AuditoriaUsuarioCreacion' ?
)? @
.@ A
NotEmptyA I
(I J
)J K
;K L
RuleFor 
( 
command 
=> 
command &
.& '/
#RecordatorioLlamadaProspectoCommand' J
.J K
TelefonoCelularK Z
)Z [
.[ \
NotEmpty\ d
(d e
)e f
.3 4
When4 8
(8 9
command9 @
=>A C
stringD J
.J K
IsNullOrEmptyK X
(X Y
commandY `
.` a0
#RecordatorioLlamadaProspectoCommand	a Ñ
.
Ñ Ö
TelefonoFijo
Ö ë
)
ë í
)
í ì
;
ì î
RuleFor 
( 
command 
=> 
command &
.& '/
#RecordatorioLlamadaProspectoCommand' J
.J K
TelefonoFijoK W
)W X
.X Y
NotEmptyY a
(a b
)b c
.3 4
When4 8
(8 9
command9 @
=>A C
stringD J
.J K
IsNullOrEmptyK X
(X Y
commandY `
.` a0
#RecordatorioLlamadaProspectoCommand	a Ñ
.
Ñ Ö
TelefonoCelular
Ö î
)
î ï
)
ï ñ
;
ñ ó
} 	
} 
public 

class 9
-ActualizarRecordatorioLlamadaCommandValidator >
:? @
AbstractValidatorA R
<R S0
$ActualizarRecordatorioLlamadaCommandS w
>w x
{ 
public 9
-ActualizarRecordatorioLlamadaCommandValidator <
(< =
ILogger= D
<D E9
-ActualizarRecordatorioLlamadaCommandValidatorE r
>r s
loggert z
)z {
{ 	
RuleFor   
(   
command   
=>   
command   &
.  & '!
IdRecordatorioLlamada  ' <
)  < =
.  = >
NotEmpty  > F
(  F G
)  G H
;  H I
RuleFor!! 
(!! 
command!! 
=>!! 
command!! &
.!!& '&
AuditoriaFechaModificacion!!' A
)!!A B
.!!B C
NotEmpty!!C K
(!!K L
)!!L M
;!!M N
RuleFor"" 
("" 
command"" 
=>"" 
command"" &
.""& '(
AuditoriaUsuarioModificacion""' C
)""C D
.""D E
NotEmpty""E M
(""M N
)""N O
;""O P
When## 
(## 
command## 
=>## 
!## 
string## #
.### $
IsNullOrEmpty##$ 1
(##1 2
command##2 9
.##9 :
Accion##: @
)##@ A
,##A B
(##C D
)##D E
=>##F H
{$$ 
RuleFor%% 
(%% 
command%% 
=>%%  "
command%%# *
.%%* +
Accion%%+ 1
)%%1 2
.%%2 3
Equal%%3 8
(%%8 9
$str%%9 E
)%%E F
.%%F G
WithMessage%%G R
(%%R S
$str%%S y
)%%y z
;%%z {
}&& 
)&& 
;&& 
}'' 	
}(( 
})) ˛-
ZD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Application\Validations\ReunionCommandValidator.cs
	namespace 	
Agenda
 
. 
API 
. 
Application  
.  !
Validations! ,
{ 
public 

class (
CrearReunionCommandValidator -
:. /
AbstractValidator0 A
<A B
CrearReunionCommandB U
>U V
{ 
public		 (
CrearReunionCommandValidator		 +
(		+ ,
ILogger		, 3
<		3 4(
CrearReunionCommandValidator		4 P
>		P Q
logger		R X
)		X Y
{

 	
RuleFor 
( 
command 
=> 
command &
.& '&
IdConsolidadoIntermediario' A
)A B
.B C
NotEmptyC K
(K L
)L M
.M N
WithMessageN Y
(Y Z
$str	Z ó
)
ó ò
;
ò ô
RuleFor 
( 
command 
=> 
command &
.& '
CodigoTipoReunion' 8
)8 9
.9 :
NotEmpty: B
(B C
)C D
;D E
RuleFor 
( 
command 
=> 
command &
.& '
FechaReunion' 3
)3 4
.4 5
NotEmpty5 =
(= >
)> ?
;? @
RuleFor 
( 
command 
=> 
command &
.& '

HoraInicio' 1
)1 2
.2 3
NotEmpty3 ;
(; <
)< =
;= >
RuleFor 
( 
command 
=> 
command &
.& '
HoraFin' .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
GreaterThan; F
(F G
commandG N
=>O Q
commandR Y
.Y Z

HoraInicioZ d
)d e
;e f
RuleFor 
( 
command 
=> 
command &
.& '
	Ubicacion' 0
)0 1
.1 2
MaximumLength2 ?
(? @
$num@ C
)C D
;D E
RuleFor 
( 
command 
=> 
command &
.& '
ReferenciaUbicacion' :
): ;
.; <
MaximumLength< I
(I J
$numJ M
)M N
;N O
RuleFor 
( 
command 
=> 
command &
.& '"
AuditoriaFechaCreacion' =
)= >
.> ?
NotEmpty? G
(G H
)H I
;I J
RuleFor 
( 
command 
=> 
command &
.& '$
AuditoriaUsuarioCreacion' ?
)? @
.@ A
NotEmptyA I
(I J
)J K
;K L
} 	
} 
public 

class -
!ActualizarReunionCommandValidator 2
:3 4
AbstractValidator5 F
<F G$
ActualizarReunionCommandG _
>_ `
{ 
public -
!ActualizarReunionCommandValidator 0
(0 1
ILogger1 8
<8 9$
ActualizarReunionCommand9 Q
>Q R
loggerS Y
)Y Z
{ 	
RuleFor 
( 
command 
=> 
command &
.& '
	IdReunion' 0
)0 1
.1 2
NotEmpty2 :
(: ;
); <
;< =
RuleFor 
( 
command 
=> 
command &
.& '
FechaReunion' 3
)3 4
.4 5
NotEmpty5 =
(= >
)> ?
;? @
RuleFor 
( 
command 
=> 
command &
.& '

HoraInicio' 1
)1 2
.2 3
NotEmpty3 ;
(; <
)< =
;= >
RuleFor 
( 
command 
=> 
command &
.& '
HoraFin' .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
GreaterThan; F
(F G
commandG N
=>O Q
commandR Y
.Y Z

HoraInicioZ d
)d e
;e f
RuleFor 
( 
command 
=> 
command &
.& '&
AuditoriaFechaModificacion' A
)A B
.B C
NotEmptyC K
(K L
)L M
;M N
RuleFor   
(   
command   
=>   
command   &
.  & '(
AuditoriaUsuarioModificacion  ' C
)  C D
.  D E
NotEmpty  E M
(  M N
)  N O
;  O P
When!! 
(!! 
command!! 
=>!! 
!!! 
string!! #
.!!# $
IsNullOrEmpty!!$ 1
(!!1 2
command!!2 9
.!!9 :
Accion!!: @
)!!@ A
,!!A B
(!!C D
)!!D E
=>!!F H
{"" 
RuleFor## 
(## 
command## 
=>##  "
command### *
.##* +
Accion##+ 1
)##1 2
.##2 3
Equal##3 8
(##8 9
$str##9 C
)##C D
.##D E
WithMessage##E P
(##P Q
$str##Q u
)##u v
;##v w
}$$ 
)$$ 
;$$ 
}%% 	
}&& 
}(( Ï
MD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Configurations\HeaderConfiguration.cs
	namespace 	
Agenda
 
. 
API 
. 
Configurations #
{ 
public 

class 
HeaderConfiguration $
:% & 
IHeaderConfiguration' ;
{ 
public 
string 
idTransaccion #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public		 
string		 
nombreAplicacion		 &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
string

 
usuarioAplicacion

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
public 
int 
idIntermediario "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
CodigoIntermediario )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
correlationId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
AuditRequest 
auditRequest (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ⁄í
KD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Controllers\CalendarioController.cs
	namespace 	
Agenda
 
. 
API 
. 
Controllers  
{ 
[ 
ApiController 
] 
public 

class  
CalendarioController %
:& '
ControllerBase( 6
{ 
private 
readonly 
ILogger  
<  ! 
CalendarioController! 5
>5 6
_logger7 >
;> ?
private 
readonly 
ICalendarioQueries +
_calendarioQueries, >
;> ?
private 
readonly 
IImpresionLog &
_impresionLog' 4
;4 5
private 
readonly  
IHeaderConfiguration - 
_headerConfiguration. B
;B C
public  
CalendarioController #
(# $
ILogger$ +
<+ , 
CalendarioController, @
>@ A
loggerB H
,H I
ICalendarioQueries# 5
calendarioQueries6 G
,G H
IImpresionLog# 0
impresionLog1 =
,= > 
IHeaderConfiguration# 7
headerConfiguration8 K
)K L
{ 	
_logger   
=   
logger   
??   
throw    %
new  & )!
ArgumentNullException  * ?
(  ? @
nameof  @ F
(  F G
logger  G M
)  M N
)  N O
;  O P
_calendarioQueries!! 
=!!  
calendarioQueries!!! 2
??!!3 5
throw!!6 ;
new!!< ?!
ArgumentNullException!!@ U
(!!U V
nameof!!V \
(!!\ ]
calendarioQueries!!] n
)!!n o
)!!o p
;!!p q
_impresionLog"" 
="" 
impresionLog"" (
??"") +
throw"", 1
new""2 5!
ArgumentNullException""6 K
(""K L
nameof""L R
(""R S
impresionLog""S _
)""_ `
)""` a
;""a b 
_headerConfiguration##  
=##! "
headerConfiguration### 6
??##7 9
throw##: ?
new##@ C!
ArgumentNullException##D Y
(##Y Z
nameof##Z `
(##` a
headerConfiguration##a t
)##t u
)##u v
;##v w
}$$ 	
[&& 	
HttpGet&&	 
]&& 
['' 	
Route''	 
('' 
$str'' .
)''. /
]''/ 0
[(( 	
SwaggerOperation((	 
((( 
Summary(( !
=((" #
$str(($ 8
,((8 9
Description((: E
=((F G
$str((H \
)((\ ]
]((] ^
[)) 	
SwaggerResponse))	 
()) 
StatusCodes)) $
.))$ %
Status200OK))% 0
,))0 1
type))2 6
:))6 7
typeof))8 >
())> ?
ResponseModel))? L
<))L M
List))M Q
<))Q R
SemanaCalendario))R b
>))b c
>))c d
)))d e
)))e f
]))f g
[++ 	
SwaggerResponse++	 
(++ 
StatusCodes++ $
.++$ %(
Status500InternalServerError++% A
,++A B
type++C G
:++G H
typeof++I O
(++O P
ResponseModel++P ]
<++] ^
List++^ b
<++b c
SemanaCalendario++c s
>++s t
>++t u
)++u v
)++v w
]++w x
[,, 	"
SwaggerResponseExample,,	 
(,,  
StatusCodes,,  +
.,,+ ,(
Status500InternalServerError,,, H
,,,H I
typeof,,J P
(,,P Q.
"ResponseInternalServerModelExample,,Q s
),,s t
),,t u
],,u v
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
ResponseModel..' 4
<..4 5
List..5 9
<..9 :
SemanaCalendario..: J
>..J K
>..K L
>..L M
>..M N#
ObtenerSemanaCalendario..O f
(..f g
string..g m
fechaactual..n y
)..y z
{// 	
	Stopwatch00 
timeMeasure00 !
=00" #
new00$ '
	Stopwatch00( 1
(001 2
)002 3
;003 4
timeMeasure11 
.11 
Start11 
(11 
)11 
;11  
int33 
intermediario33 
=33 
string33  &
.33& '
IsNullOrEmpty33' 4
(334 5 
_headerConfiguration335 I
.33I J
CodigoIntermediario33J ]
)33] ^
?33_ ` 
_headerConfiguration33a u
.33u v
idIntermediario	33v Ö
:
33Ü á
int
33à ã
.
33ã å
Parse
33å ë
(
33ë í"
_headerConfiguration
33í ¶
.
33¶ ß!
CodigoIntermediario
33ß ∫
)
33∫ ª
;
33ª º
_impresionLog55 
.55 
InicioMetodo55 &
(55& '
$str55' @
,55@ A 
_headerConfiguration55B V
.55V W
idTransaccion55W d
,55d e 
_headerConfiguration55f z
.55z {
correlationId	55{ à
,
55à â
$str
55ä £
)
55£ §
;
55§ •
_logger66 
.66 
LogInformation66 "
(66" #
$str66# -
,66- .
$str66/ K
+66L M
$str66N V
+66W X 
_headerConfiguration66Y m
.66m n
idTransaccion66n {
+66| }
$str	66~ á
+
66à â"
_headerConfiguration
66ä û
.
66û ü
correlationId
66ü ¨
+
66≠ Æ
$str
66Ø ≤
+
66≥ ¥
$str
66µ  
+
66À Ã
JsonConvert77  
.77  !
SerializeObject77! 0
(770 1 
_headerConfiguration771 E
.77E F
auditRequest77F R
,77R S

Formatting77T ^
.77^ _
Indented77_ g
)77g h
+77i j
$str77k x
+77y z
fechaactual	77{ Ü
+
77á à
$str
77â û
+
77ü †"
_headerConfiguration
77° µ
.
77µ ∂
idIntermediario
77∂ ≈
+
77∆ «
$str
77» „
+
77‰ Â"
_headerConfiguration
77Ê ˙
.
77˙ ˚!
CodigoIntermediario
77˚ é
)
77é è
;
77è ê
var99 
result99 
=99 
await99 
_calendarioQueries99 1
.991 2#
ObtenerSemanaCalendario992 I
(99I J
fechaactual99J U
,99U V
intermediario99W d
)99d e
;99e f
result:: 
.:: 
auditResponse::  
.::  !
idTransaccion::! .
=::/ 0 
_headerConfiguration::1 E
.::E F
idTransaccion::F S
;::S T
timeMeasure<< 
.<< 
Stop<< 
(<< 
)<< 
;<< 
_impresionLog== 
.== 
DatosFinMetodo== (
(==( )
$str==) B
,==B C 
_headerConfiguration==D X
.==X Y
idTransaccion==Y f
,==f g 
_headerConfiguration==h |
.==| }
correlationId	==} ä
,
==ä ã
result
==å í
)
==í ì
;
==ì î
_impresionLog>> 
.>> 
	FinMetodo>> #
(>># $
$str>>$ =
,>>= > 
_headerConfiguration>>? S
.>>S T
idTransaccion>>T a
,>>a b 
_headerConfiguration>>c w
.>>w x
correlationId	>>x Ö
,
>>Ö Ü
$str
>>á †
,
>>† °
timeMeasure
>>¢ ≠
.
>>≠ Æ
Elapsed
>>Æ µ
.
>>µ ∂
TotalMilliseconds
>>∂ «
.
>>« »
ToString
>>» –
(
>>– —
)
>>— “
)
>>“ ”
;
>>” ‘
return@@ 
Ok@@ 
(@@ 
result@@ 
)@@ 
;@@ 
}AA 	
[CC 	
HttpGetCC	 
]CC 
[DD 	
RouteDD	 
(DD 
$strDD .
)DD. /
]DD/ 0
[EE 	
SwaggerOperationEE	 
(EE 
SummaryEE !
=EE" #
$strEE$ A
,EEA B
DescriptionEEC N
=EEO P
$strEEQ n
)EEn o
]EEo p
[FF 	
SwaggerResponseFF	 
(FF 
StatusCodesFF $
.FF$ %
Status200OKFF% 0
,FF0 1
typeFF2 6
:FF6 7
typeofFF8 >
(FF> ?
ResponseModelFF? L
<FFL M
ListFFM Q
<FFQ R
SemanaCalendarioFFR b
>FFb c
>FFc d
)FFd e
)FFe f
]FFf g
[HH 	
SwaggerResponseHH	 
(HH 
StatusCodesHH $
.HH$ %(
Status500InternalServerErrorHH% A
,HHA B
typeHHC G
:HHG H
typeofHHI O
(HHO P
ResponseModelHHP ]
<HH] ^
ListHH^ b
<HHb c
SemanaCalendarioHHc s
>HHs t
>HHt u
)HHu v
)HHv w
]HHw x
[II 	"
SwaggerResponseExampleII	 
(II  
StatusCodesII  +
.II+ ,(
Status500InternalServerErrorII, H
,IIH I
typeofIIJ P
(IIP Q.
"ResponseInternalServerModelExampleIIQ s
)IIs t
)IIt u
]IIu v
publicKK 
asyncKK 
TaskKK 
<KK 
ActionResultKK &
<KK& '
ResponseModelKK' 4
<KK4 5
ListKK5 9
<KK9 :
ActividadReporteKK: J
>KKJ K
>KKK L
>KKL M
>KKM N*
ObtenerReporteActividadSemanalKKO m
(KKm n
stringKKn t
fechaactual	KKu Ä
)
KKÄ Å
{LL 	
	StopwatchMM 
timeMeasureMM !
=MM" #
newMM$ '
	StopwatchMM( 1
(MM1 2
)MM2 3
;MM3 4
timeMeasureNN 
.NN 
StartNN 
(NN 
)NN 
;NN  
stringOO 
intermediarioOO  
=OO! "
stringOO# )
.OO) *
IsNullOrEmptyOO* 7
(OO7 8 
_headerConfigurationOO8 L
.OOL M
CodigoIntermediarioOOM `
)OO` a
?OOc d 
_headerConfigurationOOe y
.OOy z
idIntermediario	OOz â
.
OOâ ä
ToString
OOä í
(
OOí ì
)
OOì î
:
OOï ñ"
_headerConfiguration
OOó ´
.
OO´ ¨!
CodigoIntermediario
OO¨ ø
;
OOø ¿
_impresionLogQQ 
.QQ 
InicioMetodoQQ &
(QQ& '
$strQQ' @
,QQ@ A 
_headerConfigurationQQB V
.QQV W
idTransaccionQQW d
,QQd e 
_headerConfigurationQQf z
.QQz {
correlationId	QQ{ à
,
QQà â
$str
QQä £
)
QQ£ §
;
QQ§ •
_loggerRR 
.RR 
LogInformationRR "
(RR" #
$strRR# -
,RR- .
$strRR/ K
+RRL M
$strRRN V
+RRW X 
_headerConfigurationRRY m
.RRm n
idTransaccionRRn {
+RR| }
$str	RR~ á
+
RRà â"
_headerConfiguration
RRä û
.
RRû ü
correlationId
RRü ¨
+
RR≠ Æ
$str
RRØ ≤
+
RR≥ ¥
$str
RRµ  
+
RRÀ Ã
JsonConvertSS  
.SS  !
SerializeObjectSS! 0
(SS0 1 
_headerConfigurationSS1 E
.SSE F
auditRequestSSF R
,SSR S

FormattingSST ^
.SS^ _
IndentedSS_ g
)SSg h
+SSi j
$strSSk x
+SSy z
fechaactual	SS{ Ü
+
SSá à
$str
SSâ û
+
SSü †"
_headerConfiguration
SS° µ
.
SSµ ∂
idIntermediario
SS∂ ≈
)
SS≈ ∆
;
SS∆ «
varUU 
resultUU 
=UU 
awaitUU 
_calendarioQueriesUU 1
.UU1 2*
ObtenerReporteActividadSemanalUU2 P
(UUP Q
fechaactualUUQ \
,UU\ ]
intermediarioUU^ k
)UUk l
;UUl m
resultVV 
.VV 
auditResponseVV  
.VV  !
idTransaccionVV! .
=VV/ 0 
_headerConfigurationVV1 E
.VVE F
idTransaccionVVF S
;VVS T
timeMeasureXX 
.XX 
StopXX 
(XX 
)XX 
;XX 
_impresionLogYY 
.YY 
DatosFinMetodoYY (
(YY( )
$strYY) B
,YYB C 
_headerConfigurationYYD X
.YYX Y
idTransaccionYYY f
,YYf g 
_headerConfigurationYYh |
.YY| }
correlationId	YY} ä
,
YYä ã
result
YYå í
)
YYí ì
;
YYì î
_impresionLogZZ 
.ZZ 
	FinMetodoZZ #
(ZZ# $
$strZZ$ =
,ZZ= > 
_headerConfigurationZZ? S
.ZZS T
idTransaccionZZT a
,ZZa b 
_headerConfigurationZZc w
.ZZw x
correlationId	ZZx Ö
,
ZZÖ Ü
$str
ZZá †
,
ZZ† °
timeMeasure
ZZ¢ ≠
.
ZZ≠ Æ
Elapsed
ZZÆ µ
.
ZZµ ∂
TotalMilliseconds
ZZ∂ «
.
ZZ« »
ToString
ZZ» –
(
ZZ– —
)
ZZ— “
)
ZZ“ ”
;
ZZ” ‘
return\\ 
Ok\\ 
(\\ 
result\\ 
)\\ 
;\\ 
}]] 	
[__ 	
HttpGet__	 
]__ 
[`` 	
Route``	 
(`` 
$str`` #
)``# $
]``$ %
[aa 	
SwaggerOperationaa	 
(aa 
Summaryaa !
=aa" #
$straa$ E
,aaE F
DescriptionaaG R
=aaS T
$straaU v
)aav w
]aaw x
[bb 	
SwaggerResponsebb	 
(bb 
StatusCodesbb $
.bb$ %
Status200OKbb% 0
,bb0 1
typebb2 6
:bb6 7
typeofbb8 >
(bb> ?
ResponseModelbb? L
<bbL M
ListbbM Q
<bbQ R
SemanaCalendariobbR b
>bbb c
>bbc d
)bbd e
)bbe f
]bbf g
[dd 	
SwaggerResponsedd	 
(dd 
StatusCodesdd $
.dd$ %(
Status500InternalServerErrordd% A
,ddA B
typeddC G
:ddG H
typeofddI O
(ddO P
ResponseModelddP ]
<dd] ^
Listdd^ b
<ddb c
Intermediarioddc p
>ddp q
>ddq r
)ddr s
)dds t
]ddt u
[ee 	"
SwaggerResponseExampleee	 
(ee  
StatusCodesee  +
.ee+ ,(
Status500InternalServerErroree, H
,eeH I
typeofeeJ P
(eeP Q.
"ResponseInternalServerModelExampleeeQ s
)ees t
)eet u
]eeu v
publicgg 
asyncgg 
Taskgg 
<gg 
ActionResultgg &
<gg& '
ResponseModelgg' 4
<gg4 5
Listgg5 9
<gg9 :
Intermediariogg: G
>ggG H
>ggH I
>ggI J
>ggJ K(
ObtenerAsesoresPorSupervisorggL h
(ggh i
)ggi j
{hh 	
	Stopwatchii 
timeMeasureii !
=ii" #
newii$ '
	Stopwatchii( 1
(ii1 2
)ii2 3
;ii3 4
timeMeasurejj 
.jj 
Startjj 
(jj 
)jj 
;jj  
_impresionLogll 
.ll 
InicioMetodoll &
(ll& '
$strll' A
,llA B 
_headerConfigurationllC W
.llW X
idTransaccionllX e
,lle f 
_headerConfigurationllg {
.ll{ |
correlationId	ll| â
,
llâ ä
$str
llã ©
)
ll© ™
;
ll™ ´
_loggermm 
.mm 
LogInformationmm "
(mm" #
$strmm# -
,mm- .
$strmm/ L
+mmM N
$strmmO W
+mmX Y 
_headerConfigurationmmZ n
.mmn o
idTransaccionmmo |
+mm} ~
$str	mm à
+
mmâ ä"
_headerConfiguration
mmã ü
.
mmü †
correlationId
mm† ≠
+
mmÆ Ø
$str
mm∞ ≥
+
mm¥ µ
$str
mm∂ À
+
mmÃ Õ
JsonConvertnn  
.nn  !
SerializeObjectnn! 0
(nn0 1 
_headerConfigurationnn1 E
.nnE F
auditRequestnnF R
,nnR S

FormattingnnT ^
.nn^ _
Indentednn_ g
)nng h
+nni j
$str	nnk Ä
+
nnÅ Ç"
_headerConfiguration
nnÉ ó
.
nnó ò
idIntermediario
nnò ß
)
nnß ®
;
nn® ©
varpp 
resultpp 
=pp 
awaitpp 
_calendarioQueriespp 1
.pp1 2(
ObtenerAsesoresPorSupervisorpp2 N
(ppN O 
_headerConfigurationppO c
.ppc d
idIntermediarioppd s
)pps t
;ppt u
resultqq 
.qq 
auditResponseqq  
.qq  !
idTransaccionqq! .
=qq/ 0 
_headerConfigurationqq1 E
.qqE F
idTransaccionqqF S
;qqS T
timeMeasuress 
.ss 
Stopss 
(ss 
)ss 
;ss 
_impresionLogtt 
.tt 
DatosFinMetodott (
(tt( )
$strtt) C
,ttC D 
_headerConfigurationttE Y
.ttY Z
idTransaccionttZ g
,ttg h 
_headerConfigurationtti }
.tt} ~
correlationId	tt~ ã
,
ttã å
result
ttç ì
)
ttì î
;
ttî ï
_impresionLoguu 
.uu 
	FinMetodouu #
(uu# $
$struu$ >
,uu> ? 
_headerConfigurationuu@ T
.uuT U
idTransaccionuuU b
,uub c 
_headerConfigurationuud x
.uux y
correlationId	uuy Ü
,
uuÜ á
$str
uuà ¶
,
uu¶ ß
timeMeasure
uu® ≥
.
uu≥ ¥
Elapsed
uu¥ ª
.
uuª º
TotalMilliseconds
uuº Õ
.
uuÕ Œ
ToString
uuŒ ÷
(
uu÷ ◊
)
uu◊ ÿ
)
uuÿ Ÿ
;
uuŸ ⁄
returnww 
Okww 
(ww 
resultww 
)ww 
;ww 
}xx 	
}yy 
}zz ¸Å
ED:\Proyecto-Agenda-Mejoras-1\Agenda.API\Controllers\CitaController.cs
	namespace 	
Agenda
 
. 
API 
. 
Controllers  
{ 
[ 
ApiController 
] 
public 

class 
CitaController 
:  !
ControllerBase" 0
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
ILogger  
<  !
CitaController! /
>/ 0
_logger1 8
;8 9
private 
readonly 
ICitaQueries %
_citaQueries& 2
;2 3
private 
readonly 
IImpresionLog &
_impresionLog' 4
;4 5
private 
readonly  
IHeaderConfiguration - 
_headerConfiguration. B
;B C
public 
CitaController 
( 
	IMediator '
mediator( 0
,0 1
ILogger# *
<* +
CitaController+ 9
>9 :
logger; A
,A B
ICitaQueries# /
citaQueries0 ;
,; <
IImpresionLog  # 0
impresionLog  1 =
,  = > 
IHeaderConfiguration!!# 7
headerConfiguration!!8 K
)!!K L
{"" 	
	_mediator## 
=## 
mediator##  
??##! #
throw##$ )
new##* -!
ArgumentNullException##. C
(##C D
nameof##D J
(##J K
mediator##K S
)##S T
)##T U
;##U V
_logger$$ 
=$$ 
logger$$ 
??$$ 
throw$$  %
new$$& )!
ArgumentNullException$$* ?
($$? @
nameof$$@ F
($$F G
logger$$G M
)$$M N
)$$N O
;$$O P
_citaQueries%% 
=%% 
citaQueries%% &
??%%' )
throw%%* /
new%%0 3!
ArgumentNullException%%4 I
(%%I J
nameof%%J P
(%%P Q
citaQueries%%Q \
)%%\ ]
)%%] ^
;%%^ _
_impresionLog&& 
=&& 
impresionLog&& (
??&&) +
throw&&, 1
new&&2 5!
ArgumentNullException&&6 K
(&&K L
nameof&&L R
(&&R S
impresionLog&&S _
)&&_ `
)&&` a
;&&a b 
_headerConfiguration''  
=''! "
headerConfiguration''# 6
??''7 9
throw'': ?
new''@ C!
ArgumentNullException''D Y
(''Y Z
nameof''Z `
(''` a
headerConfiguration''a t
)''t u
)''u v
;''v w
})) 	
[++ 	
Route++	 
(++ 
$str++ 
)++ 
]++ 
[,, 	
HttpPost,,	 
],, 
[-- 	
SwaggerOperation--	 
(-- 
Summary-- !
=--" #
$str--$ 2
,--2 3
Description--4 ?
=--@ A
$str--B P
)--P Q
]--Q R
[.. 	!
SwaggerRequestExample..	 
(.. 
typeof.. %
(..% &
CrearCitaCommand..& 6
)..6 7
,..7 8
typeof..9 ?
(..? @*
RequestCrearCitaCommandExample..@ ^
)..^ _
).._ `
]..` a
[// 	
SwaggerResponse//	 
(// 
StatusCodes// $
.//$ %
Status201Created//% 5
,//5 6
type//7 ;
://; <
typeof//= C
(//C D
ResponseModel//D Q
<//Q R

EntidadDto//R \
>//\ ]
)//] ^
)//^ _
]//_ `
[00 	"
SwaggerResponseExample00	 
(00  
StatusCodes00  +
.00+ ,
Status201Created00, <
,00< =
typeof00> D
(00D E+
ResponseCrearCitaCommandExample00E d
)00d e
)00e f
]00f g
[11 	
SwaggerResponse11	 
(11 
StatusCodes11 $
.11$ %(
Status500InternalServerError11% A
,11A B
type11C G
:11G H
typeof11I O
(11O P
ResponseModel11P ]
<11] ^

EntidadDto11^ h
>11h i
)11i j
)11j k
]11k l
[22 	"
SwaggerResponseExample22	 
(22  
StatusCodes22  +
.22+ ,(
Status500InternalServerError22, H
,22H I
typeof22J P
(22P Q.
"ResponseInternalServerModelExample22Q s
)22s t
)22t u
]22u v
public33 
async33 
Task33 
<33 
ActionResult33 &
<33& '
ResponseModel33' 4
<334 5

EntidadDto335 ?
>33? @
>33@ A
>33A B
	Registrar33C L
(33L M
[33M N
FromBody33N V
]33V W
CrearCitaCommand33X h
crearCitaCommand33i y
)33y z
{44 	
crearCitaCommand55 
.55 '
CodigoIntermediarioCreacion55 8
=559 : 
_headerConfiguration55; O
.55O P
idIntermediario55P _
;55_ `
RequestModel66 
<66 
CrearCitaCommand66 )
>66) *
requestModel66+ 7
=668 9
new66: =
RequestModel66> J
<66J K
CrearCitaCommand66K [
>66[ \
(66\ ]
)66] ^
{66_ `
Entity66a g
=66h i
crearCitaCommand66j z
,66z {
auditRequest	66| à
=
66â ä"
_headerConfiguration
66ã ü
.
66ü †
auditRequest
66† ¨
}
66≠ Æ
;
66Æ Ø
ResponseModel77 
<77 

EntidadDto77 $
>77$ %
result77& ,
=77- .
new77/ 2
ResponseModel773 @
<77@ A

EntidadDto77A K
>77K L
(77L M
)77M N
;77N O
	Stopwatch88 
timeMeasure88 !
=88" #
new88$ '
	Stopwatch88( 1
(881 2
)882 3
;883 4
timeMeasure99 
.99 
Start99 
(99 
)99 
;99  
_impresionLog;; 
.;; 
InicioMetodo;; &
(;;& '
$str;;' :
,;;: ; 
_headerConfiguration;;< P
.;;P Q
idTransaccion;;Q ^
,;;^ _ 
_headerConfiguration;;` t
.;;t u
correlationId	;;u Ç
,
;;Ç É
$str
;;Ñ è
)
;;è ê
;
;;ê ë
_impresionLog<< 
.<< 
DatosInicioMetodo<< +
(<<+ ,
$str<<, ?
,<<? @ 
_headerConfiguration<<A U
.<<U V
idTransaccion<<V c
,<<c d 
_headerConfiguration<<e y
.<<y z
correlationId	<<z á
,
<<á à
requestModel
<<â ï
)
<<ï ñ
;
<<ñ ó
try>> 
{>> 
result>> 
=>> 
await>> 
	_mediator>> (
.>>( )
Send>>) -
(>>- .
crearCitaCommand>>. >
)>>> ?
;>>? @
}>>@ A
catch?? 
(?? 
	Exception?? 
e?? 
)?? 
{?? 
result?? %
.??% &
Entity??& ,
=??- .
new??/ 2

EntidadDto??3 =
{??> ?
Mensaje??@ G
=??H I
e??J K
.??K L
Message??L S
.??S T
ToString??T \
(??\ ]
)??] ^
}??_ `
;??` a
}??a b
resultAA 
.AA 
auditResponseAA  
.AA  !
idTransaccionAA! .
=AA/ 0 
_headerConfigurationAA1 E
.AAE F
idTransaccionAAF S
;AAS T
timeMeasureCC 
.CC 
StopCC 
(CC 
)CC 
;CC 
_impresionLogDD 
.DD 
DatosFinMetodoDD (
(DD( )
$strDD) <
,DD< = 
_headerConfigurationDD> R
.DDR S
idTransaccionDDS `
,DD` a 
_headerConfigurationDDb v
.DDv w
correlationId	DDw Ñ
,
DDÑ Ö
result
DDÜ å
)
DDå ç
;
DDç é
_impresionLogEE 
.EE 
	FinMetodoEE #
(EE# $
$strEE$ 7
,EE7 8 
_headerConfigurationEE9 M
.EEM N
idTransaccionEEN [
,EE[ \ 
_headerConfigurationEE] q
.EEq r
correlationIdEEr 
,	EE Ä
$str
EEÅ å
,
EEå ç
timeMeasure
EEé ô
.
EEô ö
Elapsed
EEö °
.
EE° ¢
TotalMilliseconds
EE¢ ≥
.
EE≥ ¥
ToString
EE¥ º
(
EEº Ω
)
EEΩ æ
)
EEæ ø
;
EEø ¿
returnGG 
CreatedAtActionGG "
(GG" #
nameofGG# )
(GG) *
	RegistrarGG* 3
)GG3 4
,GG4 5
resultGG6 <
)GG< =
;GG= >
}HH 	
[JJ 	
RouteJJ	 
(JJ 
$strJJ 
)JJ 
]JJ 
[KK 	
HttpPutKK	 
]KK 
[LL 	
SwaggerOperationLL	 
(LL 
SummaryLL !
=LL" #
$strLL$ 5
,LL5 6
DescriptionLL7 B
=LLC D
$strLLE V
)LLV W
]LLW X
[MM 	!
SwaggerRequestExampleMM	 
(MM 
typeofMM %
(MM% &!
ActualizarCitaCommandMM& ;
)MM; <
,MM< =
typeofMM> D
(MMD E/
#RequestActualizarCitaCommandExampleMME h
)MMh i
)MMi j
]MMj k
[NN 	
SwaggerResponseNN	 
(NN 
StatusCodesNN $
.NN$ %
Status201CreatedNN% 5
,NN5 6
typeNN7 ;
:NN; <
typeofNN= C
(NNC D
ResponseModelNND Q
<NNQ R

EntidadDtoNNR \
>NN\ ]
)NN] ^
)NN^ _
]NN_ `
[OO 	"
SwaggerResponseExampleOO	 
(OO  
StatusCodesOO  +
.OO+ ,
Status201CreatedOO, <
,OO< =
typeofOO> D
(OOD E0
$ResponseActualizarCitaCommandExampleOOE i
)OOi j
)OOj k
]OOk l
[PP 	
SwaggerResponsePP	 
(PP 
StatusCodesPP $
.PP$ %(
Status500InternalServerErrorPP% A
,PPA B
typePPC G
:PPG H
typeofPPI O
(PPO P
ResponseModelPPP ]
<PP] ^

EntidadDtoPP^ h
>PPh i
)PPi j
)PPj k
]PPk l
[QQ 	"
SwaggerResponseExampleQQ	 
(QQ  
StatusCodesQQ  +
.QQ+ ,(
Status500InternalServerErrorQQ, H
,QQH I
typeofQQJ P
(QQP Q.
"ResponseInternalServerModelExampleQQQ s
)QQs t
)QQt u
]QQu v
publicRR 
asyncRR 
TaskRR 
<RR 
ActionResultRR &
<RR& '
ResponseModelRR' 4
<RR4 5

EntidadDtoRR5 ?
>RR? @
>RR@ A
>RRA B

ActualizarRRC M
(RRM N
[RRN O
FromBodyRRO W
]RRW X!
ActualizarCitaCommandRRY n"
actualizarCitaCommand	RRo Ñ
)
RRÑ Ö
{SS 	
RequestModelTT 
<TT !
ActualizarCitaCommandTT .
>TT. /
requestModelTT0 <
=TT= >
newTT? B
RequestModelTTC O
<TTO P!
ActualizarCitaCommandTTP e
>TTe f
(TTf g
)TTg h
{TTi j
EntityTTk q
=TTr s"
actualizarCitaCommand	TTt â
,
TTâ ä
auditRequest
TTã ó
=
TTò ô"
_headerConfiguration
TTö Æ
.
TTÆ Ø
auditRequest
TTØ ª
}
TTº Ω
;
TTΩ æ
ResponseModelUU 
<UU 

EntidadDtoUU $
>UU$ %
resultUU& ,
=UU- .
newUU/ 2
ResponseModelUU3 @
<UU@ A

EntidadDtoUUA K
>UUK L
(UUL M
)UUM N
;UUN O
	StopwatchVV 
timeMeasureVV !
=VV" #
newVV$ '
	StopwatchVV( 1
(VV1 2
)VV2 3
;VV3 4
timeMeasureWW 
.WW 
StartWW 
(WW 
)WW 
;WW  
_impresionLogYY 
.YY 
InicioMetodoYY &
(YY& '
$strYY' :
,YY: ; 
_headerConfigurationYY< P
.YYP Q
idTransaccionYYQ ^
,YY^ _ 
_headerConfigurationYY` t
.YYt u
correlationId	YYu Ç
,
YYÇ É
$str
YYÑ ê
)
YYê ë
;
YYë í
_impresionLogZZ 
.ZZ 
DatosInicioMetodoZZ +
(ZZ+ ,
$strZZ, ?
,ZZ? @ 
_headerConfigurationZZA U
.ZZU V
idTransaccionZZV c
,ZZc d 
_headerConfigurationZZe y
.ZZy z
correlationId	ZZz á
,
ZZá à
requestModel
ZZâ ï
)
ZZï ñ
;
ZZñ ó
try\\ 
{\\ 
result\\ 
=\\ 
await\\  
	_mediator\\! *
.\\* +
Send\\+ /
(\\/ 0!
actualizarCitaCommand\\0 E
)\\E F
;\\F G
}\\H I
catch]] 
(]] 
	Exception]] 
e]] 
)]] 
{]]  !
result]]" (
.]]( )
Entity]]) /
=]]0 1
new]]2 5

EntidadDto]]6 @
{]]A B
Mensaje]]C J
=]]K L
e]]M N
.]]N O
Message]]O V
.]]V W
ToString]]W _
(]]_ `
)]]` a
}]]b c
;]]c d
}]]e f
result^^ 
.^^ 
auditResponse^^  
.^^  !
idTransaccion^^! .
=^^/ 0 
_headerConfiguration^^1 E
.^^E F
idTransaccion^^F S
;^^S T
timeMeasure`` 
.`` 
Stop`` 
(`` 
)`` 
;`` 
_impresionLogaa 
.aa 
DatosFinMetodoaa (
(aa( )
$straa) <
,aa< = 
_headerConfigurationaa> R
.aaR S
idTransaccionaaS `
,aa` a 
_headerConfigurationaab v
.aav w
correlationId	aaw Ñ
,
aaÑ Ö
result
aaÜ å
)
aaå ç
;
aaç é
_impresionLogbb 
.bb 
	FinMetodobb #
(bb# $
$strbb$ 7
,bb7 8 
_headerConfigurationbb9 M
.bbM N
idTransaccionbbN [
,bb[ \ 
_headerConfigurationbb] q
.bbq r
correlationIdbbr 
,	bb Ä
$str
bbÅ ç
,
bbç é
timeMeasure
bbè ö
.
bbö õ
Elapsed
bbõ ¢
.
bb¢ £
TotalMilliseconds
bb£ ¥
.
bb¥ µ
ToString
bbµ Ω
(
bbΩ æ
)
bbæ ø
)
bbø ¿
;
bb¿ ¡
returndd 
Okdd 
(dd 
resultdd 
)dd 
;dd 
}ee 	
[gg 	
Routegg	 
(gg 
$strgg $
)gg$ %
]gg% &
[hh 	
HttpPuthh	 
]hh 
[ii 	
SwaggerOperationii	 
(ii 
Summaryii !
=ii" #
$strii$ 4
,ii4 5
Descriptionii6 A
=iiB C
$striiD T
)iiT U
]iiU V
[jj 	!
SwaggerRequestExamplejj	 
(jj 
typeofjj %
(jj% & 
CalificarCitaCommandjj& :
)jj: ;
,jj; <
typeofjj= C
(jjC D.
"RequestCalificarCitaCommandExamplejjD f
)jjf g
)jjg h
]jjh i
[kk 	
SwaggerResponsekk	 
(kk 
StatusCodeskk $
.kk$ %
Status201Createdkk% 5
,kk5 6
typekk7 ;
:kk; <
typeofkk= C
(kkC D
ResponseModelkkD Q
<kkQ R

EntidadDtokkR \
>kk\ ]
)kk] ^
)kk^ _
]kk_ `
[ll 	"
SwaggerResponseExamplell	 
(ll  
StatusCodesll  +
.ll+ ,
Status201Createdll, <
,ll< =
typeofll> D
(llD E/
#ResponseCalificarCitaCommandExamplellE h
)llh i
)lli j
]llj k
[mm 	
SwaggerResponsemm	 
(mm 
StatusCodesmm $
.mm$ %(
Status500InternalServerErrormm% A
,mmA B
typemmC G
:mmG H
typeofmmI O
(mmO P
ResponseModelmmP ]
<mm] ^

EntidadDtomm^ h
>mmh i
)mmi j
)mmj k
]mmk l
[nn 	"
SwaggerResponseExamplenn	 
(nn  
StatusCodesnn  +
.nn+ ,(
Status500InternalServerErrornn, H
,nnH I
typeofnnJ P
(nnP Q.
"ResponseInternalServerModelExamplennQ s
)nns t
)nnt u
]nnu v
publicoo 
asyncoo 
Taskoo 
<oo 
ActionResultoo &
<oo& '
ResponseModeloo' 4
<oo4 5

EntidadDtooo5 ?
>oo? @
>oo@ A
>ooA B
	CalificarooC L
(ooL M
[ooM N
FromBodyooN V
]ooV W 
CalificarCitaCommandooX l!
calificarCitaCommand	oom Å
)
ooÅ Ç
{pp 	
RequestModelqq 
<qq  
CalificarCitaCommandqq -
>qq- .
requestModelqq/ ;
=qq< =
newqq> A
RequestModelqqB N
<qqN O 
CalificarCitaCommandqqO c
>qqc d
(qqd e
)qqe f
{qqg h
Entityqqi o
=qqp q!
calificarCitaCommand	qqr Ü
,
qqÜ á
auditRequest
qqà î
=
qqï ñ"
_headerConfiguration
qqó ´
.
qq´ ¨
auditRequest
qq¨ ∏
}
qqπ ∫
;
qq∫ ª
ResponseModelrr 
<rr 

EntidadDtorr $
>rr$ %
resultrr& ,
=rr- .
newrr/ 2
ResponseModelrr3 @
<rr@ A

EntidadDtorrA K
>rrK L
(rrL M
)rrM N
;rrN O
	Stopwatchss 
timeMeasuress !
=ss" #
newss$ '
	Stopwatchss( 1
(ss1 2
)ss2 3
;ss3 4
timeMeasurett 
.tt 
Starttt 
(tt 
)tt 
;tt  
_impresionLogvv 
.vv 
InicioMetodovv &
(vv& '
$strvv' ;
,vv; < 
_headerConfigurationvv= Q
.vvQ R
idTransaccionvvR _
,vv_ ` 
_headerConfigurationvva u
.vvu v
correlationId	vvv É
,
vvÉ Ñ
$str
vvÖ ê
)
vvê ë
;
vvë í
_impresionLogww 
.ww 
DatosInicioMetodoww +
(ww+ ,
$strww, @
,ww@ A 
_headerConfigurationwwB V
.wwV W
idTransaccionwwW d
,wwd e 
_headerConfigurationwwf z
.wwz {
correlationId	ww{ à
,
wwà â
requestModel
wwä ñ
)
wwñ ó
;
wwó ò
tryyy 
{yy 
resultyy 
=yy 
awaityy  
	_mediatoryy! *
.yy* +
Sendyy+ /
(yy/ 0 
calificarCitaCommandyy0 D
)yyD E
;yyE F
}yyG H
catchzz 
(zz 
	Exceptionzz 
ezz 
)zz 
{zz  !
resultzz" (
.zz( )
Entityzz) /
=zz0 1
newzz2 5

EntidadDtozz6 @
{zzA B
MensajezzC J
=zzK L
ezzM N
.zzN O
MessagezzO V
.zzV W
ToStringzzW _
(zz_ `
)zz` a
}zzb c
;zzc d
}zze f
result{{ 
.{{ 
auditResponse{{  
.{{  !
idTransaccion{{! .
={{/ 0 
_headerConfiguration{{1 E
.{{E F
idTransaccion{{F S
;{{S T
timeMeasure}} 
.}} 
Stop}} 
(}} 
)}} 
;}} 
_impresionLog~~ 
.~~ 
DatosFinMetodo~~ (
(~~( )
$str~~) =
,~~= > 
_headerConfiguration~~? S
.~~S T
idTransaccion~~T a
,~~a b 
_headerConfiguration~~c w
.~~w x
correlationId	~~x Ö
,
~~Ö Ü
result
~~á ç
)
~~ç é
;
~~é è
_impresionLog 
. 
	FinMetodo #
(# $
$str$ 8
,8 9 
_headerConfiguration: N
.N O
idTransaccionO \
,\ ] 
_headerConfiguration^ r
.r s
correlationId	s Ä
,
Ä Å
$str
Ç ç
,
ç é
timeMeasure
è ö
.
ö õ
Elapsed
õ ¢
.
¢ £
TotalMilliseconds
£ ¥
.
¥ µ
ToString
µ Ω
(
Ω æ
)
æ ø
)
ø ¿
;
¿ ¡
return
ÅÅ 
Ok
ÅÅ 
(
ÅÅ 
result
ÅÅ 
)
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
[
ÖÖ 	
HttpGet
ÖÖ	 
]
ÖÖ 
[
ÜÜ 	
Route
ÜÜ	 
(
ÜÜ 
$str
ÜÜ (
)
ÜÜ( )
]
ÜÜ) *
[
áá 	
SwaggerOperation
áá	 
(
áá 
Summary
áá !
=
áá" #
$str
áá$ 9
,
áá9 :
Description
áá; F
=
ááG H
$str
ááI ^
)
áá^ _
]
áá_ `
[
àà 	
SwaggerResponse
àà	 
(
àà 
StatusCodes
àà $
.
àà$ %
Status200OK
àà% 0
,
àà0 1
type
àà2 6
:
àà6 7
typeof
àà8 >
(
àà> ?
ResponseModel
àà? L
<
ààL M

AgendaCita
ààM W
>
ààW X
)
ààX Y
)
ààY Z
]
ààZ [
[
ââ 	$
SwaggerResponseExample
ââ	 
(
ââ  
StatusCodes
ââ  +
.
ââ+ ,
Status200OK
ââ, 7
,
ââ7 8
typeof
ââ9 ?
(
ââ? @3
%ResponseObtenerNumeroCitaQueryExample
ââ@ e
)
ââe f
)
ââf g
]
ââg h
[
ää 	
SwaggerResponse
ää	 
(
ää 
StatusCodes
ää $
.
ää$ %*
Status500InternalServerError
ää% A
,
ääA B
type
ääC G
:
ääG H
typeof
ääI O
(
ääO P
ResponseModel
ääP ]
<
ää] ^

AgendaCita
ää^ h
>
ääh i
)
ääi j
)
ääj k
]
ääk l
[
ãã 	$
SwaggerResponseExample
ãã	 
(
ãã  
StatusCodes
ãã  +
.
ãã+ ,*
Status500InternalServerError
ãã, H
,
ããH I
typeof
ããJ P
(
ããP Q0
"ResponseInternalServerModelExample
ããQ s
)
ããs t
)
ããt u
]
ããu v
public
çç 
async
çç 
Task
çç 
<
çç 
ActionResult
çç &
<
çç& '
ResponseModel
çç' 4
<
çç4 5

AgendaCita
çç5 ?
>
çç? @
>
çç@ A
>
ççA B
ObtenerNumeroCita
ççC T
(
ççT U
string
ççU [
idprospecto
çç\ g
)
ççg h
{
éé 	
	Stopwatch
èè 
timeMeasure
èè !
=
èè" #
new
èè$ '
	Stopwatch
èè( 1
(
èè1 2
)
èè2 3
;
èè3 4
timeMeasure
êê 
.
êê 
Start
êê 
(
êê 
)
êê 
;
êê  
_impresionLog
íí 
.
íí 
InicioMetodo
íí &
(
íí& '
$str
íí' ;
,
íí; <"
_headerConfiguration
íí= Q
.
ííQ R
idTransaccion
ííR _
,
íí_ `"
_headerConfiguration
íía u
.
ííu v
correlationIdíív É
,ííÉ Ñ
$strííÖ ò
)ííò ô
;ííô ö
_logger
ìì 
.
ìì 
LogInformation
ìì "
(
ìì" #
$str
ìì# -
,
ìì- .
$str
ìì/ F
+
ììG H
$str
ììI Q
+
ììR S"
_headerConfiguration
ììT h
.
ììh i
idTransaccion
ììi v
+
ììw x
$strììy Ç
+ììÉ Ñ$
_headerConfigurationììÖ ô
.ììô ö
correlationIdììö ß
+ìì® ©
$strìì™ ≠
+ììÆ Ø
$strìì∞ ≈
+ìì∆ «
JsonConvert
îî  
.
îî  !
SerializeObject
îî! 0
(
îî0 1"
_headerConfiguration
îî1 E
.
îîE F
auditRequest
îîF R
,
îîR S

Formatting
îîT ^
.
îî^ _
Indented
îî_ g
)
îîg h
+
îîi j
$str
îîk z
+
îî{ |
idprospectoîî} à
)îîà â
;îîâ ä
var
ññ 
result
ññ 
=
ññ 
await
ññ 
_citaQueries
ññ +
.
ññ+ ,
ObtenerNumeroCita
ññ, =
(
ññ= >
idprospecto
ññ> I
,
ññI J"
_headerConfiguration
ññJ ^
.
ññ^ _
idIntermediario
ññ_ n
)
ññn o
;
ñño p
result
óó 
.
óó 
auditResponse
óó  
.
óó  !
idTransaccion
óó! .
=
óó/ 0"
_headerConfiguration
óó1 E
.
óóE F
idTransaccion
óóF S
;
óóS T
timeMeasure
ôô 
.
ôô 
Stop
ôô 
(
ôô 
)
ôô 
;
ôô 
_impresionLog
öö 
.
öö 
DatosFinMetodo
öö (
(
öö( )
$str
öö) =
,
öö= >"
_headerConfiguration
öö? S
.
ööS T
idTransaccion
ööT a
,
ööa b"
_headerConfiguration
ööc w
.
ööw x
correlationIdööx Ö
,ööÖ Ü
resultööá ç
)ööç é
;ööé è
_impresionLog
õõ 
.
õõ 
	FinMetodo
õõ #
(
õõ# $
$str
õõ$ 8
,
õõ8 9"
_headerConfiguration
õõ: N
.
õõN O
idTransaccion
õõO \
,
õõ\ ]"
_headerConfiguration
õõ^ r
.
õõr s
correlationIdõõs Ä
,õõÄ Å
$strõõÇ ï
,õõï ñ
timeMeasureõõó ¢
.õõ¢ £
Elapsedõõ£ ™
.õõ™ ´!
TotalMillisecondsõõ´ º
.õõº Ω
ToStringõõΩ ≈
(õõ≈ ∆
)õõ∆ «
)õõ« »
;õõ» …
return
ùù 
Ok
ùù 
(
ùù 
result
ùù 
)
ùù 
;
ùù 
}
ûû 	
[
†† 	
HttpGet
††	 
]
†† 
[
°° 	
Route
°°	 
(
°° 
$str
°° =
)
°°= >
]
°°> ?
[
¢¢ 	
SwaggerOperation
¢¢	 
(
¢¢ 
Summary
¢¢ !
=
¢¢" #
$str
¢¢$ H
,
¢¢H I
Description
¢¢J U
=
¢¢V W
$str
¢¢X |
)
¢¢| }
]
¢¢} ~
[
££ 	
SwaggerResponse
££	 
(
££ 
StatusCodes
££ $
.
££$ %
Status200OK
££% 0
,
££0 1
type
££2 6
:
££6 7
typeof
££8 >
(
££> ?
ResponseModel
££? L
<
££L M

AgendaCita
££M W
>
££W X
)
££X Y
)
££Y Z
]
££Z [
[
§§ 	$
SwaggerResponseExample
§§	 
(
§§  
StatusCodes
§§  +
.
§§+ ,
Status200OK
§§, 7
,
§§7 8
typeof
§§9 ?
(
§§? @3
%ResponseObtenerNumeroCitaQueryExample
§§@ e
)
§§e f
)
§§f g
]
§§g h
[
•• 	
SwaggerResponse
••	 
(
•• 
StatusCodes
•• $
.
••$ %*
Status500InternalServerError
••% A
,
••A B
type
••C G
:
••G H
typeof
••I O
(
••O P
ResponseModel
••P ]
<
••] ^

AgendaCita
••^ h
>
••h i
)
••i j
)
••j k
]
••k l
[
¶¶ 	$
SwaggerResponseExample
¶¶	 
(
¶¶  
StatusCodes
¶¶  +
.
¶¶+ ,*
Status500InternalServerError
¶¶, H
,
¶¶H I
typeof
¶¶J P
(
¶¶P Q0
"ResponseInternalServerModelExample
¶¶Q s
)
¶¶s t
)
¶¶t u
]
¶¶u v
public
®® 
async
®® 
Task
®® 
<
®® 
ActionResult
®® &
<
®®& '
ResponseModel
®®' 4
<
®®4 5

AgendaCita
®®5 ?
>
®®? @
>
®®@ A
>
®®A B%
ValidarFechaHorarioCita
®®C Z
(
®®Z [
string
®®[ a
	fechacita
®®b k
,
®®k l
string
®®m s

horainicio
®®t ~
,
®®~ 
string®®Ä Ü
horafin®®á é
)®®é è
{
©© 	
	Stopwatch
™™ 
timeMeasure
™™ !
=
™™" #
new
™™$ '
	Stopwatch
™™( 1
(
™™1 2
)
™™2 3
;
™™3 4
timeMeasure
´´ 
.
´´ 
Start
´´ 
(
´´ 
)
´´ 
;
´´  
_impresionLog
≠≠ 
.
≠≠ 
InicioMetodo
≠≠ &
(
≠≠& '
$str
≠≠' ;
,
≠≠; <"
_headerConfiguration
≠≠= Q
.
≠≠Q R
idTransaccion
≠≠R _
,
≠≠_ `"
_headerConfiguration
≠≠a u
.
≠≠u v
correlationId≠≠v É
,≠≠É Ñ
$str≠≠Ö û
)≠≠û ü
;≠≠ü †
_logger
ÆÆ 
.
ÆÆ 
LogInformation
ÆÆ "
(
ÆÆ" #
$str
ÆÆ# -
,
ÆÆ- .
$str
ÆÆ/ F
+
ÆÆG H
$str
ÆÆI Q
+
ÆÆR S"
_headerConfiguration
ÆÆT h
.
ÆÆh i
idTransaccion
ÆÆi v
+
ÆÆw x
$strÆÆy Ç
+ÆÆÉ Ñ$
_headerConfigurationÆÆÖ ô
.ÆÆô ö
correlationIdÆÆö ß
+ÆÆ® ©
$strÆÆ™ ≠
+ÆÆÆ Ø
$strÆÆ∞ ≈
+ÆÆ∆ «
JsonConvert
ØØ  
.
ØØ  !
SerializeObject
ØØ! 0
(
ØØ0 1"
_headerConfiguration
ØØ1 E
.
ØØE F
auditRequest
ØØF R
,
ØØR S

Formatting
ØØT ^
.
ØØ^ _
Indented
ØØ_ g
)
ØØg h
+
ØØh i
$str
ØØi v
+
ØØw x
	fechacitaØØy Ç
+ØØÉ Ñ
$strØØÑ ê
+ØØë í

horainicioØØì ù
+ØØû ü
$strØØü ©
+ØØ™ ´
horafinØØ¨ ≥
)ØØ≥ ¥
;ØØ¥ µ
var
±± 
result
±± 
=
±± 
await
±± 
_citaQueries
±± +
.
±±+ ,-
ValidarFechaHorarioAgendamiento
±±, K
(
±±K L"
_headerConfiguration
±±L `
.
±±` a
idIntermediario
±±a p
,
±±p q
	fechacita
±±q z
,
±±z {

horainicio±±{ Ö
,±±Ö Ü
horafin±±Ü ç
)±±ç é
;±±é è
result
≤≤ 
.
≤≤ 
auditResponse
≤≤  
.
≤≤  !
idTransaccion
≤≤! .
=
≤≤/ 0"
_headerConfiguration
≤≤1 E
.
≤≤E F
idTransaccion
≤≤F S
;
≤≤S T
timeMeasure
¥¥ 
.
¥¥ 
Stop
¥¥ 
(
¥¥ 
)
¥¥ 
;
¥¥ 
_impresionLog
µµ 
.
µµ 
DatosFinMetodo
µµ (
(
µµ( )
$str
µµ) =
,
µµ= >"
_headerConfiguration
µµ? S
.
µµS T
idTransaccion
µµT a
,
µµa b"
_headerConfiguration
µµc w
.
µµw x
correlationIdµµx Ö
,µµÖ Ü
resultµµá ç
)µµç é
;µµé è
_impresionLog
∂∂ 
.
∂∂ 
	FinMetodo
∂∂ #
(
∂∂# $
$str
∂∂$ 8
,
∂∂8 9"
_headerConfiguration
∂∂: N
.
∂∂N O
idTransaccion
∂∂O \
,
∂∂\ ]"
_headerConfiguration
∂∂^ r
.
∂∂r s
correlationId∂∂s Ä
,∂∂Ä Å
$str∂∂Ç õ
,∂∂õ ú
timeMeasure∂∂ù ®
.∂∂® ©
Elapsed∂∂© ∞
.∂∂∞ ±!
TotalMilliseconds∂∂± ¬
.∂∂¬ √
ToString∂∂√ À
(∂∂À Ã
)∂∂Ã Õ
)∂∂Õ Œ
;∂∂Œ œ
return
∏∏ 
Ok
∏∏ 
(
∏∏ 
result
∏∏ 
)
∏∏ 
;
∏∏ 
}
ππ 	
}
∫∫ 
}ªª Åª
JD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Controllers\ProspectoController.cs
	namespace 	
Agenda
 
. 
API 
. 
Controllers  
{ 
[ 
ApiController 
] 
public 

class 
ProspectoController $
:% &
ControllerBase' 5
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
ILogger  
<  !
ProspectoController! 4
>4 5
_logger6 =
;= >
private 
readonly ,
 IConsolidadoIntermediarioQueries 9,
 _consolidadoIntermediarioQueries; [
;[ \
private 
readonly 
IProspectoQueries *
_prospectoQueries+ <
;< =
private 
readonly 
IGeneralesQueries *
_generalesQueries+ <
;< =
private   
readonly   
IImpresionLog   &
_impresionLog  ' 4
;  4 5
private!! 
readonly!!  
IHeaderConfiguration!! - 
_headerConfiguration!!. B
;!!B C
public## 
ProspectoController## "
(##" #
	IMediator### ,
mediator##- 5
,##5 6,
 IConsolidadoIntermediarioQueries$$# C+
consolidadoIntermediarioQueries$$D c
,$$c d
IProspectoQueries%%# 4
prospectoQueries%%5 E
,%%E F
IGeneralesQueries&&# 4
generalesQueries&&5 E
,&&E F
ILogger''# *
<''* +
ProspectoController''+ >
>''> ?
logger''@ F
,''F G
IImpresionLog((# 0
impresionLog((1 =
,((= > 
IHeaderConfiguration))# 7
headerConfiguration))8 K
)))K L
{** 	
	_mediator++ 
=++ 
mediator++  
??++! #
throw++$ )
new++* -!
ArgumentNullException++. C
(++C D
nameof++D J
(++J K
mediator++K S
)++S T
)++T U
;++U V,
 _consolidadoIntermediarioQueries,, ,
=,,- .+
consolidadoIntermediarioQueries,,/ N
??,,O Q
throw,,R W
new,,X [!
ArgumentNullException,,\ q
(,,q r
nameof,,r x
(,,x y,
consolidadoIntermediarioQueries	,,y ò
)
,,ò ô
)
,,ô ö
;
,,ö õ
_prospectoQueries-- 
=-- 
prospectoQueries--  0
??--1 3
throw--4 9
new--: =!
ArgumentNullException--> S
(--S T
nameof--T Z
(--Z [
prospectoQueries--[ k
)--k l
)--l m
;--m n
_generalesQueries.. 
=.. 
generalesQueries..  0
??..1 3
throw..4 9
new..: =!
ArgumentNullException..> S
(..S T
nameof..T Z
(..Z [
generalesQueries..[ k
)..k l
)..l m
;..m n
_logger// 
=// 
logger// 
??// 
throw//  %
new//& )!
ArgumentNullException//* ?
(//? @
nameof//@ F
(//F G
logger//G M
)//M N
)//N O
;//O P
_impresionLog00 
=00 
impresionLog00 (
??00) +
throw00, 1
new002 5!
ArgumentNullException006 K
(00K L
nameof00L R
(00R S
impresionLog00S _
)00_ `
)00` a
;00a b 
_headerConfiguration11  
=11! "
headerConfiguration11# 6
??117 9
throw11: ?
new11@ C!
ArgumentNullException11D Y
(11Y Z
nameof11Z `
(11` a
headerConfiguration11a t
)11t u
)11u v
;11v w
}33 	
[55 	
Route55	 
(55 
$str55 
)55  
]55  !
[66 	
HttpPost66	 
]66 
[77 	
SwaggerOperation77	 
(77 
Summary77 !
=77" #
$str77$ 7
,777 8
Description779 D
=77E F
$str77G Z
)77Z [
]77[ \
[88 	!
SwaggerRequestExample88	 
(88 
typeof88 %
(88% &!
CrearProspectoCommand88& ;
)88; <
,88< =
typeof88> D
(88D E/
#RequestCrearProspectoCommandExample88E h
)88h i
)88i j
]88j k
[99 	
SwaggerResponse99	 
(99 
StatusCodes99 $
.99$ %
Status201Created99% 5
,995 6
type997 ;
:99; <
typeof99= C
(99C D
ResponseModel99D Q
<99Q R

EntidadDto99R \
>99\ ]
)99] ^
)99^ _
]99_ `
[:: 	"
SwaggerResponseExample::	 
(::  
StatusCodes::  +
.::+ ,
Status201Created::, <
,::< =
typeof::> D
(::D E0
$ResponseCrearProspectoCommandExample::E i
)::i j
)::j k
]::k l
[;; 	
SwaggerResponse;;	 
(;; 
StatusCodes;; $
.;;$ %(
Status500InternalServerError;;% A
,;;A B
type;;C G
:;;G H
typeof;;I O
(;;O P
ResponseModel;;P ]
<;;] ^

EntidadDto;;^ h
>;;h i
);;i j
);;j k
];;k l
[<< 	"
SwaggerResponseExample<<	 
(<<  
StatusCodes<<  +
.<<+ ,(
Status500InternalServerError<<, H
,<<H I
typeof<<J P
(<<P Q.
"ResponseInternalServerModelExample<<Q s
)<<s t
)<<t u
]<<u v
public== 
async== 
Task== 
<== 
ActionResult== &
<==& '
ResponseModel==' 4
<==4 5
	Prospecto==5 >
>==> ?
>==? @
>==@ A
	Registrar==B K
(==K L
[==L M
FromBody==M U
]==U V!
CrearProspectoCommand==W l"
crearProspectoCommand	==m Ç
)
==Ç É
{>> 	!
crearProspectoCommand?? !
.??! "
CodigoIntermediario??" 5
=??6 7 
_headerConfiguration??8 L
.??L M
idIntermediario??M \
;??\ ]
RequestModel@@ 
<@@ !
CrearProspectoCommand@@ .
>@@. /
requestModel@@0 <
=@@= >
new@@? B
RequestModel@@C O
<@@O P!
CrearProspectoCommand@@P e
>@@e f
(@@f g
)@@g h
{@@i j
Entity@@k q
=@@r s"
crearProspectoCommand	@@t â
,
@@â ä
auditRequest
@@ã ó
=
@@ò ô"
_headerConfiguration
@@ö Æ
.
@@Æ Ø
auditRequest
@@Ø ª
}
@@ª º
;
@@º Ω
	StopwatchAA 
timeMeasureAA !
=AA" #
newAA$ '
	StopwatchAA( 1
(AA1 2
)AA2 3
;AA3 4
ResponseModelBB 
<BB 

EntidadDtoBB $
>BB$ %
resultBB& ,
=BB- .
newBB/ 2
ResponseModelBB3 @
<BB@ A

EntidadDtoBBA K
>BBK L
(BBL M
)BBM N
;BBN O
ResponseModelCC 
<CC 
	ProspectoCC #
>CC# $
	prospectoCC% .
=CC/ 0
newCC1 4
ResponseModelCC5 B
<CCB C
	ProspectoCCC L
>CCL M
(CCM N
)CCN O
;CCO P
timeMeasureDD 
.DD 
StartDD 
(DD 
)DD 
;DD  
_impresionLogFF 
.FF 
InicioMetodoFF &
(FF& '
$strFF' ?
,FF? @ 
_headerConfigurationFFA U
.FFU V
idTransaccionFFV c
,FFc d 
_headerConfigurationFFe y
.FFy z
correlationId	FFz á
,
FFá à
$str
FFâ î
)
FFî ï
;
FFï ñ
_impresionLogGG 
.GG 
DatosInicioMetodoGG +
(GG+ ,
$strGG, D
,GGD E 
_headerConfigurationGGF Z
.GGZ [
idTransaccionGG[ h
,GGh i 
_headerConfigurationGGj ~
.GG~ 
correlationId	GG å
,
GGå ç
requestModel
GGé ö
)
GGö õ
;
GGõ ú!
crearProspectoCommandII !
.II! "&
IdConsolidadoIntermediarioII" <
=II= >
awaitII? D,
 _consolidadoIntermediarioQueriesIIE e
.IIe f.
!ObtenerIdConsolidadoIntermediario	IIf á
(
IIá à"
_headerConfiguration
IIà ú
.
IIú ù
idIntermediario
IIù ¨
)
II¨ ≠
;
II≠ Æ!
crearProspectoCommandJJ !
.JJ! "
CodigoRangoEdadJJ" 1
=JJ2 3!
crearProspectoCommandJJ4 I
.JJI J
FechaNacimientoJJJ Y
.JJY Z
HasValueJJZ b
?JJc d
awaitKK5 :
_generalesQueriesKK; L
.KKL M"
ObtenerCodigoRangoEdadKKM c
(KKc d!
crearProspectoCommandKKd y
.KKy z
FechaNacimiento	KKz â
.
KKâ ä
Value
KKä è
,
KKè ê"
_headerConfiguration
KKë •
.
KK• ¶
idIntermediario
KK¶ µ
)
KKµ ∂
:
KK∂ ∑
default
KK∏ ø
(
KKø ¿
short
KK¿ ≈
?
KK≈ ∆
)
KK∆ «
;
KK« »!
crearProspectoCommandLL !
.LL! "
CodigoRangoFondoLL" 2
=LL3 4!
crearProspectoCommandLL5 J
.LLJ K$
ProspectoAdnRentaCommandLLK c
.LLc d
MonedaPatrimonioAfpLLd w
.LLw x
HasValue	LLx Ä
?
LLÅ Ç
awaitMM6 ;
_generalesQueriesMM< M
.MMM N#
ObtenerCodigoRangoFondoMMN e
(MMe f!
crearProspectoCommandMMf {
.MM{ |%
ProspectoAdnRentaCommand	MM| î
.
MMî ï!
MonedaPatrimonioAfp
MMï ®
.
MM® ©
Value
MM© Æ
,
MMÆ Ø"
_headerConfiguration
MM∞ ƒ
.
MMƒ ≈
idIntermediario
MM≈ ‘
)
MM‘ ’
:
MM÷ ◊
default
MMÿ ﬂ
(
MMﬂ ‡
short
MM‡ Â
?
MMÂ Ê
)
MMÊ Á
;
MMÁ Ë
tryOO 
{PP 
resultQQ 
=QQ 
awaitQQ 
	_mediatorQQ (
.QQ( )
SendQQ) -
(QQ- .!
crearProspectoCommandQQ. C
)QQC D
;QQD E
	prospectoRR 
=RR 
awaitRR !
_prospectoQueriesRR" 3
.RR3 4'
ObtenerProspectoVistaPreviaRR4 O
(RRO P
resultRRP V
.RRV W
EntityRRW ]
.RR] ^
IdRR^ `
)RR` a
;RRa b
}SS 
catchTT 
(TT 
	ExceptionTT 
eTT 
)TT 
{TT  !
resultTT" (
.TT( )
EntityTT) /
=TT0 1
newTT2 5

EntidadDtoTT6 @
{TTA B
MensajeTTC J
=TTK L
eTTM N
.TTN O
MessageTTO V
.TTV W
ToStringTTW _
(TT_ `
)TT` a
}TTb c
;TTc d
}TTe f
resultVV 
.VV 
auditResponseVV  
.VV  !
idTransaccionVV! .
=VV/ 0 
_headerConfigurationVV1 E
.VVE F
idTransaccionVVF S
;VVS T
timeMeasureWW 
.WW 
StopWW 
(WW 
)WW 
;WW 
_impresionLogXX 
.XX 
DatosFinMetodoXX (
(XX( )
$strXX) A
,XXA B 
_headerConfigurationXXC W
.XXW X
idTransaccionXXX e
,XXe f 
_headerConfigurationXXg {
.XX{ |
correlationId	XX| â
,
XXâ ä
result
XXã ë
)
XXë í
;
XXí ì
_impresionLogYY 
.YY 
	FinMetodoYY #
(YY# $
$strYY$ <
,YY< = 
_headerConfigurationYY> R
.YYR S
idTransaccionYYS `
,YY` a 
_headerConfigurationYYb v
.YYv w
correlationId	YYw Ñ
,
YYÑ Ö
$str
YYÜ ë
,
YYë í
timeMeasure
YYì û
.
YYû ü
Elapsed
YYü ¶
.
YY¶ ß
TotalMilliseconds
YYß ∏
.
YY∏ π
ToString
YYπ ¡
(
YY¡ ¬
)
YY¬ √
)
YY√ ƒ
;
YYƒ ≈
return[[ 
	prospecto[[ 
.[[ 
Entity[[ #
==[[$ &
null[[' +
?[[, -
CreatedAtAction[[. =
([[= >
nameof[[> D
([[D E
	Registrar[[E N
)[[N O
,[[O P
result[[Q W
)[[W X
:[[Y Z
CreatedAtAction[[[ j
([[j k
nameof[[k q
([[q r
	Registrar[[r {
)[[{ |
,[[| }
	prospecto	[[~ á
)
[[á à
;
[[à â
}\\ 	
[^^ 	
Route^^	 
(^^ 
$str^^ 
)^^  
]^^  !
[__ 	
HttpPut__	 
]__ 
[`` 	
SwaggerOperation``	 
(`` 
Summary`` !
=``" #
$str``$ :
,``: ;
Description``< G
=``H I
$str``J `
)``` a
]``a b
[aa 	!
SwaggerRequestExampleaa	 
(aa 
typeofaa %
(aa% &&
ActualizarProspectoCommandaa& @
)aa@ A
,aaA B
typeofaaC I
(aaI J4
(RequestActualizarProspectoCommandExampleaaJ r
)aar s
)aas t
]aat u
[bb 	
SwaggerResponsebb	 
(bb 
StatusCodesbb $
.bb$ %
Status201Createdbb% 5
,bb5 6
typebb7 ;
:bb; <
typeofbb= C
(bbC D
ResponseModelbbD Q
<bbQ R

EntidadDtobbR \
>bb\ ]
)bb] ^
)bb^ _
]bb_ `
[cc 	"
SwaggerResponseExamplecc	 
(cc  
StatusCodescc  +
.cc+ ,
Status201Createdcc, <
,cc< =
typeofcc> D
(ccD E5
)ResponseActualizarProspectoCommandExampleccE n
)ccn o
)cco p
]ccp q
[dd 	
SwaggerResponsedd	 
(dd 
StatusCodesdd $
.dd$ %(
Status500InternalServerErrordd% A
,ddA B
typeddC G
:ddG H
typeofddI O
(ddO P
ResponseModelddP ]
<dd] ^

EntidadDtodd^ h
>ddh i
)ddi j
)ddj k
]ddk l
[ee 	"
SwaggerResponseExampleee	 
(ee  
StatusCodesee  +
.ee+ ,(
Status500InternalServerErroree, H
,eeH I
typeofeeJ P
(eeP Q.
"ResponseInternalServerModelExampleeeQ s
)ees t
)eet u
]eeu v
publicff 
asyncff 
Taskff 
<ff 
ActionResultff &
<ff& '
ResponseModelff' 4
<ff4 5
	Prospectoff5 >
>ff> ?
>ff? @
>ff@ A

ActualizarffB L
(ffL M
[ffM N
FromBodyffN V
]ffV W&
ActualizarProspectoCommandffX r'
actualizarProspectoCommand	ffs ç
)
ffç é
{gg 	
RequestModelhh 
<hh &
ActualizarProspectoCommandhh 3
>hh3 4
requestModelhh5 A
=hhB C
newhhD G
RequestModelhhH T
<hhT U&
ActualizarProspectoCommandhhU o
>hho p
(hhp q
)hhq r
{hhs t
Entityhhu {
=hh| }'
actualizarProspectoCommand	hh~ ò
,
hhò ô
auditRequest
hhö ¶
=
hhß ®"
_headerConfiguration
hh© Ω
.
hhΩ æ
auditRequest
hhæ  
}
hhÀ Ã
;
hhÃ Õ
	Stopwatchii 
timeMeasureii !
=ii" #
newii$ '
	Stopwatchii( 1
(ii1 2
)ii2 3
;ii3 4
ResponseModeljj 
<jj 

EntidadDtojj $
>jj$ %
resultjj& ,
=jj- .
newjj/ 2
ResponseModeljj3 @
<jj@ A

EntidadDtojjA K
>jjK L
(jjL M
)jjM N
;jjN O
ResponseModelkk 
<kk 
	Prospectokk #
>kk# $
	prospectokk% .
=kk/ 0
newkk1 4
ResponseModelkk5 B
<kkB C
	ProspectokkC L
>kkL M
(kkM N
)kkN O
;kkO P
timeMeasurell 
.ll 
Startll 
(ll 
)ll 
;ll  
_impresionLognn 
.nn 
InicioMetodonn &
(nn& '
$strnn' @
,nn@ A 
_headerConfigurationnnB V
.nnV W
idTransaccionnnW d
,nnd e 
_headerConfigurationnnf z
.nnz {
correlationId	nn{ à
,
nnà â
$str
nnä ñ
)
nnñ ó
;
nnó ò
_impresionLogoo 
.oo 
DatosInicioMetodooo +
(oo+ ,
$stroo, D
,ooD E 
_headerConfigurationooF Z
.ooZ [
idTransaccionoo[ h
,ooh i 
_headerConfigurationooj ~
.oo~ 
correlationId	oo å
,
ooå ç
requestModel
ooé ö
)
ooö õ
;
ooõ ú&
actualizarProspectoCommandqq &
.qq& '
CodigoRangoEdadqq' 6
=qq7 8&
actualizarProspectoCommandqq9 S
.qqS T
FechaNacimientoqqT c
.qqc d
HasValueqqd l
?qqm n
awaitrr5 :
_generalesQueriesrr; L
.rrL M"
ObtenerCodigoRangoEdadrrM c
(rrc d&
actualizarProspectoCommandrrd ~
.rr~ 
FechaNacimiento	rr é
.
rré è
Value
rrè î
,
rrî ï"
_headerConfiguration
rrñ ™
.
rr™ ´
idIntermediario
rr´ ∫
)
rr∫ ª
:
rrº Ω
default
rræ ≈
(
rr≈ ∆
short
rr∆ À
?
rrÀ Ã
)
rrÃ Õ
;
rrÕ Œ&
actualizarProspectoCommandss &
.ss& '
CodigoRangoFondoss' 7
=ss8 9&
actualizarProspectoCommandss: T
.ssT U$
ProspectoAdnRentaCommandssU m
.ssm n 
MonedaPatrimonioAfp	ssn Å
.
ssÅ Ç
HasValue
ssÇ ä
?
ssã å
awaittt6 ;
_generalesQueriestt< M
.ttM N#
ObtenerCodigoRangoFondottN e
(tte f'
actualizarProspectoCommand	ttf Ä
.
ttÄ Å&
ProspectoAdnRentaCommand
ttÅ ô
.
ttô ö!
MonedaPatrimonioAfp
ttö ≠
.
tt≠ Æ
Value
ttÆ ≥
,
tt≥ ¥"
_headerConfiguration
ttµ …
.
tt…  
idIntermediario
tt  Ÿ
)
ttŸ ⁄
:
tt€ ‹
default
tt› ‰
(
tt‰ Â
short
ttÂ Í
?
ttÍ Î
)
ttÎ Ï
;
ttÏ Ì
tryvv 
{ww 
resultxx 
=xx 
awaitxx 
	_mediatorxx (
.xx( )
Sendxx) -
(xx- .&
actualizarProspectoCommandxx. H
)xxH I
;xxI J
	prospectoyy 
=yy 
awaityy !
_prospectoQueriesyy" 3
.yy3 4'
ObtenerProspectoVistaPreviayy4 O
(yyO P
resultyyP V
.yyV W
EntityyyW ]
.yy] ^
Idyy^ `
)yy` a
;yya b
}zz 
catch{{ 
({{ 
	Exception{{ 
e{{ 
){{ 
{{{  !
result{{" (
.{{( )
Entity{{) /
={{0 1
new{{2 5

EntidadDto{{6 @
{{{A B
Mensaje{{C J
={{K L
e{{M N
.{{N O
Message{{O V
.{{V W
ToString{{W _
({{_ `
){{` a
}{{b c
;{{c d
}{{e f
result}} 
.}} 
auditResponse}}  
.}}  !
idTransaccion}}! .
=}}/ 0 
_headerConfiguration}}1 E
.}}E F
idTransaccion}}F S
;}}S T
timeMeasure 
. 
Stop 
( 
) 
; 
_impresionLog
ÄÄ 
.
ÄÄ 
DatosFinMetodo
ÄÄ (
(
ÄÄ( )
$str
ÄÄ) B
,
ÄÄB C"
_headerConfiguration
ÄÄD X
.
ÄÄX Y
idTransaccion
ÄÄY f
,
ÄÄf g"
_headerConfiguration
ÄÄh |
.
ÄÄ| }
correlationIdÄÄ} ä
,ÄÄä ã
resultÄÄå í
)ÄÄí ì
;ÄÄì î
_impresionLog
ÅÅ 
.
ÅÅ 
	FinMetodo
ÅÅ #
(
ÅÅ# $
$str
ÅÅ$ =
,
ÅÅ= >"
_headerConfiguration
ÅÅ? S
.
ÅÅS T
idTransaccion
ÅÅT a
,
ÅÅa b"
_headerConfiguration
ÅÅc w
.
ÅÅw x
correlationIdÅÅx Ö
,ÅÅÖ Ü
$strÅÅá ì
,ÅÅì î
timeMeasureÅÅï †
.ÅÅ† °
ElapsedÅÅ° ®
.ÅÅ® ©!
TotalMillisecondsÅÅ© ∫
.ÅÅ∫ ª
ToStringÅÅª √
(ÅÅ√ ƒ
)ÅÅƒ ≈
)ÅÅ≈ ∆
;ÅÅ∆ «
return
ÉÉ 
	prospecto
ÉÉ 
.
ÉÉ 
Entity
ÉÉ #
==
ÉÉ$ &
null
ÉÉ' +
?
ÉÉ, -
CreatedAtAction
ÉÉ. =
(
ÉÉ= >
nameof
ÉÉ> D
(
ÉÉD E
	Registrar
ÉÉE N
)
ÉÉN O
,
ÉÉO P
result
ÉÉQ W
)
ÉÉW X
:
ÉÉY Z
CreatedAtAction
ÉÉ[ j
(
ÉÉj k
nameof
ÉÉk q
(
ÉÉq r
	Registrar
ÉÉr {
)
ÉÉ{ |
,
ÉÉ| }
	prospectoÉÉ~ á
)ÉÉá à
;ÉÉà â
}
ÑÑ 	
[
ÜÜ 	
Route
ÜÜ	 
(
ÜÜ 
$str
ÜÜ )
)
ÜÜ) *
]
ÜÜ* +
[
áá 	
HttpPut
áá	 
]
áá 
[
àà 	
SwaggerOperation
àà	 
(
àà 
Summary
àà !
=
àà" #
$str
àà$ 9
,
àà9 :
Description
àà; F
=
ààG H
$str
ààI ^
)
àà^ _
]
àà_ `
[
ââ 	#
SwaggerRequestExample
ââ	 
(
ââ 
typeof
ââ %
(
ââ% &(
ActualizarProspectoCommand
ââ& @
)
ââ@ A
,
ââA B
typeof
ââC I
(
ââI J5
'RequestDescartarProspectoCommandExample
ââJ q
)
ââq r
)
ââr s
]
ââs t
[
ää 	
SwaggerResponse
ää	 
(
ää 
StatusCodes
ää $
.
ää$ %
Status201Created
ää% 5
,
ää5 6
type
ää7 ;
:
ää; <
typeof
ää= C
(
ääC D
ResponseModel
ääD Q
<
ääQ R

EntidadDto
ääR \
>
ää\ ]
)
ää] ^
)
ää^ _
]
ää_ `
[
ãã 	$
SwaggerResponseExample
ãã	 
(
ãã  
StatusCodes
ãã  +
.
ãã+ ,
Status201Created
ãã, <
,
ãã< =
typeof
ãã> D
(
ããD E6
(ResponseDescartarProspectoCommandExample
ããE m
)
ããm n
)
ããn o
]
ãão p
[
åå 	
SwaggerResponse
åå	 
(
åå 
StatusCodes
åå $
.
åå$ %*
Status500InternalServerError
åå% A
,
ååA B
type
ååC G
:
ååG H
typeof
ååI O
(
ååO P
ResponseModel
ååP ]
<
åå] ^

EntidadDto
åå^ h
>
ååh i
)
ååi j
)
ååj k
]
ååk l
[
çç 	$
SwaggerResponseExample
çç	 
(
çç  
StatusCodes
çç  +
.
çç+ ,*
Status500InternalServerError
çç, H
,
ççH I
typeof
ççJ P
(
ççP Q0
"ResponseInternalServerModelExample
ççQ s
)
ççs t
)
ççt u
]
ççu v
public
éé 
async
éé 
Task
éé 
<
éé 
ActionResult
éé &
<
éé& '
ResponseModel
éé' 4
<
éé4 5

EntidadDto
éé5 ?
>
éé? @
>
éé@ A
>
ééA B
	Descartar
ééC L
(
ééL M
[
ééM N
FromBody
ééN V
]
ééV W'
DescartarProspectoCommand
ééX q(
descartarProspectoCommandéér ã
)ééã å
{
èè 	
RequestModel
êê 
<
êê '
DescartarProspectoCommand
êê 2
>
êê2 3
requestModel
êê4 @
=
êêA B
new
êêC F
RequestModel
êêG S
<
êêS T'
DescartarProspectoCommand
êêT m
>
êêm n
(
êên o
)
êêo p
{
êêq r
Entity
êês y
=
êêz {(
descartarProspectoCommandêê| ï
,êêï ñ
auditRequestêêó £
=êê§ •$
_headerConfigurationêê¶ ∫
.êê∫ ª
auditRequestêêª «
}êê» …
;êê…  
	Stopwatch
ëë 
timeMeasure
ëë !
=
ëë" #
new
ëë$ '
	Stopwatch
ëë( 1
(
ëë1 2
)
ëë2 3
;
ëë3 4
ResponseModel
íí 
<
íí 

EntidadDto
íí $
>
íí$ %
result
íí& ,
=
íí- .
new
íí/ 2
ResponseModel
íí3 @
<
íí@ A

EntidadDto
ííA K
>
ííK L
(
ííL M
)
ííM N
;
ííN O
timeMeasure
ìì 
.
ìì 
Start
ìì 
(
ìì 
)
ìì 
;
ìì  
_impresionLog
ïï 
.
ïï 
InicioMetodo
ïï &
(
ïï& '
$str
ïï' @
,
ïï@ A"
_headerConfiguration
ïïB V
.
ïïV W
idTransaccion
ïïW d
,
ïïd e"
_headerConfiguration
ïïf z
.
ïïz {
correlationIdïï{ à
,ïïà â
$strïïä ï
)ïïï ñ
;ïïñ ó
_impresionLog
ññ 
.
ññ 
DatosInicioMetodo
ññ +
(
ññ+ ,
$str
ññ, E
,
ññE F"
_headerConfiguration
ññG [
.
ññ[ \
idTransaccion
ññ\ i
,
ññi j"
_headerConfiguration
ññk 
.ññ Ä
correlationIdññÄ ç
,ññç é
requestModelññè õ
)ññõ ú
;ññú ù
try
òò 
{
òò 
result
òò 
=
òò 
await
òò  
	_mediator
òò! *
.
òò* +
Send
òò+ /
(
òò/ 0'
descartarProspectoCommand
òò0 I
)
òòI J
;
òòJ K
}
òòL M
catch
ôô 
(
ôô 
	Exception
ôô 
e
ôô 
)
ôô 
{
ôô  !
result
ôô" (
.
ôô( )
Entity
ôô) /
=
ôô0 1
new
ôô2 5

EntidadDto
ôô6 @
{
ôôA B
Mensaje
ôôC J
=
ôôK L
e
ôôM N
.
ôôN O
Message
ôôO V
.
ôôV W
ToString
ôôW _
(
ôô_ `
)
ôô` a
}
ôôb c
;
ôôc d
}
ôôe f
result
öö 
.
öö 
auditResponse
öö  
.
öö  !
idTransaccion
öö! .
=
öö/ 0"
_headerConfiguration
öö1 E
.
ööE F
idTransaccion
ööF S
;
ööS T
timeMeasure
úú 
.
úú 
Stop
úú 
(
úú 
)
úú 
;
úú 
_impresionLog
ùù 
.
ùù 
DatosFinMetodo
ùù (
(
ùù( )
$str
ùù) B
,
ùùB C"
_headerConfiguration
ùùD X
.
ùùX Y
idTransaccion
ùùY f
,
ùùf g"
_headerConfiguration
ùùh |
.
ùù| }
correlationIdùù} ä
,ùùä ã
resultùùå í
)ùùí ì
;ùùì î
_impresionLog
ûû 
.
ûû 
	FinMetodo
ûû #
(
ûû# $
$str
ûû$ =
,
ûû= >"
_headerConfiguration
ûû? S
.
ûûS T
idTransaccion
ûûT a
,
ûûa b"
_headerConfiguration
ûûc w
.
ûûw x
correlationIdûûx Ö
,ûûÖ Ü
$strûûá í
,ûûí ì
timeMeasureûûî ü
.ûûü †
Elapsedûû† ß
.ûûß ®!
TotalMillisecondsûû® π
.ûûπ ∫
ToStringûû∫ ¬
(ûû¬ √
)ûû√ ƒ
)ûûƒ ≈
;ûû≈ ∆
return
†† 
Ok
†† 
(
†† 
result
†† 
)
†† 
;
†† 
}
°° 	
[
££ 	
HttpGet
££	 
]
££ 
[
§§ 	
Route
§§	 
(
§§ 
$str
§§  
)
§§  !
]
§§! "
[
•• 	
SwaggerOperation
••	 
(
•• 
Summary
•• !
=
••" #
$str
••$ B
,
••B C
Description
••D O
=
••P Q
$str
••R p
)
••p q
]
••q r
[
¶¶ 	
SwaggerResponse
¶¶	 
(
¶¶ 
StatusCodes
¶¶ $
.
¶¶$ %
Status200OK
¶¶% 0
,
¶¶0 1
type
¶¶2 6
:
¶¶6 7
typeof
¶¶8 >
(
¶¶> ?
ResponseModel
¶¶? L
<
¶¶L M
List
¶¶M Q
<
¶¶Q R
	Prospecto
¶¶R [
>
¶¶[ \
>
¶¶\ ]
)
¶¶] ^
)
¶¶^ _
]
¶¶_ `
[
ßß 	$
SwaggerResponseExample
ßß	 
(
ßß  
StatusCodes
ßß  +
.
ßß+ ,
Status200OK
ßß, 7
,
ßß7 8
typeof
ßß9 ?
(
ßß? @3
%ResponseObtenerProspectosQueryExample
ßß@ e
)
ßße f
)
ßßf g
]
ßßg h
[
®® 	
SwaggerResponse
®®	 
(
®® 
StatusCodes
®® $
.
®®$ %*
Status500InternalServerError
®®% A
,
®®A B
type
®®C G
:
®®G H
typeof
®®I O
(
®®O P
ResponseModel
®®P ]
<
®®] ^
List
®®^ b
<
®®b c
	Prospecto
®®c l
>
®®l m
>
®®m n
)
®®n o
)
®®o p
]
®®p q
[
©© 	$
SwaggerResponseExample
©©	 
(
©©  
StatusCodes
©©  +
.
©©+ ,*
Status500InternalServerError
©©, H
,
©©H I
typeof
©©J P
(
©©P Q0
"ResponseInternalServerModelExample
©©Q s
)
©©s t
)
©©t u
]
©©u v
public
´´ 
async
´´ 
Task
´´ 
<
´´ 
ActionResult
´´ &
<
´´& '
ResponseModel
´´' 4
<
´´4 5
List
´´5 9
<
´´9 :
	Prospecto
´´: C
>
´´C D
>
´´D E
>
´´E F
>
´´F G'
ObtenerProspectoPorFiltro
´´H a
(
´´a b
[
´´b c
	FromQuery
´´c l
]
´´l m#
ProspectoQueryFilter´´m Å$
prospectoQueryFilter´´Ç ñ
)´´ñ ó
{
¨¨ 	
	Stopwatch
≠≠ 
timeMeasure
≠≠ !
=
≠≠" #
new
≠≠$ '
	Stopwatch
≠≠( 1
(
≠≠1 2
)
≠≠2 3
;
≠≠3 4
timeMeasure
ÆÆ 
.
ÆÆ 
Start
ÆÆ 
(
ÆÆ 
)
ÆÆ 
;
ÆÆ  "
prospectoQueryFilter
ØØ  
.
ØØ  !!
codigointermediario
ØØ! 4
=
ØØ5 6"
_headerConfiguration
ØØ7 K
.
ØØK L
idIntermediario
ØØL [
;
ØØ[ \
_impresionLog
±± 
.
±± 
InicioMetodo
±± &
(
±±& '
$str
±±' @
,
±±@ A"
_headerConfiguration
±±B V
.
±±V W
idTransaccion
±±W d
,
±±d e"
_headerConfiguration
±±f z
.
±±z {
correlationId±±{ à
,±±à â
$str±±ä ∂
)±±∂ ∑
;±±∑ ∏
_logger
≤≤ 
.
≤≤ 
LogInformation
≤≤ "
(
≤≤" #
$str
≤≤# -
,
≤≤- .
$str
≤≤/ K
+
≤≤L M
$str
≤≤N V
+
≤≤W X"
_headerConfiguration
≤≤Y m
.
≤≤m n
idTransaccion
≤≤n {
+
≤≤| }
$str≤≤~ á
+≤≤à â$
_headerConfiguration≤≤ä û
.≤≤û ü
correlationId≤≤ü ¨
+≤≤≠ Æ
$str≤≤Ø ≤
+≤≤≥ ¥
$str≤≤µ  
+≤≤À Ã
JsonConvert
≥≥  
.
≥≥  !
SerializeObject
≥≥! 0
(
≥≥0 1"
_headerConfiguration
≥≥1 E
.
≥≥E F
auditRequest
≥≥F R
,
≥≥R S

Formatting
≥≥T ^
.
≥≥^ _
Indented
≥≥_ g
)
≥≥g h
+
≥≥i j
$str≥≥k É
+≥≥Ñ Ö$
prospectoQueryFilter≥≥Ü ö
)≥≥ö õ
;≥≥õ ú
var
µµ 
result
µµ 
=
µµ 
await
µµ 
_prospectoQueries
µµ 0
.
µµ0 1'
ObtenerProspectoPorFiltro
µµ1 J
(
µµJ K"
prospectoQueryFilter
µµK _
)
µµ_ `
;
µµ` a
result
∂∂ 
.
∂∂ 
auditResponse
∂∂  
.
∂∂  !
idTransaccion
∂∂! .
=
∂∂/ 0"
_headerConfiguration
∂∂1 E
.
∂∂E F
idTransaccion
∂∂F S
;
∂∂S T
timeMeasure
∏∏ 
.
∏∏ 
Stop
∏∏ 
(
∏∏ 
)
∏∏ 
;
∏∏ 
_impresionLog
ππ 
.
ππ 
DatosFinMetodo
ππ (
(
ππ( )
$str
ππ) B
,
ππB C"
_headerConfiguration
ππD X
.
ππX Y
idTransaccion
ππY f
,
ππf g"
_headerConfiguration
ππh |
.
ππ| }
correlationIdππ} ä
,ππä ã
resultππå í
)ππí ì
;ππì î
_impresionLog
∫∫ 
.
∫∫ 
	FinMetodo
∫∫ #
(
∫∫# $
$str
∫∫$ =
,
∫∫= >"
_headerConfiguration
∫∫? S
.
∫∫S T
idTransaccion
∫∫T a
,
∫∫a b"
_headerConfiguration
∫∫c w
.
∫∫w x
correlationId∫∫x Ö
,∫∫Ö Ü
$str∫∫á ≥
,∫∫≥ ¥
timeMeasure∫∫µ ¿
.∫∫¿ ¡
Elapsed∫∫¡ »
.∫∫» …!
TotalMilliseconds∫∫… ⁄
.∫∫⁄ €
ToString∫∫€ „
(∫∫„ ‰
)∫∫‰ Â
)∫∫Â Ê
;∫∫Ê Á
return
ºº 
Ok
ºº 
(
ºº 
result
ºº 
)
ºº 
;
ºº 
}
ΩΩ 	
[
øø 	
HttpGet
øø	 
]
øø 
[
¿¿ 	
Route
¿¿	 
(
¿¿ 
$str
¿¿ -
)
¿¿- .
]
¿¿. /
[
¡¡ 	
SwaggerOperation
¡¡	 
(
¡¡ 
Summary
¡¡ !
=
¡¡" #
$str
¡¡$ O
,
¡¡O P
Description
¡¡Q \
=
¡¡] ^
$str¡¡_ ä
)¡¡ä ã
]¡¡ã å
[
¬¬ 	
SwaggerResponse
¬¬	 
(
¬¬ 
StatusCodes
¬¬ $
.
¬¬$ %
Status200OK
¬¬% 0
,
¬¬0 1
type
¬¬2 6
:
¬¬6 7
typeof
¬¬8 >
(
¬¬> ?
ResponseModel
¬¬? L
<
¬¬L M
List
¬¬M Q
<
¬¬Q R
	Prospecto
¬¬R [
>
¬¬[ \
>
¬¬\ ]
)
¬¬] ^
)
¬¬^ _
]
¬¬_ `
[
√√ 	$
SwaggerResponseExample
√√	 
(
√√  
StatusCodes
√√  +
.
√√+ ,
Status200OK
√√, 7
,
√√7 8
typeof
√√9 ?
(
√√? @9
+ResponseObtenerProspectoDetalleQueryExample
√√@ k
)
√√k l
)
√√l m
]
√√m n
[
ƒƒ 	
SwaggerResponse
ƒƒ	 
(
ƒƒ 
StatusCodes
ƒƒ $
.
ƒƒ$ %*
Status500InternalServerError
ƒƒ% A
,
ƒƒA B
type
ƒƒC G
:
ƒƒG H
typeof
ƒƒI O
(
ƒƒO P
ResponseModel
ƒƒP ]
<
ƒƒ] ^(
ActualizarProspectoCommand
ƒƒ^ x
>
ƒƒx y
)
ƒƒy z
)
ƒƒz {
]
ƒƒ{ |
[
≈≈ 	$
SwaggerResponseExample
≈≈	 
(
≈≈  
StatusCodes
≈≈  +
.
≈≈+ ,*
Status500InternalServerError
≈≈, H
,
≈≈H I
typeof
≈≈J P
(
≈≈P Q0
"ResponseInternalServerModelExample
≈≈Q s
)
≈≈s t
)
≈≈t u
]
≈≈u v
public
«« 
async
«« 
Task
«« 
<
«« 
ActionResult
«« &
<
««& '
ResponseModel
««' 4
<
««4 5(
ActualizarProspectoCommand
««5 O
>
««O P
>
««P Q
>
««Q R3
%ObtenerProspectoDetallePorIdProspecto
««S x
(
««x y
string
««y 
idprospecto««Ä ã
)««ã å
{
»» 	
	Stopwatch
…… 
timeMeasure
…… !
=
……" #
new
……$ '
	Stopwatch
……( 1
(
……1 2
)
……2 3
;
……3 4
timeMeasure
   
.
   
Start
   
(
   
)
   
;
    
_impresionLog
ÃÃ 
.
ÃÃ 
InicioMetodo
ÃÃ &
(
ÃÃ& '
$str
ÃÃ' @
,
ÃÃ@ A"
_headerConfiguration
ÃÃB V
.
ÃÃV W
idTransaccion
ÃÃW d
,
ÃÃd e"
_headerConfiguration
ÃÃf z
.
ÃÃz {
correlationIdÃÃ{ à
,ÃÃà â
$strÃÃä ±
)ÃÃ± ≤
;ÃÃ≤ ≥
_logger
ÕÕ 
.
ÕÕ 
LogInformation
ÕÕ "
(
ÕÕ" #
$str
ÕÕ# -
,
ÕÕ- .
$str
ÕÕ/ K
+
ÕÕL M
$str
ÕÕN V
+
ÕÕW X"
_headerConfiguration
ÕÕY m
.
ÕÕm n
idTransaccion
ÕÕn {
+
ÕÕ| }
$strÕÕ~ á
+ÕÕà â$
_headerConfigurationÕÕä û
.ÕÕû ü
correlationIdÕÕü ¨
+ÕÕ≠ Æ
$strÕÕØ ≤
+ÕÕ≥ ¥
$strÕÕµ  
+ÕÕÀ Ã
JsonConvert
ŒŒ  
.
ŒŒ  !
SerializeObject
ŒŒ! 0
(
ŒŒ0 1"
_headerConfiguration
ŒŒ1 E
.
ŒŒE F
auditRequest
ŒŒF R
,
ŒŒR S

Formatting
ŒŒT ^
.
ŒŒ^ _
Indented
ŒŒ_ g
)
ŒŒg h
+
ŒŒi j
$str
ŒŒk z
+
ŒŒ{ |
idprospectoŒŒ} à
)ŒŒà â
;ŒŒâ ä
var
–– 
result
–– 
=
–– 
await
–– 
_prospectoQueries
–– 0
.
––0 13
%ObtenerProspectoDetallePorIdProspecto
––1 V
(
––V W
idprospecto
––W b
)
––b c
;
––c d
result
—— 
.
—— 
auditResponse
——  
.
——  !
idTransaccion
——! .
=
——/ 0"
_headerConfiguration
——1 E
.
——E F
idTransaccion
——F S
;
——S T
timeMeasure
”” 
.
”” 
Stop
”” 
(
”” 
)
”” 
;
”” 
_impresionLog
‘‘ 
.
‘‘ 
DatosFinMetodo
‘‘ (
(
‘‘( )
$str
‘‘) B
,
‘‘B C"
_headerConfiguration
‘‘D X
.
‘‘X Y
idTransaccion
‘‘Y f
,
‘‘f g"
_headerConfiguration
‘‘h |
.
‘‘| }
correlationId‘‘} ä
,‘‘ä ã
result‘‘å í
)‘‘í ì
;‘‘ì î
_impresionLog
’’ 
.
’’ 
	FinMetodo
’’ #
(
’’# $
$str
’’$ =
,
’’= >"
_headerConfiguration
’’? S
.
’’S T
idTransaccion
’’T a
,
’’a b"
_headerConfiguration
’’c w
.
’’w x
correlationId’’x Ö
,’’Ö Ü
$str’’á Æ
,’’Æ Ø
timeMeasure’’∞ ª
.’’ª º
Elapsed’’º √
.’’√ ƒ!
TotalMilliseconds’’ƒ ’
.’’’ ÷
ToString’’÷ ﬁ
(’’ﬁ ﬂ
)’’ﬂ ‡
)’’‡ ·
;’’· ‚
return
◊◊ 
Ok
◊◊ 
(
◊◊ 
result
◊◊ 
)
◊◊ 
;
◊◊ 
}
ÿÿ 	
}
ŸŸ 
}⁄⁄ ∑r
TD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Controllers\RecordatorioLlamadaController.cs
	namespace 	
Agenda
 
. 
API 
. 
Controllers  
{ 
[ 
ApiController 
] 
public 

class )
RecordatorioLlamadaController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IImpresionLog &
_impresionLog' 4
;4 5
private 
readonly  
IHeaderConfiguration - 
_headerConfiguration. B
;B C
public )
RecordatorioLlamadaController ,
(, -
	IMediator- 6
mediator7 ?
,? @
IImpresionLog# 0
impresionLog1 =
,= > 
IHeaderConfiguration# 7
headerConfiguration8 K
)K L
{ 	
	_mediator 
= 
mediator  
??! #
throw$ )
new* -!
ArgumentNullException. C
(C D
nameofD J
(J K
mediatorK S
)S T
)T U
;U V
_impresionLog 
= 
impresionLog (
??) +
throw, 1
new2 5!
ArgumentNullException6 K
(K L
nameofL R
(R S
impresionLogS _
)_ `
)` a
;a b 
_headerConfiguration  
=! "
headerConfiguration# 6
??7 9
throw: ?
new@ C!
ArgumentNullExceptionD Y
(Y Z
nameofZ `
(` a
headerConfigurationa t
)t u
)u v
;v w
}   	
["" 	
Route""	 
("" 
$str"" )
)"") *
]""* +
[## 	
HttpPost##	 
]## 
[$$ 	
SwaggerOperation$$	 
($$ 
Summary$$ !
=$$" #
$str$$$ B
,$$B C
Description$$D O
=$$P Q
$str$$R p
)$$p q
]$$q r
[%% 	!
SwaggerRequestExample%%	 
(%% 
typeof%% %
(%%% &+
CrearRecordatorioLlamadaCommand%%& E
)%%E F
,%%F G
typeof%%H N
(%%N O9
-RequestCrearRecordatorioLlamadaCommandExample%%O |
)%%| }
)%%} ~
]%%~ 
[&& 	
SwaggerResponse&&	 
(&& 
StatusCodes&& $
.&&$ %
Status201Created&&% 5
,&&5 6
type&&7 ;
:&&; <
typeof&&= C
(&&C D
ResponseModel&&D Q
<&&Q R

EntidadDto&&R \
>&&\ ]
)&&] ^
)&&^ _
]&&_ `
['' 	"
SwaggerResponseExample''	 
(''  
StatusCodes''  +
.''+ ,
Status201Created'', <
,''< =
typeof''> D
(''D E:
.ResponseCrearRecordatorioLlamadaCommandExample''E s
)''s t
)''t u
]''u v
[(( 	
SwaggerResponse((	 
((( 
StatusCodes(( $
.(($ %(
Status500InternalServerError((% A
,((A B
type((C G
:((G H
typeof((I O
(((O P
ResponseModel((P ]
<((] ^

EntidadDto((^ h
>((h i
)((i j
)((j k
]((k l
[)) 	"
SwaggerResponseExample))	 
())  
StatusCodes))  +
.))+ ,(
Status500InternalServerError)), H
,))H I
typeof))J P
())P Q.
"ResponseInternalServerModelExample))Q s
)))s t
)))t u
]))u v
public** 
async** 
Task** 
<** 
ActionResult** &
<**& '
ResponseModel**' 4
<**4 5

EntidadDto**5 ?
>**? @
>**@ A
>**A B
	Registrar**C L
(**L M
[**M N
FromBody**N V
]**V W+
CrearRecordatorioLlamadaCommand**X w,
crearRecordatorioLlamadaCommand	**x ó
)
**ó ò
{++ 	
RequestModel,, 
<,, +
CrearRecordatorioLlamadaCommand,, 8
>,,8 9
requestModel,,: F
=,,G H
new,,I L
RequestModel,,M Y
<,,Y Z+
CrearRecordatorioLlamadaCommand,,Z y
>,,y z
(,,z {
),,{ |
{,,} ~
Entity	,, Ö
=
,,Ü á-
crearRecordatorioLlamadaCommand
,,à ß
,
,,ß ®
auditRequest
,,© µ
=
,,∂ ∑"
_headerConfiguration
,,∏ Ã
.
,,Ã Õ
auditRequest
,,Õ Ÿ
}
,,⁄ €
;
,,€ ‹
	Stopwatch-- 
timeMeasure-- !
=--" #
new--$ '
	Stopwatch--( 1
(--1 2
)--2 3
;--3 4
ResponseModel.. 
<.. 

EntidadDto.. $
>..$ %
result..& ,
=..- .
new../ 2
ResponseModel..3 @
<..@ A

EntidadDto..A K
>..K L
(..L M
)..M N
;..N O
timeMeasure// 
.// 
Start// 
(// 
)// 
;//  
_impresionLog11 
.11 
InicioMetodo11 &
(11& '
$str11' I
,11I J 
_headerConfiguration11K _
.11_ `
idTransaccion11` m
,11m n!
_headerConfiguration	11o É
.
11É Ñ
correlationId
11Ñ ë
,
11ë í
$str
11ì û
)
11û ü
;
11ü †
_impresionLog22 
.22 
DatosInicioMetodo22 +
(22+ ,
$str22, N
,22N O 
_headerConfiguration22P d
.22d e
idTransaccion22e r
,22r s!
_headerConfiguration	22t à
.
22à â
correlationId
22â ñ
,
22ñ ó
requestModel
22ò §
)
22§ •
;
22• ¶
try44 
{44 
result44 
=44 
await44  
	_mediator44! *
.44* +
Send44+ /
(44/ 0+
crearRecordatorioLlamadaCommand440 O
)44O P
;44P Q
}44R S
catch55 
(55 
	Exception55 
e55 
)55 
{55  !
result55" (
.55( )
Entity55) /
=550 1
new552 5

EntidadDto556 @
{55A B
Mensaje55C J
=55K L
e55M N
.55N O
Message55O V
.55V W
ToString55W _
(55_ `
)55` a
}55b c
;55c d
}55e f
result66 
.66 
auditResponse66  
.66  !
idTransaccion66! .
=66/ 0 
_headerConfiguration661 E
.66E F
idTransaccion66F S
;66S T
timeMeasure88 
.88 
Stop88 
(88 
)88 
;88 
_impresionLog99 
.99 
DatosFinMetodo99 (
(99( )
$str99) K
,99K L 
_headerConfiguration99M a
.99a b
idTransaccion99b o
,99o p!
_headerConfiguration	99q Ö
.
99Ö Ü
correlationId
99Ü ì
,
99ì î
result
99ï õ
)
99õ ú
;
99ú ù
_impresionLog:: 
.:: 
	FinMetodo:: #
(::# $
$str::$ F
,::F G 
_headerConfiguration::H \
.::\ ]
idTransaccion::] j
,::j k!
_headerConfiguration	::l Ä
.
::Ä Å
correlationId
::Å é
,
::é è
$str
::ê õ
,
::õ ú
timeMeasure
::ù ®
.
::® ©
Elapsed
::© ∞
.
::∞ ±
TotalMilliseconds
::± ¬
.
::¬ √
ToString
::√ À
(
::À Ã
)
::Ã Õ
)
::Õ Œ
;
::Œ œ
return<< 
CreatedAtAction<< "
(<<" #
nameof<<# )
(<<) *
	Registrar<<* 3
)<<3 4
,<<4 5
result<<6 <
)<<< =
;<<= >
}== 	
[?? 	
Route??	 
(?? 
$str?? )
)??) *
]??* +
[@@ 	
HttpPut@@	 
]@@ 
[AA 	
SwaggerOperationAA	 
(AA 
SummaryAA !
=AA" #
$strAA$ E
,AAE F
DescriptionAAG R
=AAS T
$strAAU v
)AAv w
]AAw x
[BB 	!
SwaggerRequestExampleBB	 
(BB 
typeofBB %
(BB% &+
CrearRecordatorioLlamadaCommandBB& E
)BBE F
,BBF G
typeofBBH N
(BBN O?
2RequestActualizarRecordatorioLlamadaCommandExample	BBO Å
)
BBÅ Ç
)
BBÇ É
]
BBÉ Ñ
[CC 	
SwaggerResponseCC	 
(CC 
StatusCodesCC $
.CC$ %
Status201CreatedCC% 5
,CC5 6
typeCC7 ;
:CC; <
typeofCC= C
(CCC D
ResponseModelCCD Q
<CCQ R

EntidadDtoCCR \
>CC\ ]
)CC] ^
)CC^ _
]CC_ `
[DD 	"
SwaggerResponseExampleDD	 
(DD  
StatusCodesDD  +
.DD+ ,
Status201CreatedDD, <
,DD< =
typeofDD> D
(DDD E?
3ResponseActualizarRecordatorioLlamadaCommandExampleDDE x
)DDx y
)DDy z
]DDz {
[EE 	
SwaggerResponseEE	 
(EE 
StatusCodesEE $
.EE$ %(
Status500InternalServerErrorEE% A
,EEA B
typeEEC G
:EEG H
typeofEEI O
(EEO P
ResponseModelEEP ]
<EE] ^

EntidadDtoEE^ h
>EEh i
)EEi j
)EEj k
]EEk l
[FF 	"
SwaggerResponseExampleFF	 
(FF  
StatusCodesFF  +
.FF+ ,(
Status500InternalServerErrorFF, H
,FFH I
typeofFFJ P
(FFP Q.
"ResponseInternalServerModelExampleFFQ s
)FFs t
)FFt u
]FFu v
publicGG 
asyncGG 
TaskGG 
<GG 
ActionResultGG &
<GG& '
ResponseModelGG' 4
<GG4 5

EntidadDtoGG5 ?
>GG? @
>GG@ A
>GGA B

ActualizarGGC M
(GGM N
[GGN O
FromBodyGGO W
]GGW X0
$ActualizarRecordatorioLlamadaCommandGGY }1
$actualizarRecordatorioLlamadaCommand	GG~ ¢
)
GG¢ £
{HH 	
RequestModelII 
<II 0
$ActualizarRecordatorioLlamadaCommandII =
>II= >
requestModelII? K
=IIL M
newIIN Q
RequestModelIIR ^
<II^ _1
$ActualizarRecordatorioLlamadaCommand	II_ É
>
IIÉ Ñ
(
IIÑ Ö
)
IIÖ Ü
{
IIá à
Entity
IIâ è
=
IIê ë2
$actualizarRecordatorioLlamadaCommand
IIí ∂
,
II∂ ∑
auditRequest
II∏ ƒ
=
II≈ ∆"
_headerConfiguration
II« €
.
II€ ‹
auditRequest
II‹ Ë
}
IIÈ Í
;
IIÍ Î
	StopwatchJJ 
timeMeasureJJ !
=JJ" #
newJJ$ '
	StopwatchJJ( 1
(JJ1 2
)JJ2 3
;JJ3 4
ResponseModelKK 
<KK 

EntidadDtoKK $
>KK$ %
resultKK& ,
=KK- .
newKK/ 2
ResponseModelKK3 @
<KK@ A

EntidadDtoKKA K
>KKK L
(KKL M
)KKM N
;KKN O
timeMeasureLL 
.LL 
StartLL 
(LL 
)LL 
;LL  
_impresionLogNN 
.NN 
InicioMetodoNN &
(NN& '
$strNN' I
,NNI J 
_headerConfigurationNNK _
.NN_ `
idTransaccionNN` m
,NNm n!
_headerConfiguration	NNo É
.
NNÉ Ñ
correlationId
NNÑ ë
,
NNë í
$str
NNì ü
)
NNü †
;
NN† °
_impresionLogOO 
.OO 
DatosInicioMetodoOO +
(OO+ ,
$strOO, N
,OON O 
_headerConfigurationOOP d
.OOd e
idTransaccionOOe r
,OOr s!
_headerConfiguration	OOt à
.
OOà â
correlationId
OOâ ñ
,
OOñ ó
requestModel
OOò §
)
OO§ •
;
OO• ¶
tryQQ 
{QQ 
resultQQ 
=QQ 
awaitQQ  
	_mediatorQQ! *
.QQ* +
SendQQ+ /
(QQ/ 00
$actualizarRecordatorioLlamadaCommandQQ0 T
)QQT U
;QQU V
}QQW X
catchRR 
(RR 
	ExceptionRR 
eRR 
)RR 
{RR  !
resultRR" (
.RR( )
EntityRR) /
=RR0 1
newRR2 5

EntidadDtoRR6 @
{RRA B
MensajeRRC J
=RRK L
eRRM N
.RRN O
MessageRRO V
.RRV W
ToStringRRW _
(RR_ `
)RR` a
}RRb c
;RRc d
}RRe f
resultSS 
.SS 
auditResponseSS  
.SS  !
idTransaccionSS! .
=SS/ 0 
_headerConfigurationSS1 E
.SSE F
idTransaccionSSF S
;SSS T
timeMeasureUU 
.UU 
StopUU 
(UU 
)UU 
;UU 
_impresionLogVV 
.VV 
DatosFinMetodoVV (
(VV( )
$strVV) K
,VVK L 
_headerConfigurationVVM a
.VVa b
idTransaccionVVb o
,VVo p!
_headerConfiguration	VVq Ö
.
VVÖ Ü
correlationId
VVÜ ì
,
VVì î
result
VVï õ
)
VVõ ú
;
VVú ù
_impresionLogWW 
.WW 
	FinMetodoWW #
(WW# $
$strWW$ F
,WWF G 
_headerConfigurationWWH \
.WW\ ]
idTransaccionWW] j
,WWj k!
_headerConfiguration	WWl Ä
.
WWÄ Å
correlationId
WWÅ é
,
WWé è
$str
WWê ú
,
WWú ù
timeMeasure
WWû ©
.
WW© ™
Elapsed
WW™ ±
.
WW± ≤
TotalMilliseconds
WW≤ √
.
WW√ ƒ
ToString
WWƒ Ã
(
WWÃ Õ
)
WWÕ Œ
)
WWŒ œ
;
WWœ –
returnYY 
CreatedAtActionYY "
(YY" #
nameofYY# )
(YY) *
	RegistrarYY* 3
)YY3 4
,YY4 5
resultYY6 <
)YY< =
;YY= >
}ZZ 	
}[[ 
}\\ ∞l
HD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Controllers\ReunionController.cs
	namespace 	
Agenda
 
. 
API 
. 
Controllers  
{ 
[ 
ApiController 
] 
public 

class 
ReunionController "
:# $
ControllerBase% 3
{ 
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IImpresionLog &
_impresionLog' 4
;4 5
private 
readonly  
IHeaderConfiguration - 
_headerConfiguration. B
;B C
private 
readonly ,
 IConsolidadoIntermediarioQueries 9,
 _consolidadoIntermediarioQueries: Z
;Z [
public 
ReunionController  
(  !
	IMediator! *
mediator+ 3
,3 4
IImpresionLog# 0
impresionLog1 =
,= > 
IHeaderConfiguration# 7
headerConfiguration8 K
,K L,
 IConsolidadoIntermediarioQueries# C+
consolidadoIntermediarioQueriesD c
)c d
{ 	
	_mediator   
=   
mediator    
??  ! #
throw  $ )
new  * -!
ArgumentNullException  . C
(  C D
nameof  D J
(  J K
mediator  K S
)  S T
)  T U
;  U V
_impresionLog!! 
=!! 
impresionLog!! (
??!!) +
throw!!, 1
new!!2 5!
ArgumentNullException!!6 K
(!!K L
nameof!!L R
(!!R S
impresionLog!!S _
)!!_ `
)!!` a
;!!a b 
_headerConfiguration""  
=""! "
headerConfiguration""# 6
??""7 9
throw"": ?
new""@ C!
ArgumentNullException""D Y
(""Y Z
nameof""Z `
(""` a
headerConfiguration""a t
)""t u
)""u v
;""v w,
 _consolidadoIntermediarioQueries## ,
=##- .+
consolidadoIntermediarioQueries##/ N
??##O Q
throw##R W
new##X [!
ArgumentNullException##\ q
(##q r
nameof##r x
(##x y,
consolidadoIntermediarioQueries	##y ò
)
##ò ô
)
##ô ö
;
##ö õ
}$$ 	
[&& 	
Route&&	 
(&& 
$str&& 
)&& 
]&& 
['' 	
HttpPost''	 
]'' 
[(( 	
SwaggerOperation((	 
((( 
Summary(( !
=((" #
$str(($ 5
,((5 6
Description((7 B
=((C D
$str((E V
)((V W
]((W X
[)) 	!
SwaggerRequestExample))	 
()) 
typeof)) %
())% &
CrearReunionCommand))& 9
)))9 :
,)): ;
typeof))< B
())B C-
!RequestCrearReunionCommandExample))C d
)))d e
)))e f
]))f g
[** 	
SwaggerResponse**	 
(** 
StatusCodes** $
.**$ %
Status201Created**% 5
,**5 6
type**7 ;
:**; <
typeof**= C
(**C D
ResponseModel**D Q
<**Q R

EntidadDto**R \
>**\ ]
)**] ^
)**^ _
]**_ `
[++ 	"
SwaggerResponseExample++	 
(++  
StatusCodes++  +
.+++ ,
Status201Created++, <
,++< =
typeof++> D
(++D E.
"ResponseCrearReunionCommandExample++E g
)++g h
)++h i
]++i j
[,, 	
SwaggerResponse,,	 
(,, 
StatusCodes,, $
.,,$ %(
Status500InternalServerError,,% A
,,,A B
type,,C G
:,,G H
typeof,,I O
(,,O P
ResponseModel,,P ]
<,,] ^

EntidadDto,,^ h
>,,h i
),,i j
),,j k
],,k l
[-- 	"
SwaggerResponseExample--	 
(--  
StatusCodes--  +
.--+ ,(
Status500InternalServerError--, H
,--H I
typeof--J P
(--P Q.
"ResponseInternalServerModelExample--Q s
)--s t
)--t u
]--u v
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
ResponseModel..' 4
<..4 5

EntidadDto..5 ?
>..? @
>..@ A
>..A B
	Registrar..C L
(..L M
[..M N
FromBody..N V
]..V W
CrearReunionCommand..X k
crearReunionCommand..l 
)	.. Ä
{// 	
RequestModel00 
<00 
CrearReunionCommand00 ,
>00, -
requestModel00. :
=00; <
new00= @
RequestModel00A M
<00M N
CrearReunionCommand00N a
>00a b
(00b c
)00c d
{00e f
Entity00g m
=00n o 
crearReunionCommand	00p É
,
00É Ñ
auditRequest
00Ö ë
=
00í ì"
_headerConfiguration
00î ®
.
00® ©
auditRequest
00© µ
}
00∂ ∑
;
00∑ ∏
	Stopwatch11 
timeMeasure11 !
=11" #
new11$ '
	Stopwatch11( 1
(111 2
)112 3
;113 4
timeMeasure22 
.22 
Start22 
(22 
)22 
;22  
_impresionLog44 
.44 
InicioMetodo44 &
(44& '
$str44' =
,44= > 
_headerConfiguration44? S
.44S T
idTransaccion44T a
,44a b 
_headerConfiguration44c w
.44w x
correlationId	44x Ö
,
44Ö Ü
$str
44á í
)
44í ì
;
44ì î
_impresionLog55 
.55 
DatosInicioMetodo55 +
(55+ ,
$str55, B
,55B C 
_headerConfiguration55D X
.55X Y
idTransaccion55Y f
,55f g 
_headerConfiguration55h |
.55| }
correlationId	55} ä
,
55ä ã
requestModel
55å ò
)
55ò ô
;
55ô ö
crearReunionCommand77 
.77  &
IdConsolidadoIntermediario77  :
=77; <
await77= B,
 _consolidadoIntermediarioQueries77C c
.77c d.
!ObtenerIdConsolidadoIntermediario	77d Ö
(
77Ö Ü"
_headerConfiguration
77Ü ö
.
77ö õ
idIntermediario
77õ ™
)
77™ ´
;
77´ ¨
var88 
result88 
=88 
await88 
	_mediator88 (
.88( )
Send88) -
(88- .
crearReunionCommand88. A
)88A B
;88B C
result99 
.99 
auditResponse99  
.99  !
idTransaccion99! .
=99/ 0 
_headerConfiguration991 E
.99E F
idTransaccion99F S
;99S T
timeMeasure;; 
.;; 
Stop;; 
(;; 
);; 
;;; 
_impresionLog<< 
.<< 
DatosFinMetodo<< (
(<<( )
$str<<) ?
,<<? @ 
_headerConfiguration<<A U
.<<U V
idTransaccion<<V c
,<<c d 
_headerConfiguration<<e y
.<<y z
correlationId	<<z á
,
<<á à
result
<<â è
)
<<è ê
;
<<ê ë
_impresionLog== 
.== 
	FinMetodo== #
(==# $
$str==$ :
,==: ; 
_headerConfiguration==< P
.==P Q
idTransaccion==Q ^
,==^ _ 
_headerConfiguration==` t
.==t u
correlationId	==u Ç
,
==Ç É
$str
==Ñ è
,
==è ê
timeMeasure
==ë ú
.
==ú ù
Elapsed
==ù §
.
==§ •
TotalMilliseconds
==• ∂
.
==∂ ∑
ToString
==∑ ø
(
==ø ¿
)
==¿ ¡
)
==¡ ¬
;
==¬ √
return?? 
CreatedAtAction?? "
(??" #
nameof??# )
(??) *
	Registrar??* 3
)??3 4
,??4 5
result??6 <
)??< =
;??= >
}@@ 	
[BB 	
RouteBB	 
(BB 
$strBB 
)BB 
]BB 
[CC 	
HttpPutCC	 
]CC 
[DD 	
SwaggerOperationDD	 
(DD 
SummaryDD !
=DD" #
$strDD$ 8
,DD8 9
DescriptionDD: E
=DDF G
$strDDH \
)DD\ ]
]DD] ^
[EE 	!
SwaggerRequestExampleEE	 
(EE 
typeofEE %
(EE% &$
ActualizarReunionCommandEE& >
)EE> ?
,EE? @
typeofEEA G
(EEG H2
&RequestActualizarReunionCommandExampleEEH n
)EEn o
)EEo p
]EEp q
[FF 	
SwaggerResponseFF	 
(FF 
StatusCodesFF $
.FF$ %
Status201CreatedFF% 5
,FF5 6
typeFF7 ;
:FF; <
typeofFF= C
(FFC D
ResponseModelFFD Q
<FFQ R

EntidadDtoFFR \
>FF\ ]
)FF] ^
)FF^ _
]FF_ `
[GG 	"
SwaggerResponseExampleGG	 
(GG  
StatusCodesGG  +
.GG+ ,
Status201CreatedGG, <
,GG< =
typeofGG> D
(GGD E3
'ResponseActualizarReunionCommandExampleGGE l
)GGl m
)GGm n
]GGn o
[HH 	
SwaggerResponseHH	 
(HH 
StatusCodesHH $
.HH$ %(
Status500InternalServerErrorHH% A
,HHA B
typeHHC G
:HHG H
typeofHHI O
(HHO P
ResponseModelHHP ]
<HH] ^

EntidadDtoHH^ h
>HHh i
)HHi j
)HHj k
]HHk l
[II 	"
SwaggerResponseExampleII	 
(II  
StatusCodesII  +
.II+ ,(
Status500InternalServerErrorII, H
,IIH I
typeofIIJ P
(IIP Q.
"ResponseInternalServerModelExampleIIQ s
)IIs t
)IIt u
]IIu v
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
ActionResultJJ &
<JJ& '
ResponseModelJJ' 4
<JJ4 5

EntidadDtoJJ5 ?
>JJ? @
>JJ@ A
>JJA B

ActualizarJJC M
(JJM N
[JJN O
FromBodyJJO W
]JJW X$
ActualizarReunionCommandJJY q%
actualizarReunionCommand	JJr ä
)
JJä ã
{KK 	
RequestModelLL 
<LL $
ActualizarReunionCommandLL 1
>LL1 2
requestModelLL3 ?
=LL@ A
newLLB E
RequestModelLLF R
<LLR S$
ActualizarReunionCommandLLS k
>LLk l
(LLl m
)LLm n
{LLo p
EntityLLq w
=LLx y%
actualizarReunionCommand	LLz í
,
LLí ì
auditRequest
LLî †
=
LL° ¢"
_headerConfiguration
LL£ ∑
.
LL∑ ∏
auditRequest
LL∏ ƒ
}
LL≈ ∆
;
LL∆ «
	StopwatchMM 
timeMeasureMM !
=MM" #
newMM$ '
	StopwatchMM( 1
(MM1 2
)MM2 3
;MM3 4
timeMeasureNN 
.NN 
StartNN 
(NN 
)NN 
;NN  
_impresionLogPP 
.PP 
InicioMetodoPP &
(PP& '
$strPP' =
,PP= > 
_headerConfigurationPP? S
.PPS T
idTransaccionPPT a
,PPa b 
_headerConfigurationPPc w
.PPw x
correlationId	PPx Ö
,
PPÖ Ü
$str
PPá ì
)
PPì î
;
PPî ï
_impresionLogQQ 
.QQ 
DatosInicioMetodoQQ +
(QQ+ ,
$strQQ, B
,QQB C 
_headerConfigurationQQD X
.QQX Y
idTransaccionQQY f
,QQf g 
_headerConfigurationQQh |
.QQ| }
correlationId	QQ} ä
,
QQä ã
requestModel
QQå ò
)
QQò ô
;
QQô ö
varSS 
resultSS 
=SS 
awaitSS 
	_mediatorSS (
.SS( )
SendSS) -
(SS- .$
actualizarReunionCommandSS. F
)SSF G
;SSG H
resultTT 
.TT 
auditResponseTT  
.TT  !
idTransaccionTT! .
=TT/ 0 
_headerConfigurationTT1 E
.TTE F
idTransaccionTTF S
;TTS T
timeMeasureVV 
.VV 
StopVV 
(VV 
)VV 
;VV 
_impresionLogWW 
.WW 
DatosFinMetodoWW (
(WW( )
$strWW) ?
,WW? @ 
_headerConfigurationWWA U
.WWU V
idTransaccionWWV c
,WWc d 
_headerConfigurationWWe y
.WWy z
correlationId	WWz á
,
WWá à
result
WWâ è
)
WWè ê
;
WWê ë
_impresionLogXX 
.XX 
	FinMetodoXX #
(XX# $
$strXX$ :
,XX: ; 
_headerConfigurationXX< P
.XXP Q
idTransaccionXXQ ^
,XX^ _ 
_headerConfigurationXX` t
.XXt u
correlationId	XXu Ç
,
XXÇ É
$str
XXÑ ê
,
XXê ë
timeMeasure
XXí ù
.
XXù û
Elapsed
XXû •
.
XX• ¶
TotalMilliseconds
XX¶ ∑
.
XX∑ ∏
ToString
XX∏ ¿
(
XX¿ ¡
)
XX¡ ¬
)
XX¬ √
;
XX√ ƒ
returnZZ 
CreatedAtActionZZ "
(ZZ" #
nameofZZ# )
(ZZ) *

ActualizarZZ* 4
)ZZ4 5
,ZZ5 6
resultZZ7 =
)ZZ= >
;ZZ> ?
}[[ 	
}\\ 
}]] ±
RD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Extensions\HeaderConfigurationExtension.cs
	namespace 	
Agenda
 
. 
API 
. 

Extensions 
{ 
public 

static 
class (
HeaderConfigurationExtension 4
{ 
public 
static 
IApplicationBuilder )"
UseHeaderConfiguration* @
(@ A
thisA E
IApplicationBuilderF Y
applicationBuilderZ l
)l m
{		 	
return

 
applicationBuilder

 %
.

% &
UseMiddleware

& 3
<

3 4)
HeaderConfigurationMiddleware

4 Q
>

Q R
(

R S
)

S T
;

T U
} 	
} 
} Å	
WD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Infrastructure\AutofacModules\CommandsModule.cs
	namespace 	
Agenda
 
. 
API 
. 
Infrastructure #
.# $
AutofacModules$ 2
{ 
public 

class 
CommandsModule 
:  !
Autofac" )
.) *
Module* 0
{		 
	protected

 
override

 
void

 
Load

  $
(

$ %
ContainerBuilder

% 5
builder

6 =
)

= >
{ 	
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1!
CrearProspectoCommand1 F
)F G
.G H
GetTypeInfoH S
(S T
)T U
.U V
AssemblyV ^
)^ _
._ `
AsClosedTypesOf` o
(o p
typeofp v
(v w
IRequestHandler	w Ü
<
Ü á
,
á à
>
à â
)
â ä
)
ä ã
;
ã å
} 	
} 
} ı
WD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Infrastructure\AutofacModules\MediatorModule.cs
	namespace 	
Agenda
 
. 
API 
. 
Infrastructure #
.# $
AutofacModules$ 2
{ 
public 

class 
MediatorModule 
:  !
Autofac" )
.) *
Module* 0
{		 
	protected

 
override

 
void

 
Load

  $
(

$ %
ContainerBuilder

% 5
builder

6 =
)

= >
{ 	
builder 
. !
RegisterAssemblyTypes )
() *
typeof* 0
(0 1
	IMediator1 :
): ;
.; <
GetTypeInfo< G
(G H
)H I
.I J
AssemblyJ R
)R S
.S T#
AsImplementedInterfacesT k
(k l
)l m
;m n
builder 
. 
Register 
< 
ServiceFactory +
>+ ,
(, -
context- 4
=>5 7
{ 
var 
componentContext $
=% &
context' .
.. /
Resolve/ 6
<6 7
IComponentContext7 H
>H I
(I J
)J K
;K L
return 
t 
=> 
{ 
object $
o% &
;& '
return( .
componentContext/ ?
.? @

TryResolve@ J
(J K
tK L
,L M
outN Q
oR S
)S T
?U V
oW X
:Y Z
null[ _
;_ `
}a b
;b c
} 
) 
; 
builder 
. 
RegisterGeneric #
(# $
typeof$ *
(* +
ValidatorBehavior+ <
<< =
,= >
>> ?
)? @
)@ A
.A B
AsB D
(D E
typeofE K
(K L
IPipelineBehaviorL ]
<] ^
,^ _
>_ `
)` a
)a b
;b c
} 	
} 
} Œ
VD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Infrastructure\AutofacModules\QueriesModule.cs
	namespace 	
Agenda
 
. 
API 
. 
Infrastructure #
.# $
AutofacModules$ 2
{		 
public

 

class

 
QueriesModule

 
:

  
Autofac

! (
.

( )
Module

) /
{ 
public 
string $
_queriesConnectionString .
{/ 0
get1 4
;4 5
}6 7
public 
QueriesModule 
( 
string ##
queriesConnectionString$ ;
); <
{ 	$
_queriesConnectionString $
=% &#
queriesConnectionString' >
;> ?
} 	
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
Register 
( 
c 
=> !
new" %+
ConsolidadoIntermediarioQueries& E
(E F$
_queriesConnectionStringF ^
)^ _
)_ `
.` a
Asa c
<c d-
 IConsolidadoIntermediarioQueries	d Ñ
>
Ñ Ö
(
Ö Ü
)
Ü á
.
á à&
InstancePerLifetimeScope
à †
(
† °
)
° ¢
;
¢ £
builder 
. 
RegisterType  
<  !
CitaQueries! ,
>, -
(- .
). /
. 
As 
< 
ICitaQueries  
>  !
(! "
)" #
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
builder 
. 
RegisterType  
<  !
ProspectoQueries! 1
>1 2
(2 3
)3 4
. 
As 
< 
IProspectoQueries %
>% &
(& '
)' (
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
builder 
. 
RegisterType  
<  !
CalendarioQueries! 2
>2 3
(3 4
)4 5
. 
As 
< 
ICalendarioQueries &
>& '
(' (
)( )
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
builder 
. 
RegisterType  
<  !
GeneralesQueries! 1
>1 2
(2 3
)3 4
. 
As 
< 
IGeneralesQueries %
>% &
(& '
)' (
. $
InstancePerLifetimeScope )
() *
)* +
;+ ,
}   	
}!! 
}"" Ò
YD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Infrastructure\AutofacModules\RepositoryModule.cs
	namespace 	
Agenda
 
. 
API 
. 
Infrastructure #
.# $
AutofacModules$ 2
{		 
public

 

class

 
RepositoryModule

 !
:

" #
Autofac

$ +
.

+ ,
Module

, 2
{ 
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
RegisterType  
<  !
ProspectoRepository! 4
>4 5
(5 6
)6 7
.7 8
As8 :
<: ; 
IProspectoRepository; O
>O P
(P Q
)Q R
.R S$
InstancePerLifetimeScopeS k
(k l
)l m
;m n
builder 
. 
RegisterType  
<  !
CitaRepository! /
>/ 0
(0 1
)1 2
.2 3
As3 5
<5 6
ICitaRepository6 E
>E F
(F G
)G H
.H I$
InstancePerLifetimeScopeI a
(a b
)b c
;c d
builder 
. 
RegisterType  
<  !
ReunionRepository! 2
>2 3
(3 4
)4 5
.5 6
As6 8
<8 9
IReunionRepository9 K
>K L
(L M
)M N
.N O$
InstancePerLifetimeScopeO g
(g h
)h i
;i j
builder 
. 
RegisterType  
<  !)
RecordatorioLlamadaRepository! >
>> ?
(? @
)@ A
.A B
AsB D
<D E*
IRecordatorioLlamadaRepositoryE c
>c d
(d e
)e f
.f g$
InstancePerLifetimeScopeg 
(	 Ä
)
Ä Å
;
Å Ç
} 	
} 
} ¶)
XD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Infrastructure\AutofacModules\ValidatorModule.cs
	namespace		 	
Agenda		
 
.		 
API		 
.		 
Infrastructure		 #
.		# $
AutofacModules		$ 2
{

 
public 

class 
ValidatorModule  
:! "
Autofac# *
.* +
Module+ 1
{ 
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
RegisterType  
<  !*
CrearProspectoCommandValidator! ?
>? @
(@ A
)A B
.B C
AsC E
<E F
AbstractValidatorF W
<W X!
CrearProspectoCommandX m
>m n
>n o
(o p
)p q
.q r$
AsImplementedInterfaces	r â
(
â ä
)
ä ã
;
ã å
builder 
. 
RegisterType  
<  !/
#ActualizarProspectoCommandValidator! D
>D E
(E F
)F G
.G H
AsH J
<J K
AbstractValidatorK \
<\ ]&
ActualizarProspectoCommand] w
>w x
>x y
(y z
)z {
.{ |$
AsImplementedInterfaces	| ì
(
ì î
)
î ï
;
ï ñ
builder 
. 
RegisterType  
<  !.
"DescartarProspectoCommandValidator! C
>C D
(D E
)E F
.F G
AsG I
<I J
AbstractValidatorJ [
<[ \%
DescartarProspectoCommand\ u
>u v
>v w
(w x
)x y
.y z$
AsImplementedInterfaces	z ë
(
ë í
)
í ì
;
ì î
builder 
. 
RegisterType  
<  !%
CrearCitaCommandValidator! :
>: ;
(; <
)< =
.= >
As> @
<@ A
AbstractValidatorA R
<R S
CrearCitaCommandS c
>c d
>d e
(e f
)f g
.g h#
AsImplementedInterfacesh 
(	 Ä
)
Ä Å
;
Å Ç
builder 
. 
RegisterType  
<  !)
CalificarCitaCommandValidator! >
>> ?
(? @
)@ A
.A B
AsB D
<D E
AbstractValidatorE V
<V W 
CalificarCitaCommandW k
>k l
>l m
(m n
)n o
.o p$
AsImplementedInterfaces	p á
(
á à
)
à â
;
â ä
builder 
. 
RegisterType  
<  !*
ActualizarCitaCommandValidator! ?
>? @
(@ A
)A B
.B C
AsC E
<E F
AbstractValidatorF W
<W X!
ActualizarCitaCommandX m
>m n
>n o
(o p
)p q
.q r$
AsImplementedInterfaces	r â
(
â ä
)
ä ã
;
ã å
builder 
. 
RegisterType  
<  !4
(CrearRecordatorioLlamadaCommandValidator! I
>I J
(J K
)K L
.L M
AsM O
<O P
AbstractValidatorP a
<a b,
CrearRecordatorioLlamadaCommand	b Å
>
Å Ç
>
Ç É
(
É Ñ
)
Ñ Ö
.
Ö Ü%
AsImplementedInterfaces
Ü ù
(
ù û
)
û ü
;
ü †
builder 
. 
RegisterType  
<  !9
-ActualizarRecordatorioLlamadaCommandValidator! N
>N O
(O P
)P Q
.Q R
AsR T
<T U
AbstractValidatorU f
<f g1
$ActualizarRecordatorioLlamadaCommand	g ã
>
ã å
>
å ç
(
ç é
)
é è
.
è ê%
AsImplementedInterfaces
ê ß
(
ß ®
)
® ©
;
© ™
builder!! 
.!! 
RegisterType!!  
<!!  !(
CrearReunionCommandValidator!!! =
>!!= >
(!!> ?
)!!? @
.!!@ A
As!!A C
<!!C D
AbstractValidator!!D U
<!!U V
CrearReunionCommand!!V i
>!!i j
>!!j k
(!!k l
)!!l m
.!!m n$
AsImplementedInterfaces	!!n Ö
(
!!Ö Ü
)
!!Ü á
;
!!á à
builder"" 
."" 
RegisterType""  
<""  !-
!ActualizarReunionCommandValidator""! B
>""B C
(""C D
)""D E
.""E F
As""F H
<""H I
AbstractValidator""I Z
<""Z [$
ActualizarReunionCommand""[ s
>""s t
>""t u
(""u v
)""v w
.""w x$
AsImplementedInterfaces	""x è
(
""è ê
)
""ê ë
;
""ë í
}$$ 	
}%% 
}&& ’
cD:\Proyecto-Agenda-Mejoras-1\Agenda.API\Infrastructure\Middlewares\HeaderConfigurationMiddleware.cs
	namespace 	
Agenda
 
. 
API 
. 
Infrastructure #
.# $
Middlewares$ /
{ 
class 	)
HeaderConfigurationMiddleware
 '
{		 
private

 
readonly

 
RequestDelegate

 (
_next

) .
;

. /
public )
HeaderConfigurationMiddleware ,
(, -
RequestDelegate- <
next= A
)A B
=>C E
_nextF K
=L M
nextN R
;R S
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
httpContext2 =
,= > 
IHeaderConfiguration? S
headerConfigurationT g
)g h
{ 	
headerConfiguration 
.  
idTransaccion  -
=. /
httpContext0 ;
.; <
Request< C
.C D
HeadersD K
[K L
$strL [
][ \
.\ ]
ToString] e
(e f
)f g
;g h
headerConfiguration 
.  
correlationId  -
=. /
httpContext0 ;
.; <
Request< C
.C D
HeadersD K
[K L
$strL [
][ \
.\ ]
ToString] e
(e f
)f g
;g h
headerConfiguration 
.  
nombreAplicacion  0
=1 2
httpContext3 >
.> ?
Request? F
.F G
HeadersG N
[N O
$strO a
]a b
.b c
ToStringc k
(k l
)l m
;m n
headerConfiguration 
.  
usuarioAplicacion  1
=2 3
httpContext4 ?
.? @
Request@ G
.G H
HeadersH O
[O P
$strP c
]c d
.d e
ToStringe m
(m n
)n o
;o p
headerConfiguration 
.  
idIntermediario  /
=0 1
string2 8
.8 9
IsNullOrEmpty9 F
(F G
httpContextG R
.R S
RequestS Z
.Z [
Headers[ b
[b c
$strc t
]t u
.u v
ToStringv ~
(~ 
)	 Ä
)
Ä Å
?
Ç É
$num
É Ñ
:
Ñ Ö
int; >
.> ?
Parse? D
(D E
httpContextE P
.P Q
RequestQ X
.X Y
HeadersY `
[` a
$stra r
]r s
.s t
ToStringt |
(| }
)} ~
)~ 
;	 Ä
headerConfiguration 
.  
CodigoIntermediario  3
=4 5
httpContext6 A
.A B
RequestB I
.I J
HeadersJ Q
[Q R
$strR g
]g h
.h i
ToStringi q
(q r
)r s
;s t
headerConfiguration 
.  
auditRequest  ,
=- .
new/ 2
AuditRequest3 ?
{ 
idTransaccion 
= 
headerConfiguration  3
.3 4
idTransaccion4 A
,A B
nombreAplicacion  
=! "
headerConfiguration# 6
.6 7
nombreAplicacion7 G
,G H
usuarioAplicacion !
=" #
headerConfiguration$ 7
.7 8
usuarioAplicacion8 I
} 
; 
await 
_next 
. 
Invoke 
( 
httpContext *
)* +
;+ ,
} 	
}   
}"" ∫
2D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Program.cs
	namespace 	
Agenda
 
. 
API 
{ 
public 

class 
Program 
{		 
public

 
static

 
void

 
Main

 
(

  
string

  &
[

& '
]

' (
args

) -
)

- .
{ 	
var 
configuration 
= 
GetConfiguration  0
(0 1
)1 2
;2 3
var 
host 
= 
CreateHostBuilder (
(( )
configuration) 6
,6 7
args8 <
)< =
;= >
host 
. 
Run 
( 
) 
; 
} 	
private 
static 
IWebHost 
CreateHostBuilder  1
(1 2
IConfiguration2 @
configurationA N
,N O
stringP V
[V W
]W X
argsY ]
)] ^
=>_ a
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup 
>  
(  !
)! "
. 
UseConfiguration 
( 
configuration +
)+ ,
. #
UseCustomLoggerProvider $
($ %
)% &
. 
Build 
( 
) 
; 
private 
static 
IConfiguration %
GetConfiguration& 6
(6 7
)7 8
{ 	
return 
new  
ConfigurationBuilder +
(+ ,
), -
.- .
Build. 3
(3 4
)4 5
;5 6
} 	
} 
} §H
2D:\Proyecto-Agenda-Mejoras-1\Agenda.API\Startup.cs
	namespace 	
Agenda
 
. 
API 
{ 
public 

class 
Startup 
{ 
readonly 
string 

CorsPolicy "
=# $
$str% 1
;1 2
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public"" 
virtual"" 
IServiceProvider"" '
ConfigureServices""( 9
(""9 :
IServiceCollection"": L
services""M U
)""U V
{## 	
services$$ 
.%% 
AddGrpc%% 
(%% 
options%%  
=>%%! #
{&& 
options'' 
.''  
EnableDetailedErrors'' 0
=''1 2
true''3 7
;''7 8
}(( 
)(( 
.)) 
Services)) 
.** 
AddAutoMapper** 
(** 
Assembly** '
.**' ( 
GetExecutingAssembly**( <
(**< =
)**= >
)**> ?
.++ 
AddCustomMvc++ 
(++ 
)++ 
.,, 
AddCustomDbContext,, #
(,,# $
Configuration,,$ 1
),,1 2
.-- 
AddCustomSwagger-- !
(--! "
Configuration--" /
)--/ 0
;--0 1
services// 
.// 
	AddScoped// 
<//  
IHeaderConfiguration// 3
,//3 4
HeaderConfiguration//5 H
>//H I
(//I J
)//J K
;//K L
services00 
.00 
AddTransient00 !
<00! "
IImpresionLog00" /
,00/ 0
ImpresionLog001 =
>00= >
(00> ?
)00? @
;00@ A
var22 
builder22 
=22 
new22 
ContainerBuilder22 .
(22. /
)22/ 0
;220 1
builder33 
.33 
Populate33 
(33 
services33 %
)33% &
;33& '
builder55 
.55 
RegisterModule55 "
(55" #
new55# &
MediatorModule55' 5
(555 6
)556 7
)557 8
;558 9
builder66 
.66 
RegisterModule66 "
(66" #
new66# &
CommandsModule66' 5
(665 6
)666 7
)667 8
;668 9
builder77 
.77 
RegisterModule77 "
(77" #
new77# &
QueriesModule77' 4
(774 5
Configuration775 B
.77B C
GetConnectionString77C V
(77V W
$str77W c
)77c d
)77d e
)77e f
;77f g
builder88 
.88 
RegisterModule88 "
(88" #
new88# &
RepositoryModule88' 7
(887 8
)888 9
)889 :
;88: ;
builder99 
.99 
RegisterModule99 "
(99" #
new99# &
ValidatorModule99' 6
(996 7
)997 8
)998 9
;999 :
var;; 
	container;; 
=;; 
builder;; #
.;;# $
Build;;$ )
(;;) *
);;* +
;;;+ ,
return== 
	container== 
.== 
Resolve== $
<==$ %
IServiceProvider==% 5
>==5 6
(==6 7
)==7 8
;==8 9
}>> 	
publicAA 
voidAA 
	ConfigureAA 
(AA 
IApplicationBuilderAA 1
appAA2 5
,AA5 6
IWebHostEnvironmentAA7 J
envAAK N
)AAN O
{BB 	
ifCC 
(CC 
envCC 
.CC 
IsDevelopmentCC !
(CC! "
)CC" #
)CC# $
{DD 
appEE 
.EE %
UseDeveloperExceptionPageEE -
(EE- .
)EE. /
;EE/ 0
}FF 
appHH 
.HH 

UseSwaggerHH 
(HH 
)HH 
;HH 
appII 
.II 
UseSwaggerUIII 
(II 
cII 
=>II !
{JJ 
stringKK 
swaggerJsonBasePathKK *
=KK+ ,
stringKK- 3
.KK3 4
IsNullOrWhiteSpaceKK4 F
(KKF G
cKKG H
.KKH I
RoutePrefixKKI T
)KKT U
?KKV W
$strKKX [
:KK\ ]
$strKK^ b
;KKb c
cLL 
.LL 
SwaggerEndpointLL !
(LL! "
$"LL" $
{LL$ %
swaggerJsonBasePathLL% 8
}LL8 9$
/swagger/v1/swagger.jsonLL9 Q
"LLQ R
,LLR S
$strLLT z
)LLz {
;LL{ |
}MM 
)MM 
;MM 
appOO 
.OO 
UseHttpsRedirectionOO #
(OO# $
)OO$ %
;OO% &
appPP 
.PP "
UseHeaderConfigurationPP &
(PP& '
)PP' (
;PP( )
appQQ 
.QQ 

UseRoutingQQ 
(QQ 
)QQ 
;QQ 
appRR 
.RR 
UseCorsRR 
(RR 

CorsPolicyRR "
)RR" #
;RR# $
appSS 
.SS 
UseAuthorizationSS  
(SS  !
)SS! "
;SS" #
appTT 
.TT 
UseEndpointsTT 
(TT 
	endpointsTT &
=>TT' )
{UU 
	endpointsVV 
.VV 
MapControllersVV (
(VV( )
)VV) *
;VV* +
}WW 
)WW 
;WW 
}XX 	
}YY 
staticZZ 

classZZ #
CustomExtensionsMethodsZZ (
{[[ 
public\\ 
static\\ 
IServiceCollection\\ (
AddCustomMvc\\) 5
(\\5 6
this\\6 :
IServiceCollection\\; M
services\\N V
)\\V W
{]] 	
services^^ 
.^^ 
AddCors^^ 
(^^ 
options^^ $
=>^^% '
{__ 
options`` 
.`` 
	AddPolicy`` !
(``! "
$str``" .
,``. /
builderaa" )
=>aa* ,
{bb" #
buildercc& -
.cc- .
AllowAnyOrigincc. <
(cc< =
)cc= >
.dd- .
AllowAnyHeaderdd. <
(dd< =
)dd= >
.ee- .
AllowAnyMethodee. <
(ee< =
)ee= >
;ee> ?
}ff" #
)ff# $
;ff$ %
}gg 
)gg 
;gg 
serviceshh 
.hh 
AddControllershh #
(hh# $
)hh$ %
;hh% &
returnii 
servicesii 
;ii 
}jj 	
publickk 
statickk 
IServiceCollectionkk (
AddCustomDbContextkk) ;
(kk; <
thiskk< @
IServiceCollectionkkA S
serviceskkT \
,kk\ ]
IConfigurationkk^ l
configurationkkm z
)kkz {
{ll 	
returnmm 
servicesmm 
.mm 
AddDbContextmm (
<mm( )
AgendaContextmm) 6
>mm6 7
(mm7 8
optionsmm8 ?
=>mm@ B
optionsnn 
.nn 
UseSqlServernn (
(nn( )
configurationnn) 6
.nn6 7
GetConnectionStringnn7 J
(nnJ K
$strnnK W
)nnW X
)nnX Y
)nnY Z
;nnZ [
}oo 	
publicpp 
staticpp 
IServiceCollectionpp (
AddCustomSwaggerpp) 9
(pp9 :
thispp: >
IServiceCollectionpp? Q
servicesppR Z
,ppZ [
IConfigurationpp\ j
configurationppk x
)ppx y
{qq 	
returnrr 
servicesrr 
.rr 
AddSwaggerGenrr )
(rr) *
crr* +
=>rr, .
{ss 
ctt 
.tt %
DescribeAllEnumsAsStringstt +
(tt+ ,
)tt, -
;tt- .
cuu 
.uu 
EnableAnnotationsuu #
(uu# $
)uu$ %
;uu% &
cvv 
.vv 

SwaggerDocvv 
(vv 
$strvv !
,vv! "
newvv# &
OpenApiInfovv' 2
{ww 
Titlexx 
=xx 
$strxx >
,xx> ?
Versionyy 
=yy 
$stryy "
,yy" #
Descriptionzz 
=zz  !
$strzz" b
}{{ 
){{ 
;{{ 
c|| 
.|| 
ExampleFilters||  
(||  !
)||! "
;||" #
}~~ 
)~~ 
.~~ ,
 AddSwaggerExamplesFromAssemblyOf~~ /
<~~/ 0/
#RequestCrearProspectoCommandExample~~0 S
>~~S T
(~~T U
)~~U V
;~~V W
} 	
}
ÄÄ 
}ÅÅ 