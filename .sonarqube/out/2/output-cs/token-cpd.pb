�

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
} �

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
} �
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
}		 �
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
}		 �
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
}		 �
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
 �
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
	TResponse	z �
>
� �
next
� �
)
� �
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
}55 �
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
	TResponse	z �
>
� �
next
� �
)
� �
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
$str	x �
,
� �
failures
� �
)
� �
)
� �
;
� �
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
}!! �
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
}'' �
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
}!! ��
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
status	EE �
)
EE� �
;
EE� �
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
status	tt �
)
tt� �
;
tt� �
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
�� 

class
�� 0
"RequestCalificarCitaCommandExample
�� 3
:
��4 5
IExamplesProvider
��6 G
<
��G H"
CalificarCitaCommand
��H \
>
��\ ]
{
�� 
public
�� "
CalificarCitaCommand
�� #
GetExamples
��$ /
(
��/ 0
)
��0 1
{
�� 	"
CalificarCitaCommand
��  "
calificarCitaCommand
��! 5
=
��6 7
new
��8 ;"
CalificarCitaCommand
��< P
(
��P Q
)
��Q R
;
��R S"
calificarCitaCommand
��  
.
��  !
FlagCalificacion
��! 1
=
��2 3
true
��4 8
;
��8 9"
calificarCitaCommand
��  
.
��  !$
CodigoTipoCalificacion
��! 7
=
��8 9
$num
��: ;
;
��; <"
calificarCitaCommand
��  
.
��  !/
!CodigoTipoExperienciaCalificacion
��! B
=
��C D
$num
��E F
;
��F G"
calificarCitaCommand
��  
.
��  !0
"CodigoPorcentajeAvanceCalificacion
��! C
=
��D E
$num
��F G
;
��G H"
calificarCitaCommand
��  
.
��  !!
FechaEstimadaCierre
��! 4
=
��5 6
DateTime
��7 ?
.
��? @
Now
��@ C
;
��C D"
calificarCitaCommand
��  
.
��  !$
ComentarioCalificacion
��! 7
=
��8 9
$str
��: J
;
��J K"
calificarCitaCommand
��  
.
��  !(
AuditoriaFechaModificacion
��! ;
=
��< =
DateTime
��> F
.
��F G
Now
��G J
;
��J K"
calificarCitaCommand
��  
.
��  !*
AuditoriaUsuarioModificacion
��! =
=
��> ?
$str
��@ I
;
��I J
return
�� "
calificarCitaCommand
�� '
;
��' (
}
�� 	
}
�� 
public
�� 

class
�� 1
#ResponseCalificarCitaCommandExample
�� 4
:
��5 6
IExamplesProvider
��7 H
<
��H I1
#ResponseCalificarCitaCommandExample
��I l
>
��l m
{
�� 
public
�� 1
#ResponseCalificarCitaCommandExample
�� 2
(
��2 3
)
��3 4
=>
��5 7
responseModel
��8 E
=
��F G
new
��H K
ResponseModel
��L Y
<
��Y Z

EntidadDto
��Z d
>
��d e
(
��e f
)
��f g
;
��g h
public
�� 
ResponseModel
�� 
<
�� 

EntidadDto
�� '
>
��' (
responseModel
��) 6
{
��7 8
get
��9 <
;
��< =
set
��> A
;
��A B
}
��C D
public
�� 1
#ResponseCalificarCitaCommandExample
�� 2
GetExamples
��3 >
(
��> ?
)
��? @
{
�� 	
string
�� 
mensajeRespuesta
�� #
=
��$ %
string
��& ,
.
��, -
Empty
��- 2
;
��2 3
int
�� 
status
�� 
=
�� 
$num
�� 
;
�� 
AuditResponse
�� 
auditResponse
�� '
=
��( )
new
��* -
AuditResponse
��. ;
(
��; <
)
��< =
;
��= >

EntidadDto
�� 

entidadDto
�� !
=
��" #
new
��$ '

EntidadDto
��( 2
(
��2 3
)
��3 4
;
��4 5

entidadDto
�� 
.
�� 
Id
�� 
=
�� 
$num
�� 
;
�� 

entidadDto
�� 
.
�� 
Mensaje
�� 
=
��  
$str
��! D
;
��D E
auditResponse
�� 
.
�� 
idTransaccion
�� '
=
��( )
$str
��* 5
;
��5 6
auditResponse
�� 
.
�� 
codigoRespuesta
�� )
=
��* +%
CodigoRespuestaServicio
��, C
.
��C D
Exito
��D I
;
��I J
new
�� !
ConfigurationHelper
�� #
(
��# $
)
��$ %
.
��% &-
ObtenerMensajeRespuestaServicio
��& E
(
��E F
auditResponse
��F S
.
��S T
codigoRespuesta
��T c
,
��c d
ref
��e h
mensajeRespuesta
��i y
,
��y z
ref
��{ ~
status�� �
)��� �
;��� �
auditResponse
�� 
.
�� 
mensajeRespuesta
�� *
=
��+ ,
mensajeRespuesta
��- =
;
��= >
return
�� 
new
�� 1
#ResponseCalificarCitaCommandExample
�� :
(
��: ;
)
��; <
{
�� 
responseModel
�� 
=
�� 
new
��  #
ResponseModel
��$ 1
<
��1 2

EntidadDto
��2 <
>
��< =
(
��= >
)
��> ?
{
�� 
auditResponse
�� !
=
��" #
auditResponse
��$ 1
,
��1 2
Entity
�� 
=
�� 

entidadDto
�� '
}
�� 
}
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
TelefonoCelular	**x �
:
**� �
$str
**� �
,
**� �
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
TelefonoFijo	++x �
:
++� �
$str
++� �
,
++� �
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
mensajeRespuesta	22p �
=
22� �
responseService
22� �
.
22� �
mensajeRespuesta
22� �
}
22� �
;
22� �
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
InnerException	;;{ �
.
;;� �
Message
;;� �
.
;;� �
ToString
;;� �
(
;;� �
)
;;� �
)
;;� �
;
;;� �
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
mensajeRespuesta	<<p �
=
<<� �
responseService
<<� �
.
<<� �
mensajeRespuesta
<<� �
}
<<� �
;
<<� �
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
mensajeRespuesta	RRp �
=
RR� �
responseService
RR� �
.
RR� �
mensajeRespuesta
RR� �
}
RR� �
;
RR� �
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
InnerException	[[z �
.
[[� �
Message
[[� �
.
[[� �
ToString
[[� �
(
[[� �
)
[[� �
)
[[� �
;
[[� �
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
mensajeRespuesta	\\p �
=
\\� �
responseService
\\� �
.
\\� �
mensajeRespuesta
\\� �
}
\\� �
;
\\� �
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
CodigoMotivoUnoDescarte	nni �
,
nn� �
request
nn� �
.
nn� �%
CodigoMotivoDosDescarte
nn� �
,
nn� �
request
nn� �
.
nn� �&
CodigoMotivoTresDescarte
nn� �
,
nn� �
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
AuditoriaFechaModificacion	ooi �
,
oo� �
request
oo� �
.
oo� �*
AuditoriaUsuarioModificacion
oo� �
)
oo� �
;
oo� � 
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
mensajeRespuesta	xxp �
=
xx� �
responseService
xx� �
.
xx� �
mensajeRespuesta
xx� �
}
xx� �
;
xx� �
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
�� 
responseService
�� 
=
��  !
configuration
��" /
.
��/ 0,
ObtenerCodigoRespuestaServicio
��0 N
(
��N O%
CodigoRespuestaServicio
��O f
.
��f g
ErrorInesperado
��g v
,
��v w
ex
��x z
.
��z {
InnerException��{ �
.��� �
Message��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
response
�� 
.
�� 
auditResponse
�� &
=
��' (
new
��) ,
AuditResponse
��- :
{
��; <
codigoRespuesta
��= L
=
��M N
responseService
��O ^
.
��^ _
codigoRespuesta
��_ n
,
��n o
mensajeRespuesta��p �
=��� �
responseService��� �
.��� � 
mensajeRespuesta��� �
}��� �
;��� �
return
�� 
await
�� 
Task
�� !
.
��! "
Run
��" %
(
��% &
(
��& '
)
��' (
=>
��) +
{
��, -
return
�� 
response
�� #
;
��# $
}
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �-
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
};; �)
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
}00 �H
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
}WW �
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
} �
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
status	FF �
)
FF� �
;
FF� �
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
�� %
.
��% &
Distrito_Id
��& 1
=
��2 3
$num
��4 5
;
��5 6'
prospectoDireccionCommand
�� %
.
��% &
TipoDireccion
��& 3
=
��4 5
$num
��6 7
;
��7 8'
prospectoDireccionCommand
�� %
.
��% &

FlagActivo
��& 0
=
��1 2
true
��3 7
;
��7 8'
prospectoDireccionCommand
�� %
.
��% &$
AuditoriaFechaCreacion
��& <
=
��= >
DateTime
��? G
.
��G H
Now
��H K
;
��K L'
prospectoDireccionCommand
�� %
.
��% &&
AuditoriaUsuarioCreacion
��& >
=
��? @
$str
��A J
;
��J K(
actualizarProspectoCommand
�� &
.
��& '&
ProspectoAdnRentaCommand
��' ?
=
��@ A&
prospectoAdnRentaCommand
��B Z
;
��Z [(
actualizarProspectoCommand
�� &
.
��& ''
ProspectoDireccionCommand
��' @
=
��A B'
prospectoDireccionCommand
��C \
;
��\ ]
return
�� (
actualizarProspectoCommand
�� -
;
��- .
}
�� 	
}
�� 
public
�� 

class
�� 7
)ResponseActualizarProspectoCommandExample
�� :
:
��; <
IExamplesProvider
��= N
<
��N O7
)ResponseActualizarProspectoCommandExample
��O x
>
��x y
{
�� 
public
�� 7
)ResponseActualizarProspectoCommandExample
�� 8
(
��8 9
)
��9 :
=>
��; =
responseModel
��> K
=
��L M
new
��N Q
ResponseModel
��R _
<
��_ `

EntidadDto
��` j
>
��j k
(
��k l
)
��l m
;
��m n
public
�� 
ResponseModel
�� 
<
�� 

EntidadDto
�� '
>
��' (
responseModel
��) 6
{
��7 8
get
��9 <
;
��< =
set
��> A
;
��A B
}
��C D
public
�� 7
)ResponseActualizarProspectoCommandExample
�� 8
GetExamples
��9 D
(
��D E
)
��E F
{
�� 	
string
�� 
mensajeRespuesta
�� #
=
��$ %
string
��& ,
.
��, -
Empty
��- 2
;
��2 3
int
�� 
status
�� 
=
�� 
$num
�� 
;
�� 
AuditResponse
�� 
auditResponse
�� '
=
��( )
new
��* -
AuditResponse
��. ;
(
��; <
)
��< =
;
��= >

EntidadDto
�� 

entidadDto
�� !
=
��" #
new
��$ '

EntidadDto
��( 2
(
��2 3
)
��3 4
;
��4 5

entidadDto
�� 
.
�� 
Id
�� 
=
�� 
$num
�� 
;
�� 

entidadDto
�� 
.
�� 
Mensaje
�� 
=
��  
$str
��! J
;
��J K
auditResponse
�� 
.
�� 
idTransaccion
�� '
=
��( )
$str
��* 5
;
��5 6
auditResponse
�� 
.
�� 
codigoRespuesta
�� )
=
��* +%
CodigoRespuestaServicio
��, C
.
��C D
Exito
��D I
;
��I J
new
�� !
ConfigurationHelper
�� #
(
��# $
)
��$ %
.
��% &-
ObtenerMensajeRespuestaServicio
��& E
(
��E F
auditResponse
��F S
.
��S T
codigoRespuesta
��T c
,
��c d
ref
��e h
mensajeRespuesta
��i y
,
��y z
ref
��{ ~
status�� �
)��� �
;��� �
auditResponse
�� 
.
�� 
mensajeRespuesta
�� *
=
��+ ,
mensajeRespuesta
��- =
;
��= >
return
�� 
new
�� 7
)ResponseActualizarProspectoCommandExample
�� @
(
��@ A
)
��A B
{
�� 
responseModel
�� 
=
�� 
new
��  #
ResponseModel
��$ 1
<
��1 2

EntidadDto
��2 <
>
��< =
(
��= >
)
��> ?
{
�� 
auditResponse
�� !
=
��" #
auditResponse
��$ 1
,
��1 2
Entity
�� 
=
�� 

entidadDto
�� '
}
�� 
}
�� 
;
�� 
}
�� 	
}
�� 
public
�� 

class
�� 5
'RequestDescartarProspectoCommandExample
�� 8
:
��9 :
IExamplesProvider
��; L
<
��L M'
DescartarProspectoCommand
��M f
>
��f g
{
�� 
public
�� '
DescartarProspectoCommand
�� (
GetExamples
��) 4
(
��4 5
)
��5 6
{
�� 	'
DescartarProspectoCommand
�� %'
descartarProspectoCommand
��& ?
=
��@ A
new
��B E'
DescartarProspectoCommand
��F _
(
��_ `
)
��` a
;
��a b'
descartarProspectoCommand
�� %
.
��% &
FlagDescarte
��& 2
=
��3 4
true
��5 9
;
��9 :'
descartarProspectoCommand
�� %
.
��% &%
CodigoMotivoUnoDescarte
��& =
=
��> ?
$num
��@ A
;
��A B'
descartarProspectoCommand
�� %
.
��% &%
CodigoMotivoDosDescarte
��& =
=
��> ?
$num
��@ B
;
��B C'
descartarProspectoCommand
�� %
.
��% &&
TextoMontivoTresDescarte
��& >
=
��? @
$str
��A O
;
��O P'
descartarProspectoCommand
�� %
.
��% &(
AuditoriaFechaModificacion
��& @
=
��A B
DateTime
��C K
.
��K L
Now
��L O
;
��O P'
descartarProspectoCommand
�� %
.
��% &*
AuditoriaUsuarioModificacion
��& B
=
��C D
$str
��E N
;
��N O
return
�� '
descartarProspectoCommand
�� ,
;
��, -
}
�� 	
}
�� 
public
�� 

class
�� 6
(ResponseDescartarProspectoCommandExample
�� 9
:
��: ;
IExamplesProvider
��< M
<
��M N6
(ResponseDescartarProspectoCommandExample
��N v
>
��v w
{
�� 
public
�� 6
(ResponseDescartarProspectoCommandExample
�� 7
(
��7 8
)
��8 9
=>
��: <
responseModel
��= J
=
��K L
new
��M P
ResponseModel
��Q ^
<
��^ _

EntidadDto
��_ i
>
��i j
(
��j k
)
��k l
;
��l m
public
�� 
ResponseModel
�� 
<
�� 

EntidadDto
�� '
>
��' (
responseModel
��) 6
{
��7 8
get
��9 <
;
��< =
set
��> A
;
��A B
}
��C D
public
�� 6
(ResponseDescartarProspectoCommandExample
�� 7
GetExamples
��8 C
(
��C D
)
��D E
{
�� 	
string
�� 
mensajeRespuesta
�� #
=
��$ %
string
��& ,
.
��, -
Empty
��- 2
;
��2 3
int
�� 
status
�� 
=
�� 
$num
�� 
;
�� 
AuditResponse
�� 
auditResponse
�� '
=
��( )
new
��* -
AuditResponse
��. ;
(
��; <
)
��< =
;
��= >

EntidadDto
�� 

entidadDto
�� !
=
��" #
new
��$ '

EntidadDto
��( 2
(
��2 3
)
��3 4
;
��4 5

entidadDto
�� 
.
�� 
Id
�� 
=
�� 
$num
�� 
;
�� 

entidadDto
�� 
.
�� 
Mensaje
�� 
=
��  
$str
��! I
;
��I J
auditResponse
�� 
.
�� 
idTransaccion
�� '
=
��( )
$str
��* 5
;
��5 6
auditResponse
�� 
.
�� 
codigoRespuesta
�� )
=
��* +%
CodigoRespuestaServicio
��, C
.
��C D
Exito
��D I
;
��I J
new
�� !
ConfigurationHelper
�� #
(
��# $
)
��$ %
.
��% &-
ObtenerMensajeRespuestaServicio
��& E
(
��E F
auditResponse
��F S
.
��S T
codigoRespuesta
��T c
,
��c d
ref
��e h
mensajeRespuesta
��i y
,
��y z
ref
��{ ~
status�� �
)��� �
;��� �
auditResponse
�� 
.
�� 
mensajeRespuesta
�� *
=
��+ ,
mensajeRespuesta
��- =
;
��= >
return
�� 
new
�� 6
(ResponseDescartarProspectoCommandExample
�� ?
(
��? @
)
��@ A
{
�� 
responseModel
�� 
=
�� 
new
��  #
ResponseModel
��$ 1
<
��1 2

EntidadDto
��2 <
>
��< =
(
��= >
)
��> ?
{
�� 
auditResponse
�� !
=
��" #
auditResponse
��$ 1
,
��1 2
Entity
�� 
=
�� 

entidadDto
�� '
}
�� 
}
�� 
;
�� 
}
�� 	
}
�� 
}�� �z
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
$str	%% �
,
%%� �
request
%%� �
.
%%� �!
CodigoIntermediario
%%� �
.
%%� �
ToString
%%� �
(
%%� �
)
%%� �
)
%%� �
)
%%� �
;
%%� �
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
mensajeRespuesta	&&p �
=
&&� �
responseService
&&� �
.
&&� �
mensajeRespuesta
&&� �
}
&&� �
;
&&� �
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
mensajeRespuesta	11p �
=
11� �
responseService
11� �
.
11� �
mensajeRespuesta
11� �
}
11� �
;
11� �
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
$str	22Y �
}
22� �
;
22� �
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
InnerException	::{ �
.
::� �
Message
::� �
.
::� �
ToString
::� �
(
::� �
)
::� �
)
::� �
;
::� �
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
mensajeRespuesta	;;p �
=
;;� �
responseService
;;� �
.
;;� �
mensajeRespuesta
;;� �
}
;;� �
;
;;� �
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
cancellationToken	CCr �
)
CC� �
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
mensajeRespuesta	OOp �
=
OO� �
responseService
OO� �
.
OO� �
mensajeRespuesta
OO� �
}
OO� �
;
OO� �
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
$str	PPY �
}
PP� �
;
PP� �
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
InnerException	XX{ �
.
XX� �
Message
XX� �
.
XX� �
ToString
XX� �
(
XX� �
)
XX� �
)
XX� �
;
XX� �
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
mensajeRespuesta	YYp �
=
YY� �
responseService
YY� �
.
YY� �
mensajeRespuesta
YY� �
}
YY� �
;
YY� �
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
cancellationToken	aaq �
)
aa� �
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
mensajeRespuesta	qqp �
=
qq� �
responseService
qq� �
.
qq� �
mensajeRespuesta
qq� �
}
qq� �
;
qq� �
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
$str	rrY �
}
rr� �
;
rr� �
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
InnerException	zz{ �
.
zz� �
Message
zz� �
.
zz� �
ToString
zz� �
(
zz� �
)
zz� �
)
zz� �
;
zz� �
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
mensajeRespuesta	{{p �
=
{{� �
responseService
{{� �
.
{{� �
mensajeRespuesta
{{� �
}
{{� �
;
{{� �
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
�� 
}
�� 	
}
�� 
}�� �
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
} �
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
}%% �[
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
;	 �
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
.ResponseCrearRecordatorioLlamadaCommandExample	11T �
>
11� �
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
status	?? �
)
??� �
;
??� �
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
$ActualizarRecordatorioLlamadaCommand	QQ\ �
(
QQ� �
)
QQ� �
;
QQ� �0
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
3ResponseActualizarRecordatorioLlamadaCommandExample	^^Y �
>
^^� �
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
status	ll �
)
ll� �
;
ll� �
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
}xx �P
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
>	 �
,
� �
IRequestHandler5 D
<D E0
$ActualizarRecordatorioLlamadaCommandE i
,i j
ResponseModelj w
<w x

EntidadDto	x �
>
� �
>
� �
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
cancellationToken	w �
)
� �
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
mensajeRespuesta	&&p �
=
&&� �
responseService
&&� �
.
&&� �
mensajeRespuesta
&&� �
}
&&� �
;
&&� �
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
$str	''m �
}
''� �
;
''� �
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
InnerException	//{ �
.
//� �
Message
//� �
.
//� �
ToString
//� �
(
//� �
)
//� �
)
//� �
;
//� �
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
mensajeRespuesta	00p �
=
00� �
responseService
00� �
.
00� �
mensajeRespuesta
00� �
}
00� �
;
00� �
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
cancellationToken	88| �
)
88� �
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
mensajeRespuesta	GGp �
=
GG� �
responseService
GG� �
.
GG� �
mensajeRespuesta
GG� �
}
GG� �
;
GG� �
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
$str	HHc �
}
HH� �
;
HH� �
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
InnerException	PP{ �
.
PP� �
Message
PP� �
.
PP� �
ToString
PP� �
(
PP� �
)
PP� �
)
PP� �
;
PP� �
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
mensajeRespuesta	QQp �
=
QQ� �
responseService
QQ� �
.
QQ� �
mensajeRespuesta
QQ� �
}
QQ� �
;
QQ� �
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
}YY �
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
}   �
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
}!! �O
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
status	11 �
)
11� �
;
11� �
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
status	\\ �
)
\\� �
;
\\� �
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
}hh �O
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
mensajeRespuesta	&&p �
=
&&� �
responseService
&&� �
.
&&� �
mensajeRespuesta
&&� �
}
&&� �
;
&&� �
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
InnerException	//{ �
.
//� �
Message
//� �
.
//� �
ToString
//� �
(
//� �
)
//� �
)
//� �
;
//� �
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
mensajeRespuesta	00p �
=
00� �
responseService
00� �
.
00� �
mensajeRespuesta
00� �
}
00� �
;
00� �
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
cancellationToken	88p �
)
88� �
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
mensajeRespuesta	JJp �
=
JJ� �
responseService
JJ� �
.
JJ� �
mensajeRespuesta
JJ� �
}
JJ� �
;
JJ� �
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
$str	KK| �
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
InnerException	TT{ �
.
TT� �
Message
TT� �
.
TT� �
ToString
TT� �
(
TT� �
)
TT� �
)
TT� �
;
TT� �
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
mensajeRespuesta	UUp �
=
UU� �
responseService
UU� �
.
UU� �
mensajeRespuesta
UU� �
}
UU� �
;
UU� �
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
}]] �=
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
}gg �;
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
}ii �
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
;	 �
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
 �'
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
� �
nombremetodo
� �
+
� �
$str
� �
;
� �
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
tiempo	 �
)
� �
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
nombremetodo	 �
+
� �
$str
� �
+
� �
$str
� �
+
� �
tiempo
� �
+
� �
$str
� �
;
� �
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
$str	t �
+
� �
JsonConvert
� �
.
� �
SerializeObject
� �
(
� �
requestmodel
� �
,
� �

Formatting
� �
.
� �
Indented
� �
)
� �
;
� �
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
$str	''t �
+
''� �
JsonConvert
''� �
.
''� �
SerializeObject
''� �
(
''� �
responseModel
''� �
,
''� �

Formatting
''� �
.
''� �
Indented
''� �
)
''� �
;
''� �
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
}-- �
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
status	 �
)
� �
;
� �
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
}   �
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
} �
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
} �,
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
}'' �+
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
}:: ��
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
codigointermediario	q �
)
� �
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
cumpleañosCalendarios( =
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
fsemanamasdos	++w �
}
++� �
;
++� �
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
Año11 
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
cumpleañosCalendariosEE %
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
$str	GP �
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
.	TT �
ToListAsync
TT� �
(
TT� �
)
TT� �
;
TT� �
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

Concretado	]]y �
)
]]� �
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
cumpleañosCalendariosbb- B
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
)	dd �
;
dd� �
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
FechaFin	jj{ �
)
jj� �
.
jj� �
ToList
jj� �
(
jj� �
)
jj� �
;
jj� �
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
responseService	ww �
.
ww� �
mensajeRespuesta
ww� �
}
ww� �
;
ww� �
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
codigointermediarios	}}{ �
)
}}� �
{~~ 	
ResponseService 
responseService +
;+ ,!
ConfigurationHelper
�� !
configurationHelper
��  3
=
��4 5
new
��6 9!
ConfigurationHelper
��: M
(
��M N
)
��N O
;
��O P
ResponseModel
�� 
<
�� 
List
�� 
<
�� 
ActividadReporte
�� /
>
��/ 0
>
��0 1
response
��2 :
=
��; <
new
��= @
ResponseModel
��A N
<
��N O
List
��O S
<
��S T
ActividadReporte
��T d
>
��d e
>
��e f
(
��f g
)
��g h
;
��h i
var
�� %
listcodigointermediario
�� '
=
��( )"
codigointermediarios
��* >
.
��> ?
Split
��? D
(
��D E
$char
��E H
)
��H I
.
��I J
Select
��J P
(
��P Q
int
��Q T
.
��T U
Parse
��U Z
)
��Z [
.
��[ \
ToList
��\ b
(
��b c
)
��c d
;
��d e
DateTime
�� 
factual
�� 
=
�� 
DateTime
�� '
.
��' (
Parse
��( -
(
��- .
fechaactual
��. 9
)
��9 :
;
��: ;
DateTime
�� 
finiciosemana
�� "
,
��" #

ffinsemana
��$ .
,
��. /

finiciomes
��0 :
,
��: ;
ffinmes
��< C
;
��C D
finiciosemana
�� 
=
�� 
factual
�� #
.
��# $
AddDays
��$ +
(
��+ ,
-
��, -$
ObtenerNumeroDiaSemana
��- C
(
��C D
factual
��D K
.
��K L
	DayOfWeek
��L U
.
��U V
ToString
��V ^
(
��^ _
)
��_ `
)
��` a
)
��a b
;
��b c

ffinsemana
�� 
=
�� 
factual
��  
.
��  !
AddDays
��! (
(
��( )
-
��) *$
ObtenerNumeroDiaSemana
��* @
(
��@ A
factual
��A H
.
��H I
	DayOfWeek
��I R
.
��R S
ToString
��S [
(
��[ \
)
��\ ]
)
��] ^
)
��^ _
.
��_ `
AddDays
��` g
(
��g h
$num
��h i
)
��i j
;
��j k

finiciomes
�� 
=
�� 
new
�� 
DateTime
�� %
(
��% &
factual
��& -
.
��- .
Year
��. 2
,
��2 3
factual
��4 ;
.
��; <
Month
��< A
,
��A B
$num
��C D
)
��D E
;
��E F
ffinmes
�� 
=
�� 

finiciomes
��  
.
��  !
	AddMonths
��! *
(
��* +
$num
��+ ,
)
��, -
.
��- .
AddDays
��. 5
(
��5 6
-
��6 7
$num
��7 8
)
��8 9
;
��9 :
List
�� 
<
�� 
ProspectoReporte
�� !
>
��! ")
listProspectoCitasPorSemana
��# >
=
��? @
null
��A E
;
��E F
List
�� 
<
�� 
ProspectoReporte
�� !
>
��! ".
 listProspectoEntrevistaPorSemana
��# C
=
��D E
null
��F J
;
��J K
List
�� 
<
�� 
ProspectoReporte
�� !
>
��! "&
listProspectoCitasPorMes
��# ;
=
��< =
null
��> B
;
��B C
List
�� 
<
�� 
ProspectoReporte
�� !
>
��! "+
listProspectoEntrevistaPorMes
��# @
=
��A B
null
��C G
;
��G H
List
�� 
<
�� 
ActividadReporte
�� !
>
��! "!
listaReporteSemanal
��# 6
=
��7 8
new
��9 <
List
��= A
<
��A B
ActividadReporte
��B R
>
��R S
(
��S T
)
��T U
;
��U V
List
�� 
<
�� 
ActividadReporte
�� !
>
��! "(
listaReporteSemanalInicial
��# =
=
��> ?
new
��@ C
List
��D H
<
��H I
ActividadReporte
��I Y
>
��Y Z
(
��Z [
)
��[ \
;
��\ ](
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Subcategoria
��B N
=
��O P
$str
��Q b
}
��c d
)
��d e
;
��e f(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Z
,
��Z [
Subcategoria
��\ h
=
��i j
$str
��k r
}
��s t
)
��t u
;
��u v(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Z
,
��Z [
Subcategoria
��\ h
=
��i j
$str
��k v
}
��w x
)
��x y
;
��y z(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Z
,
��Z [
Subcategoria
��\ h
=
��i j
$str
��k z
}
��{ |
)
��| }
;
��} ~(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M T
,
��T U
Subcategoria
��V b
=
��c d
$str
��e t
}
��u v
)
��v w
;
��w x(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M T
,
��T U
Subcategoria
��V b
=
��c d
$str
��e t
}
��u v
)
��v w
;
��w x(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M T
,
��T U
Subcategoria
��V b
=
��c d
$str
��e v
}
��w x
)
��x y
;
��y z(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Z
,
��Z [
Subcategoria
��\ h
=
��i j
$str
��k z
}
��{ |
)
��| }
;
��} ~(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Z
,
��Z [
Subcategoria
��\ h
=
��i j
$str
��k z
}
��{ |
)
��| }
;
��} ~(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Z
,
��Z [
Subcategoria
��\ h
=
��i j
$str
��k |
}
��} ~
)
��~ 
;�� �(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Y
,
��Y Z
Subcategoria
��[ g
=
��h i
$str
��j w
}
��x y
)
��y z
;
��z {(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M Y
,
��Y Z
Subcategoria
��[ g
=
��h i
$str
��j r
}
��s t
)
��t u
;
��u v(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M d
,
��d e
Subcategoria
��f r
=
��s t
$str��u �
}��� �
)��� �
;��� �(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M d
,
��d e
Subcategoria
��f r
=
��s t
$str��u �
}��� �
)��� �
;��� �(
listaReporteSemanalInicial
�� &
.
��& '
Add
��' *
(
��* +
new
��+ .
ActividadReporte
��/ ?
{
��@ A
Category
��B J
=
��K L
$str
��M d
,
��d e
Subcategoria
��f r
=
��s t
$str��u �
}��� �
)��� �
;��� �
var
�� !
listProspectoPorMes
�� #
=
��$ %
await
��& +$
ObtenerProspectoPorMes
��, B
(
��B C%
listcodigointermediario
��C Z
,
��Z [

finiciomes
��\ f
,
��f g
ffinmes
��h o
)
��o p
.
��p q
ToListAsync
��q |
(
��| }
)
��} ~
;
��~ 
var
�� &
listProspectosAdnsPorMes
�� (
=
��) *
await
��+ 0'
ObtenerProspectoAdnPorMes
��1 J
(
��J K%
listcodigointermediario
��K b
,
��b c

finiciomes
��d n
,
��n o
ffinmes
��p w
)
��w x
.
��x y
ToListAsync��y �
(��� �
)��� �
;��� �
var
�� 
listcitaspormes
�� 
=
��  !
await
��" ' 
ObtenerCitasPorMes
��( :
(
��: ;%
listcodigointermediario
��; R
,
��R S

finiciomes
��T ^
,
��^ _
ffinmes
��` g
)
��g h
.
��h i
ToListAsync
��i t
(
��t u
)
��u v
;
��v w
var
�� $
listprospectoporsemana
�� &
=
��' (!
listProspectoPorMes
��) <
.
��< =
Where
��= B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
Fecha
��J O
>=
��P R
finiciosemana
��S `
&&
��a c
x
��d e
.
��e f
Fecha
��f k
<=
��l n

ffinsemana
��o y
)
��y z
.
��z {
GroupBy��{ �
(��� �
x��� �
=>��� �
new��� �
{��� �
x��� �
.��� �
Fecha��� �
,��� �
x��� �
.��� �
	Categoria��� �
,��� �
x��� �
.��� �
Subcategoria��� �
}��� �
)��� �
.
��) *
Select
��* 0
(
��0 1
y
��1 2
=>
��3 5
new
��6 9
ProspectoReporte
��: J
(
��J K
)
��K L
{
��) *
	Categoria
��- 6
=
��7 8
y
��9 :
.
��: ;
Key
��; >
.
��> ?
	Categoria
��? H
,
��H I
Subcategoria
��- 9
=
��: ;
y
��< =
.
��= >
Key
��> A
.
��A B
Subcategoria
��B N
,
��N O
CantidadProspecto
��- >
=
��? @
y
��A B
.
��B C
Count
��C H
(
��H I
)
��I J
,
��J K
Fecha
��- 2
=
��3 4
y
��5 6
.
��6 7
Key
��7 :
.
��: ;
Fecha
��; @
}
��) *
)
��* +
.
��+ ,
ToList
��, 2
(
��2 3
)
��3 4
;
��4 5!
listProspectoPorMes
�� 
=
��  !!
listProspectoPorMes
��" 5
.
��5 6
GroupBy
��6 =
(
��= >
x
��> ?
=>
��@ B
new
��C F
{
��G H
x
��I J
.
��J K
Fecha
��K P
,
��P Q
x
��R S
.
��S T
	Categoria
��T ]
,
��] ^
x
��_ `
.
��` a
Subcategoria
��a m
}
��n o
)
��o p
.
��) *
Select
��* 0
(
��0 1
y
��1 2
=>
��3 5
new
��6 9
ProspectoReporte
��: J
(
��J K
)
��K L
{
��) *
	Categoria
��- 6
=
��7 8
y
��9 :
.
��: ;
Key
��; >
.
��> ?
	Categoria
��? H
,
��H I
Subcategoria
��- 9
=
��: ;
y
��< =
.
��= >
Key
��> A
.
��A B
Subcategoria
��B N
,
��N O
CantidadProspecto
��- >
=
��? @
y
��A B
.
��B C
Count
��C H
(
��H I
)
��I J
,
��J K
Fecha
��- 2
=
��3 4
y
��5 6
.
��6 7
Key
��7 :
.
��: ;
Fecha
��; @
}
��) *
)
��* +
.
��+ ,
ToList
��, 2
(
��2 3
)
��3 4
;
��4 5
var
�� '
listprospectoadnporsemana
�� )
=
��* +&
listProspectosAdnsPorMes
��, D
.
��D E
Where
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
Fecha
��R W
>=
��X Z
finiciosemana
��[ h
&&
��i k
x
��l m
.
��m n
Fecha
��n s
<=
��t v

ffinsemana��w �
)��� �
;��� �
if
�� 
(
�� 
listcitaspormes
�� 
.
��  
Count
��  %
(
��% &
)
��& '
>
��( )
$num
��* +
)
��+ ,
{
�� &
listProspectoCitasPorMes
�� )
=
��* +
listcitaspormes
��, ;
.
��; <
GroupBy
��< C
(
��C D
x
��D E
=>
��F H
new
��I L
{
��M N
x
��O P
.
��P Q
Fecha
��Q V
,
��V W
x
��X Y
.
��Y Z
Subcategoria
��Z f
}
��g h
)
��h i
.
��) *
Select
��* 0
(
��0 1
y
��1 2
=>
��3 5
new
��6 9
ProspectoReporte
��: J
(
��J K
)
��K L
{
��) *
	Categoria
��- 6
=
��7 8
$str
��9 @
,
��@ A
Subcategoria
��- 9
=
��: ;
y
��< =
.
��= >
Key
��> A
.
��A B
Subcategoria
��B N
,
��N O
CantidadProspecto
��- >
=
��? @
y
��A B
.
��B C
Sum
��C F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
CantidadCita
��N Z
)
��Z [
,
��[ \
Fecha
��- 2
=
��3 4
y
��5 6
.
��6 7
Key
��7 :
.
��: ;
Fecha
��; @
}
��) *
)
��* +
.
��+ ,
ToList
��, 2
(
��2 3
)
��3 4
;
��4 5+
listProspectoEntrevistaPorMes
�� .
=
��/ 0
listcitaspormes
��1 @
.
��@ A
Where
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Calificacion
��N Z
&&
��[ ]
x
��^ _
.
��_ `$
CodigoTipoCalificacion
��` v
==
��w y$
TablaTipoCalificacion��z �
.��� �

Concretado��� �
)��� �
.��� �
GroupBy��� �
(��� �
x��� �
=>��� �
new��� �
{��� �
x��� �
.��� �
Fecha��� �
,��� �
x��� �
.��� �
Subcategoria��� �
}��� �
)��� �
.
��/ 0
Select
��0 6
(
��6 7
y
��7 8
=>
��9 ;
new
��< ?
ProspectoReporte
��@ P
(
��P Q
)
��Q R
{
��/ 0
	Categoria
��3 <
=
��= >
$str
��? L
,
��L M
Subcategoria
��3 ?
=
��@ A
y
��B C
.
��C D
Key
��D G
.
��G H
Subcategoria
��H T
,
��T U
CantidadProspecto
��3 D
=
��E F
y
��G H
.
��H I
Sum
��I L
(
��L M
X
��M N
=>
��O Q
X
��R S
.
��S T
CantidadCita
��T `
)
��` a
,
��a b
Fecha
��3 8
=
��9 :
y
��; <
.
��< =
Key
��= @
.
��@ A
Fecha
��A F
}
��/ 0
)
��0 1
.
��1 2
ToList
��2 8
(
��8 9
)
��9 :
;
��: ;)
listProspectoCitasPorSemana
�� ,
=
��- .&
listProspectoCitasPorMes
��/ G
.
��G H
Where
��H M
(
��M N
x
��N O
=>
��P R
x
��S T
.
��T U
Fecha
��U Z
>=
��[ ]
finiciosemana
��^ k
&&
��l n
x
��o p
.
��p q
Fecha
��q v
<=
��w y

ffinsemana��z �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �.
 listProspectoEntrevistaPorSemana
�� 1
=
��2 3+
listProspectoEntrevistaPorMes
��4 Q
.
��Q R
Where
��R W
(
��W X
x
��X Y
=>
��Z \
x
��] ^
.
��^ _
Fecha
��_ d
>=
��e g
finiciosemana
��h u
&&
��v x
x
��y z
.
��z {
Fecha��{ �
<=��� �

ffinsemana��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� '
listprospectoadnporsemana
�� )
?
��) *
.
��* +
Any
��+ .
(
��. /
)
��/ 0
==
��1 3
true
��4 8
)
��8 9
{
�� !
listaReporteSemanal
�� #
.
��# $
Add
��$ '
(
��' ('
listprospectoadnporsemana
��( A
.
��A B
GroupBy
��B I
(
��I J
x
��J K
=>
��L N
new
��O R
{
��S T
x
��U V
.
��V W
Subcategoria
��W c
}
��d e
)
��e f
.
��f g
Select
��* 0
(
��0 1
y
��1 2
=>
��3 5
new
��6 9
ActividadReporte
��: J
(
��J K
)
��K L
{
��* +
Subcategoria
��. :
=
��; <
y
��= >
.
��> ?
Key
��? B
.
��B C
Subcategoria
��C O
,
��O P
Lunes
��. 3
=
��4 5
y
��6 7
.
��7 8
Where
��8 =
(
��= >
x
��> ?
=>
��@ B
(
��C D
byte
��D H
)
��H I
x
��I J
.
��J K
Fecha
��K P
.
��P Q
	DayOfWeek
��Q Z
==
��[ ]
$num
��^ _
)
��_ `
.
��` a
Sum
��a d
(
��d e
x
��e f
=>
��g i
x
��j k
.
��k l
CantidadProspecto
��l }
)
��} ~
,
��~ 
Martes
��. 4
=
��5 6
y
��7 8
.
��8 9
Where
��9 >
(
��> ?
x
��? @
=>
��A C
(
��D E
byte
��E I
)
��I J
x
��J K
.
��K L
Fecha
��L Q
.
��Q R
	DayOfWeek
��R [
==
��\ ^
$num
��_ `
)
��` a
.
��a b
Sum
��b e
(
��e f
x
��f g
=>
��h j
x
��k l
.
��l m
CantidadProspecto
��m ~
)
��~ 
,�� �
	Miercoles
��. 7
=
��8 9
y
��: ;
.
��; <
Where
��< A
(
��A B
x
��B C
=>
��D F
(
��G H
byte
��H L
)
��L M
x
��M N
.
��N O
Fecha
��O T
.
��T U
	DayOfWeek
��U ^
==
��_ a
$num
��b c
)
��c d
.
��d e
Sum
��e h
(
��h i
x
��i j
=>
��k m
x
��n o
.
��o p 
CantidadProspecto��p �
)��� �
,��� �
Jueves
��. 4
=
��5 6
y
��7 8
.
��8 9
Where
��9 >
(
��> ?
x
��? @
=>
��A C
(
��D E
byte
��E I
)
��I J
x
��J K
.
��K L
Fecha
��L Q
.
��Q R
	DayOfWeek
��R [
==
��\ ^
$num
��_ `
)
��` a
.
��a b
Sum
��b e
(
��e f
x
��f g
=>
��h j
x
��k l
.
��l m
CantidadProspecto
��m ~
)
��~ 
,�� �
Viernes
��. 5
=
��6 7
y
��8 9
.
��9 :
Where
��: ?
(
��? @
x
��@ A
=>
��B D
(
��E F
byte
��F J
)
��J K
x
��K L
.
��L M
Fecha
��M R
.
��R S
	DayOfWeek
��S \
==
��] _
$num
��` a
)
��a b
.
��b c
Sum
��c f
(
��f g
x
��g h
=>
��i k
x
��l m
.
��m n
CantidadProspecto
��n 
)�� �
,��� �
Sabado
��. 4
=
��5 6
y
��7 8
.
��8 9
Where
��9 >
(
��> ?
x
��? @
=>
��A C
(
��D E
byte
��E I
)
��I J
x
��J K
.
��K L
Fecha
��L Q
.
��Q R
	DayOfWeek
��R [
==
��\ ^
$num
��_ `
)
��` a
.
��a b
Sum
��b e
(
��e f
x
��f g
=>
��h j
x
��k l
.
��l m
CantidadProspecto
��m ~
)
��~ 
,�� �
Domingo
��. 5
=
��6 7
y
��8 9
.
��9 :
Where
��: ?
(
��? @
x
��@ A
=>
��B D
(
��E F
byte
��F J
)
��J K
x
��K L
.
��L M
Fecha
��M R
.
��R S
	DayOfWeek
��S \
==
��] _
$num
��` a
)
��a b
.
��b c
Sum
��c f
(
��f g
x
��g h
=>
��i k
x
��l m
.
��m n
CantidadProspecto
��n 
)�� �
,��� �
TotalSemana
��. 9
=
��: ;
y
��< =
.
��= >
Sum
��> A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I
CantidadProspecto
��I Z
)
��Z [
,
��[ \
TotalMes
��. 6
=
��7 8&
listProspectosAdnsPorMes
��9 Q
.
��Q R
Sum
��R U
(
��U V
x
��V W
=>
��X Z
x
��[ \
.
��\ ]
CantidadProspecto
��] n
)
��n o
}
��* +
)
��+ ,
.
��, -
FirstOrDefault
��- ;
(
��; <
)
��< =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� $
listprospectoporsemana
�� *
?
��* +
.
��+ ,
Any
��, /
(
��/ 0
)
��0 1
==
��2 4
true
��5 9
)
��9 :
{
�� !
listaReporteSemanal
�� #
.
��# $
AddRange
��$ ,
(
��, -"
AgruparProspectoCita
��- A
(
��A B$
listprospectoporsemana
��B X
,
��X Y!
listProspectoPorMes
��Z m
)
��m n
)
��n o
;
��o p
}
�� 
if
�� 
(
�� )
listProspectoCitasPorSemana
�� /
?
��/ 0
.
��0 1
Any
��1 4
(
��4 5
)
��5 6
==
��7 9
true
��: >
)
��> ?
{
�� !
listaReporteSemanal
�� #
.
��# $
AddRange
��$ ,
(
��, -"
AgruparProspectoCita
��- A
(
��A B)
listProspectoCitasPorSemana
��B ]
,
��] ^&
listProspectoCitasPorMes
��_ w
)
��w x
)
��x y
;
��y z
}
�� 
if
�� 
(
�� .
 listProspectoEntrevistaPorSemana
�� 4
?
��4 5
.
��5 6
Any
��6 9
(
��9 :
)
��: ;
==
��< >
true
��? C
)
��C D
{
�� !
listaReporteSemanal
�� #
.
��# $
AddRange
��$ ,
(
��, -"
AgruparProspectoCita
��- A
(
��A B.
 listProspectoEntrevistaPorSemana
��B b
,
��b c,
listProspectoEntrevistaPorMes��d �
)��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� !
listaReporteSemanal
�� #
.
��# $
Count
��$ )
>
��) *
$num
��* +
)
��+ ,
{
�� 
foreach
�� 
(
�� 
var
�� 
	actividad
�� &
in
��' )(
listaReporteSemanalInicial
��* D
)
��D E
{
�� 
var
��  
respuestaactividad
�� *
=
��+ ,!
listaReporteSemanal
��- @
.
��@ A
Where
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Category
��N V
==
��W Y
	actividad
��Z c
.
��c d
Category
��d l
&&
��m o
x
��p q
.
��q r
Subcategoria
��r ~
.
��~ 
ToUpper�� �
(��� �
)��� �
==��� �
	actividad��� �
.��� �
Subcategoria��� �
.��� �
ToUpper��� �
(��� �
)��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
if
�� 
(
��  
respuestaactividad
�� *
!=
��+ -
null
��. 2
)
��2 3
{
�� 
	actividad
�� !
.
��! "
Lunes
��" '
=
��( ) 
respuestaactividad
��* <
.
��< =
Lunes
��= B
;
��B C
	actividad
�� !
.
��! "
Martes
��" (
=
��) * 
respuestaactividad
��+ =
.
��= >
Martes
��> D
;
��D E
	actividad
�� !
.
��! "
	Miercoles
��" +
=
��, - 
respuestaactividad
��. @
.
��@ A
	Miercoles
��A J
;
��J K
	actividad
�� !
.
��! "
Jueves
��" (
=
��) * 
respuestaactividad
��+ =
.
��= >
Jueves
��> D
;
��D E
	actividad
�� !
.
��! "
Viernes
��" )
=
��* + 
respuestaactividad
��, >
.
��> ?
Viernes
��? F
;
��F G
	actividad
�� !
.
��! "
Sabado
��" (
=
��) * 
respuestaactividad
��+ =
.
��= >
Sabado
��> D
;
��D E
	actividad
�� !
.
��! "
Domingo
��" )
=
��* + 
respuestaactividad
��, >
.
��> ?
Domingo
��? F
;
��F G
	actividad
�� !
.
��! "
TotalSemana
��" -
=
��. / 
respuestaactividad
��0 B
.
��B C
TotalSemana
��C N
;
��N O
	actividad
�� !
.
��! "
TotalMes
��" *
=
��+ , 
respuestaactividad
��- ?
.
��? @
TotalMes
��@ H
;
��H I
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
List
�� 
<
�� 
ProspectoReporte
�� %
>
��% &
total
��' ,
=
��- .
new
��/ 2
List
��3 7
<
��7 8
ProspectoReporte
��8 H
>
��H I
(
��I J
)
��J K
;
��K L
if
�� 
(
�� +
listProspectoEntrevistaPorMes
�� 1
?
��1 2
.
��2 3
Any
��3 6
(
��6 7
)
��7 8
==
��9 ;
true
��< @
)
��@ A
total
��B G
.
��G H
AddRange
��H P
(
��P Q+
listProspectoEntrevistaPorMes
��Q n
)
��n o
;
��o p
if
�� 
(
�� !
listProspectoPorMes
�� '
?
��' (
.
��( )
Any
��) ,
(
��, -
)
��- .
==
��/ 1
true
��2 6
)
��6 7
total
��8 =
.
��= >
AddRange
��> F
(
��F G!
listProspectoPorMes
��G Z
)
��Z [
;
��[ \
if
�� 
(
�� &
listProspectoCitasPorMes
�� ,
?
��, -
.
��- .
Any
��. 1
(
��1 2
)
��2 3
==
��4 6
true
��7 ;
)
��; <
total
��= B
.
��B C
AddRange
��C K
(
��K L&
listProspectoCitasPorMes
��L d
)
��d e
;
��e f
if
�� 
(
�� +
listProspectoEntrevistaPorMes
�� 1
?
��1 2
.
��2 3
Any
��3 6
(
��6 7
)
��7 8
==
��9 ;
true
��< @
)
��@ A
total
��B G
.
��G H
AddRange
��H P
(
��P Q+
listProspectoEntrevistaPorMes
��Q n
)
��n o
;
��o p
foreach
�� 
(
�� 
var
�� 
	actividad
�� &
in
��' )(
listaReporteSemanalInicial
��* D
)
��D E
{
�� 
	actividad
�� 
.
�� 
TotalMes
�� #
=
��$ %
total
��& +
?
��+ ,
.
��, -
Any
��- 0
(
��0 1
)
��1 2
==
��3 5
true
��6 :
?
��; <
total
��= B
.
��B C
Where
��C H
(
��H I
x
��I J
=>
��K M
x
��N O
.
��O P
	Categoria
��P Y
==
��Z \
	actividad
��] f
.
��f g
Category
��g o
&&
��p r
x
��s t
.
��t u
Subcategoria��u �
.��� �
ToUpper��� �
(��� �
)��� �
==��� �
	actividad��� �
.��� �
Subcategoria��� �
.��� �
ToUpper��� �
(��� �
)��� �
)��� �
.��� �
Sum��� �
(��� �
x��� �
=>��� �
x��� �
.��� �!
CantidadProspecto��� �
)��� �
:��� �
$num��� �
;��� �
}
�� 
}
�� 
responseService
�� 
=
�� !
configurationHelper
�� 1
.
��1 2,
ObtenerCodigoRespuestaServicio
��2 P
(
��P Q%
CodigoRespuestaServicio
��Q h
.
��h i
Exito
��i n
,
��n o
$str
��p r
)
��r s
;
��s t
response
�� 
.
�� 
auditResponse
�� "
=
��# $
new
��% (
AuditResponse
��) 6
{
��7 8
codigoRespuesta
��9 H
=
��I J
responseService
��K Z
.
��Z [
codigoRespuesta
��[ j
,
��j k
mensajeRespuesta
��l |
=
��} ~
responseService�� �
.��� � 
mensajeRespuesta��� �
}��� �
;��� �
response
�� 
.
�� 
Entity
�� 
=
�� (
listaReporteSemanalInicial
�� 8
;
��8 9
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ResponseModel
�� '
<
��' (
List
��( ,
<
��, -
Intermediario
��- :
>
��: ;
>
��; <
>
��< =*
ObtenerAsesoresPorSupervisor
��> Z
(
��Z [
int
��[ ^!
codigointermediario
��_ r
)
��r s
{
�� 	
ResponseService
�� 
responseService
�� +
;
��+ ,!
ConfigurationHelper
�� !
configurationHelper
��  3
=
��4 5
new
��6 9!
ConfigurationHelper
��: M
(
��M N
)
��N O
;
��O P
ResponseModel
�� 
<
�� 
List
�� 
<
�� 
Intermediario
�� ,
>
��, -
>
��- .
response
��/ 7
=
��8 9
new
��: =
ResponseModel
��> K
<
��K L
List
��L P
<
��P Q
Intermediario
��Q ^
>
��^ _
>
��_ `
(
��` a
)
��a b
;
��b c
var
�� 
result
�� 
=
�� 
await
�� 
(
��  
from
��  $
intermediario
��% 2
in
��3 5
_context
��6 >
.
��> ?'
ConsolidadoIntermediarios
��? X
where
��" '
intermediario
��( 5
.
��5 6#
CodigoIntermediarioGA
��6 K
==
��L N!
codigointermediario
��O b
||
��c e
intermediario
��( 5
.
��5 6#
CodigoIntermediarioGU
��6 K
==
��L N!
codigointermediario
��O b
select
��" (
new
��) ,
{
��" #
intermediario
��& 3
}
��" #
)
��# $
.
��$ %
Select
��% +
(
��+ ,
x
��, -
=>
��. 0
new
��1 4
Intermediario
��5 B
(
��B C
)
��C D
{
��" #
Nombres
��& -
=
��. /
x
��0 1
.
��1 2
intermediario
��2 ?
.
��? @
NombreRazonSocial
��@ Q
,
��Q R!
CodigoIntermediario
��& 9
=
��: ;
x
��< =
.
��= >
intermediario
��> K
.
��K L!
CodigoIntermediario
��L _
}
��" #
)
��# $
.
��$ %
ToListAsync
��% 0
(
��0 1
)
��1 2
;
��2 3
responseService
�� 
=
�� !
configurationHelper
�� 1
.
��1 2,
ObtenerCodigoRespuestaServicio
��2 P
(
��P Q%
CodigoRespuestaServicio
��Q h
.
��h i
Exito
��i n
,
��n o
$str
��p r
)
��r s
;
��s t
response
�� 
.
�� 
auditResponse
�� "
=
��# $
new
��% (
AuditResponse
��) 6
{
��7 8
codigoRespuesta
��9 H
=
��I J
responseService
��K Z
.
��Z [
codigoRespuesta
��[ j
,
��j k
mensajeRespuesta
��l |
=
��} ~
responseService�� �
.��� � 
mensajeRespuesta��� �
}��� �
;��� �
response
�� 
.
�� 
Entity
�� 
=
�� 
result
�� $
;
��$ %
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
int
�� $
ObtenerNumeroDiaSemana
�� )
(
��) *
string
��* 0
	diasemana
��1 :
)
��: ;
{
�� 	
int
�� 
	numerodia
�� 
=
�� 
$num
�� 
;
�� 
switch
�� 
(
�� 
	diasemana
�� 
)
�� 
{
�� 
case
�� 
$str
�� 
:
�� 
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
case
�� 
$str
��  
:
��  !
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 
	numerodia
�� 
=
�� 
$num
��  !
;
��! "
break
�� 
;
�� 
default
�� 
:
�� 
	numerodia
�� 
=
�� 
-
��  !
$num
��! "
;
��" #
break
�� 
;
�� 
}
�� 
return
�� 
	numerodia
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� 
CitaCalendario
�� (
>
��( )#
ObtenerCitaCalendario
��* ?
(
��? @
int
��@ C!
codigoIntermediario
��D W
,
��W X
DateTime
��X `
fechaInicio
��a l
,
��l m
DateTime
��m u
fechaFin
��v ~
)
��~ 
{
�� 	
var
�� 
result
�� 
=
�� 
(
��% &
from
��& *
c
��+ ,
in
��- /
_context
��0 8
.
��8 9
Citas
��9 >
join
��% )
	prospecto
��* 3
in
��4 6
_context
��7 ?
.
��? @

Prospectos
��@ J
on
��K M
c
��N O
.
��O P
IdProspecto
��P [
equals
��\ b
	prospecto
��c l
.
��l m
IdProspecto
��m x
join
��% )
intermediario
��* 7
in
��8 :
_context
��; C
.
��C D'
ConsolidadoIntermediarios
��D ]
on
��^ `
	prospecto
��a j
.
��j k)
IdConsolidadoIntermediario��k �
equals��� �
intermediario��� �
.��� �*
IdConsolidadoIntermediario��� �
join
��% )
referido
��* 2
in
��3 5
_context
��6 >
.
��> ?

Prospectos
��? I
on
��J L
	prospecto
��M V
.
��V W
IdReferenciador
��W f
equals
��g m
referido
��n v
.
��v w
IdProspecto��w �
into��� �!
ProspectoReferido��� �
from
��% )
	preferido
��* 3
in
��4 6
ProspectoReferido
��7 H
.
��H I
DefaultIfEmpty
��I W
(
��W X
)
��X Y
join
��% )
	actividad
��* 3
in
��4 6
_context
��7 ?
.
��? @

Actividads
��@ J
on
��K M
new
��N Q
{
��R S
c
��T U
.
��U V
NumeroEntrevista
��V f
,
��f g
lnegocio
��h p
=
��q r
LineaNegocio
��s 
.�� �
Renta��� �
}��� �
equals
��@ F
new
��G J
{
��K L
NumeroEntrevista
��M ]
=
��^ _
	actividad
��` i
.
��i j

NumeroCita
��j t
,
��t u
lnegocio
��v ~
=�� �
	actividad��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �
CitaActividad��� �
from
��% )

cactividad
��* 4
in
��5 7
CitaActividad
��8 E
.
��E F
DefaultIfEmpty
��F T
(
��T U
)
��U V
join
��% )
etapa
��* /
in
��0 2
_context
��3 ;
.
��; <
TablaTablas
��< G
on
��H J
new
��K N
{
��O P

cactividad
��Q [
.
��[ \
CodigoEtapa
��\ g
,
��g h
idtablaetapa
��i u
=
��v w

TablaTabla��x �
.��� �
EtapaActivad��� �
}��� �
equals
��@ F
new
��G J
{
��K L
CodigoEtapa
��M X
=
��Y Z
etapa
��[ `
.
��` a
CodigoCampo
��a l
,
��l m
idtablaetapa
��n z
=
��{ |
etapa��} �
.��� �
IdTabla��� �
}��� �
into��� �
ActividadEtapa��� �
from
��% )
actividadetapa
��* 8
in
��9 ;
ActividadEtapa
��< J
.
��J K
DefaultIfEmpty
��K Y
(
��Y Z
)
��Z [
join
��% )
motivounodescarte
��* ;
in
��< >
_context
��? G
.
��G H
ListaTablas
��H S
on
��T V
new
��W Z
{
��[ \
	prospecto
��] f
.
��f g%
CodigoMotivoUnoDescarte
��g ~
,
��~ %
idtablamotivodescarte��� �
=��� �

TablaTabla��� �
.��� �
MotivoDescarte��� �
}��� �
equals
��A G
new
��H K
{
��L M%
CodigoMotivoUnoDescarte
��N e
=
��f g
(
��h i
short
��i n
?
��n o
)
��o p 
motivounodescarte��p �
.��� �
CodigoCampo��� �
,��� �%
idtablamotivodescarte��� �
=��� �!
motivounodescarte��� �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoUnoDescarte��� �
from
��% ) 
pmotivounodescarte
��* <
in
��= ?(
ProspectoMotivoUnoDescarte
��@ Z
.
��Z [
DefaultIfEmpty
��[ i
(
��i j
)
��j k
join
��% )
motivodosdescarte
��* ;
in
��< >
_context
��? G
.
��G H
ListaTablas
��H S
on
��T V
new
��W Z
{
��[ \
	prospecto
��] f
.
��f g%
CodigoMotivoDosDescarte
��g ~
,
��~ %
idtablamotivodescarte��� �
=��� �

TablaTabla��� �
.��� �
MotivoDescarte��� �
}��� �
equals
��I O
new
��P S
{
��T U%
CodigoMotivoDosDescarte
��V m
=
��n o
(
��p q
short
��q v
?
��v w
)
��w x 
motivodosdescarte��x �
.��� �
CodigoCampo��� �
,��� �%
idtablamotivodescarte��� �
=��� �!
motivodosdescarte��� �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoDosDescarte��� �
from
��% ) 
pmotivodosdescarte
��* <
in
��= ?(
ProspectoMotivoDosDescarte
��@ Z
.
��Z [
DefaultIfEmpty
��[ i
(
��i j
)
��j k
join
��% )
fuente
��* 0
in
��1 3
_context
��4 <
.
��< =
ListaTablas
��= H
on
��I K
new
��L O
{
��P Q
	prospecto
��R [
.
��[ \
CodigoFuente
��\ h
,
��h i
idtablafuente
��j w
=
��x y

TablaTabla��z �
.��� �
FuenteProspecto��� �
,��� �
lnegocio��� �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
��A G
new
��H K
{
��L M
CodigoFuente
��N Z
=
��[ \
(
��] ^
short
��^ c
?
��c d
)
��d e
fuente
��e k
.
��k l
CodigoCampo
��l w
,
��w x
idtablafuente��y �
=��� �
fuente��� �
.��� �
IdTabla��� �
,��� �
lnegocio��� �
=��� �
fuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �
ProspectoFuente��� �
from
��% )
pfuente
��* 1
in
��2 4
ProspectoFuente
��5 D
.
��D E
DefaultIfEmpty
��E S
(
��S T
)
��T U
join
��% )
	subfuente
��* 3
in
��4 6
_context
��7 ?
.
��? @
ListaTablas
��@ K
on
��L N
new
��O R
{
��S T
	prospecto
��U ^
.
��^ _
CodigoSubFuente
��_ n
,
��n o
idtablasubfuente��p �
=��� �

TablaTabla��� �
.��� �
FuenteProspecto��� �
,��� �
lnegocio��� �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
��I O
new
��P S
{
��T U
CodigoSubFuente
��V e
=
��f g
(
��h i
short
��i n
?
��n o
)
��o p
	subfuente
��p y
.
��y z
CodigoCampo��z �
,��� � 
idtablasubfuente��� �
=��� �
	subfuente��� �
.��� �
IdTabla��� �
,��� �
lnegocio��� �
=��� �
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
��% )

psubfuente
��* 4
in
��5 7 
ProspectoSubFuente
��8 J
.
��J K
DefaultIfEmpty
��K Y
(
��Y Z
)
��Z [
join
��% )
tipocalificacion
��* :
in
��; =
_context
��> F
.
��F G
TablaTablas
��G R
on
��S U
new
��V Y
{
��Z [
c
��\ ]
.
��] ^$
CodigoTipoCalificacion
��^ t
,
��t u&
idtablatipocalificacion��v �
=��� �

TablaTabla��� �
.��� � 
TipoCalificacion��� �
}��� �
equals
��I O
new
��P S
{
��T U$
CodigoTipoCalificacion
��V l
=
��m n
(
��o p
short
��p u
?
��u v
)
��v w
tipocalificacion��w �
.��� �
CodigoCampo��� �
,��� �'
idtablatipocalificacion��� �
=��� � 
tipocalificacion��� �
.��� �
IdTabla��� �
}��� �
into��� �$
CitaTipoCalificacion��� �
from
��% )
ctipocalificacion
��* ;
in
��< >"
CitaTipoCalificacion
��? S
.
��S T
DefaultIfEmpty
��T b
(
��b c
)
��c d
join
��% )%
experienciacalificacion
��* A
in
��B D
_context
��E M
.
��M N
TablaTablas
��N Y
on
��Z \
new
��] `
{
��a b
c
��c d
.
��d e0
!CodigoTipoExperienciaCalificacion��e �
,��� �.
idtablaexperienciacalificacion��� �
=��� �

TablaTabla��� �
.��� �'
ExperienciaCalificacion��� �
}��� �
equals
��I O
new
��P S
{
��T U/
!CodigoTipoExperienciaCalificacion
��V w
=
��x y
(
��z {
short��{ �
?��� �
)��� �'
experienciacalificacion��� �
.��� �
CodigoCampo��� �
,��� �.
idtablaexperienciacalificacion��� �
=��� �'
experienciacalificacion��� �
.��� �
IdTabla��� �
}��� �
into��� �+
CitaExperienciaCalificacion��� �
from
��% )&
cexperienciacalificacion
��* B
in
��C E)
CitaExperienciaCalificacion
��F a
.
��a b
DefaultIfEmpty
��b p
(
��p q
)
��q r
join
��% )
porcentajeavance
��* :
in
��; =
_context
��> F
.
��F G
TablaTablas
��G R
on
��S U
new
��V Y
{
��Z [
c
��\ ]
.
��] ^1
"CodigoPorcentajeAvanceCalificacion��^ �
,��� �'
idtablaporcentajeavance��� �
=��� �

TablaTabla��� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
��? E
new
��F I
{
��J K0
"CodigoPorcentajeAvanceCalificacion
��L n
=
��o p
(
��q r
short
��r w
?
��w x
)
��x y
porcentajeavance��y �
.��� �
CodigoCampo��� �
,��� �'
idtablaporcentajeavance��� �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �
CitaPorcentaje��� �
from
��% )
cporcentajeavance
��* ;
in
��< >
CitaPorcentaje
��? M
.
��M N
DefaultIfEmpty
��N \
(
��\ ]
)
��] ^
join
��% ) 
motivonoconcretada
��* <
in
��= ?
_context
��@ H
.
��H I
TablaTablas
��I T
on
��U W
new
��X [
{
��\ ]
c
��^ _
.
��_ `*
CodigoMotivoCitaNoConcretada
��` |
,
��| }(
idtablamotivonoconcretada��~ �
=��� �

TablaTabla��� �
.��� �&
MotivoCitaNoConcretada��� �
}��� �
equals
��? E
new
��F I
{
��J K*
CodigoMotivoCitaNoConcretada
��L h
=
��i j
(
��k l
short
��l q
?
��q r
)
��r s!
motivonoconcretada��s �
.��� �
CodigoCampo��� �
,��� �)
idtablamotivonoconcretada��� �
=��� �"
motivonoconcretada��� �
.��� �
IdTabla��� �
}��� �
into��� �&
CitaMotivoNoConcretada��� �
from
��% )!
cmotivonoconcretada
��* =
in
��> @$
CitaMotivoNoConcretada
��A W
.
��W X
DefaultIfEmpty
��X f
(
��f g
)
��g h
join
��% )
motivoreagendada
��* :
in
��; =
_context
��> F
.
��F G
TablaTablas
��G R
on
��S U
new
��V Y
{
��Z [
c
��\ ]
.
��] ^$
CodigoMotivoReagendado
��^ t
,
��t u&
idtablamotivoreagendada��v �
=��� �

TablaTabla��� �
.��� � 
MotivoReagendada��� �
}��� �
equals
��? E
new
��F I
{
��J K$
CodigoMotivoReagendado
��L b
=
��c d
(
��e f
short
��f k
?
��k l
)
��l m
motivoreagendada
��m }
.
��} ~
CodigoCampo��~ �
,��� �'
idtablamotivoreagendada��� �
=��� � 
motivoreagendada��� �
.��� �
IdTabla��� �
}��� �
into��� �$
CitaMotivoReagendada��� �
from
��% )
cmotivoreagendada
��* ;
in
��< >"
CitaMotivoReagendada
��? S
.
��S T
DefaultIfEmpty
��T b
(
��b c
)
��c d
join
��% )
distrito
��* 2
in
��3 5
_context
��6 >
.
��> ?
	Distritos
��? H
on
��I K
new
��L O
{
��P Q
c
��R S
.
��S T 
CodigoDepartamento
��T f
,
��f g
c
��h i
.
��i j
CodigoProvincia
��j y
,
��y z
c
��{ |
.
��| }
CodigoDistrito��} �
}��� �
equals
��A G
new
��H K
{
��L M 
CodigoDepartamento
��N `
=
��a b
(
��c d
short
��d i
?
��i j
)
��j k
distrito
��k s
.
��s t
Departamento_Id��t �
,��� �
CodigoProvincia��� �
=��� �
(��� �
short��� �
?��� �
)��� �
distrito��� �
.��� �
Provincia_Id��� �
,��� �
CodigoDistrito��� �
=��� �
(��� �
short��� �
?��� �
)��� �
distrito��� �
.��� �
Distrito_Id��� �
}��� �
into��� �
CitaDistrito��� �
from
��% )
	cdistrito
��* 3
in
��4 6
CitaDistrito
��7 C
.
��C D
DefaultIfEmpty
��D R
(
��R S
)
��S T
join
��% )
	provincia
��* 3
in
��4 6
_context
��7 ?
.
��? @

Provincias
��@ J
on
��K M
new
��N Q
{
��R S
c
��T U
.
��U V
CodigoProvincia
��V e
,
��e f
c
��g h
.
��h i 
CodigoDepartamento
��i {
}
��| }
equals
��K Q
new
��R U
{
��V W
CodigoProvincia
��X g
=
��h i
(
��j k
short
��k p
?
��p q
)
��q r
	provincia
��r {
.
��{ |
Provincia_Id��| �
,��� �"
CodigoDepartamento��� �
=��� �
(��� �
short��� �
?��� �
)��� �
	provincia��� �
.��� �
Departamento_Id��� �
}��� �
into��� �"
DireccionProvincia��� �
from
��% )

cprovincia
��* 4
in
��5 7 
DireccionProvincia
��8 J
.
��J K
DefaultIfEmpty
��K Y
(
��Y Z
)
��Z [
join
��% )
departamento
��* 6
in
��7 9
_context
��: B
.
��B C
Departamentos
��C P
on
��Q S
c
��T U
.
��U V 
CodigoDepartamento
��V h
equals
��i o
departamento
��p |
.
��| }
Departamento_Id��} �
into��� �%
DireccionDepartamento��� �
from
��% )
cdepartamento
��* 7
in
��8 :#
DireccionDepartamento
��; P
.
��P Q
DefaultIfEmpty
��Q _
(
��_ `
)
��` a
where
��% *
intermediario
��+ 8
.
��8 9!
CodigoIntermediario
��9 L
==
��M O!
codigoIntermediario
��P c
&&
��d f
(
��+ ,
c
��, -
.
��- .
	FechaCita
��. 7
>=
��8 :
fechaInicio
��; F
&&
��G I
c
��J K
.
��K L
	FechaCita
��L U
<=
��V X
fechaFin
��Y a
)
��a b
select
��% +
new
��, /
{
��% &
c
��) *
,
��* +
	prospecto
��+ 4
,
��4 5
intermediario
��5 B
,
��B C
	preferido
��C L
,
��L M
pfuente
��M T
,
��T U
actividadetapa
��U c
,
��c d

psubfuente
��d n
,
��n o
	cdistrito
��o x
,
��x y

cprovincia��y �
,��� �
cdepartamento��� �
,��� �

cactividad��� �
,��� �
ctipocalificacion
��) :
,
��: ;
cporcentajeavance
��; L
,
��L M&
cexperienciacalificacion
��M e
,
��e f
cmotivoreagendada
��f w
,
��w x"
cmotivonoconcretada��x �
,��� �"
pmotivounodescarte��� �
,��� � 
pmotivodosdescarte
��) ;
,
��; <
}
��% &
)
��( )
.
��) *
AsNoTracking
��* 6
(
��6 7
)
��7 8
.
��8 9
Select
��9 ?
(
��? @
x
��@ A
=>
��B D
new
��E H
CitaCalendario
��I W
{
��( )
IdCita
��, 2
=
��3 4
x
��5 6
.
��6 7
c
��7 8
.
��8 9
IdCita
��9 ?
,
��? @
IdProspecto
��, 7
=
��8 9
x
��: ;
.
��; <
	prospecto
��< E
.
��E F
IdProspecto
��F Q
,
��Q R
Nombres
��, 3
=
��4 5
string
��6 <
.
��< =
Format
��= C
(
��C D
$str
��D Q
,
��Q R
x
��S T
.
��T U
	prospecto
��U ^
.
��^ _
Nombres
��_ f
,
��f g
x
��h i
.
��i j
	prospecto
��j s
.
��s t
ApellidoPaterno��t �
,��� �
x��� �
.��� �
	prospecto��� �
.��� �
ApellidoMaterno��� �
)��� �
,��� �
TelefonoFijo
��, 8
=
��9 :
x
��; <
.
��< =
	prospecto
��= F
.
��F G
TelefonoFijo
��G S
,
��S T
TelefonoCelular
��, ;
=
��< =
x
��> ?
.
��? @
	prospecto
��@ I
.
��I J
TelefonoCelular
��J Y
,
��Y Z
Fuente
��, 2
=
��3 4
string
��5 ;
.
��; <
Format
��< B
(
��B C
$str
��C O
,
��O P
x
��P Q
.
��Q R
pfuente
��R Y
.
��Y Z
ValorCadena
��Z e
,
��e f
string
��f l
.
��l m
IsNullOrEmpty
��m z
(
��z {
x
��{ |
.
��| }

psubfuente��} �
.��� �
ValorCadena��� �
)��� �
?��� �
$str��� �
:��� �
$str��� �
+��� �
x��� �
.��� �

psubfuente��� �
.��� �
ValorCadena��� �
,��� �
x
��D E
.
��E F
	prospecto
��F O
.
��O P
IdReferenciador
��P _
.
��_ `
HasValue
��` h
?
��i j
x
��k l
.
��l m
	preferido
��m v
.
��v w
Nombres
��w ~
+�� �
$str��� �
+��� �
x��� �
.��� �
	preferido��� �
.��� �
ApellidoPaterno��� �
+��� �
$str��� �
+��� �
x��� �
.��� �
	preferido��� �
.��� �
ApellidoMaterno��� �
:��� �
x��� �
.��� �
	prospecto��� �
.��� �
Referenciador��� �
)��� �
,��� �

Descartado
��, 6
=
��7 8
x
��9 :
.
��: ;
	prospecto
��; D
.
��D E
FlagDescarte
��E Q
.
��Q R
Value
��R W
,
��W X!
TextoMotivoDescarte
��, ?
=
��@ A
string
��B H
.
��H I
IsNullOrEmpty
��I V
(
��V W
x
��W X
.
��X Y 
pmotivodosdescarte
��Y k
.
��k l
ValorCadena
��l w
)
��w x
?
��y z
x
��{ |
.
��| }!
pmotivounodescarte��} �
.��� �
ValorCadena��� �
:
��J K
string
��L R
.
��R S
Format
��S Y
(
��Y Z
$str
��Z c
,
��c d
x
��e f
.
��f g 
pmotivounodescarte
��g y
.
��y z
ValorCadena��z �
,��� �
x��� �
.��� �"
pmotivodosdescarte��� �
.��� �
ValorCadena��� �
)��� �
,��� �
FechaDescarte
��, 9
=
��: ;
x
��< =
.
��= >
	prospecto
��> G
.
��G H%
FechaMotivoTresDescarte
��H _
.
��_ `
Value
��` e
,
��e f
Etapa
��, 1
=
��2 3
string
��4 :
.
��: ;
IsNullOrEmpty
��; H
(
��H I
x
��I J
.
��J K
actividadetapa
��K Y
.
��Y Z
ValorCadena
��Z e
)
��e f
?
��g h
$str
��i z
:
��{ |
x
��} ~
.
��~ 
actividadetapa�� �
.��� �
ValorCadena��� �
,��� �
	FechaCita
��, 5
=
��6 7
x
��8 9
.
��9 :
c
��: ;
.
��; <
	FechaCita
��< E
.
��E F
Value
��F K
,
��K L
NumeroEntrevista
��, <
=
��= >
x
��? @
.
��@ A
c
��A B
.
��B C
NumeroEntrevista
��C S
,
��S T

HoraInicio
��, 6
=
��7 8
x
��9 :
.
��: ;
c
��; <
.
��< =

HoraInicio
��= G
.
��G H
Value
��H M
.
��M N
ToString
��N V
(
��V W
$str
��W `
)
��` a
,
��a b
HoraFin
��, 3
=
��4 5
x
��6 7
.
��7 8
c
��8 9
.
��9 :
HoraFin
��: A
.
��A B
Value
��B G
.
��G H
ToString
��H P
(
��P Q
$str
��Q Z
)
��Z [
,
��[ \
	Ubicacion
��, 5
=
��6 7
x
��8 9
.
��9 :
c
��: ;
.
��; <
	Ubicacion
��< E
,
��E F 
CodigoDepartamento
��, >
=
��? @
x
��A B
.
��B C
c
��C D
.
��D E 
CodigoDepartamento
��E W
,
��W X
CodigoProvincia
��, ;
=
��< =
x
��> ?
.
��? @
c
��@ A
.
��A B
CodigoProvincia
��B Q
,
��Q R
CodigoDistrito
��, :
=
��; <
x
��= >
.
��> ?
c
��? @
.
��@ A
CodigoDistrito
��A O
,
��O P
Departamento
��, 8
=
��9 :
x
��; <
.
��< =
cdepartamento
��= J
.
��J K
Nombre
��K Q
,
��Q R
	Provincia
��, 5
=
��6 7
x
��8 9
.
��9 :

cprovincia
��: D
.
��D E
Nombre
��E K
,
��K L
Distrito
��, 4
=
��5 6
x
��7 8
.
��8 9
	cdistrito
��9 B
.
��B C
Nombre
��C I
,
��I J!
CorreoElectronicoGA
��, ?
=
��@ A
x
��B C
.
��C D
c
��D E
.
��E F
FlagInvitadoGA
��F T
.
��T U
Value
��U Z
?
��[ \
x
��] ^
.
��^ _
intermediario
��_ l
.
��l m"
CorreoElectronicoGA��m �
:��� �
$str��� �
,��� �
NombreGA
��, 4
=
��5 6
x
��7 8
.
��8 9
intermediario
��9 F
.
��F G
NombreGA
��G O
,
��O P!
CorreoElectronicoGU
��, ?
=
��@ A
x
��B C
.
��C D
c
��D E
.
��E F
FlagInvitadoGU
��F T
.
��T U
Value
��U Z
?
��[ \
x
��] ^
.
��^ _
intermediario
��_ l
.
��l m"
CorreoElectronicoGU��m �
:��� �
$str��� �
,��� �
NombreGU
��, 4
=
��5 6
x
��7 8
.
��8 9
intermediario
��9 F
.
��F G
NombreGU
��G O
,
��O P
Descripcion
��, 7
=
��8 9
x
��: ;
.
��; <
c
��< =
.
��= >
Descripcion
��> I
,
��I J
Recordatorio
��, 8
=
��9 :
x
��; <
.
��< =
c
��= >
.
��> ? 
AlertaMinutosAntes
��? Q
.
��Q R
Value
��R W
,
��W X
Fecha
��, 1
=
��2 3
x
��4 5
.
��5 6
c
��6 7
.
��7 8
	FechaCita
��8 A
.
��A B
Value
��B G
,
��G H
EtiquetaColor
��, 9
=
��: ;
string
��< B
.
��B C
IsNullOrEmpty
��C P
(
��P Q
x
��Q R
.
��R S

cactividad
��S ]
.
��] ^
Etiqueta
��^ f
)
��f g
?
��h i
$str
��j r
:
��s t
x
��u v
.
��v w

cactividad��w �
.��� �
Etiqueta��� �
,��� �
TieneCalificacion
��, =
=
��> ?
x
��@ A
.
��A B
c
��B C
.
��C D
FlagCalificacion
��D T
.
��T U
Value
��U Z
,
��Z [
TipoCalificacion
��, <
=
��= >
x
��? @
.
��@ A
ctipocalificacion
��A R
.
��R S
ValorCadena
��S ^
,
��^ _$
CodigoTipoCalificacion
��, B
=
��C D
x
��E F
.
��F G
ctipocalificacion
��G X
.
��X Y
CodigoCampo
��Y d
,
��d e
CalificacionCita
��, <
=
��= >
x
��? @
.
��@ A&
cexperienciacalificacion
��A Y
.
��Y Z
ValorCadena
��Z e
,
��e f$
ComentarioCalificacion
��, B
=
��C D
x
��E F
.
��F G
c
��G H
.
��H I$
ComentarioCalificacion
��I _
,
��_ ` 
ProbabilidadCierre
��, >
=
��? @
x
��A B
.
��B C
cporcentajeavance
��C T
.
��T U
ValorCadena
��U `
,
��` a
PorcentajeAvance
��, <
=
��= >
(
��? @
int
��@ C
)
��C D
x
��D E
.
��E F
cporcentajeavance
��F W
.
��W X
ValorNumerico
��X e
,
��e f&
PorcentajeAvanceAnterior
��, D
=
��E F
(
��G H
int
��H K
)
��K L
(
��L M
(
��M N
(
��N O
from
��O S
citamax
��T [
in
��\ ^
_context
��_ g
.
��g h
Citas
��h m
join
��H L
porcentajeavance
��M ]
in
��^ `
_context
��a i
.
��i j
TablaTablas
��j u
on
��v x
new
��y |
{
��} ~
citamax�� �
.��� �2
"CodigoPorcentajeAvanceCalificacion��� �
,��� �'
idtablaporcentajeavance��� �
=��� �

TablaTabla��� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
��H N
new
��O R
{
��S T0
"CodigoPorcentajeAvanceCalificacion
��U w
=
��x y
(
��z {
short��{ �
?��� �
)��� � 
porcentajeavance��� �
.��� �
CodigoCampo��� �
,��� �'
idtablaporcentajeavance��� �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �!
CitaMaxPorcentaje��� �
from
��H L%
citamaxporcentajeavance
��M d
in
��e g
CitaMaxPorcentaje
��h y
.
��y z
DefaultIfEmpty��z �
(��� �
)��� �
where
��H M
citamax
��N U
.
��U V
IdProspecto
��V a
==
��b d
x
��e f
.
��f g
c
��g h
.
��h i
IdProspecto
��i t
select
��H N
new
��O R
{
��S T
citamax
��U \
,
��\ ]%
citamaxporcentajeavance
��] t
}
��t u
)
��H I
.
��I J
GroupBy
��J Q
(
��Q R
x
��R S
=>
��T V
new
��W Z
{
��[ \
x
��] ^
.
��^ _
citamax
��_ f
.
��f g
IdProspecto
��g r
}
��r s
)
��s t
.
��H I
Select
��I O
(
��O P
y
��P Q
=>
��R T
new
��U X
{
��Y Z
PorcentajeMaximo
��L \
=
��] ^
y
��_ `
.
��` a
Max
��a d
(
��d e
x
��e f
=>
��g i
x
��j k
.
��k l&
citamaxporcentajeavance��l �
.��� �
ValorNumerico��� �
.��� �
Value��� �
)��� �
}
��H I
)
��I J
)
��J K
.
��K L
First
��L Q
(
��Q R
)
��R S
.
��S T
PorcentajeMaximo
��T d
)
��d e
,
��e f 
MotivoNoConcretada
��, >
=
��? @
x
��A B
.
��B C!
cmotivonoconcretada
��C V
.
��V W
ValorCadena
��W b
,
��b c!
FechaEstimadaCierre
��, ?
=
��@ A
x
��B C
.
��C D
c
��D E
.
��E F!
FechaEstimadaCierre
��F Y
.
��Y Z
Value
��Z _
,
��_ `
	Cancelada
��, 5
=
��6 7
(
��8 9
x
��9 :
.
��: ;
c
��; <
.
��< =$
CodigoMotivoReagendado
��= S
==
��T V
$num
��W X
||
��Y [
x
��\ ]
.
��] ^
c
��^ _
.
��_ `$
CodigoMotivoReagendado
��` v
==
��w y
$num
��z {
)
��{ |
,
��| }
MotivoCancelada
��, ;
=
��< =
x
��> ?
.
��? @
cmotivoreagendada
��@ Q
.
��Q R
ValorCadena
��R ]
,
��] ^
FlagUrlTeams
��, 8
=
��9 :
x
��; <
.
��< =
c
��= >
.
��> ?
FlagUrlTeams
��? K
.
��K L
Value
��L Q
,
��Q R
UrlTeams
��, 4
=
��5 6
x
��7 8
.
��8 9
c
��9 :
.
��: ;
UrlTeams
��; C
}
��( )
)
��) *
;
��* +
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� +
RecordatorioLlamadaCalendario
�� 8
>
��8 92
$ObtenerRecordatorioLlamadaCalendario
��: ^
(
��^ _
int
��_ b!
codigoIntermediario
��c v
,
��v w
DateTime��x �
fechaInicio��� �
,��� �
DateTime��� �
fechaFin��� �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
(
��  !
from
��! %
r
��& '
in
��( *
_context
��+ 3
.
��3 4"
RecordatorioLlamadas
��4 H
join
��  $
	prospecto
��% .
in
��/ 1
_context
��2 :
.
��: ;

Prospectos
��; E
on
��F H
r
��I J
.
��J K
IdProspecto
��K V
equals
��W ]
	prospecto
��^ g
.
��g h
IdProspecto
��h s
join
��  $
intermediario
��% 2
in
��3 5
_context
��6 >
.
��> ?'
ConsolidadoIntermediarios
��? X
on
��Y [
	prospecto
��\ e
.
��e f)
IdConsolidadoIntermediario��f �
equals��� �
intermediario��� �
.��� �*
IdConsolidadoIntermediario��� �
join
��  $
referido
��% -
in
��. 0
_context
��1 9
.
��9 :

Prospectos
��: D
on
��E G
	prospecto
��H Q
.
��Q R
IdReferenciador
��R a
equals
��b h
referido
��i q
.
��q r
IdProspecto
��r }
into��~ �!
ProspectoReferido��� �
from
��  $
	preferido
��% .
in
��/ 1
ProspectoReferido
��2 C
.
��C D
DefaultIfEmpty
��D R
(
��R S
)
��S T
join
��  $
motivounodescarte
��% 6
in
��7 9
_context
��: B
.
��B C
ListaTablas
��C N
on
��O Q
new
��R U
{
��V W
	prospecto
��X a
.
��a b%
CodigoMotivoUnoDescarte
��b y
,
��y z$
idtablamotivodescarte��{ �
=��� �

TablaTabla��� �
.��� �
MotivoDescarte��� �
}��� �
equals
��< B
new
��C F
{
��G H%
CodigoMotivoUnoDescarte
��I `
=
��a b
(
��c d
short
��d i
?
��i j
)
��j k
motivounodescarte
��k |
.
��| }
CodigoCampo��} �
,��� �%
idtablamotivodescarte��� �
=��� �!
motivounodescarte��� �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoUnoDescarte��� �
from
��  $ 
pmotivounodescarte
��% 7
in
��8 :(
ProspectoMotivoUnoDescarte
��; U
.
��U V
DefaultIfEmpty
��V d
(
��d e
)
��e f
join
��  $
motivodosdescarte
��% 6
in
��7 9
_context
��: B
.
��B C
ListaTablas
��C N
on
��O Q
new
��R U
{
��V W
	prospecto
��X a
.
��a b%
CodigoMotivoDosDescarte
��b y
,
��y z$
idtablamotivodescarte��{ �
=��� �

TablaTabla��� �
.��� �
MotivoDescarte��� �
}��� �
equals
��D J
new
��K N
{
��O P%
CodigoMotivoDosDescarte
��Q h
=
��i j
(
��k l
short
��l q
?
��q r
)
��r s 
motivodosdescarte��s �
.��� �
CodigoCampo��� �
,��� �%
idtablamotivodescarte��� �
=��� �!
motivodosdescarte��� �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoDosDescarte��� �
from
��  $ 
pmotivodosdescarte
��% 7
in
��8 :(
ProspectoMotivoDosDescarte
��; U
.
��U V
DefaultIfEmpty
��V d
(
��d e
)
��e f
join
��  $
fuente
��% +
in
��, .
_context
��/ 7
.
��7 8
ListaTablas
��8 C
on
��D F
new
��G J
{
��K L
	prospecto
��M V
.
��V W
CodigoFuente
��W c
,
��c d
idtablafuente
��e r
=
��s t

TablaTabla
��u 
.�� �
FuenteProspecto��� �
,��� �
lnegocio��� �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
��< B
new
��C F
{
��G H
CodigoFuente
��I U
=
��V W
(
��X Y
short
��Y ^
?
��^ _
)
��_ `
fuente
��` f
.
��f g
CodigoCampo
��g r
,
��r s
idtablafuente��t �
=��� �
fuente��� �
.��� �
IdTabla��� �
,��� �
lnegocio��� �
=��� �
fuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �
ProspectoFuente��� �
from
��  $
pfuente
��% ,
in
��- /
ProspectoFuente
��0 ?
.
��? @
DefaultIfEmpty
��@ N
(
��N O
)
��O P
join
��  $
	subfuente
��% .
in
��/ 1
_context
��2 :
.
��: ;
ListaTablas
��; F
on
��G I
new
��J M
{
��N O
	prospecto
��P Y
.
��Y Z
CodigoSubFuente
��Z i
,
��i j
idtablasubfuente
��k {
=
��| }

TablaTabla��~ �
.��� �
FuenteProspecto��� �
,��� �
lnegocio��� �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
��D J
new
��K N
{
��O P
CodigoSubFuente
��Q `
=
��a b
(
��c d
short
��d i
?
��i j
)
��j k
	subfuente
��k t
.
��t u
CodigoCampo��u �
,��� � 
idtablasubfuente��� �
=��� �
	subfuente��� �
.��� �
IdTabla��� �
,��� �
lnegocio��� �
=��� �
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
��  $

psubfuente
��% /
in
��0 2 
ProspectoSubFuente
��3 E
.
��E F
DefaultIfEmpty
��F T
(
��T U
)
��U V
join
��  $
lineanegocio
��% 1
in
��2 4
_context
��5 =
.
��= >
TablaTablas
��> I
on
��J L
new
��M P
{
��Q R
r
��S T
.
��T U 
CodigoLineaNegocio
��U g
,
��g h!
idtablalineanegocio
��i |
=
��} ~

TablaTabla�� �
.��� �
LineaNegocio��� �
}��� �
equals
��B H
new
��I L
{
��M N 
CodigoLineaNegocio
��O a
=
��b c
(
��d e
short
��e j
?
��j k
)
��k l
lineanegocio
��l x
.
��x y
CodigoCampo��y �
,��� �#
idtablalineanegocio��� �
=��� �
lineanegocio��� �
.��� �
IdTabla��� �
}��� �
into��� �%
ProspectoLineaNegocio��� �
from
��  $
plineanegocio
��% 2
in
��3 5#
ProspectoLineaNegocio
��6 K
.
��K L
DefaultIfEmpty
��L Z
(
��Z [
)
��[ \
where
��  %
intermediario
��& 3
.
��3 4!
CodigoIntermediario
��4 G
==
��H J!
codigoIntermediario
��K ^
&&
��_ a
(
��& '
r
��' (
.
��( )
FechaRecordatorio
��) :
.
��: ;
Date
��; ?
>=
��@ B
fechaInicio
��C N
&&
��O Q
r
��R S
.
��S T
FechaRecordatorio
��T e
.
��e f
Date
��f j
<=
��k m
fechaFin
��n v
)
��v w
select
��  &
new
��' *
{
��  !
r
��$ %
,
��% &
	prospecto
��$ -
,
��- .
	preferido
��$ -
,
��- .
intermediario
��$ 1
,
��1 2
pfuente
��$ +
,
��+ ,

psubfuente
��$ .
,
��. /
plineanegocio
��$ 1
,
��1 2 
pmotivounodescarte
��$ 6
,
��6 7 
pmotivodosdescarte
��$ 6
,
��6 7
}
��  !
)
��( )
.
��) *
AsNoTracking
��* 6
(
��6 7
)
��7 8
.
��8 9
Select
��9 ?
(
��? @
x
��@ A
=>
��B D
new
��E H+
RecordatorioLlamadaCalendario
��I f
{
��( )#
IdRecordatorioLlamada
��, A
=
��B C
x
��D E
.
��E F
r
��F G
.
��G H#
IdRecordatorioLlamada
��H ]
,
��] ^
IdProspecto
��, 7
=
��8 9
x
��: ;
.
��; <
	prospecto
��< E
.
��E F
IdProspecto
��F Q
,
��Q R
Nombres
��, 3
=
��4 5
string
��6 <
.
��< =
Format
��= C
(
��C D
$str
��D Q
,
��Q R
x
��S T
.
��T U
	prospecto
��U ^
.
��^ _
Nombres
��_ f
,
��f g
x
��h i
.
��i j
	prospecto
��j s
.
��s t
ApellidoPaterno��t �
,��� �
x��� �
.��� �
	prospecto��� �
.��� �
ApellidoMaterno��� �
)��� �
,��� �
TelefonoFijo
��, 8
=
��9 :
x
��; <
.
��< =
	prospecto
��= F
.
��F G
TelefonoFijo
��G S
,
��S T
TelefonoCelular
��, ;
=
��< =
x
��> ?
.
��? @
	prospecto
��@ I
.
��I J
TelefonoCelular
��J Y
,
��Y Z
Fuente
��, 2
=
��3 4
string
��5 ;
.
��; <
Format
��< B
(
��B C
$str
��C K
,
��K L
x
��L M
.
��M N
pfuente
��N U
.
��U V
ValorCadena
��V a
,
��a b
string
��b h
.
��h i
IsNullOrEmpty
��i v
(
��v w
x
��w x
.
��x y

psubfuente��y �
.��� �
ValorCadena��� �
)��� �
?��� �
$str��� �
:��� �
$str��� �
+��� �
x��� �
.��� �

psubfuente��� �
.��� �
ValorCadena��� �
)��� �
,��� �
Referenciador
��, 9
=
��: ;
string
��< B
.
��B C
IsNullOrEmpty
��C P
(
��P Q
x
��Q R
.
��R S
	prospecto
��S \
.
��\ ]
Referenciador
��] j
)
��j k
?
��< =
string
��? E
.
��E F
Format
��F L
(
��L M
$str
��M Z
,
��Z [
x
��\ ]
.
��] ^
	preferido
��^ g
.
��g h
Nombres
��h o
,
��o p
x
��p q
.
��q r
	preferido
��r {
.
��{ |
ApellidoPaterno��| �
,��� �
x��� �
.��� �
	preferido��� �
.��� �
ApellidoMaterno��� �
)��� �
:��� �
x��� �
.��� �
	prospecto��� �
.��� �
Referenciador��� �
,��� �

HoraInicio
��, 6
=
��7 8
x
��9 :
.
��: ;
r
��; <
.
��< =

HoraInicio
��= G
.
��G H
Value
��H M
.
��M N
ToString
��N V
(
��V W
$str
��W `
)
��` a
,
��a b
HoraFin
��, 3
=
��4 5
x
��6 7
.
��7 8
r
��8 9
.
��9 :
HoraFin
��: A
.
��A B
Value
��B G
.
��G H
ToString
��H P
(
��P Q
$str
��Q Z
)
��Z [
,
��[ \
Fecha
��, 1
=
��2 3
x
��4 5
.
��5 6
r
��6 7
.
��7 8
FechaRecordatorio
��8 I
.
��I J
Date
��J N
,
��N O
Descripcion
��, 7
=
��8 9
x
��: ;
.
��; <
r
��< =
.
��= >
Descripcion
��> I
,
��I J
Producto
��, 4
=
��5 6
x
��7 8
.
��8 9
plineanegocio
��9 F
.
��F G
ValorCadena
��G R
,
��R S

Descartado
��, 6
=
��7 8
x
��9 :
.
��: ;
	prospecto
��; D
.
��D E
FlagDescarte
��E Q
.
��Q R
Value
��R W
,
��W X!
TextoMotivoDescarte
��, ?
=
��@ A
string
��B H
.
��H I
IsNullOrEmpty
��I V
(
��V W
x
��W X
.
��X Y 
pmotivodosdescarte
��Y k
.
��k l
ValorCadena
��l w
)
��w x
?
��y z
x
��{ |
.
��| }!
pmotivounodescarte��} �
.��� �
ValorCadena��� �
:
��J K
string
��L R
.
��R S
Format
��S Y
(
��Y Z
$str
��Z c
,
��c d
x
��e f
.
��f g 
pmotivounodescarte
��g y
.
��y z
ValorCadena��z �
,��� �
x��� �
.��� �"
pmotivodosdescarte��� �
.��� �
ValorCadena��� �
)��� �
,��� �
FechaDescarte
��, 9
=
��: ;
x
��< =
.
��= >
	prospecto
��> G
.
��G H%
FechaMotivoTresDescarte
��H _
.
��_ `
Value
��` e
,
��e f
Activo
��, 2
=
��3 4
x
��5 6
.
��6 7
r
��7 8
.
��8 9

FlagActivo
��9 C
.
��C D
Value
��D I
}
��( )
)
��) *
;
��* +
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� 
ReunionCalendario
�� +
>
��+ ,&
ObtenerReunionCalendario
��- E
(
��E F
int
��F I!
codigoIntermediario
��J ]
,
��] ^
DateTime
��_ g
fechaInicio
��h s
,
��s t
DateTime
��u }
fechaFin��~ �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
(
��  !
from
��! %
r
��& '
in
��( *
_context
��+ 3
.
��3 4
Reunions
��4 <
join
��  $
intermediario
��% 2
in
��3 5
_context
��6 >
.
��> ?'
ConsolidadoIntermediarios
��? X
on
��Y [
r
��\ ]
.
��] ^(
IdConsolidadoIntermediario
��^ x
equals
��y 
intermediario��� �
.��� �*
IdConsolidadoIntermediario��� �
join
��  $
tiporeunion
��% 0
in
��1 3
_context
��4 <
.
��< =
TablaTablas
��= H
on
��I K
new
��L O
{
��P Q
r
��R S
.
��S T
CodigoTipoReunion
��T e
,
��e f 
idtablatiporeunion
��g y
=
��z {

TablaTabla��| �
.��� �
TipoReunion��� �
}��� �
equals
��D J
new
��K N
{
��O P
CodigoTipoReunion
��Q b
=
��c d
(
��e f
short
��f k
?
��k l
)
��l m
tiporeunion
��m x
.
��x y
CodigoCampo��y �
,��� �"
idtablatiporeunion��� �
=��� �
tiporeunion��� �
.��� �
IdTabla��� �
}��� �
into��� �"
ReunionTipoReunion��� �
from
��  $
rtiporeunion
��% 1
in
��2 4 
ReunionTipoReunion
��5 G
.
��G H
DefaultIfEmpty
��H V
(
��V W
)
��W X
join
��  $
distrito
��% -
in
��. 0
_context
��1 9
.
��9 :
	Distritos
��: C
on
��D F
new
��G J
{
��K L
r
��M N
.
��N O 
CodigoDepartamento
��O a
,
��a b
r
��c d
.
��d e
CodigoProvincia
��e t
,
��t u
r
��v w
.
��w x
CodigoDistrito��x �
}��� �
equals
��A G
new
��H K
{
��L M 
CodigoDepartamento
��N `
=
��a b
(
��c d
short
��d i
?
��i j
)
��j k
distrito
��k s
.
��s t
Departamento_Id��t �
,��� �
CodigoProvincia��� �
=��� �
(��� �
short��� �
?��� �
)��� �
distrito��� �
.��� �
Provincia_Id��� �
,��� �
CodigoDistrito��� �
=��� �
(��� �
short��� �
?��� �
)��� �
distrito��� �
.��� �
Distrito_Id��� �
}��� �
into��� �
ReunionDistrito��� �
from
��  $
	rdistrito
��% .
in
��/ 1
ReunionDistrito
��2 A
.
��A B
DefaultIfEmpty
��B P
(
��P Q
)
��Q R
join
��  $
	provincia
��% .
in
��/ 1
_context
��2 :
.
��: ;

Provincias
��; E
on
��F H
new
��I L
{
��M N
r
��O P
.
��P Q
CodigoProvincia
��Q `
,
��` a
r
��b c
.
��c d 
CodigoDepartamento
��d v
}
��w x
equals
��F L
new
��M P
{
��Q R
CodigoProvincia
��S b
=
��c d
(
��e f
short
��f k
?
��k l
)
��l m
	provincia
��m v
.
��v w
Provincia_Id��w �
,��� �"
CodigoDepartamento��� �
=��� �
(��� �
short��� �
?��� �
)��� �
	provincia��� �
.��� �
Departamento_Id��� �
}��� �
into��� � 
ReunionProvincia��� �
from
��  $

rprovincia
��% /
in
��0 2
ReunionProvincia
��3 C
.
��C D
DefaultIfEmpty
��D R
(
��R S
)
��S T
join
��  $
departamento
��% 1
in
��2 4
_context
��5 =
.
��= >
Departamentos
��> K
on
��L N
r
��O P
.
��P Q 
CodigoDepartamento
��Q c
equals
��d j
departamento
��k w
.
��w x
Departamento_Id��x �
into��� �#
ReunionDepartamento��� �
from
��  $
rdepartamento
��% 2
in
��3 5!
ReunionDepartamento
��6 I
.
��I J
DefaultIfEmpty
��J X
(
��X Y
)
��Y Z
where
��  %
intermediario
��& 3
.
��3 4!
CodigoIntermediario
��4 G
==
��H J!
codigoIntermediario
��K ^
&&
��_ a
(
��& '
r
��' (
.
��( )
FechaReunion
��) 5
>=
��6 8
fechaInicio
��9 D
&&
��E G
r
��H I
.
��I J
FechaReunion
��J V
<=
��W Y
fechaFin
��Z b
)
��b c
select
��  &
new
��' *
{
��  !
r
��$ %
,
��% &
intermediario
��$ 1
,
��1 2
rtiporeunion
��$ 0
,
��0 1
rdepartamento
��$ 1
,
��1 2

rprovincia
��$ .
,
��. /
	rdistrito
��$ -
}
��  !
)
��( )
.
��) *
AsNoTracking
��* 6
(
��6 7
)
��7 8
.
��8 9
Select
��9 ?
(
��? @
x
��@ A
=>
��B D
new
��E H
ReunionCalendario
��I Z
{
��( )
	IdReunion
��, 5
=
��6 7
x
��8 9
.
��9 :
r
��: ;
.
��; <
	IdReunion
��< E
,
��E F
TipoReunion
��, 7
=
��8 9
x
��: ;
.
��; <
rtiporeunion
��< H
.
��H I
ValorCadena
��I T
,
��T U
FechaReunion
��, 8
=
��9 :
x
��; <
.
��< =
r
��= >
.
��> ?
FechaReunion
��? K
,
��K L
	Ubicacion
��, 5
=
��6 7
x
��8 9
.
��9 :
r
��: ;
.
��; <
	Ubicacion
��< E
,
��E F
Departamento
��, 8
=
��9 :
x
��; <
.
��< =
rdepartamento
��= J
.
��J K
Nombre
��K Q
,
��Q R
	Provincia
��, 5
=
��6 7
x
��8 9
.
��9 :

rprovincia
��: D
.
��D E
Nombre
��E K
,
��K L
Distrito
��, 4
=
��5 6
x
��7 8
.
��8 9
	rdistrito
��9 B
.
��B C
Nombre
��C I
,
��I J!
CorreoElectronicoGA
��, ?
=
��@ A
x
��B C
.
��C D
r
��D E
.
��E F
FlagInvitadoGA
��F T
.
��T U
Value
��U Z
?
��[ \
x
��] ^
.
��^ _
intermediario
��_ l
.
��l m"
CorreoElectronicoGA��m �
:��� �
$str��� �
,��� �!
CorreoElectronicoGU
��, ?
=
��@ A
x
��B C
.
��C D
r
��D E
.
��E F
FlagInvitadoGU
��F T
.
��T U
Value
��U Z
?
��[ \
x
��] ^
.
��^ _
intermediario
��_ l
.
��l m"
CorreoElectronicoGU��m �
:��� �
$str��� �
,��� �
Fecha
��, 1
=
��2 3
x
��4 5
.
��5 6
r
��6 7
.
��7 8
FechaReunion
��8 D
,
��D E

HoraInicio
��, 6
=
��7 8
x
��9 :
.
��: ;
r
��; <
.
��< =

HoraInicio
��= G
.
��G H
ToString
��H P
(
��P Q
$str
��Q Z
)
��Z [
,
��[ \
HoraFin
��, 3
=
��4 5
x
��6 7
.
��7 8
r
��8 9
.
��9 :
HoraFin
��: A
.
��A B
ToString
��B J
(
��J K
$str
��K T
)
��T U
,
��U V
Descripcion
��, 7
=
��8 9
x
��: ;
.
��; <
r
��< =
.
��= >
Descripcion
��> I
,
��I J 
AlertaMinutosAntes
��, >
=
��? @
(
��A B
int
��B E
)
��E F
x
��F G
.
��G H
r
��H I
.
��I J 
AlertaMinutosAntes
��J \
,
��\ ]
FlagUrlTeams
��, 8
=
��9 :
x
��; <
.
��< =
r
��= >
.
��> ?
FlagUrlTeams
��? K
.
��K L
Value
��L Q
,
��Q R
EtiquetaColor
��, 9
=
��: ;
$str
��< C
}
��( )
)
��) *
;
��* +
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� 
ProspectoReporte
�� *
>
��* +$
ObtenerProspectoPorMes
��, B
(
��B C
List
��C G
<
��G H
int
��H K
>
��K L%
listCodigoIntermediario
��M d
,
��d e
DateTime
��e m
fechaInicio
��n y
,
��y z
DateTime��z �
fechaFin��� �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
	prospecto
�� (
in
��) +
_context
��, 4
.
��4 5

Prospectos
��5 ?
join
��' +
intermediario
��, 9
in
��: <
_context
��= E
.
��E F'
ConsolidadoIntermediarios
��F _
on
��` b
	prospecto
��c l
.
��l m)
IdConsolidadoIntermediario��m �
equals��� �
intermediario��� �
.��� �*
IdConsolidadoIntermediario��� �
join
��' +
fuente
��, 2
in
��3 5
_context
��6 >
.
��> ?
ListaTablas
��? J
on
��K M
new
��N Q
{
��R S
	prospecto
��T ]
.
��] ^
CodigoFuente
��^ j
,
��j k
idtablafuente
��l y
=
��z {

TablaTabla��| �
.��� �
FuenteProspecto��� �
}��� �
equals
��K Q
new
��R U
{
��V W
CodigoFuente
��X d
=
��e f
(
��g h
short
��h m
?
��m n
)
��n o
fuente
��o u
.
��u v
CodigoCampo��v �
,��� �
idtablafuente��� �
=��� �
fuente��� �
.��� �
IdTabla��� �
}��� �
where
��' ,%
listCodigoIntermediario
��- D
.
��D E
Contains
��E M
(
��M N
intermediario
��N [
.
��[ \!
CodigoIntermediario
��\ o
)
��o p
&&
��q s
	prospecto
��' 0
.
��0 1
CodigoFuente
��1 =
!=
��> @
Fuente
��A G
.
��G H
CentroInfluencia
��H X
&&
��Y [
(
��' (
	prospecto
��( 1
.
��1 2$
AuditoriaFechaCreacion
��2 H
.
��H I
Value
��I N
.
��N O
Date
��O S
>=
��T V
fechaInicio
��W b
.
��b c
Date
��c g
&&
��h j
	prospecto
��k t
.
��t u%
AuditoriaFechaCreacion��u �
.��� �
Value��� �
.��� �
Date��� �
<=��� �
fechaFin��� �
.��� �
Date��� �
)��� �
select
��' -
new
��. 1
{
��' (
	prospecto
��+ 4
,
��4 5
fuente
��+ 1
}
��' (
)
��$ %
.
��% &
AsNoTracking
��& 2
(
��2 3
)
��3 4
.
��4 5
GroupBy
��5 <
(
��< =
x
��= >
=>
��? A
new
��B E
{
��F G
x
��H I
.
��I J
	prospecto
��J S
.
��S T$
AuditoriaFechaCreacion
��T j
.
��j k
Value
��k p
.
��p q
Date
��q u
,
��u v
x
��w x
.
��x y
fuente
��y 
.�� �
ValorCadena��� �
,��� �
x��� �
.��� �
	prospecto��� �
.��� �
IdProspecto��� �
}��� �
)��� �
.
��% &
Select
��& ,
(
��, -
y
��- .
=>
��/ 1
new
��2 5
ProspectoReporte
��6 F
(
��F G
)
��G H
{
��% &
	Categoria
��) 2
=
��3 4
$str
��5 B
,
��B C
Subcategoria
��) 5
=
��6 7
y
��8 9
.
��9 :
Key
��: =
.
��= >
ValorCadena
��> I
==
��J L
$str
��M T
||
��U W
y
��X Y
.
��Y Z
Key
��Z ]
.
��] ^
ValorCadena
��^ i
==
��j l
$str
��m v
?
��w x
$str��y �
:��� �
y
��5 6
.
��6 7
Key
��7 :
.
��: ;
ValorCadena
��; F
==
��G I
$str
��J T
||
��U W
y
��X Y
.
��Y Z
Key
��Z ]
.
��] ^
ValorCadena
��^ i
==
��j l
$str
��m r
?
��s t
$str��u �
:��� �
y
��5 6
.
��6 7
Key
��7 :
.
��: ;
ValorCadena
��; F
==
��G I
$str
��J T
||
��U W
y
��X Y
.
��Y Z
Key
��Z ]
.
��] ^
ValorCadena
��^ i
==
��j l
$str��m �
?��� �
$str��� �
:��� �
$str��� �
,��� �
CantidadProspecto
��) :
=
��; <
y
��= >
.
��> ?
Count
��? D
(
��D E
)
��E F
,
��F G
Fecha
��) .
=
��/ 0
y
��1 2
.
��2 3
Key
��3 6
.
��6 7
Date
��7 ;
,
��; <
IdProspecto
��) 4
=
��5 6
y
��7 8
.
��8 9
Key
��9 <
.
��< =
IdProspecto
��= H
}
��% &
)
��& '
;
��' (
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� 
ProspectoReporte
�� *
>
��* +'
ObtenerProspectoAdnPorMes
��, E
(
��E F
List
��F J
<
��J K
int
��K N
>
��N O%
listCodigoIntermediario
��P g
,
��g h
DateTime
��i q
fechaInicio
��r }
,
��} ~
DateTime�� �
fechaFin��� �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
	prospecto
�� (
in
��) +
_context
��, 4
.
��4 5

Prospectos
��5 ?
join
��, 0
intermediario
��1 >
in
��? A
_context
��B J
.
��J K'
ConsolidadoIntermediarios
��K d
on
��e g
	prospecto
��h q
.
��q r)
IdConsolidadoIntermediario��r �
equals��� �
intermediario��� �
.��� �*
IdConsolidadoIntermediario��� �
join
��, 0
adn
��1 4
in
��5 7
_context
��8 @
.
��@ A
	AdnRentas
��A J
on
��K M
	prospecto
��N W
.
��W X
IdProspecto
��X c
equals
��d j
adn
��k n
.
��n o
IdProspecto
��o z
where
��, 1%
listCodigoIntermediario
��2 I
.
��I J
Contains
��J R
(
��R S
intermediario
��S `
.
��` a!
CodigoIntermediario
��a t
)
��t u
&&
��v x
	prospecto
��, 5
.
��5 6
CodigoFuente
��6 B
!=
��C E
Fuente
��F L
.
��L M
CentroInfluencia
��M ]
&&
��^ `
(
��, -
adn
��- 0
.
��0 1
PorcentajeAvance
��1 A
>
��B C
$num
��D F
)
��F G
&&
��H J
(
��, -
	prospecto
��- 6
.
��6 7$
AuditoriaFechaCreacion
��7 M
.
��M N
Value
��N S
.
��S T
Date
��T X
>=
��Y [
fechaInicio
��\ g
.
��g h
Date
��h l
&&
��m o
	prospecto
��p y
.
��y z%
AuditoriaFechaCreacion��z �
.��� �
Value��� �
.��� �
Date��� �
<=��� �
fechaFin��� �
.��� �
Date��� �
)��� �
select
��, 2
new
��3 6
{
��, -
	prospecto
��0 9
}
��, -
)
��, -
.
��- .
AsNoTracking
��. :
(
��: ;
)
��; <
.
��< =
GroupBy
��= D
(
��D E
x
��E F
=>
��G I
new
��J M
{
��N O
x
��P Q
.
��Q R
	prospecto
��R [
.
��[ \$
AuditoriaFechaCreacion
��\ r
.
��r s
Value
��s x
.
��x y
Date
��y }
}
��~ 
)�� �
.
��$ %
Select
��% +
(
��+ ,
y
��, -
=>
��. 0
new
��1 4
ProspectoReporte
��5 E
(
��E F
)
��F G
{
��$ %
Subcategoria
��( 4
=
��5 6
$str
��7 H
,
��H I
CantidadProspecto
��( 9
=
��: ;
y
��< =
.
��= >
Count
��> C
(
��C D
)
��D E
,
��E F
Fecha
��( -
=
��. /
y
��0 1
.
��1 2
Key
��2 5
.
��5 6
Date
��6 :
}
��$ %
)
��% &
;
��& '
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� 
CitaReporte
�� %
>
��% & 
ObtenerCitasPorMes
��' 9
(
��9 :
List
��: >
<
��> ?
int
��? B
>
��B C%
listCodigoIntermediario
��D [
,
��[ \
DateTime
��] e
fechaInicio
��f q
,
��q r
DateTime
��s {
fechaFin��| �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
cita
�� #
in
��$ &
_context
��' /
.
��/ 0
Citas
��0 5
join
�� 
	actividad
�� (
in
��) +
_context
��, 4
.
��4 5

Actividads
��5 ?
on
��@ B
new
��C F
{
��G H
cita
��I M
.
��M N
NumeroEntrevista
��N ^
,
��^ _
lnegocio
��` h
=
��i j
LineaNegocio
��k w
.
��w x
Renta
��x }
}
��~ 
equals
��7 =
new
��> A
{
��B C
NumeroEntrevista
��D T
=
��U V
	actividad
��W `
.
��` a

NumeroCita
��a k
,
��k l
lnegocio
��m u
=
��v w
	actividad��x �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �
CitaActividad��� �
from
�� 

cactividad
�� )
in
��* ,
CitaActividad
��- :
.
��: ;
DefaultIfEmpty
��; I
(
��I J
)
��J K
join
�� 
etapa
�� $
in
��% '
_context
��( 0
.
��0 1
TablaTablas
��1 <
on
��= ?
new
��@ C
{
��D E

cactividad
��F P
.
��P Q
CodigoEtapa
��Q \
,
��\ ]
idtablaetapa
��^ j
=
��k l

TablaTabla
��m w
.
��w x
EtapaActivad��x �
}��� �
equals
��5 ;
new
��< ?
{
��@ A
CodigoEtapa
��B M
=
��N O
etapa
��P U
.
��U V
CodigoCampo
��V a
,
��a b
idtablaetapa
��c o
=
��p q
etapa
��r w
.
��w x
IdTabla
��x 
}��� �
into��� �
ActividadEtapa��� �
from
�� 
actividadetapa
�� -
in
��. 0
ActividadEtapa
��1 ?
.
��? @
DefaultIfEmpty
��@ N
(
��N O
)
��O P
where
�� %
listCodigoIntermediario
��  7
.
��7 8
Contains
��8 @
(
��@ A
cita
��A E
.
��E F)
CodigoIntermediarioCreacion
��F a
)
��a b
&&
��c e
(
�� 
cita
�� 
.
��  
	FechaCita
��  )
.
��) *
Value
��* /
.
��/ 0
Date
��0 4
>=
��5 7
fechaInicio
��8 C
.
��C D
Date
��D H
&&
��I K
cita
��L P
.
��P Q
	FechaCita
��Q Z
.
��Z [
Value
��[ `
.
��` a
Date
��a e
<=
��f h
fechaFin
��i q
.
��q r
Date
��r v
)
��v w
select
��  
new
��! $
{
�� 
cita
��' +
,
��+ ,
actividadetapa
��' 5
}
��# $
)
��$ %
.
��% &
AsNoTracking
��& 2
(
��2 3
)
��3 4
.
��4 5
GroupBy
��5 <
(
��< =
x
��= >
=>
��? A
new
��B E
{
��F G
x
��' (
.
��( )
cita
��) -
.
��- .
	FechaCita
��. 7
.
��7 8
Value
��8 =
.
��= >
Date
��> B
,
��B C
x
��' (
.
��( )
actividadetapa
��) 7
.
��7 8
ValorCadena
��8 C
,
��C D
x
��' (
.
��( )
cita
��) -
.
��- .
FlagCalificacion
��. >
,
��> ?
x
��' (
.
��( )
cita
��) -
.
��- .$
CodigoTipoCalificacion
��. D
,
��D E
x
��' (
.
��( )
cita
��) -
.
��- .$
CodigoMotivoReagendado
��. D
}
��# $
)
��$ %
.
��$ %
Select
��% +
(
��+ ,
y
��, -
=>
��. 0
new
��1 4
CitaReporte
��5 @
(
��@ A
)
��A B
{
��$ %
CantidadCita
��( 4
=
��5 6
y
��7 8
.
��8 9
Count
��9 >
(
��> ?
)
��? @
,
��@ A
Subcategoria
��( 4
=
��5 6
string
��7 =
.
��= >
IsNullOrEmpty
��> K
(
��K L
y
��L M
.
��M N
Key
��N Q
.
��Q R
ValorCadena
��R ]
)
��] ^
?
��_ `
$str
��a r
:
��s t
y
��u v
.
��v w
Key
��w z
.
��z {
ValorCadena��{ �
,��� �
Calificacion
��( 4
=
��5 6
y
��7 8
.
��8 9
Key
��9 <
.
��< =
FlagCalificacion
��= M
.
��M N
Value
��N S
,
��S T$
CodigoTipoCalificacion
��( >
=
��? @
y
��A B
.
��B C
Key
��C F
.
��F G$
CodigoTipoCalificacion
��G ]
.
��] ^
Value
��^ c
,
��c d$
CodigoMotivoReagendado
��( >
=
��? @
y
��A B
.
��B C
Key
��C F
.
��F G$
CodigoMotivoReagendado
��G ]
.
��] ^
Value
��^ c
,
��c d
Fecha
��( -
=
��. /
y
��0 1
.
��1 2
Key
��2 5
.
��5 6
Date
��6 :
}
��$ %
)
��% &
;
��& '
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
List
�� 
<
�� 
ActividadReporte
�� $
>
��$ %"
AgruparProspectoCita
��& :
(
��: ;
List
��; ?
<
��? @
ProspectoReporte
��@ P
>
��P Q 
prospectoPorSemana
��R d
,
��d e
List
��e i
<
��i j
ProspectoReporte
��j z
>
��z {
prospectoPorMes��| �
)��� �
{
�� 	
var
�� 
result
�� 
=
��  
prospectoPorSemana
�� +
.
��+ ,
GroupBy
��, 3
(
��3 4
x
��4 5
=>
��6 8
new
��9 <
{
��= >
x
��? @
.
��@ A
	Categoria
��A J
,
��J K
x
��L M
.
��M N
Subcategoria
��N Z
}
��[ \
)
��\ ]
.
��] ^
Select
��" (
(
��( )
y
��) *
=>
��+ -
new
��. 1
ActividadReporte
��2 B
(
��B C
)
��C D
{
��" #
Category
��& .
=
��/ 0
y
��1 2
.
��2 3
Key
��3 6
.
��6 7
	Categoria
��7 @
,
��@ A
Subcategoria
��& 2
=
��3 4
y
��5 6
.
��6 7
Key
��7 :
.
��: ;
Subcategoria
��; G
,
��G H
Lunes
��& +
=
��, -
y
��. /
.
��/ 0
Where
��0 5
(
��5 6
x
��6 7
=>
��8 :
(
��; <
byte
��< @
)
��@ A
x
��A B
.
��B C
Fecha
��C H
.
��H I
	DayOfWeek
��I R
==
��S U
$num
��V W
)
��W X
.
��X Y
Sum
��Y \
(
��\ ]
x
��] ^
=>
��_ a
x
��b c
.
��c d
CantidadProspecto
��d u
)
��u v
,
��v w
Martes
��& ,
=
��- .
y
��/ 0
.
��0 1
Where
��1 6
(
��6 7
x
��7 8
=>
��9 ;
(
��< =
byte
��= A
)
��A B
x
��B C
.
��C D
Fecha
��D I
.
��I J
	DayOfWeek
��J S
==
��T V
$num
��W X
)
��X Y
.
��Y Z
Sum
��Z ]
(
��] ^
x
��^ _
=>
��` b
x
��c d
.
��d e
CantidadProspecto
��e v
)
��v w
,
��w x
	Miercoles
��& /
=
��0 1
y
��2 3
.
��3 4
Where
��4 9
(
��9 :
x
��: ;
=>
��< >
(
��? @
byte
��@ D
)
��D E
x
��E F
.
��F G
Fecha
��G L
.
��L M
	DayOfWeek
��M V
==
��W Y
$num
��Z [
)
��[ \
.
��\ ]
Sum
��] `
(
��` a
x
��a b
=>
��c e
x
��f g
.
��g h
CantidadProspecto
��h y
)
��y z
,
��z {
Jueves
��& ,
=
��- .
y
��/ 0
.
��0 1
Where
��1 6
(
��6 7
x
��7 8
=>
��9 ;
(
��< =
byte
��= A
)
��A B
x
��B C
.
��C D
Fecha
��D I
.
��I J
	DayOfWeek
��J S
==
��T V
$num
��W X
)
��X Y
.
��Y Z
Sum
��Z ]
(
��] ^
x
��^ _
=>
��` b
x
��c d
.
��d e
CantidadProspecto
��e v
)
��v w
,
��w x
Viernes
��& -
=
��. /
y
��0 1
.
��1 2
Where
��2 7
(
��7 8
x
��8 9
=>
��: <
(
��= >
byte
��> B
)
��B C
x
��C D
.
��D E
Fecha
��E J
.
��J K
	DayOfWeek
��K T
==
��U W
$num
��X Y
)
��Y Z
.
��Z [
Sum
��[ ^
(
��^ _
x
��_ `
=>
��a c
x
��d e
.
��e f
CantidadProspecto
��f w
)
��w x
,
��x y
Sabado
��& ,
=
��- .
y
��/ 0
.
��0 1
Where
��1 6
(
��6 7
x
��7 8
=>
��9 ;
(
��< =
byte
��= A
)
��A B
x
��B C
.
��C D
Fecha
��D I
.
��I J
	DayOfWeek
��J S
==
��T V
$num
��W X
)
��X Y
.
��Y Z
Sum
��Z ]
(
��] ^
x
��^ _
=>
��` b
x
��c d
.
��d e
CantidadProspecto
��e v
)
��v w
,
��w x
Domingo
��& -
=
��. /
y
��0 1
.
��1 2
Where
��2 7
(
��7 8
x
��8 9
=>
��: <
(
��= >
byte
��> B
)
��B C
x
��C D
.
��D E
Fecha
��E J
.
��J K
	DayOfWeek
��K T
==
��U W
$num
��X Y
)
��Y Z
.
��Z [
Sum
��[ ^
(
��^ _
x
��_ `
=>
��a c
x
��d e
.
��e f
CantidadProspecto
��f w
)
��w x
,
��x y
TotalSemana
��& 1
=
��2 3
y
��4 5
.
��5 6
Sum
��6 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
CantidadProspecto
��A R
)
��R S
,
��S T
TotalMes
��& .
=
��/ 0
prospectoPorMes
��1 @
.
��@ A
Where
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Subcategoria
��N Z
==
��[ ]
y
��^ _
.
��_ `
Key
��` c
.
��c d
Subcategoria
��d p
)
��p q
.
��q r
Sum
��r u
(
��u v
x
��v w
=>
��x z
x
��{ |
.
��| } 
CantidadProspecto��} �
)��� �
}
��" #
)
��# $
.
��$ %
ToList
��% +
(
��+ ,
)
��, -
;
��- .
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� ǌ
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
Año		 
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
�� 
DateTime
�� 
Fecha
�� 
{
�� 
get
��  #
;
��# $
set
��% (
;
��( )
}
��* +
public
�� 
string
�� 
NombreEtapa
�� !
{
��" #
get
��$ '
;
��' (
set
��) ,
;
��, -
}
��. /
public
�� 
int
�� 
CantidadCita
�� 
{
��  !
get
��" %
;
��% &
set
��' *
;
��* +
}
��, -
public
�� 
int
��  
CantidadEntrevista
�� %
{
��& '
get
��( +
;
��+ ,
set
��- 0
;
��0 1
}
��2 3
}
�� 
public
�� 

class
�� 
Intermediario
�� 
{
�� 
public
�� 
int
�� !
CodigoIntermediario
�� &
{
��' (
get
��) ,
;
��, -
set
��. 1
;
��1 2
}
��3 4
public
�� 
string
�� 
Nombres
�� 
{
�� 
get
��  #
;
��# $
set
��% (
;
��( )
}
��* +
}
�� 
}�� �
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
codigointermediarios	n �
)
� �
;
� �
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
} �#
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
})) �f
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
.	 �)
CodigoIntermediarioCreacion
� �
==
� �!
codigoIntermediario
� �
)
� �
)
� �
;
� �
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
NumeroEntrevista	&&~ �
+
&&� �
$num
&&� �
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
CodigoRespuestaServicio	22i �
.
22� �
Exito
22� �
,
22� �
$str
22� �
)
22� �
:33/ 0
configurationHelper331 D
.33D E*
ObtenerCodigoRespuestaServicio33E c
(33c d#
CodigoRespuestaServicio33d {
.33{ |
SinDatos	33| �
,
33� �
$str
33� �
)
33� �
;
33� �
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
responseService	55 �
.
55� �
mensajeRespuesta
55� �
}
55� �
;
55� �
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
string	>>~ �

horaInicio
>>� �
,
>>� �
string
>>� �
horaFin
>>� �
)
>>� �
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
)	FF �
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
horaFin	GG} �
)
GG� �
)
GG� �
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
HoraFin	HH} �
)
HH� �
)
HH� �
)
HH� �
.
HH� �
Any
HH� �
(
HH� �
)
HH� �
;
HH� �
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
equals	LLz �
ci
LL� �
.
LL� �(
IdConsolidadoIntermediario
LL� �
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
HoraFin	NN} �
)
NN� �
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
horaFin	OO~ �
)
OO� �
)
OO� �
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
HoraFin	PP~ �
)
PP� �
)
PP� �
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
CodigoRespuestaServicio	SS{ �
.
SS� �
Exito
SS� �
,
SS� �
$str
SS� �
)
SS� �
:TT/ 0
configurationHelperTT1 D
.TTD E*
ObtenerCodigoRespuestaServicioTTE c
(TTc d#
CodigoRespuestaServicioTTd {
.TT{ |
SinDatos	TT| �
,
TT� �
$str
TT� �
)
TT� �
;
TT� �
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
responseService	VV �
.
VV� �
mensajeRespuesta
VV� �
}
VV� �
;
VV� �
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
$str	WWc �
:
WW� �
$str
WW� �
}
WW� �
;
WW� �
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
}\\ �
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
status	 �
)
� �
;
� �
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
}$$ �
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
} �	
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
z �
,


� �
string


� �
horaFin


� �
)


� �
;


� �
} 
} �
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
}"" �
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
}		 �
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
}66 �
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
} �	
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
} ��
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
Exito	}}| �
,
}}� �
$str
}}� �
)
}}� �
:~~/ 0
configurationHelper~~1 D
.~~D E*
ObtenerCodigoRespuestaServicio~~E c
(~~c d#
CodigoRespuestaServicio~~d {
.~~{ |
SinDatos	~~| �
,
~~� �
$str
~~� �
)
~~� �
;
~~� �
response
�� 
.
�� 
auditResponse
�� &
=
��' (
new
��) ,
AuditResponse
��- :
{
��; <
codigoRespuesta
��= L
=
��M N
responseService
��O ^
.
��^ _
codigoRespuesta
��_ n
,
��n o
mensajeRespuesta��p �
=��� �
responseService��� �
.��� � 
mensajeRespuesta��� �
}��� �
;��� �
response
�� 
.
�� 
Entity
�� 
=
��  !
result
��" (
.
��( )
OrderByDescending
��) :
(
��: ;
x
��; <
=>
��= ?
x
��@ A
.
��A B
IdProspecto
��B M
)
��M N
.
��N O
OrderByDescending
��O `
(
��` a
x
��a b
=>
��c e
x
��f g
.
��g h
CodigoFuente
��h t
)
��t u
.
��u v
ToList
��v |
(
��| }
)
��} ~
;
��~ 
return
�� 	
response
��
 
;
�� 
}
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
ResponseModel
�� '
<
��' ((
ActualizarProspectoCommand
��( B
>
��B C
>
��C D3
%ObtenerProspectoDetallePorIdProspecto
��E j
(
��j k
string
��k q
idProspecto
��r }
)
��} ~
{
�� 	
ResponseModel
�� 
<
�� (
ActualizarProspectoCommand
�� 4
>
��4 5
response
��6 >
=
��? @
new
��A D
ResponseModel
��E R
<
��R S(
ActualizarProspectoCommand
��S m
>
��m n
(
��n o
)
��o p
;
��p q(
ActualizarProspectoCommand
�� &
result
��' -
;
��- .!
ConfigurationHelper
�� !
configurationHelper
��  3
=
��4 5
new
��6 9!
ConfigurationHelper
��: M
(
��M N
)
��N O
;
��O P
ResponseService
�� 
responseService
�� +
;
��+ ,
result
�� 	
=
��
 
await
�� *
ObtenerProspectoDetallePorId
�� .
(
��. /
int
��/ 2
.
��2 3
Parse
��3 8
(
��8 9
idProspecto
��9 D
)
��D E
)
��E F
.
��F G!
FirstOrDefaultAsync
��G Z
(
��Z [
)
��[ \
;
��\ ]
responseService
�� 
=
�� 
result
�� $
!=
��% '
null
��( ,
?
��- .!
configurationHelper
��/ B
.
��B C,
ObtenerCodigoRespuestaServicio
��C a
(
��a b%
CodigoRespuestaServicio
��b y
.
��y z
Exito
��z 
,�� �
$str��� �
)��� �
:
��/ 0!
configurationHelper
��1 D
.
��D E,
ObtenerCodigoRespuestaServicio
��E c
(
��c d%
CodigoRespuestaServicio
��d {
.
��{ |
SinDatos��| �
,��� �
$str��� �
)��� �
;��� �
response
�� 
.
�� 
auditResponse
�� "
=
��# $
new
��% (
AuditResponse
��) 6
{
��7 8
codigoRespuesta
��9 H
=
��I J
responseService
��K Z
.
��Z [
codigoRespuesta
��[ j
,
��j k
mensajeRespuesta
��l |
=
��} ~
responseService�� �
.��� � 
mensajeRespuesta��� �
}��� �
;��� �
response
�� 
.
�� 
Entity
�� 
=
�� 
result
�� $
;
��$ %
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ResponseModel
�� '
<
��' (
	Prospecto
��( 1
>
��1 2
>
��2 3)
ObtenerProspectoVistaPrevia
��4 O
(
��O P
int
��P S
idProspecto
��T _
)
��_ `
{
�� 	
ResponseModel
�� 
<
�� 
	Prospecto
�� #
>
��# $
response
��% -
=
��. /
new
��0 3
ResponseModel
��4 A
<
��A B
	Prospecto
��B K
>
��K L
(
��L M
)
��M N
;
��N O!
ConfigurationHelper
�� !
configurationHelper
��  3
=
��4 5
new
��6 9!
ConfigurationHelper
��: M
(
��M N
)
��N O
;
��O P
ResponseService
�� 
responseService
�� +
;
��+ ,
	Prospecto
�� 
result
�� 
;
�� 
result
�� 	
=
��
 
await
�� .
 ObtenerProspectoVistaPreviaPorId
�� 3
(
��3 4
idProspecto
��4 ?
)
��? @
.
��@ A!
FirstOrDefaultAsync
��A T
(
��T U
)
��U V
;
��V W
responseService
�� 
=
�� 
result
�� 
!=
�� 
null
�� #
?
��$ %!
configurationHelper
��& 9
.
��9 :,
ObtenerCodigoRespuestaServicio
��: X
(
��X Y%
CodigoRespuestaServicio
��Y p
.
��p q
Exito
��q v
,
��v w
$str
��x z
)
��z {
:
�� !
configurationHelper
�� !
.
��! ",
ObtenerCodigoRespuestaServicio
��" @
(
��@ A%
CodigoRespuestaServicio
��A X
.
��X Y
SinDatos
��Y a
,
��a b
$str
��c e
)
��e f
;
��f g
response
�� 
.
�� 
auditResponse
�� 
=
�� 
new
�� 
AuditResponse
��  -
{
��. /
codigoRespuesta
��0 ?
=
��@ A
responseService
��B Q
.
��Q R
codigoRespuesta
��R a
,
��a b
mensajeRespuesta
��c s
=
��t u
responseService��v �
.��� � 
mensajeRespuesta��� �
}��� �
;��� �
response
�� 
.
�� 
Entity
�� 
=
�� 
result
�� 
;
�� 
return
�� 	
response
�� 
;
�� 
}
�� 	
public
�� 

IQueryable
�� 
<
�� (
ActualizarProspectoCommand
�� 4
>
��4 5*
ObtenerProspectoDetallePorId
��6 R
(
��R S
int
��S V
idProspecto
��W b
)
��b c
{
�� 
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
p
�� 
in
�� 
_context
�� #
.
��# $

Prospectos
��$ .
join
�� 
a
�� 
in
�� 
_context
�� 
.
�� 
	AdnRentas
�� #
on
��$ &
p
��' (
.
��( )
IdProspecto
��) 4
equals
��5 ;
a
��< =
.
��= >
IdProspecto
��> I
into
��J N
ProspectoAdn
��O [
from
�� 
pa
�� 
in
�� 
ProspectoAdn
�� 
.
�� 
DefaultIfEmpty
�� -
(
��- .
)
��. /
join
�� 
f
�� 
in
�� 
_context
�� 
.
�� 
ListaTablas
�� %
on
��& (
p
��) *
.
��* +
CodigoFuente
��+ 7
equals
��8 >
f
��? @
.
��@ A
CodigoCampo
��A L
into
��M Q
ProspectoFuente
��R a
from
�� 
pf
�� 
in
�� 
ProspectoFuente
�� !
.
��! "
DefaultIfEmpty
��" 0
(
��0 1
)
��1 2
join
�� 
d
�� 
in
�� 
_context
�� 
.
�� !
DireccionProspectos
�� -
on
��. 0
p
��1 2
.
��2 3
IdProspecto
��3 >
equals
��? E
d
��F G
.
��G H
IdProspecto
��H S
into
��T X 
ProspectoDireccion
��Y k
from
�� 
pd
�� 
in
��  
ProspectoDireccion
�� $
.
��$ %
DefaultIfEmpty
��% 3
(
��3 4
)
��4 5
join
�� 
r
�� 
in
�� 
_context
�� 
.
�� 

Prospectos
�� $
on
��% '
p
��( )
.
��) *
IdReferenciador
��* 9
equals
��: @
r
��A B
.
��B C
IdProspecto
��C N
into
��O S$
ProspectoReferenciador
��T j
from
�� 
pr
�� 
in
�� $
ProspectoReferenciador
�� (
.
��( )
DefaultIfEmpty
��) 7
(
��7 8
)
��8 9
where
�� 
p
�� 
.
�� 
IdProspecto
�� 
==
�� 
idProspecto
�� )
select
�� 
new
�� 
{
�� 
p
�� 	
,
��	 

pa
�� 

,
��
 
pf
�� 

,
��
 
pd
�� 

,
��
 
pr
�� 

}
�� 
)
�� 	
.
��	 

AsNoTracking
��
 
(
�� 
)
�� 
.
�� 
Select
�� 
(
��  
x
��  !
=>
��" $
new
��% ((
ActualizarProspectoCommand
��) C
{
�� 
IdProspecto
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdProspecto
�� %
,
��% &!
CodigoTipoDocumento
�� 
=
�� 
x
�� 
.
��  
p
��  !
.
��! "!
CodigoTipoDocumento
��" 5
,
��5 6
NumeroDocumento
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
NumeroDocumento
�� -
,
��- .
Nombres
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Nombres
�� 
,
�� 
ApellidoPaterno
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoPaterno
�� -
,
��- .
ApellidoMaterno
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoMaterno
�� -
,
��- .
FechaNacimiento
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FechaNacimiento
�� -
,
��- .

CodigoSexo
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 

CodigoSexo
�� #
,
��# $
FlagHijo
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FlagHijo
�� 
,
��  
Empresa
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Empresa
�� 
,
�� 
CodigoCargo
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoCargo
�� %
,
��% &
	OtroCargo
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
	OtroCargo
�� !
,
��! "
Referenciador
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Referenciador
�� )
,
��) *
CodigoFuente
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoFuente
�� '
,
��' (
CodigoSubFuente
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoSubFuente
�� -
,
��- .$
ProspectoReferenciador
�� 
=
��  
x
��! "
.
��" #
p
��# $
.
��$ %
IdReferenciador
��% 4
.
��4 5
HasValue
��5 =
?
��> ?
string
��@ F
.
��F G
Format
��G M
(
��M N
$str
��N [
,
��[ \
x
��] ^
.
��^ _
pr
��_ a
.
��a b
Nombres
��b i
,
��i j
x
��k l
.
��l m
pr
��m o
.
��o p
ApellidoPaterno
��p 
,�� �
x��� �
.��� �
pr��� �
.��� �
ApellidoMaterno��� �
)��� �
:
�� 
$str
�� 
,
�� 
TelefonoFijo
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoFijo
�� '
,
��' (
TelefonoCelular
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoCelular
�� -
,
��- . 
CorreoElectronico1
�� 
=
�� 
x
�� 
.
�� 
p
��  
.
��  ! 
CorreoElectronico1
��! 3
,
��3 4
CodigoEtapa
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoEtapa
�� %
,
��% &
CodigoEstado
�� 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoEstado
�� '
,
��' ('
ProspectoDireccionCommand
�� !
=
��" #
new
��$ ''
ProspectoDireccionCommand
��( A
{
�� 	
IdDireccion
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 
IdDireccion
�� '
,
��' (
IdProspecto
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 
IdProspecto
�� '
,
��' (
	Direccion
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 
	Direccion
�� #
,
��# $
Departamento_Id
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
��  
Departamento_Id
��  /
,
��/ 0
Provincia_Id
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 
Provincia_Id
�� )
,
��) *
Distrito_Id
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 
Distrito_Id
�� '
,
��' (

FlagActivo
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 

FlagActivo
�� %
,
��% &
TipoDireccion
��	 
=
�� 
x
�� 
.
�� 
pd
�� 
.
�� 
TipoDireccion
�� +
}
�� 	
,
��	 
&
ProspectoAdnRentaCommand
��  
=
��! "
new
��# &&
ProspectoAdnRentaCommand
��' ?
{
�� 	!
MonedaPatrimonioAfp
��	 
=
�� 
x
��  
.
��  !
pa
��! #
.
��# $!
MonedaPatrimonioAfp
��$ 7
,
��7 8 
MontoPatrimonioAfp
��	 
=
�� 
x
�� 
.
��  
pa
��  "
.
��" # 
MontoPatrimonioAfp
��# 5
,
��5 6
PorcentajeAvance
��	 
=
�� 
x
�� 
.
�� 
pa
��  
.
��  !
PorcentajeAvance
��! 1
,
��1 2&
PorcentajeAvanceCompleto
��	 !
=
��" #
x
��$ %
.
��% &
pa
��& (
.
��( )&
PorcentajeAvanceCompleto
��) A
}
�� 	
}
�� 
)
�� 	
;
��	 

return
�� 	
result
��
 
;
�� 
}
�� 
public
�� 

IQueryable
��	 
<
�� 
	Prospecto
�� 
>
�� .
 ObtenerProspectoVistaPreviaPorId
�� ?
(
��? @
int
��@ C
idProspecto
��D O
)
��O P
{
�� 
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
p
�� 
in
�� 
_context
�� $
.
��$ %

Prospectos
��% /
join
�� 
intermediario
�� 
in
�� 
_context
�� &
.
��& ''
ConsolidadoIntermediarios
��' @
on
��A C
p
��D E
.
��E F(
IdConsolidadoIntermediario
��F `
equals
��a g
intermediario
��h u
.
��u v)
IdConsolidadoIntermediario��v �
join
�� 
adn
�� 
in
�� 
_context
�� 
.
�� 
	AdnRentas
�� &
on
��' )
p
��* +
.
��+ ,
IdProspecto
��, 7
equals
��8 >
adn
��? B
.
��B C
IdProspecto
��C N
into
��O S
ProspectoAdn
��T `
from
�� 
padn
�� 
in
�� 
ProspectoAdn
�� !
.
��! "
DefaultIfEmpty
��" 0
(
��0 1
)
��1 2
join
�� 
fuente
�� 
in
�� 
_context
�� 
.
��  
ListaTablas
��  +
on
��, .
new
��/ 2
{
��3 4
p
��5 6
.
��6 7
CodigoFuente
��7 C
,
��C D
idtablafuente
��E R
=
��S T

TablaTabla
��U _
.
��_ `
FuenteProspecto
��` o
,
��o p
lnegocio
��q y
=
��z {
LineaNegocio��| �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoFuente
�� *
=
��+ ,
(
��- .
short
��. 3
?
��3 4
)
��4 5
fuente
��5 ;
.
��; <
CodigoCampo
��< G
,
��G H
idtablafuente
��I V
=
��W X
fuente
��Y _
.
��_ `
IdTabla
��` g
,
��g h
lnegocio
��i q
=
��r s
fuente
��t z
.
��z {!
CodigoLineaNegocio��{ �
}��� �
into��� �
ProspectoFuente��� �
from
�� 
pfuente
�� 
in
�� 
ProspectoFuente
�� '
.
��' (
DefaultIfEmpty
��( 6
(
��6 7
)
��7 8
join
�� 
	subfuente
�� 
in
�� 
_context
�� "
.
��" #
ListaTablas
��# .
on
��/ 1
new
��2 5
{
��6 7
p
��8 9
.
��9 :
CodigoSubFuente
��: I
,
��I J
idtablaSubfuente
��K [
=
��\ ]

TablaTabla
��^ h
.
��h i
FuenteProspecto
��i x
,
��x y
lnegocio��z �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoSubFuente
�� -
=
��. /
(
��0 1
short
��1 6
?
��6 7
)
��7 8
	subfuente
��8 A
.
��A B
CodigoCampo
��B M
,
��M N
idtablaSubfuente
��O _
=
��` a
	subfuente
��b k
.
��k l
IdTabla
��l s
,
��s t
lnegocio
��u }
=
��~ 
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
�� 

psubfuente
�� 
in
��  
ProspectoSubFuente
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
referido
�� 
in
�� 
_context
�� !
.
��! "

Prospectos
��" ,
on
��- /
p
��0 1
.
��1 2
IdReferenciador
��2 A
equals
��B H
referido
��I Q
.
��Q R
IdProspecto
��R ]
into
��^ b
ProspectoReferido
��c t
from
�� 
	preferido
�� 
in
�� 
ProspectoReferido
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
cargo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� *
on
��+ -
new
��. 1
{
��2 3
p
��4 5
.
��5 6
CodigoCargo
��6 A
,
��A B
idtablacargo
��C O
=
��P Q

TablaTabla
��R \
.
��\ ]
PersonaCargo
��] i
}
��j k
equals
�� 
new
�� 
{
�� 
CodigoCargo
�� (
=
��) *
(
��+ ,
short
��, 1
?
��1 2
)
��2 3
cargo
��3 8
.
��8 9
CodigoCampo
��9 D
,
��D E
idtablacargo
��F R
=
��S T
cargo
��U Z
.
��Z [
IdTabla
��[ b
}
��c d
into
��e i
ProspectoCargo
��j x
from
�� 
pcargo
�� 
in
�� 
ProspectoCargo
�� %
.
��% &
DefaultIfEmpty
��& 4
(
��4 5
)
��5 6
join
�� 
sexo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� )
on
��* ,
new
��- 0
{
��1 2
p
��3 4
.
��4 5

CodigoSexo
��5 ?
,
��? @
idtablasexo
��A L
=
��M N

TablaTabla
��O Y
.
��Y Z
Sexo
��Z ^
}
��_ `
equals
�� 
new
�� 
{
�� 

CodigoSexo
�� &
=
��' (
(
��) *
short
��* /
?
��/ 0
)
��0 1
sexo
��1 5
.
��5 6
CodigoCampo
��6 A
,
��A B
idtablasexo
��C N
=
��O P
sexo
��Q U
.
��U V
IdTabla
��V ]
}
��^ _
into
��` d
ProspectoSexo
��e r
from
�� 
psexo
�� 
in
�� 
ProspectoSexo
�� #
.
��# $
DefaultIfEmpty
��$ 2
(
��2 3
)
��3 4
join
�� 
	direccion
�� 
in
�� 
_context
�� "
.
��" #!
DireccionProspectos
��# 6
on
��7 9
p
��: ;
.
��; <
IdProspecto
��< G
equals
��H N
	direccion
��O X
.
��X Y
IdProspecto
��Y d
into
��e i 
ProspectoDireccion
��j |
from
�� 

pdireccion
�� 
in
��  
ProspectoDireccion
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
distrito
�� 
in
�� 
_context
�� !
.
��! "
	Distritos
��" +
on
��, .
new
��/ 2
{
��3 4

pdireccion
��5 ?
.
��? @
Departamento_Id
��@ O
,
��O P

pdireccion
��Q [
.
��[ \
Provincia_Id
��\ h
,
��h i

pdireccion
��j t
.
��t u
Distrito_Id��u �
}��� �
equals
�� 
new
�� 
{
�� 
distrito
�� &
.
��& '
Departamento_Id
��' 6
,
��6 7
distrito
��8 @
.
��@ A
Provincia_Id
��A M
,
��M N
distrito
��O W
.
��W X
Distrito_Id
��X c
}
��d e
into
��f j
DireccionDistrito
��k |
from
�� 
	ddistrito
�� 
in
�� 
DireccionDistrito
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
	provincia
�� 
in
�� 
_context
�� "
.
��" #

Provincias
��# -
on
��. 0
new
��1 4
{
��5 6

pdireccion
��7 A
.
��A B
Provincia_Id
��B N
,
��N O

pdireccion
��P Z
.
��Z [
Departamento_Id
��[ j
}
��k l
equals
�� 
new
�� 
{
�� 
	provincia
�� &
.
��& '
Provincia_Id
��' 3
,
��3 4
	provincia
��5 >
.
��> ?
Departamento_Id
��? N
}
��O P
into
��Q U 
DireccionProvincia
��V h
from
�� 

dprovincia
�� 
in
��  
DireccionProvincia
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
departamento
�� 
in
�� 
_context
�� %
.
��% &
Departamentos
��& 3
on
��4 6

pdireccion
��7 A
.
��A B
Departamento_Id
��B Q
equals
��R X
departamento
��Y e
.
��e f
Departamento_Id
��f u
into
��v z$
DireccionDepartamento��{ �
from
�� 
ddepartamento
�� 
in
�� #
DireccionDepartamento
�� 3
.
��3 4
DefaultIfEmpty
��4 B
(
��B C
)
��C D
where
�� 
(
�� 
p
�� 
.
�� 
IdProspecto
�� 
==
�� 
idProspecto
��  +
)
��+ ,
select
�� 
new
�� 
{
�� 	
p
��	 

,
��
 
padn
��	 
,
�� 
pfuente
��	 
,
�� 

psubfuente
��	 
,
�� 
	preferido
��	 
,
�� 
psexo
��	 
,
�� 
pcargo
��	 
,
�� 

pdireccion
��	 
,
�� 
	ddistrito
��	 
,
�� 

dprovincia
��	 
,
�� 
ddepartamento
��	 
}
�� 	
)
��	 

.
��
 
AsNoTracking
�� 
(
�� 
)
�� 
.
�� 
Select
��  
(
��  !
x
��! "
=>
��# %
new
��& )
	Prospecto
��* 3
{
�� 	
IdProspecto
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdProspecto
�� &
,
��& '
NombresApellidos
��	 
=
�� 
string
�� "
.
��" #
Format
��# )
(
��) *
$str
��* 7
,
��7 8
x
��9 :
.
��: ;
p
��; <
.
��< =
Nombres
��= D
,
��D E
x
��F G
.
��G H
p
��H I
.
��I J
ApellidoPaterno
��J Y
,
��Y Z
x
��[ \
.
��\ ]
p
��] ^
.
��^ _
ApellidoMaterno
��_ n
)
��n o
,
��o p!
CodigoTipoDocumento
��	 
=
�� 
x
��  
.
��  !
p
��! "
.
��" #!
CodigoTipoDocumento
��# 6
.
��6 7
Value
��7 <
,
��< =
NumeroDocumento
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
NumeroDocumento
�� .
,
��. /
Nombres
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Nombres
�� 
,
�� 
ApellidoPaterno
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoPaterno
�� .
,
��. /
ApellidoMaterno
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoMaterno
�� .
,
��. /
CodigoFuente
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoFuente
�� (
.
��( )
Value
��) .
,
��. /
CodigoSubFuente
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoSubFuente
�� .
.
��. /
Value
��/ 4
,
��4 5
NombreFuente
��	 
=
�� 
x
�� 
.
�� 
pfuente
�� !
.
��! "
ValorCadena
��" -
,
��- .
NombreSubFuente
��	 
=
�� 
x
�� 
.
�� 

psubfuente
�� '
.
��' (
ValorCadena
��( 3
,
��3 4
TelefonoFijo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoFijo
�� (
,
��( )
TelefonoCelular
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoCelular
�� .
,
��. /
FechaNacimiento
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FechaNacimiento
�� .
.
��. /
Value
��/ 4
,
��4 5
	Direccion
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� !
.
��! "
	Direccion
��" +
,
��+ ,
Departamento_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� '
.
��' (
Departamento_Id
��( 7
,
��7 8
Provincia_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� $
.
��$ %
Provincia_Id
��% 1
,
��1 2
Distrito_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� #
.
��# $
Distrito_Id
��$ /
,
��/ 0
Departamento
��	 
=
�� 
x
�� 
.
�� 
ddepartamento
�� '
.
��' (
Nombre
��( .
,
��. /
	Provincia
��	 
=
�� 
x
�� 
.
�� 

dprovincia
�� !
.
��! "
Nombre
��" (
,
��( )
Distrito
��	 
=
�� 
x
�� 
.
�� 
	ddistrito
�� 
.
��  
Nombre
��  &
,
��& '
Edad
��	 
=
�� 
DateTime
�� 
.
�� 
Now
�� 
.
�� 
Year
�� !
-
��" #
x
��$ %
.
��% &
p
��& '
.
��' (
FechaNacimiento
��( 7
.
��7 8
Value
��8 =
.
��= >
Year
��> B
,
��B C

CodigoSexo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 

CodigoSexo
�� $
.
��$ %
Value
��% *
,
��* +
Sexo
��	 
=
�� 
x
�� 
.
�� 
psexo
�� 
.
�� !
ValorAuxiliarCadena
�� +
,
��+ ,
Empresa
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Empresa
�� 
,
�� 
CodigoCargo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoCargo
�� &
.
��& '
Value
��' ,
,
��, -
NombreCargo
��	 
=
�� 
x
�� 
.
�� 
pcargo
�� 
.
��  
ValorCadena
��  +
,
��+ ,
	OtroCargo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
	OtroCargo
�� "
,
��" #
Referenciador
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Referenciador
�� *
,
��* +
Hijos
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
�� $
NumeroHijosDependiente
�� .
.
��. /
Value
��/ 4
,
��4 5
Correo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
��  
CorreoElectronico1
�� (
,
��( )
MonedaFondo
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
�� !
MonedaPatrimonioAfp
�� 1
.
��1 2
Value
��2 7
,
��7 8

MontoFondo
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
��  
MontoPatrimonioAfp
�� /
.
��/ 0
Value
��0 5
,
��5 6
Fuente
��	 
=
�� 
string
�� 
.
�� 
Format
�� 
(
��  
$str
��  ,
,
��, -
x
��. /
.
��/ 0
pfuente
��0 7
.
��7 8
ValorCadena
��8 C
,
��C D
string
��E K
.
��K L
IsNullOrEmpty
��L Y
(
��Y Z
x
��Z [
.
��[ \

psubfuente
��\ f
.
��f g
ValorCadena
��g r
)
��r s
?
��t u
$str
��v x
:
��y z
$str
��{ ~
+�� �
x��� �
.��� �

psubfuente��� �
.��� �
ValorCadena��� �
,��� �
x
�� 
.
�� 
p
�� 
.
�� 
IdReferenciador
�� $
.
��$ %
HasValue
��% -
?
��. /
x
��0 1
.
��1 2
	preferido
��2 ;
.
��; <
Nombres
��< C
+
��D E
$str
��F I
+
��J K
x
��L M
.
��M N
	preferido
��N W
.
��W X
ApellidoPaterno
��X g
+
��h i
$str
��j m
+
��n o
x
��p q
.
��q r
	preferido
��r {
.
��{ |
ApellidoMaterno��| �
:��� �
x��� �
.��� �
p��� �
.��� �
Referenciador��� �
)��� �
,��� �
IdReferenciador
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdReferenciador
�� .
.
��. /
Value
��/ 4
,
��4 5
FlagDescarte
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FlagDescarte
�� (
,
��( )
VisibleDescarte
��	 
=
�� 
true
�� 
,
��  
VisibleAgendar
��	 
=
�� 
true
�� 
,
�� 
FechaCreacion
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� 3
}
�� 	
)
��	 

;
��
 
return
�� 	
result
��
 
;
�� 
}
�� 
public
�� 

IQueryable
�� 
<
�� 
	Prospecto
�� #
>
��# $%
ObtenerProspectosDelDia
��% <
(
��< ="
ProspectoQueryFilter
��= Q"
prospectoQueryFilter
��R f
)
��f g
{
�� 	
var
�� !
listcodigorangosexo
�� #
=
��$ %"
prospectoQueryFilter
��& :
.
��: ;

codigosexo
��; E
!=
��E G
null
��G K
?
��K L"
prospectoQueryFilter
��M a
.
��a b

codigosexo
��b l
.
��l m
Split
��m r
(
��r s
$char
��s v
)
��v w
.
��w x
Select
��x ~
(
��~ 
short�� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� !
listcodigorangoedad
�� 
=
�� "
prospectoQueryFilter
�� 1
.
��1 2
codigorangoedad
��2 A
!=
��A C
null
��C G
?
��G H"
prospectoQueryFilter
��I ]
.
��] ^
codigorangoedad
��^ m
.
��m n
Split
��n s
(
��s t
$char
��t w
)
��w x
.
��x y
Select
��y 
(�� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� #
listcodigorangofuente
�� 
=
�� "
prospectoQueryFilter
�� 3
.
��3 4
codigofuente
��4 @
!=
��@ B
null
��C G
?
��H I"
prospectoQueryFilter
��J ^
.
��^ _
codigofuente
��_ k
.
��k l
Split
��l q
(
��q r
$char
��r u
)
��u v
.
��v w
Select
��w }
(
��} ~
short��~ �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� &
listcodigorangosubfuente
�� 
=
��  !"
prospectoQueryFilter
��" 6
.
��6 7
codigosubfuente
��7 F
!=
��G I
null
��J N
?
��O P"
prospectoQueryFilter
��Q e
.
��e f
codigosubfuente
��f u
.
��u v
Split
��v {
(
��{ |
$char
��| 
)�� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� $
listcodigorangoingreso
�� 
=
�� "
prospectoQueryFilter
��  4
.
��4 5 
codigorangoingreso
��5 G
!=
��H J
null
��K O
?
��P Q"
prospectoQueryFilter
��R f
.
��f g 
codigorangoingreso
��g y
.
��y z
Split
��z 
(�� �
$char��� �
)��� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� "
listcodigorangofondo
�� 
=
�� "
prospectoQueryFilter
�� 2
.
��2 3
codigorangofondo
��3 C
!=
��D F
null
��G K
?
��L M"
prospectoQueryFilter
��N b
.
��b c
codigorangofondo
��c s
.
��s t
Split
��t y
(
��y z
$char
��z }
)
��} ~
.
��~ 
Select�� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
p
�� 
in
�� 
_context
�� #
.
��# $

Prospectos
��$ .
join
�� 
intermediario
��  
in
��! #
_context
��$ ,
.
��, -'
ConsolidadoIntermediarios
��- F
on
��G I
p
��J K
.
��K L(
IdConsolidadoIntermediario
��L f
equals
��g m
intermediario
��n {
.
��{ |)
IdConsolidadoIntermediario��| �
join
�� 
adn
�� 
in
�� 
_context
�� 
.
�� 
	AdnRentas
�� &
on
��' )
p
��* +
.
��+ ,
IdProspecto
��, 7
equals
��8 >
adn
��? B
.
��B C
IdProspecto
��C N
into
��O S
ProspectoAdn
��T `
from
�� 
padn
�� 
in
�� 
ProspectoAdn
�� !
.
��! "
DefaultIfEmpty
��" 0
(
��0 1
)
��1 2
join
�� 
fuente
�� 
in
�� 
_context
�� 
.
��  
ListaTablas
��  +
on
��, .
new
��/ 2
{
��3 4
p
��5 6
.
��6 7
CodigoFuente
��7 C
,
��C D
idtablafuente
��E R
=
��S T

TablaTabla
��U _
.
��_ `
FuenteProspecto
��` o
,
��o p
lnegocio
��q y
=
��z {
LineaNegocio��| �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoFuente
�� *
=
��+ ,
(
��- .
short
��. 3
?
��3 4
)
��4 5
fuente
��5 ;
.
��; <
CodigoCampo
��< G
,
��G H
idtablafuente
��I V
=
��W X
fuente
��Y _
.
��_ `
IdTabla
��` g
,
��g h
lnegocio
��i q
=
��r s
fuente
��t z
.
��z {!
CodigoLineaNegocio��{ �
}��� �
into��� �
ProspectoFuente��� �
from
�� 
pfuente
�� 
in
�� 
ProspectoFuente
�� '
.
��' (
DefaultIfEmpty
��( 6
(
��6 7
)
��7 8
join
�� 
	subfuente
�� 
in
�� 
_context
�� "
.
��" #
ListaTablas
��# .
on
��/ 1
new
��2 5
{
��6 7
p
��7 8
.
��8 9
CodigoSubFuente
��9 H
,
��H I
idtablaSubfuente
��J Z
=
��[ \

TablaTabla
��] g
.
��g h
FuenteProspecto
��h w
,
��w x
lnegocio��y �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
��, 2
new
��3 6
{
��7 8
CodigoSubFuente
��9 H
=
��I J
(
��K L
short
��L Q
?
��Q R
)
��R S
	subfuente
��S \
.
��\ ]
CodigoCampo
��] h
,
��h i
idtablaSubfuente
��j z
=
��{ |
	subfuente��} �
.��� �
IdTabla��� �
,��� �
lnegocio��� �
=��� �
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
�� 

psubfuente
�� 
in
��  
ProspectoSubFuente
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
motivounodescarte
�� 
in
�� !
_context
��" *
.
��* +
ListaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
p
��? @
.
��@ A%
CodigoMotivoUnoDescarte
��A X
,
��X Y#
idtablamotivodescarte
��Y n
=
��o p

TablaTabla
��q {
.
��{ |
MotivoDescarte��| �
}��� �
equals
��, 2
new
��3 6
{
��7 8%
CodigoMotivoUnoDescarte
��9 P
=
��R S
(
��T U
short
��U Z
?
��Z [
)
��[ \
motivounodescarte
��\ m
.
��m n
CodigoCampo
��n y
,
��y z$
idtablamotivodescarte��{ �
=��� �!
motivounodescarte��� �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoUnoDescarte��� �
from
��  
pmotivounodescarte
�� 
in
��  "(
ProspectoMotivoUnoDescarte
��# =
.
��= >
DefaultIfEmpty
��> L
(
��L M
)
��M N
join
�� 
motivodosdescarte
�� 
in
�� !
_context
��" *
.
��* +
ListaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
p
��@ A
.
��A B%
CodigoMotivoDosDescarte
��B Y
,
��Y Z#
idtablamotivodescarte
��[ p
=
��q r

TablaTabla
��s }
.
��} ~
MotivoDescarte��~ �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoDosDescarte
�� 5
=
��6 7
(
��8 9
short
��9 >
?
��> ?
)
��? @
motivodosdescarte
��@ Q
.
��Q R
CodigoCampo
��R ]
,
��] ^#
idtablamotivodescarte
��_ t
=
��u v 
motivodosdescarte��w �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoDosDescarte��� �
from
��  
pmotivodosdescarte
�� 
in
��  "(
ProspectoMotivoDosDescarte
��# =
.
��= >
DefaultIfEmpty
��> L
(
��L M
)
��M N
join
�� 
referido
�� 
in
�� 
_context
�� !
.
��! "

Prospectos
��" ,
on
��- /
p
��0 1
.
��1 2
IdReferenciador
��2 A
equals
��B H
referido
��I Q
.
��Q R
IdProspecto
��R ]
into
��^ b
ProspectoReferido
��c t
from
�� 
	preferido
�� 
in
�� 
ProspectoReferido
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
cargo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� *
on
��+ -
new
��. 1
{
��2 3
p
��3 4
.
��4 5
CodigoCargo
��5 @
,
��@ A
idtablacargo
��A M
=
��N O

TablaTabla
��P Z
.
��Z [
PersonaCargo
��[ g
}
��g h
equals
��+ 1
new
��2 5
{
��6 7
CodigoCargo
��8 C
=
��D E
(
��F G
short
��G L
?
��L M
)
��M N
cargo
��N S
.
��S T
CodigoCampo
��T _
,
��_ `
idtablacargo
��a m
=
��n o
cargo
��p u
.
��u v
IdTabla
��v }
}
��} ~
into�� �
ProspectoCargo��� �
from
�� 
pcargo
�� 
in
�� 
ProspectoCargo
�� %
.
��% &
DefaultIfEmpty
��& 4
(
��4 5
)
��5 6
join
�� 
sexo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� )
on
��* ,
new
��- 0
{
��1 2
p
��2 3
.
��3 4

CodigoSexo
��4 >
,
��> ?
idtablasexo
��? J
=
��K L

TablaTabla
��M W
.
��W X
Sexo
��X \
}
��\ ]
equals
��* 0
new
��1 4
{
��5 6

CodigoSexo
��7 A
=
��C D
(
��E F
short
��F K
?
��K L
)
��L M
sexo
��M Q
.
��Q R
CodigoCampo
��R ]
,
��] ^
idtablasexo
��_ j
=
��k l
sexo
��m q
.
��q r
IdTabla
��r y
}
��y z
into
��{ 
ProspectoSexo��� �
from
�� 
psexo
�� 
in
�� 
ProspectoSexo
�� #
.
��# $
DefaultIfEmpty
��$ 2
(
��2 3
)
��3 4
join
�� 
	direccion
�� 
in
�� 
_context
�� "
.
��" #!
DireccionProspectos
��# 6
on
��7 9
p
��: ;
.
��; <
IdProspecto
��< G
equals
��H N
	direccion
��O X
.
��X Y
IdProspecto
��Y d
into
��e i 
ProspectoDireccion
��j |
from
�� 

pdireccion
�� 
in
��  
ProspectoDireccion
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
distrito
�� 
in
�� 
_context
�� !
.
��! "
	Distritos
��" +
on
��, .
new
��/ 2
{
��3 4

pdireccion
��4 >
.
��> ?
Departamento_Id
��? N
,
��N O

pdireccion
��O Y
.
��Y Z
Provincia_Id
��Z f
,
��f g

pdireccion
��g q
.
��q r
Distrito_Id
��r }
}
��} ~
equals
��, 2
new
��3 6
{
��7 8
distrito
��8 @
.
��@ A
Departamento_Id
��A P
,
��P Q
distrito
��Q Y
.
��Y Z
Provincia_Id
��Z f
,
��f g
distrito
��g o
.
��o p
Distrito_Id
��p {
}
��| }
into��~ �!
DireccionDistrito��� �
from
�� 
	ddistrito
�� 
in
�� 
DireccionDistrito
�� .
.
��. /
DefaultIfEmpty
��/ =
(
��= >
)
��> ?
join
�� 
	provincia
�� 
in
�� 
_context
�� "
.
��" #

Provincias
��# -
on
��. 0
new
��1 4
{
��5 6

pdireccion
��7 A
.
��A B
Provincia_Id
��B N
,
��N O

pdireccion
��O Y
.
��Y Z
Departamento_Id
��Z i
}
��i j
equals
��. 4
new
��5 8
{
��9 :
	provincia
��: C
.
��C D
Provincia_Id
��D P
,
��P Q
	provincia
��Q Z
.
��Z [
Departamento_Id
��[ j
}
��j k
into
��l p!
DireccionProvincia��q �
from
�� 

dprovincia
�� 
in
��  
DireccionProvincia
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
departamento
�� 
in
�� 
_context
�� %
.
��% &
Departamentos
��& 3
on
��4 6

pdireccion
��7 A
.
��A B
Departamento_Id
��B Q
equals
��R X
departamento
��Y e
.
��e f
Departamento_Id
��f u
into
��v z$
DireccionDepartamento��{ �
from
�� 
ddepartamento
�� 
in
�� #
DireccionDepartamento
�� 3
.
��3 4
DefaultIfEmpty
��4 B
(
��B C
)
��C D
where
�� 
(
�� 
intermediario
�� 
.
�� !
CodigoIntermediario
�� 0
==
��1 3"
prospectoQueryFilter
��4 H
.
��H I!
codigointermediario
��I \
)
��\ ]
&&
��^ `
(
��
 
p
�� 
.
�� 
Nombres
�� 
.
�� 
Contains
�� 
(
�� "
prospectoQueryFilter
�� 2
.
��2 3
	parametro
��3 <
)
��< =
||
��> @
p
��A B
.
��B C
ApellidoPaterno
��C R
.
��R S
Contains
��S [
(
��[ \"
prospectoQueryFilter
��\ p
.
��p q
	parametro
��q z
)
��z {
||
��| ~
p
�� 
.
�� 
ApellidoMaterno
�� 
.
�� 
Contains
�� %
(
��% &"
prospectoQueryFilter
��& :
.
��: ;
	parametro
��; D
)
��D E
||
��F H
p
��I J
.
��J K
Referenciador
��K X
.
��X Y
Contains
��Y a
(
��a b"
prospectoQueryFilter
��b v
.
��v w
	parametro��w �
)��� �
||��� �
p��� �
.��� �
NumeroDocumento��� �
.��� �
Contains��� �
(��� �$
prospectoQueryFilter��� �
.��� �
	parametro��� �
)��� �
)��� �
&&��� �
(
�� 
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� %
>=
��% '"
prospectoQueryFilter
��' ;
.
��; <!
fechacreacioninicio
��< O
||
��P R"
prospectoQueryFilter
��S g
.
��g h!
fechacreacioninicio
��h {
==
��{ }
null��} �
)��� �
&&��� �
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� %
<=
��% '"
prospectoQueryFilter
��' ;
.
��; <
fechacreacionfin
��< L
||
��M O"
prospectoQueryFilter
��P d
.
��d e
fechacreacionfin
��e u
==
��u w
null
��w {
)
��{ |
)
��| }
&&��~ �
(
�� !
listcodigorangoedad
�� 
.
��  
Contains
��  (
(
��( )
p
��) *
.
��* +
CodigoRangoEdad
��+ :
.
��: ;
Value
��; @
)
��@ A
||
��B D!
listcodigorangoedad
��E X
==
��Y [
null
��[ _
)
��_ `
&&
��a c
(
�� !
listcodigorangosexo
�� 
.
��  
Contains
��  (
(
��( )
p
��) *
.
��* +
CodigoRangoEdad
��+ :
.
��: ;
Value
��; @
)
��@ A
||
��B D!
listcodigorangosexo
��E X
==
��Y [
null
��\ `
)
��` a
&&
��b d
(
�� #
listcodigorangofuente
�� !
.
��! "
Contains
��" *
(
��* +
p
��+ ,
.
��, -
CodigoRangoEdad
��- <
.
��< =
Value
��= B
)
��B C
||
��D F#
listcodigorangofuente
��G \
==
��] _
null
��` d
)
��d e
&&
��f h
(
�� &
listcodigorangosubfuente
�� $
.
��$ %
Contains
��% -
(
��- .
p
��. /
.
��/ 0
CodigoRangoEdad
��0 ?
.
��? @
Value
��@ E
)
��E F
||
��G I&
listcodigorangosubfuente
��J b
==
��c e
null
��f j
)
��j k
&&
��l n
(
�� $
listcodigorangoingreso
�� "
.
��" #
Contains
��# +
(
��+ ,
p
��, -
.
��- .
CodigoRangoEdad
��. =
.
��= >
Value
��> C
)
��C D
||
��E G$
listcodigorangoingreso
��H ^
==
��_ a
null
��b f
)
��f g
&&
��h j
(
�� "
listcodigorangofondo
��  
.
��  !
Contains
��! )
(
��) *
p
��* +
.
��+ ,
CodigoRangoEdad
��, ;
.
��; <
Value
��< A
)
��A B
||
��C E"
listcodigorangofondo
��F Z
==
��[ ]
null
��^ b
)
��b c
&&
��d f
(
�� 
!
�� 
_context
�� 
.
�� 
Citas
�� 
.
�� 
Where
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
IdProspecto
��) 4
==
��5 7
p
��8 9
.
��9 :
IdProspecto
��: E
)
��E F
.
��F G
Select
��G M
(
��M N
x
��N O
=>
��P R
x
��S T
.
��T U
IdProspecto
��U `
)
��` a
.
��a b
Contains
��b j
(
��j k
p
��k l
.
��l m
IdProspecto
��m x
)
��x y
)
��y z
&&
��{ }
(
�� 
!
�� 
_context
�� 
.
�� "
RecordatorioLlamadas
�� *
.
��* +
Where
��+ 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
IdProspecto
��8 C
==
��D F
p
��G H
.
��H I
IdProspecto
��I T
)
��T U
.
��U V
Select
��V \
(
��\ ]
x
��] ^
=>
��_ a
x
��a b
.
��b c
IdProspecto
��c n
)
��n o
.
��o p
Contains
��p x
(
��x y
p
��y z
.
��z {
IdProspecto��{ �
)��� �
)��� �
select
�� 
new
�� 
{
�� 	
p
��	 

,
��
 
padn
��	 
,
�� 
pfuente
��	 
,
�� 

psubfuente
��	 
,
�� 
	preferido
��	 
,
�� 
psexo
��	 
,
�� 
pcargo
��	 
,
�� 

pdireccion
��	 
,
�� 
	ddistrito
��	 
,
�� 

dprovincia
��	 
,
�� 
ddepartamento
��	 
,
��  
pmotivounodescarte
��	 
,
��  
pmotivodosdescarte
��	 
}
�� 	
)
��	 

.
��
 
AsNoTracking
�� 
(
�� 
)
�� 
.
�� 
Select
��  
(
��  !
x
��! "
=>
��# %
new
��& )
	Prospecto
��* 3
{
�� 	
IdProspecto
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdProspecto
�� &
,
��& '
NombresApellidos
��	 
=
�� 
string
�� "
.
��" #
Format
��# )
(
��) *
$str
��* 7
,
��7 8
x
��9 :
.
��: ;
p
��; <
.
��< =
Nombres
��= D
,
��D E
x
��F G
.
��G H
p
��H I
.
��I J
ApellidoPaterno
��J Y
,
��Y Z
x
��[ \
.
��\ ]
p
��] ^
.
��^ _
ApellidoMaterno
��_ n
)
��n o
,
��o p!
CodigoTipoDocumento
��	 
=
�� 
x
��  
.
��  !
p
��! "
.
��" #!
CodigoTipoDocumento
��# 6
.
��6 7
Value
��7 <
,
��< =
NumeroDocumento
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
NumeroDocumento
�� .
,
��. /
Nombres
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Nombres
�� 
,
�� 
ApellidoPaterno
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoPaterno
�� .
,
��. /
ApellidoMaterno
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoMaterno
�� .
,
��. /
CodigoFuente
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoFuente
�� (
.
��( )
Value
��) .
,
��. /
CodigoSubFuente
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoSubFuente
�� .
.
��. /
Value
��/ 4
,
��4 5
NombreFuente
��	 
=
�� 
x
�� 
.
�� 
pfuente
�� !
.
��! "
ValorCadena
��" -
,
��- .
NombreSubFuente
��	 
=
�� 
x
�� 
.
�� 

psubfuente
�� '
.
��' (
ValorCadena
��( 3
,
��3 4
TelefonoFijo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoFijo
�� (
,
��( )
TelefonoCelular
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoCelular
�� .
,
��. /
FechaNacimiento
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FechaNacimiento
�� .
.
��. /
Value
��/ 4
,
��4 5
	Direccion
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� !
.
��! "
	Direccion
��" +
,
��+ ,
Departamento_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� '
.
��' (
Departamento_Id
��( 7
,
��7 8
Provincia_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� $
.
��$ %
Provincia_Id
��% 1
,
��1 2
Distrito_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� #
.
��# $
Distrito_Id
��$ /
,
��/ 0
Departamento
��	 
=
�� 
x
�� 
.
�� 
ddepartamento
�� '
.
��' (
Nombre
��( .
,
��. /
	Provincia
��	 
=
�� 
x
�� 
.
�� 

dprovincia
�� !
.
��! "
Nombre
��" (
,
��( )
Distrito
��	 
=
�� 
x
�� 
.
�� 
	ddistrito
�� 
.
��  
Nombre
��  &
,
��& '
Edad
��	 
=
�� 
DateTime
�� 
.
�� 
Now
�� 
.
�� 
Year
�� "
-
��# $
x
��% &
.
��& '
p
��' (
.
��( )
FechaNacimiento
��) 8
.
��8 9
Value
��9 >
.
��> ?
Year
��? C
,
��C D

CodigoSexo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 

CodigoSexo
�� $
.
��$ %
Value
��% *
,
��* +
Sexo
��	 
=
�� 
x
�� 
.
�� 
psexo
�� 
.
�� !
ValorAuxiliarCadena
�� +
,
��+ ,
Empresa
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Empresa
�� 
,
�� 
CodigoCargo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoCargo
�� &
.
��& '
Value
��' ,
,
��, -
NombreCargo
��	 
=
�� 
x
�� 
.
�� 
pcargo
�� 
.
��  
ValorCadena
��  +
,
��+ ,
	OtroCargo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
	OtroCargo
�� "
,
��" #
Referenciador
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Referenciador
�� *
,
��* +
Hijos
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
�� $
NumeroHijosDependiente
�� .
.
��. /
Value
��/ 4
,
��4 5
Correo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
��  
CorreoElectronico1
�� (
,
��( )
MonedaFondo
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
�� !
MonedaPatrimonioAfp
�� 1
.
��1 2
Value
��2 7
,
��7 8

MontoFondo
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
��  
MontoPatrimonioAfp
�� /
.
��/ 0
Value
��0 5
,
��5 6
Fuente
��	 
=
�� 
string
�� 
.
�� 
Format
�� 
(
��  
$str
��  ,
,
��, -
x
��. /
.
��/ 0
pfuente
��0 7
.
��7 8
ValorCadena
��8 C
,
��C D
string
��E K
.
��K L
IsNullOrEmpty
��L Y
(
��Y Z
x
��Z [
.
��[ \

psubfuente
��\ f
.
��f g
ValorCadena
��g r
)
��r s
?
��t u
$str
��v x
:
��y z
$str
��{ ~
+�� �
x��� �
.��� �

psubfuente��� �
.��� �
ValorCadena��� �
,��� �
x
�� 
.
�� 
p
�� 
.
�� 
IdReferenciador
�� $
.
��$ %
HasValue
��% -
?
��. /
x
��0 1
.
��1 2
	preferido
��2 ;
.
��; <
Nombres
��< C
+
��D E
$str
��F I
+
��J K
x
��L M
.
��M N
	preferido
��N W
.
��W X
ApellidoPaterno
��X g
+
��h i
$str
��j m
+
��n o
x
��p q
.
��q r
	preferido
��r {
.
��{ |
ApellidoMaterno��| �
:��� �
x��� �
.��� �
p��� �
.��� �
Referenciador��� �
)��� �
,��� �
IdReferenciador
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdReferenciador
�� .
.
��. /
Value
��/ 4
,
��4 5
FlagDescarte
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FlagDescarte
�� (
,
��( )!
TextoMotivoDescarte
��	 
=
�� 
string
�� %
.
��% &
IsNullOrEmpty
��& 3
(
��3 4
x
��4 5
.
��5 6 
pmotivodosdescarte
��6 H
.
��H I
ValorCadena
��I T
)
��T U
?
��V W
x
��X Y
.
��Y Z 
pmotivounodescarte
��Z l
.
��l m
ValorCadena
��m x
:
��/ 0
string
��1 7
.
��7 8
Format
��8 >
(
��> ?
$str
��? H
,
��H I
x
��J K
.
��K L 
pmotivounodescarte
��L ^
.
��^ _
ValorCadena
��_ j
,
��j k
x
��l m
.
��m n!
pmotivodosdescarte��n �
.��� �
ValorCadena��� �
)��� �
,��� �
VisibleDescarte
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FlagDescarte
�� +
==
��, .
true
��/ 3
?
��4 5
false
��6 ;
:
��< =
true
��> B
,
��B C
VisibleAgendar
��	 
=
�� 
true
�� 
,
�� 
FechaCreacion
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� 3
}
�� 	
)
��	 

;
��
 
return
�� 
result
�� 
;
�� 
}
�� 
public
�� 

IQueryable
�� 
<
�� 
	Prospecto
�� #
>
��# $#
ObtenerCitaCalificada
��% :
(
��: ;"
ProspectoQueryFilter
��; O"
prospectoQueryFilter
��P d
)
��d e
{
�� 	
var
�� !
listcodigorangosexo
�� #
=
��$ %"
prospectoQueryFilter
��& :
.
��: ;

codigosexo
��; E
!=
��F H
null
��I M
?
��N O"
prospectoQueryFilter
��P d
.
��d e

codigosexo
��e o
.
��o p
Split
��p u
(
��u v
$char
��v y
)
��y z
.
��z {
Select��{ �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� !
listcodigorangoedad
�� 
=
�� "
prospectoQueryFilter
�� 1
.
��1 2
codigorangoedad
��2 A
!=
��B D
null
��E I
?
��J K"
prospectoQueryFilter
��L `
.
��` a
codigorangoedad
��a p
.
��p q
Split
��q v
(
��v w
$char
��w z
)
��z {
.
��{ |
Select��| �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� #
listcodigorangofuente
�� 
=
�� "
prospectoQueryFilter
�� 3
.
��3 4
codigofuente
��4 @
!=
��A C
null
��D H
?
��I J"
prospectoQueryFilter
��K _
.
��_ `
codigofuente
��` l
.
��l m
Split
��m r
(
��r s
$char
��s v
)
��v w
.
��w x
Select
��x ~
(
��~ 
short�� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� &
listcodigorangosubfuente
�� 
=
��  !"
prospectoQueryFilter
��" 6
.
��6 7
codigosubfuente
��7 F
!=
��G I
null
��J N
?
��O P"
prospectoQueryFilter
��Q e
.
��e f
codigosubfuente
��f u
.
��u v
Split
��v {
(
��{ |
$char
��| 
)�� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� $
listcodigorangoingreso
�� 
=
�� "
prospectoQueryFilter
��  4
.
��4 5 
codigorangoingreso
��5 G
!=
��H J
null
��K O
?
��P Q"
prospectoQueryFilter
��R f
.
��f g 
codigorangoingreso
��g y
.
��y z
Split
��z 
(�� �
$char��� �
)��� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� "
listcodigorangofondo
�� 
=
�� "
prospectoQueryFilter
�� 2
.
��2 3
codigorangofondo
��3 C
!=
��D F
null
��G K
?
��L M"
prospectoQueryFilter
��N b
.
��b c
codigorangofondo
��c s
.
��s t
Split
��t y
(
��y z
$char
��z }
)
��} ~
.
��~ 
Select�� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� 
result
�� 
=
�� 
(
�� 
from
�� 
c
�� 
in
�� !
_context
��" *
.
��* +
Citas
��+ 0
join
�� 
p
�� 
in
�� 
_context
�� 
.
�� 

Prospectos
�� %
on
��& (
c
��) *
.
��* +
IdProspecto
��+ 6
equals
��7 =
p
��> ?
.
��? @
IdProspecto
��@ K
join
�� 
intermediario
�� 
in
�� 
_context
�� &
.
��& ''
ConsolidadoIntermediarios
��' @
on
��A C
p
��D E
.
��E F(
IdConsolidadoIntermediario
��F `
equals
��a g
intermediario
��h u
.
��u v)
IdConsolidadoIntermediario��v �
join
�� 
adn
�� 
in
�� 
_context
�� 
.
�� 
	AdnRentas
�� &
on
��' )
p
��* +
.
��+ ,
IdProspecto
��, 7
equals
��8 >
adn
��? B
.
��B C
IdProspecto
��C N
into
��O S
ProspectoAdn
��T `
from
�� 
padn
�� 
in
�� 
ProspectoAdn
�� !
.
��! "
DefaultIfEmpty
��" 0
(
��0 1
)
��1 2
join
�� 
fuente
�� 
in
�� 
_context
�� 
.
��  
ListaTablas
��  +
on
��, .
new
��/ 2
{
��3 4
p
��5 6
.
��6 7
CodigoFuente
��7 C
,
��C D
idtablafuente
��E R
=
��S T

TablaTabla
��U _
.
��_ `
FuenteProspecto
��` o
,
��o p
lnegocio
��q y
=
��z {
LineaNegocio��| �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoFuente
�� *
=
��+ ,
(
��- .
short
��. 3
?
��3 4
)
��4 5
fuente
��5 ;
.
��; <
CodigoCampo
��< G
,
��G H
idtablafuente
��I V
=
��W X
fuente
��Y _
.
��_ `
IdTabla
��` g
,
��g h
lnegocio
��i q
=
��r s
fuente
��t z
.
��z {!
CodigoLineaNegocio��{ �
}��� �
into��� �
ProspectoFuente��� �
from
�� 
pfuente
�� 
in
�� 
ProspectoFuente
�� '
.
��' (
DefaultIfEmpty
��( 6
(
��6 7
)
��7 8
join
�� 
	subfuente
�� 
in
�� 
_context
�� "
.
��" #
ListaTablas
��# .
on
��/ 1
new
��2 5
{
��6 7
p
��8 9
.
��9 :
CodigoSubFuente
��: I
,
��I J
idtablaSubfuente
��K [
=
��\ ]

TablaTabla
��^ h
.
��h i
FuenteProspecto
��i x
,
��x y
lnegocio��z �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoSubFuente
�� -
=
��. /
(
��0 1
short
��1 6
?
��6 7
)
��7 8
	subfuente
��8 A
.
��A B
CodigoCampo
��B M
,
��M N
idtablaSubfuente
��O _
=
��` a
	subfuente
��b k
.
��k l
IdTabla
��l s
,
��s t
lnegocio
��u }
=
��~ 
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
�� 

psubfuente
�� 
in
��  
ProspectoSubFuente
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
motivounodescarte
�� 
in
�� !
_context
��" *
.
��* +
ListaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
p
��@ A
.
��A B%
CodigoMotivoUnoDescarte
��B Y
,
��Y Z#
idtablamotivodescarte
��[ p
=
��q r

TablaTabla
��s }
.
��} ~
MotivoDescarte��~ �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoUnoDescarte
�� 5
=
��6 7
(
��8 9
short
��9 >
?
��> ?
)
��? @
motivounodescarte
��@ Q
.
��Q R
CodigoCampo
��R ]
,
��] ^#
idtablamotivodescarte
��_ t
=
��u v 
motivounodescarte��w �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoUnoDescarte��� �
from
��  
pmotivounodescarte
�� 
in
��  "(
ProspectoMotivoUnoDescarte
��# =
.
��= >
DefaultIfEmpty
��> L
(
��L M
)
��M N
join
�� 
motivodosdescarte
�� 
in
�� !
_context
��" *
.
��* +
ListaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
p
��@ A
.
��A B%
CodigoMotivoDosDescarte
��B Y
,
��Y Z#
idtablamotivodescarte
��[ p
=
��q r

TablaTabla
��s }
.
��} ~
MotivoDescarte��~ �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoDosDescarte
�� 5
=
��6 7
(
��8 9
short
��9 >
?
��> ?
)
��? @
motivodosdescarte
��@ Q
.
��Q R
CodigoCampo
��R ]
,
��] ^#
idtablamotivodescarte
��_ t
=
��u v 
motivodosdescarte��w �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoDosDescarte��� �
from
��  
pmotivodosdescarte
�� 
in
��  "(
ProspectoMotivoDosDescarte
��# =
.
��= >
DefaultIfEmpty
��> L
(
��L M
)
��M N
join
�� 
referido
�� 
in
�� 
_context
�� !
.
��! "

Prospectos
��" ,
on
��- /
p
��0 1
.
��1 2
IdReferenciador
��2 A
equals
��B H
referido
��I Q
.
��Q R
IdProspecto
��R ]
into
��^ b
ProspectoReferido
��c t
from
�� 
	preferido
�� 
in
�� 
ProspectoReferido
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
cargo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� *
on
��+ -
new
��. 1
{
��2 3
p
��4 5
.
��5 6
CodigoCargo
��6 A
,
��A B
idtablacargo
��C O
=
��P Q

TablaTabla
��R \
.
��\ ]
PersonaCargo
��] i
}
��j k
equals
�� 
new
�� 
{
�� 
CodigoCargo
��  +
=
��, -
(
��. /
short
��/ 4
?
��4 5
)
��5 6
cargo
��6 ;
.
��; <
CodigoCampo
��< G
,
��G H
idtablacargo
��I U
=
��V W
cargo
��X ]
.
��] ^
IdTabla
��^ e
}
��f g
into
��h l
ProspectoCargo
��m {
from
�� 
pcargo
�� 
in
�� 
ProspectoCargo
�� %
.
��% &
DefaultIfEmpty
��& 4
(
��4 5
)
��5 6
join
�� 
sexo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� )
on
��* ,
new
��- 0
{
��1 2
p
��3 4
.
��4 5

CodigoSexo
��5 ?
,
��? @
idtablasexo
��A L
=
��M N

TablaTabla
��O Y
.
��Y Z
Sexo
��Z ^
}
��_ `
equals
�� 
new
�� 
{
�� 

CodigoSexo
�� )
=
��* +
(
��, -
short
��- 2
?
��2 3
)
��3 4
sexo
��4 8
.
��8 9
CodigoCampo
��9 D
,
��D E
idtablasexo
��F Q
=
��R S
sexo
��T X
.
��X Y
IdTabla
��Y `
}
��a b
into
��c g
ProspectoSexo
��h u
from
�� 
psexo
�� 
in
�� 
ProspectoSexo
�� #
.
��# $
DefaultIfEmpty
��$ 2
(
��2 3
)
��3 4
join
�� 
	direccion
�� 
in
�� 
_context
�� "
.
��" #!
DireccionProspectos
��# 6
on
��7 9
p
��: ;
.
��; <
IdProspecto
��< G
equals
��H N
	direccion
��O X
.
��X Y
IdProspecto
��Y d
into
��e i 
ProspectoDireccion
��j |
from
�� 

pdireccion
�� 
in
��  
ProspectoDireccion
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
distrito
�� 
in
�� 
_context
�� !
.
��! "
	Distritos
��" +
on
��, .
new
��/ 2
{
��3 4

pdireccion
��5 ?
.
��? @
Departamento_Id
��@ O
,
��O P

pdireccion
��Q [
.
��[ \
Provincia_Id
��\ h
,
��h i

pdireccion
��j t
.
��t u
Distrito_Id��u �
}��� �
equals
�� 
new
�� 
{
�� 
distrito
�� &
.
��& '
Departamento_Id
��' 6
,
��6 7
distrito
��8 @
.
��@ A
Provincia_Id
��A M
,
��M N
distrito
��O W
.
��W X
Distrito_Id
��X c
}
��d e
into
��f j
DireccionDistrito
��k |
from
�� 
	ddistrito
�� 
in
�� 
DireccionDistrito
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
	provincia
�� 
in
�� 
_context
�� "
.
��" #

Provincias
��# -
on
��. 0
new
��1 4
{
��5 6

pdireccion
��7 A
.
��A B
Provincia_Id
��B N
,
��N O

pdireccion
��P Z
.
��Z [
Departamento_Id
��[ j
}
��k l
equals
�� 
new
�� 
{
�� 
	provincia
��  )
.
��) *
Provincia_Id
��* 6
,
��6 7
	provincia
��8 A
.
��A B
Departamento_Id
��B Q
}
��R S
into
��T X 
DireccionProvincia
��Y k
from
�� 

dprovincia
�� 
in
��  
DireccionProvincia
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
departamento
�� 
in
�� 
_context
�� %
.
��% &
Departamentos
��& 3
on
��4 6

pdireccion
��7 A
.
��A B
Departamento_Id
��B Q
equals
��R X
departamento
��Y e
.
��e f
Departamento_Id
��f u
into
��v z$
DireccionDepartamento��{ �
from
�� 
ddepartamento
�� 
in
�� #
DireccionDepartamento
�� 3
.
��3 4
DefaultIfEmpty
��4 B
(
��B C
)
��C D
join
�� 
lineanegocio
�� 
in
�� 
_context
�� %
.
��% &
TablaTablas
��& 1
on
��2 4
new
��5 8
{
��9 :
c
��; <
.
��< = 
CodigoLineaNegocio
��= O
,
��O P!
idtablalineanegocio
��Q d
=
��e f

TablaTabla
��g q
.
��q r
LineaNegocio
��r ~
}�� �
equals
�� 
new
�� 
{
��  
CodigoLineaNegocio
�� 1
=
��2 3
(
��4 5
short
��5 :
?
��: ;
)
��; <
lineanegocio
��< H
.
��H I
CodigoCampo
��I T
,
��T U!
idtablalineanegocio
��V i
=
��j k
lineanegocio
��l x
.
��x y
IdTabla��y �
}��� �
into��� �%
ProspectoLineaNegocio��� �
from
�� 
plineanegocio
�� 
in
�� #
ProspectoLineaNegocio
�� 3
.
��3 4
DefaultIfEmpty
��4 B
(
��B C
)
��C D
join
�� 
porcentajeavance
�� 
in
��  
_context
��! )
.
��) *
TablaTablas
��* 5
on
��6 8
new
��9 <
{
��= >
c
��? @
.
��@ A0
"CodigoPorcentajeAvanceCalificacion
��A c
,
��c d%
idtablaporcentajeavance
��e |
=
��} ~

TablaTabla�� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
�� 
new
�� 
{
�� 0
"CodigoPorcentajeAvanceCalificacion
�� A
=
��B C
(
��D E
short
��E J
?
��J K
)
��K L
porcentajeavance
��L \
.
��\ ]
CodigoCampo
��] h
,
��h i&
idtablaporcentajeavance��j �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �
CitaPorcentaje��� �
from
�� 
cporcentajeavance
�� 
in
�� !
CitaPorcentaje
��" 0
.
��0 1
DefaultIfEmpty
��1 ?
(
��? @
)
��@ A
where
�� 
(
�� 
intermediario
�� 
.
�� !
CodigoIntermediario
�� 0
==
��1 3"
prospectoQueryFilter
��4 H
.
��H I!
codigointermediario
��I \
)
��\ ]
&&
��^ `
(
�� 
c
�� 
.
�� 
FlagCalificacion
�� 
.
�� 
Value
�� $
)
��$ %
&&
��& (
(
�� 
p
�� 
.
�� 
Nombres
�� 
.
�� 
Contains
�� 
(
�� "
prospectoQueryFilter
�� 3
.
��3 4
	parametro
��4 =
)
��= >
||
��? A
p
��B C
.
��C D
ApellidoPaterno
��D S
.
��S T
Contains
��T \
(
��\ ]"
prospectoQueryFilter
��] q
.
��q r
	parametro
��r {
)
��{ |
||
��} 
p
�� 
.
�� 
ApellidoMaterno
�� 
.
�� 
Contains
�� %
(
��% &"
prospectoQueryFilter
��& :
.
��: ;
	parametro
��; D
)
��D E
||
��F H
p
��I J
.
��J K
Referenciador
��K X
.
��X Y
Contains
��Y a
(
��a b"
prospectoQueryFilter
��b v
.
��v w
	parametro��w �
)��� �
||��� �
p��� �
.��� �
NumeroDocumento��� �
.��� �
Contains��� �
(��� �$
prospectoQueryFilter��� �
.��� �
	parametro��� �
)��� �
)��� �
&&��� �
(
�� 
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� %
>=
��& ("
prospectoQueryFilter
��) =
.
��= >!
fechacreacioninicio
��> Q
||
��R T"
prospectoQueryFilter
��U i
.
��i j!
fechacreacioninicio
��j }
==��~ �
null��� �
)��� �
&&��� �
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� %
<=
��& ("
prospectoQueryFilter
��) =
.
��= >
fechacreacionfin
��> N
||
��O Q"
prospectoQueryFilter
��R f
.
��f g
fechacreacionfin
��g w
==
��x z
null
��{ 
)�� �
)��� �
&&��� �
(
�� 
(
�� 
c
�� 
.
�� !
FechaEstimadaCierre
�� #
>=
��$ &"
prospectoQueryFilter
��' ;
.
��; <'
fechaestimadacierreinicio
��< U
||
��V X"
prospectoQueryFilter
��Y m
.
��m n(
fechaestimadacierreinicio��n �
==��� �
null��� �
)��� �
&&��� �
(
�� 
c
�� 
.
�� !
FechaEstimadaCierre
�� "
<=
��# %"
prospectoQueryFilter
��& :
.
��: ;$
fechaestimadacierrefin
��; Q
||
��R T"
prospectoQueryFilter
��U i
.
��i j%
fechaestimadacierrefin��j �
==��� �
null��� �
)��� �
)��� �
&&��� �
(
�� 
(
�� 
c
�� 
.
�� $
AuditoriaFechaCreacion
�� &
>=
��' )"
prospectoQueryFilter
��* >
.
��> ?(
fechaultimaactividadinicio
��? Y
||
��Z \"
prospectoQueryFilter
��] q
.
��q r)
fechaultimaactividadinicio��r �
==��� �
null��� �
)��� �
&&��� �
(
�� 
c
�� 
.
�� $
AuditoriaFechaCreacion
�� %
<=
��& ("
prospectoQueryFilter
��) =
.
��= >%
fechaultimaactividadfin
��> U
||
��V X"
prospectoQueryFilter
��Y m
.
��m n&
fechaultimaactividadfin��n �
==��� �
null��� �
)��� �
)��� �
&&��� �
(
�� !
listcodigorangoedad
��  
.
��  !
Contains
��! )
(
��) *
p
��* +
.
��+ ,
CodigoRangoEdad
��, ;
.
��; <
Value
��< A
)
��A B
||
��C E!
listcodigorangoedad
��F Y
==
��Z \
null
��] a
)
��a b
&&
��c e
(
�� !
listcodigorangosexo
�� 
.
��  
Contains
��  (
(
��( )
p
��) *
.
��* +

CodigoSexo
��+ 5
.
��5 6
Value
��6 ;
)
��; <
||
��= ?!
listcodigorangosexo
��@ S
==
��T V
null
��W [
)
��[ \
&&
��] _
(
�� #
listcodigorangofuente
�� !
.
��! "
Contains
��" *
(
��* +
p
��+ ,
.
��, -
CodigoFuente
��- 9
.
��9 :
Value
��: ?
)
��? @
||
��A C#
listcodigorangofuente
��D Y
==
��Z \
null
��] a
)
��a b
&&
��c e
(
�� &
listcodigorangosubfuente
�� $
.
��$ %
Contains
��% -
(
��- .
p
��. /
.
��/ 0
CodigoSubFuente
��0 ?
.
��? @
Value
��@ E
)
��E F
||
��G I&
listcodigorangosubfuente
��J b
==
��c e
null
��f j
)
��j k
&&
��l n
(
�� $
listcodigorangoingreso
�� "
.
��" #
Contains
��# +
(
��+ ,
p
��, -
.
��- . 
CodigoRangoIngreso
��. @
.
��@ A
Value
��A F
)
��F G
||
��H J$
listcodigorangoingreso
��K a
==
��b d
null
��e i
)
��i j
&&
��k m
(
�� "
listcodigorangofondo
��  
.
��  !
Contains
��! )
(
��) *
p
��* +
.
��+ ,
CodigoRangoFondo
��, <
.
��< =
Value
��= B
)
��B C
||
��D F"
listcodigorangofondo
��G [
==
��\ ^
null
��_ c
)
��c d
&&
��e g
(
�� 
!
�� 
_context
�� 
.
�� 
Citas
�� 
.
�� 
Where
�� !
(
��! "
x
��" #
=>
��$ &
x
��' (
.
��( )
IdProspecto
��) 4
==
��5 7
p
��8 9
.
��9 :
IdProspecto
��: E
&&
��F H
x
��I J
.
��J K
FlagCalificacion
��K [
==
��\ ^
null
��_ c
)
��c d
.
��d e
Select
��e k
(
��k l
x
��l m
=>
��n p
x
��q r
.
��r s
IdProspecto
��s ~
)
��~ 
.�� �
Contains��� �
(��� �
p��� �
.��� �
IdProspecto��� �
)��� �
)��� �
select
�� 
new
�� 
{
�� 	
p
��	 

,
��
 
c
��	 

,
��
 
padn
��	 
,
�� 
	preferido
��	 
,
�� 
pfuente
��	 
,
�� 

psubfuente
��	 
,
�� 
psexo
��	 
,
�� 
pcargo
��	 
,
�� 

pdireccion
��	 
,
�� 
	ddistrito
��	 
,
�� 

dprovincia
��	 
,
�� 
ddepartamento
��	 
,
��  
pmotivounodescarte
��	 
,
��  
pmotivodosdescarte
��	 
,
�� 
plineanegocio
��	 
,
�� 
cporcentajeavance
��	 
}
�� 	
)
��	 

.
��
 
GroupBy
�� 
(
�� 
x
�� 
=>
�� 
new
�� 
{
�� 
x
�� 
.
�� 
p
��  
.
��  !
IdProspecto
��! ,
,
��, -
x
��- .
.
��. /
p
��/ 0
.
��0 1
Nombres
��1 8
,
��8 9
x
��9 :
.
��: ;
p
��; <
.
��< =
ApellidoPaterno
��= L
,
��L M
x
��M N
.
��N O
p
��O P
.
��P Q
ApellidoMaterno
��Q `
,
��` a
x
�� 	
.
��	 

p
��
 
.
�� !
CodigoTipoDocumento
�� 
,
��  
x
��  !
.
��! "
p
��" #
.
��# $
NumeroDocumento
��$ 3
,
��3 4
x
��4 5
.
��5 6
p
��6 7
.
��7 8
CodigoFuente
��8 D
,
��D E
x
��E F
.
��F G
p
��G H
.
��H I
CodigoSubFuente
��I X
,
��X Y
NombreFuente
��Y e
=
��e f
x
��f g
.
��g h
pfuente
��h o
.
��o p
ValorCadena
��p {
,
��{ |
NombreSubfuente
�� 
=
�� 
x
�� 
.
�� 

psubfuente
�� %
.
��% &
ValorCadena
��& 1
,
��1 2
x
��2 3
.
��3 4
p
��4 5
.
��5 6
TelefonoFijo
��6 B
,
��B C
x
��C D
.
��D E
p
��E F
.
��F G
TelefonoCelular
��G V
,
��V W
x
��W X
.
��X Y
p
��Y Z
.
��Z [
FechaNacimiento
��[ j
,
��j k
x
�� 	
.
��	 


pdireccion
��
 
.
�� 
	Direccion
�� 
,
�� 
x
��  
.
��  !

pdireccion
��! +
.
��+ ,
Departamento_Id
��, ;
,
��; <
x
��< =
.
��= >

pdireccion
��> H
.
��H I
Provincia_Id
��I U
,
��U V
x
��V W
.
��W X

pdireccion
��X b
.
��b c
Distrito_Id
��c n
,
��n o
Departamento
�� 
=
�� 
x
�� 
.
�� 
ddepartamento
�� %
.
��% &
Nombre
��& ,
,
��, -
	Provincia
��- 6
=
��7 8
x
��9 :
.
��: ;

dprovincia
��; E
.
��E F
Nombre
��F L
,
��L M
Distrito
��M U
=
��U V
x
��W X
.
��X Y
	ddistrito
��Y b
.
��b c
Nombre
��c i
,
��i j
NombreReferido
�� 
=
�� 
x
�� 
.
�� 
	preferido
�� $
.
��$ %
Nombres
��% ,
,
��, -%
ApellidoPaternoReferido
��- D
=
��E F
x
��G H
.
��H I
	preferido
��I R
.
��R S
ApellidoPaterno
��S b
,
��b c%
ApellidoMaternoReferido
��d {
=
��| }
x
��~ 
.�� �
	preferido��� �
.��� �
ApellidoMaterno��� �
,��� �
x
�� 	
.
��	 

p
��
 
.
�� 

CodigoSexo
�� 
,
�� 
Sexo
�� 
=
�� 
x
�� 
.
�� 
psexo
�� $
.
��$ %!
ValorAuxiliarCadena
��% 8
,
��8 9
x
��9 :
.
��: ;
p
��; <
.
��< =
Empresa
��= D
,
��D E
x
��E F
.
��F G
p
��G H
.
��H I
CodigoCargo
��I T
,
��T U
NombreCargo
��U `
=
��a b
x
��b c
.
��c d
pcargo
��d j
.
��j k
ValorCadena
��k v
,
��v w
x
��w x
.
��x y
p
��y z
.
��z {
	OtroCargo��{ �
,��� �
x��� �
.��� �
p��� �
.��� �
Referenciador��� �
,��� �
x
�� 	
.
��	 

padn
��
 
.
�� $
NumeroHijosDependiente
�� %
,
��% &
x
��& '
.
��' (
p
��( )
.
��) * 
CorreoElectronico1
��* <
,
��< =
x
��= >
.
��> ?
p
��? @
.
��@ A
MonedaFondo
��A L
,
��L M
x
��M N
.
��N O
p
��O P
.
��P Q

MontoFondo
��Q [
,
��[ \
x
��\ ]
.
��] ^
p
��^ _
.
��_ `
IdReferenciador
��` o
,
��o p
x
�� 	
.
��	 

p
��
 
.
�� 
FlagDescarte
�� 
,
�� 
MotivoDescarteUno
�� *
=
��+ ,
x
��- .
.
��. / 
pmotivodosdescarte
��/ A
.
��A B
ValorCadena
��B M
,
��M N
MotivoDescarteDos
��N _
=
��` a
x
��a b
.
��b c 
pmotivounodescarte
��c u
.
��u v
ValorCadena��v �
,��� �
Producto
�� 
=
�� 
x
�� 
.
�� 
plineanegocio
�� !
.
��! "
ValorCadena
��" -
,
��- .
x
��. /
.
��/ 0
padn
��0 4
.
��4 5!
MonedaPatrimonioAfp
��5 H
,
��H I
x
��I J
.
��J K
padn
��K O
.
��O P 
MontoPatrimonioAfp
��P b
}
�� 	
)
��	 

.
��
 
Select
�� 
(
�� 
y
�� 
=>
�� 
new
�� 
	Prospecto
�� $
(
��$ %
)
��% &
{
�� 	
IdProspecto
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
IdProspecto
�� (
,
��( )
Nombres
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Nombres
��  
,
��  !
ApellidoPaterno
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
ApellidoPaterno
��! 0
,
��0 1
ApellidoMaterno
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
ApellidoMaterno
��! 0
,
��0 1
NombresApellidos
��	 
=
�� 
string
�� "
.
��" #
Format
��# )
(
��) *
$str
��* 7
,
��7 8
y
��9 :
.
��: ;
Key
��; >
.
��> ?
Nombres
��? F
,
��F G
y
��H I
.
��I J
Key
��J M
.
��M N
ApellidoPaterno
��N ]
,
��] ^
y
��_ `
.
��` a
Key
��a d
.
��d e
ApellidoMaterno
��e t
)
��t u
,
��u v!
CodigoTipoDocumento
��	 
=
�� 
y
��  
.
��  !
Key
��! $
.
��$ %!
CodigoTipoDocumento
��% 8
.
��8 9
Value
��9 >
,
��> ?
NumeroDocumento
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
NumeroDocumento
��! 0
,
��0 1
CodigoFuente
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
CodigoFuente
�� *
.
��* +
Value
��+ 0
,
��0 1
CodigoSubFuente
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
CodigoSubFuente
��! 0
.
��0 1
Value
��1 6
,
��6 7
NombreFuente
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
NombreFuente
�� *
,
��* +
NombreSubFuente
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
NombreSubfuente
��! 0
,
��0 1
TelefonoFijo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
TelefonoFijo
�� *
,
��* +
TelefonoCelular
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
TelefonoCelular
��! 0
,
��0 1
FechaNacimiento
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
FechaNacimiento
��! 0
.
��0 1
Value
��1 6
,
��6 7
	Direccion
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
	Direccion
�� $
,
��$ %
Departamento_Id
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
Departamento_Id
��! 0
,
��0 1
Provincia_Id
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Provincia_Id
�� *
,
��* +
Distrito_Id
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Distrito_Id
�� (
,
��( )
Departamento
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Departamento
�� *
,
��* +
	Provincia
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
	Provincia
�� $
,
��$ %
Distrito
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Distrito
�� "
,
��" #
Edad
��	 
=
�� 
DateTime
�� 
.
�� 
Now
�� 
.
�� 
Year
�� !
-
��" #
y
��$ %
.
��% &
Key
��& )
.
��) *
FechaNacimiento
��* 9
.
��9 :
Value
��: ?
.
��? @
Year
��@ D
,
��D E

CodigoSexo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 

CodigoSexo
�� &
.
��& '
Value
��' ,
,
��, -
Sexo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Sexo
�� 
,
�� 
Empresa
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Empresa
��  
,
��  !
CodigoCargo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
CodigoCargo
�� (
.
��( )
Value
��) .
,
��. /
NombreCargo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
NombreCargo
�� (
,
��( )
	OtroCargo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
	OtroCargo
�� $
,
��$ %
Referenciador
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Referenciador
�� ,
,
��, -
Hijos
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� $
NumeroHijosDependiente
�� -
.
��- .
Value
��. 3
,
��3 4
Correo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
��  
CorreoElectronico1
�� *
,
��* +
MonedaFondo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� !
MonedaPatrimonioAfp
�� 0
.
��0 1
Value
��1 6
,
��6 7

MontoFondo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
��  
MontoPatrimonioAfp
�� .
.
��. /
Value
��/ 4
,
��4 5
Fuente
��	 
=
�� 
string
�� 
.
�� 
Format
�� 
(
��  
$str
��  ,
,
��, -
y
��. /
.
��/ 0
Key
��0 3
.
��3 4
NombreFuente
��4 @
,
��@ A
string
��B H
.
��H I
IsNullOrEmpty
��I V
(
��V W
y
��W X
.
��X Y
Key
��Y \
.
��\ ]
NombreSubfuente
��] l
)
��l m
?
��n o
$str
��p r
:
��s t
$str
��u x
+
��y z
y
��{ |
.
��| }
Key��} �
.��� �
NombreSubfuente��� �
,��� �
y
�� 
.
�� 
Key
�� 
.
�� 
IdReferenciador
�� &
.
��& '
HasValue
��' /
?
��0 1
y
��2 3
.
��3 4
Key
��4 7
.
��7 8
NombreReferido
��8 F
+
��G H
$str
��I L
+
��M N
y
��O P
.
��P Q
Key
��Q T
.
��T U%
ApellidoPaternoReferido
��U l
+
��m n
$str
��o r
+
��s t
y
��u v
.
��v w
Key
��w z
.
��z {&
ApellidoMaternoReferido��{ �
:��� �
y��� �
.��� �
Key��� �
.��� �
Referenciador��� �
)��� �
,��� �
IdReferenciador
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
IdReferenciador
��! 0
.
��0 1
Value
��1 6
,
��6 7
FlagDescarte
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
FlagDescarte
�� *
,
��* +!
TextoMotivoDescarte
��	 
=
�� 
string
�� %
.
��% &
IsNullOrEmpty
��& 3
(
��3 4
y
��4 5
.
��5 6
Key
��6 9
.
��9 :
MotivoDescarteDos
��: K
)
��K L
?
��M N
y
��O P
.
��P Q
Key
��Q T
.
��T U
MotivoDescarteUno
��U f
:
�� 
string
�� 
.
�� 
Format
�� #
(
��# $
$str
��$ -
,
��- .
y
��/ 0
.
��0 1
Key
��1 4
.
��4 5
MotivoDescarteUno
��5 F
,
��F G
y
��H I
.
��I J
Key
��J M
.
��M N
MotivoDescarteDos
��N _
)
��_ `
,
��` a
PorcentajeAvance
��	 
=
�� 
(
�� 
int
��  
)
��  !
y
��! "
.
��" #
Max
��# &
(
��& '
x
��' (
=>
��) +
x
��, -
.
��- .
cporcentajeavance
��. ?
.
��? @
ValorNumerico
��@ M
)
��M N
,
��N O
DescripcionAvance
��	 
=
�� 
y
�� 
.
�� 
Max
�� "
(
��" #
x
��# $
=>
��% '
x
��( )
.
��) *
cporcentajeavance
��* ;
.
��; <
ValorNumerico
��< I
)
��I J
==
��K M
$num
��N Q
?
��R S
$str
��T \
:
��] ^
y
�� 
.
�� 
Max
�� "
(
��" #
x
��# $
=>
��% '
x
��( )
.
��) *
cporcentajeavance
��* ;
.
��; <
ValorNumerico
��< I
)
��I J
==
��K M
$num
��N P
?
��Q R
$str
��S d
:
��e f
y
�� 
.
�� 
Max
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
cporcentajeavance
�� ,
.
��, -
ValorNumerico
��- :
)
��: ;
==
��< >
$num
��? A
?
��B C
$str
��D P
:
��Q R
y
�� 
.
�� 
Max
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
cporcentajeavance
�� ,
.
��, -
ValorNumerico
��- :
)
��: ;
==
��< >
$num
��? A
?
��B C
$str
��D J
:
��J K
y
�� 
.
�� 
Max
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
cporcentajeavance
�� ,
.
��, -
ValorNumerico
��- :
)
��: ;
==
��< >
$num
��? A
?
��B C
$str
��D P
:
��Q R
y
�� 
.
�� 
Max
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
cporcentajeavance
�� ,
.
��, -
ValorNumerico
��- :
)
��: ;
==
��< >
$num
��? @
?
��A B
$str
��C R
:
��S T
$str
��U W
,
��W X&
PorcentajeAvanceAnterior
��	 !
=
��" #
(
��$ %
int
��% (
)
��( )
(
��) *
(
��* +
(
��+ ,
from
��, 0
citamax
��1 8
in
��9 ;
_context
��< D
.
��D E
Citas
��E J
join
�� 
porcentajeavance
�� )
in
��* ,
_context
��- 5
.
��5 6
TablaTablas
��6 A
on
��B D
new
��E H
{
��I J
citamax
��K R
.
��R S0
"CodigoPorcentajeAvanceCalificacion
��S u
,
��u v&
idtablaporcentajeavance��w �
=��� �

TablaTabla��� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
�� 
new
�� 
{
��  0
"CodigoPorcentajeAvanceCalificacion
��! C
=
��D E
(
��F G
short
��G L
?
��L M
)
��M N
porcentajeavance
��N ^
.
��^ _
CodigoCampo
��_ j
,
��j k&
idtablaporcentajeavance��l �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �!
CitaMaxPorcentaje��� �
from
�� %
citamaxporcentajeavance
�� 0
in
��1 3
CitaMaxPorcentaje
��4 E
.
��E F
DefaultIfEmpty
��F T
(
��T U
)
��U V
where
�� 
citamax
�� !
.
��! "
IdProspecto
��" -
==
��. 0
y
��1 2
.
��2 3
Key
��3 6
.
��6 7
IdProspecto
��7 B
select
�� 
new
�� 
{
��  
citamax
��! (
,
��( )%
citamaxporcentajeavance
��* A
}
��B C
)
�� 
.
�� 
GroupBy
�� 
(
�� 
x
�� 
=>
��  
new
��! $
{
��% &
x
��' (
.
��( )
citamax
��) 0
.
��0 1
IdProspecto
��1 <
}
��= >
)
��> ?
.
�� 
Select
�� 
(
�� 
y
�� 
=>
�� 
new
�� "
{
��# $
PorcentajeMaximo
�� #
=
��$ %
y
��& '
.
��' (
Max
��( +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3%
citamaxporcentajeavance
��3 J
.
��J K
ValorNumerico
��K X
.
��X Y
Value
��Y ^
)
��^ _
}
�� 
)
�� 
)
�� 
.
�� 
First
�� 
(
�� 
)
�� 
.
�� 
PorcentajeMaximo
�� .
)
��. /
,
��/ 0
VisibleDescarte
��	 
=
�� 
(
�� 
y
�� 
.
�� 
Key
�� !
.
��! "
FlagDescarte
��" .
.
��. /
Value
��/ 4
||
��5 7
y
��8 9
.
��9 :
Max
��: =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
cporcentajeavance
��E V
.
��V W
ValorNumerico
��W d
)
��d e
==
��f h
$num
��i l
)
��l m
?
��n o
false
��p u
:
��v w
true
��x |
,
��| }
VisibleAgendar
��	 
=
�� 
y
�� 
.
�� 
Max
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
cporcentajeavance
��' 8
.
��8 9
ValorNumerico
��9 F
)
��F G
==
��H J
$num
��K N
?
��O P
false
��Q V
:
��W X
true
��Y ]
,
��] ^
FechaCreacion
��	 
=
�� 
y
�� 
.
�� 
Max
�� 
(
�� 
x
��  
=>
��! #
x
��$ %
.
��% &
p
��& '
.
��' ($
AuditoriaFechaCreacion
��( >
)
��> ?
,
��? @!
FechaEstimadaCierre
��	 
=
�� 
y
��  
.
��  !
Max
��! $
(
��$ %
x
��% &
=>
��' )
x
��* +
.
��+ ,
c
��, -
.
��- .!
FechaEstimadaCierre
��. A
)
��A B
,
��B C"
FechaUltimaActividad
��	 
=
�� 
y
��  !
.
��! "
Max
��" %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
c
��- .
.
��. /$
AuditoriaFechaCreacion
��/ E
)
��E F
,
��F G
Producto
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Producto
�� "
}
�� 	
)
��	 

;
��
 
return
�� 
result
�� 
;
�� 
}
�� 
public
�� 

IQueryable
��	 
<
�� 
	Prospecto
�� 
>
�� #
ObtenerAgendadosCitas
�� 4
(
��4 5"
ProspectoQueryFilter
��5 I"
prospectoQueryFilter
��J ^
)
��^ _
{
�� 
var
�� !
listcodigorangosexo
�� 
=
�� "
prospectoQueryFilter
�� 1
.
��1 2

codigosexo
��2 <
!=
��= ?
null
��@ D
?
��E F"
prospectoQueryFilter
��G [
.
��[ \

codigosexo
��\ f
.
��f g
Split
��g l
(
��l m
$char
��m p
)
��p q
.
��q r
Select
��r x
(
��x y
short
��y ~
.
��~ 
Parse�� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� !
listcodigorangoedad
�� 
=
�� "
prospectoQueryFilter
�� 1
.
��1 2
codigorangoedad
��2 A
!=
��B D
null
��E I
?
��J K"
prospectoQueryFilter
��L `
.
��` a
codigorangoedad
��a p
.
��p q
Split
��q v
(
��v w
$char
��w z
)
��z {
.
��{ |
Select��| �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� #
listcodigorangofuente
�� 
=
�� "
prospectoQueryFilter
�� 3
.
��3 4
codigofuente
��4 @
!=
��A C
null
��D H
?
��I J"
prospectoQueryFilter
��K _
.
��_ `
codigofuente
��` l
.
��l m
Split
��m r
(
��r s
$char
��s v
)
��v w
.
��w x
Select
��x ~
(
��~ 
short�� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� &
listcodigorangosubfuente
�� 
=
��  !"
prospectoQueryFilter
��" 6
.
��6 7
codigosubfuente
��7 F
!=
��G I
null
��J N
?
��O P"
prospectoQueryFilter
��Q e
.
��e f
codigosubfuente
��f u
.
��u v
Split
��v {
(
��{ |
$char
��| 
)�� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� $
listcodigorangoingreso
�� 
=
�� "
prospectoQueryFilter
��  4
.
��4 5 
codigorangoingreso
��5 G
!=
��H J
null
��K O
?
��P Q"
prospectoQueryFilter
��R f
.
��f g 
codigorangoingreso
��g y
.
��y z
Split
��z 
(�� �
$char��� �
)��� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� "
listcodigorangofondo
�� 
=
�� "
prospectoQueryFilter
�� 2
.
��2 3
codigorangofondo
��3 C
!=
��D F
null
��G K
?
��L M"
prospectoQueryFilter
��N b
.
��b c
codigorangofondo
��c s
.
��s t
Split
��t y
(
��y z
$char
��z }
)
��} ~
.
��~ 
Select�� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� 
result
�� 
=
�� 
(
��  !
from
��! %
c
��& '
in
��( *
_context
��+ 3
.
��3 4
Citas
��4 9
join
��	 
p
�� 
in
�� 
_context
�� 
.
�� 

Prospectos
�� &
on
��' )
c
��* +
.
��+ ,
IdProspecto
��, 7
equals
��8 >
p
��? @
.
��@ A
IdProspecto
��A L
join
��	 
intermediario
�� 
in
�� 
_context
�� '
.
��' ('
ConsolidadoIntermediarios
��( A
on
��B D
p
��E F
.
��F G(
IdConsolidadoIntermediario
��G a
equals
��b h
intermediario
��i v
.
��v w)
IdConsolidadoIntermediario��w �
join
��	 
adn
�� 
in
�� 
_context
�� 
.
�� 
	AdnRentas
�� '
on
��( *
p
��+ ,
.
��, -
IdProspecto
��- 8
equals
��9 ?
adn
��@ C
.
��C D
IdProspecto
��D O
into
��P T
ProspectoAdn
��U a
from
��	 
padn
�� 
in
�� 
ProspectoAdn
�� "
.
��" #
DefaultIfEmpty
��# 1
(
��1 2
)
��2 3
join
��	 
fuente
�� 
in
�� 
_context
��  
.
��  !
ListaTablas
��! ,
on
��- /
new
��0 3
{
��4 5
p
��6 7
.
��7 8
CodigoFuente
��8 D
,
��D E
idtablafuente
��F S
=
��T U

TablaTabla
��V `
.
��` a
FuenteProspecto
��a p
,
��p q
lnegocio
��r z
=
��{ |
LineaNegocio��} �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoFuente
�� +
=
��, -
(
��. /
short
��/ 4
?
��4 5
)
��5 6
fuente
��6 <
.
��< =
CodigoCampo
��= H
,
��H I
idtablafuente
��J W
=
��X Y
fuente
��Z `
.
��` a
IdTabla
��a h
,
��h i
lnegocio
��j r
=
��s t
fuente
��u {
.
��{ |!
CodigoLineaNegocio��| �
}��� �
into��� �
ProspectoFuente��� �
from
��	 
pfuente
�� 
in
�� 
ProspectoFuente
�� (
.
��( )
DefaultIfEmpty
��) 7
(
��7 8
)
��8 9
join
��	 
	subfuente
�� 
in
�� 
_context
�� #
.
��# $
ListaTablas
��$ /
on
��0 2
new
��3 6
{
��7 8
p
��9 :
.
��: ;
CodigoSubFuente
��; J
,
��J K
idtablaSubfuente
��L \
=
��] ^

TablaTabla
��_ i
.
��i j
FuenteProspecto
��j y
,
��y z
lnegocio��{ �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoSubFuente
�� .
=
��/ 0
(
��1 2
short
��2 7
?
��7 8
)
��8 9
	subfuente
��9 B
.
��B C
CodigoCampo
��C N
,
��N O
idtablaSubfuente
��P `
=
��a b
	subfuente
��c l
.
��l m
IdTabla
��m t
,
��t u
lnegocio
��v ~
=�� �
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
��	 

psubfuente
�� 
in
��  
ProspectoSubFuente
�� .
.
��. /
DefaultIfEmpty
��/ =
(
��= >
)
��> ?
join
��	 
motivounodescarte
�� 
in
��  "
_context
��# +
.
��+ ,
ListaTablas
��, 7
on
��8 :
new
��; >
{
��? @
p
��A B
.
��B C%
CodigoMotivoUnoDescarte
��C Z
,
��Z [#
idtablamotivodescarte
��\ q
=
��r s

TablaTabla
��t ~
.
��~ 
MotivoDescarte�� �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoUnoDescarte
�� 6
=
��7 8
(
��9 :
short
��: ?
?
��? @
)
��@ A
motivounodescarte
��A R
.
��R S
CodigoCampo
��S ^
,
��^ _#
idtablamotivodescarte
��` u
=
��v w 
motivounodescarte��x �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoUnoDescarte��� �
from
��	  
pmotivounodescarte
��  
in
��! #(
ProspectoMotivoUnoDescarte
��$ >
.
��> ?
DefaultIfEmpty
��? M
(
��M N
)
��N O
join
��	 
motivodosdescarte
�� 
in
��  "
_context
��# +
.
��+ ,
ListaTablas
��, 7
on
��8 :
new
��; >
{
��? @
p
��A B
.
��B C%
CodigoMotivoDosDescarte
��C Z
,
��Z [#
idtablamotivodescarte
��\ q
=
��r s

TablaTabla
��t ~
.
��~ 
MotivoDescarte�� �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoDosDescarte
�� 6
=
��7 8
(
��9 :
short
��: ?
?
��? @
)
��@ A
motivodosdescarte
��A R
.
��R S
CodigoCampo
��S ^
,
��^ _#
idtablamotivodescarte
��` u
=
��v w 
motivodosdescarte��x �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoDosDescarte��� �
from
��	  
pmotivodosdescarte
��  
in
��! #(
ProspectoMotivoDosDescarte
��$ >
.
��> ?
DefaultIfEmpty
��? M
(
��M N
)
��N O
join
��	 
referido
�� 
in
�� 
_context
�� "
.
��" #

Prospectos
��# -
on
��. 0
p
��1 2
.
��2 3
IdReferenciador
��3 B
equals
��C I
referido
��J R
.
��R S
IdProspecto
��S ^
into
��_ c
ProspectoReferido
��d u
from
��	 
	preferido
�� 
in
�� 
ProspectoReferido
�� ,
.
��, -
DefaultIfEmpty
��- ;
(
��; <
)
��< =
join
��	 
cargo
�� 
in
�� 
_context
�� 
.
��  
TablaTablas
��  +
on
��, .
new
��/ 2
{
��3 4
p
��5 6
.
��6 7
CodigoCargo
��7 B
,
��B C
idtablacargo
��D P
=
��Q R

TablaTabla
��S ]
.
��] ^
PersonaCargo
��^ j
}
��k l
equals
�� 
new
�� 
{
�� 
CodigoCargo
�� )
=
��* +
(
��, -
short
��- 2
?
��2 3
)
��3 4
cargo
��4 9
.
��9 :
CodigoCampo
��: E
,
��E F
idtablacargo
��G S
=
��T U
cargo
��V [
.
��[ \
IdTabla
��\ c
}
��d e
into
��f j
ProspectoCargo
��k y
from
��	 
pcargo
�� 
in
�� 
ProspectoCargo
�� &
.
��& '
DefaultIfEmpty
��' 5
(
��5 6
)
��6 7
join
��	 
sexo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� *
on
��+ -
new
��. 1
{
��2 3
p
��4 5
.
��5 6

CodigoSexo
��6 @
,
��@ A
idtablasexo
��B M
=
��N O

TablaTabla
��P Z
.
��Z [
Sexo
��[ _
}
��` a
equals
�� 
new
�� 
{
�� 

CodigoSexo
��  *
=
��+ ,
(
��- .
short
��. 3
?
��3 4
)
��4 5
sexo
��5 9
.
��9 :
CodigoCampo
��: E
,
��E F
idtablasexo
��G R
=
��S T
sexo
��U Y
.
��Y Z
IdTabla
��Z a
}
��b c
into
��d h
ProspectoSexo
��i v
from
��	 
psexo
�� 
in
�� 
ProspectoSexo
�� $
.
��$ %
DefaultIfEmpty
��% 3
(
��3 4
)
��4 5
join
��	 
	direccion
�� 
in
�� 
_context
�� #
.
��# $!
DireccionProspectos
��$ 7
on
��8 :
p
��; <
.
��< =
IdProspecto
��= H
equals
��I O
	direccion
��P Y
.
��Y Z
IdProspecto
��Z e
into
��f j 
ProspectoDireccion
��k }
from
��	 

pdireccion
�� 
in
��  
ProspectoDireccion
�� .
.
��. /
DefaultIfEmpty
��/ =
(
��= >
)
��> ?
join
��	 
distrito
�� 
in
�� 
_context
�� "
.
��" #
	Distritos
��# ,
on
��- /
new
��0 3
{
��4 5

pdireccion
��6 @
.
��@ A
Departamento_Id
��A P
,
��P Q

pdireccion
��R \
.
��\ ]
Provincia_Id
��] i
,
��i j

pdireccion
��k u
.
��u v
Distrito_Id��v �
}��� �
equals
�� 
new
�� 
{
�� 
distrito
�� '
.
��' (
Departamento_Id
��( 7
,
��7 8
distrito
��9 A
.
��A B
Provincia_Id
��B N
,
��N O
distrito
��P X
.
��X Y
Distrito_Id
��Y d
}
��e f
into
��g k
DireccionDistrito
��l }
from
��	 
	ddistrito
�� 
in
�� 
DireccionDistrito
�� ,
.
��, -
DefaultIfEmpty
��- ;
(
��; <
)
��< =
join
��	 
	provincia
�� 
in
�� 
_context
�� #
.
��# $

Provincias
��$ .
on
��/ 1
new
��2 5
{
��6 7

pdireccion
��8 B
.
��B C
Provincia_Id
��C O
,
��O P

pdireccion
��Q [
.
��[ \
Departamento_Id
��\ k
}
��l m
equals
�� 
new
�� 
{
��  
	provincia
��! *
.
��* +
Provincia_Id
��+ 7
,
��7 8
	provincia
��9 B
.
��B C
Departamento_Id
��C R
}
��S T
into
��U Y 
DireccionProvincia
��Z l
from
��	 

dprovincia
�� 
in
��  
DireccionProvincia
�� .
.
��. /
DefaultIfEmpty
��/ =
(
��= >
)
��> ?
join
��	 
departamento
�� 
in
�� 
_context
�� &
.
��& '
Departamentos
��' 4
on
��5 7

pdireccion
��8 B
.
��B C
Departamento_Id
��C R
equals
��S Y
departamento
��Z f
.
��f g
Departamento_Id
��g v
into
��w {$
DireccionDepartamento��| �
from
��	 
ddepartamento
�� 
in
�� #
DireccionDepartamento
�� 4
.
��4 5
DefaultIfEmpty
��5 C
(
��C D
)
��D E
join
��	 
lineanegocio
�� 
in
�� 
_context
�� &
.
��& '
TablaTablas
��' 2
on
��3 5
new
��6 9
{
��: ;
c
��< =
.
��= > 
CodigoLineaNegocio
��> P
,
��P Q!
idtablalineanegocio
��R e
=
��f g

TablaTabla
��h r
.
��r s
LineaNegocio
��s 
}��� �
equals
�� 
new
�� 
{
��  
CodigoLineaNegocio
��  2
=
��3 4
(
��5 6
short
��6 ;
?
��; <
)
��< =
lineanegocio
��= I
.
��I J
CodigoCampo
��J U
,
��U V!
idtablalineanegocio
��W j
=
��k l
lineanegocio
��m y
.
��y z
IdTabla��z �
}��� �
into��� �%
ProspectoLineaNegocio��� �
from
��	 
plineanegocio
�� 
in
�� #
ProspectoLineaNegocio
�� 4
.
��4 5
DefaultIfEmpty
��5 C
(
��C D
)
��D E
join
��	 
porcentajeavance
�� 
in
�� !
_context
��" *
.
��* +
TablaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
c
��@ A
.
��A B0
"CodigoPorcentajeAvanceCalificacion
��B d
,
��d e%
idtablaporcentajeavance
��f }
=
��~ 

TablaTabla��� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
�� 
new
�� 
{
�� 0
"CodigoPorcentajeAvanceCalificacion
��  B
=
��C D
(
��E F
short
��F K
?
��K L
)
��L M
porcentajeavance
��M ]
.
��] ^
CodigoCampo
��^ i
,
��i j&
idtablaporcentajeavance��k �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �
CitaPorcentaje��� �
from
��	 
cporcentajeavance
�� 
in
��  "
CitaPorcentaje
��# 1
.
��1 2
DefaultIfEmpty
��2 @
(
��@ A
)
��A B
where
��	 
(
�� 
intermediario
�� 
.
�� !
CodigoIntermediario
�� 1
==
��2 4"
prospectoQueryFilter
��5 I
.
��I J!
codigointermediario
��J ]
)
��] ^
&&
��_ a
(
�� 
p
�� 
.
�� 
Nombres
�� 
.
�� 
Contains
�� 
(
�� "
prospectoQueryFilter
�� 3
.
��3 4
	parametro
��4 =
)
��= >
||
��? A
p
��B C
.
��C D
ApellidoPaterno
��D S
.
��S T
Contains
��T \
(
��\ ]"
prospectoQueryFilter
��] q
.
��q r
	parametro
��r {
)
��{ |
||
��} 
p
�� 
.
�� 
ApellidoMaterno
�� 
.
�� 
Contains
�� &
(
��& '"
prospectoQueryFilter
��' ;
.
��; <
	parametro
��< E
)
��E F
||
��G I
p
��J K
.
��K L
Referenciador
��L Y
.
��Y Z
Contains
��Z b
(
��b c"
prospectoQueryFilter
��c w
.
��w x
	parametro��x �
)��� �
||��� �
p��� �
.��� �
NumeroDocumento��� �
.��� �
Contains��� �
(��� �$
prospectoQueryFilter��� �
.��� �
	parametro��� �
)��� �
)��� �
&&��� �
(
�� 
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� &
>=
��' )"
prospectoQueryFilter
��* >
.
��> ?!
fechacreacioninicio
��? R
||
��S U"
prospectoQueryFilter
��V j
.
��j k!
fechacreacioninicio
��k ~
==�� �
null��� �
)��� �
&&��� �
(
��
 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� #
<=
��$ &"
prospectoQueryFilter
��' ;
.
��; <
fechacreacionfin
��< L
||
��M O"
prospectoQueryFilter
��P d
.
��d e
fechacreacionfin
��e u
==
��v x
null
��y }
)
��} ~
)
��~ 
&&��� �
(
��
 
(
�� 
c
�� 
.
�� !
FechaEstimadaCierre
�� !
>=
��" $"
prospectoQueryFilter
��% 9
.
��9 :'
fechaestimadacierreinicio
��: S
||
��T V"
prospectoQueryFilter
��W k
.
��k l(
fechaestimadacierreinicio��l �
==��� �
null��� �
)��� �
&&��� �
(
��
 
c
�� 
.
�� !
FechaEstimadaCierre
��  
<=
��! #"
prospectoQueryFilter
��$ 8
.
��8 9$
fechaestimadacierrefin
��9 O
||
��P R"
prospectoQueryFilter
��S g
.
��g h$
fechaestimadacierrefin
��h ~
==�� �
null��� �
)��� �
)��� �
&&��� �
(
�� 
(
�� "
prospectoQueryFilter
�� "
.
��" #
fechacreacioncita
��# 4
==
��5 7
null
��7 ;
)
��; <
||
��= ?
(
��@ A
c
��A B
.
��B C$
AuditoriaFechaCreacion
��C Y
.
��Y Z
Value
��Z _
.
��_ `
Date
��` d
==
��e g"
prospectoQueryFilter
��h |
.
��| } 
fechacreacioncita��} �
.��� �
Value��� �
.��� �
Date��� �
)��� �
)��� �
&&��� �
(
�� 
c
�� 
.
�� 
FlagCalificacion
�� 
==
��  "
null
��# '
)
��' (
&&
��) +
(
��, -
c
��- .
.
��. /$
CodigoMotivoReagendado
��/ E
==
��F H
null
��I M
||
��N P
c
��Q R
.
��R S$
CodigoMotivoReagendado
��S i
==
��j l
$num
��m n
||
��o q
c
��r s
.
��s t%
CodigoMotivoReagendado��t �
==��� �
$num��� �
)��� �
&&��� �
(
�� !
listcodigorangoedad
��  
.
��  !
Contains
��! )
(
��) *
p
��* +
.
��+ ,
CodigoRangoEdad
��, ;
.
��; <
Value
��< A
)
��A B
||
��C E!
listcodigorangoedad
��F Y
==
��Z \
null
��] a
)
��a b
&&
��c e
(
�� !
listcodigorangosexo
��  
.
��  !
Contains
��! )
(
��) *
p
��* +
.
��+ ,

CodigoSexo
��, 6
.
��6 7
Value
��7 <
)
��< =
||
��> @!
listcodigorangosexo
��A T
==
��U W
null
��X \
)
��\ ]
&&
��^ `
(
�� #
listcodigorangofuente
�� "
.
��" #
Contains
��# +
(
��+ ,
p
��, -
.
��- .
CodigoFuente
��. :
.
��: ;
Value
��; @
)
��@ A
||
��B D#
listcodigorangofuente
��E Z
==
��[ ]
null
��^ b
)
��b c
&&
��d f
(
�� &
listcodigorangosubfuente
�� %
.
��% &
Contains
��& .
(
��. /
p
��/ 0
.
��0 1
CodigoSubFuente
��1 @
.
��@ A
Value
��A F
)
��F G
||
��H J&
listcodigorangosubfuente
��K c
==
��d f
null
��g k
)
��k l
&&
��m o
(
�� $
listcodigorangoingreso
�� #
.
��# $
Contains
��$ ,
(
��, -
p
��- .
.
��. / 
CodigoRangoIngreso
��/ A
.
��A B
Value
��B G
)
��G H
||
��I K$
listcodigorangoingreso
��L b
==
��c e
null
��f j
)
��j k
&&
��l n
(
�� "
listcodigorangofondo
�� !
.
��! "
Contains
��" *
(
��* +
p
��+ ,
.
��, -
CodigoRangoFondo
��- =
.
��= >
Value
��> C
)
��C D
||
��E G"
listcodigorangofondo
��H \
==
��] _
null
��` d
)
��d e
select
��	 
new
�� 
{
��	 

p
��
 
,
�� 
c
��
 
,
�� 
padn
��
 
,
�� 
	preferido
��
 
,
�� 
pfuente
��
 
,
�� 

psubfuente
��
 
,
�� 
psexo
��
 
,
�� 
pcargo
��
 
,
�� 

pdireccion
��
 
,
�� 
	ddistrito
��
 
,
�� 

dprovincia
��
 
,
�� 
ddepartamento
��
 
,
��  
pmotivounodescarte
��
 
,
��  
pmotivodosdescarte
��
 
,
�� 
plineanegocio
��
 
,
�� 
cporcentajeavance
��
 
}
��	 

)
��
 
.
�� 
AsNoTracking
�� 
(
�� 
)
�� 
.
�� 
GroupBy
�� "
(
��" #
x
��# $
=>
��% '
new
��( +
{
��, -
x
��- .
.
��. /
p
��/ 0
.
��0 1
IdProspecto
��1 <
,
��< =
x
��= >
.
��> ?
p
��? @
.
��@ A
Nombres
��A H
,
��H I
x
��I J
.
��J K
p
��K L
.
��L M
ApellidoPaterno
��M \
,
��\ ]
x
��] ^
.
��^ _
p
��_ `
.
��` a
ApellidoMaterno
��a p
,
��p q
x
�� 	
.
��	 

p
��
 
.
�� !
CodigoTipoDocumento
�� 
,
��  
x
��  !
.
��! "
p
��" #
.
��# $
NumeroDocumento
��$ 3
,
��3 4
x
��4 5
.
��5 6
p
��6 7
.
��7 8
CodigoFuente
��8 D
,
��D E
x
��E F
.
��F G
p
��G H
.
��H I
CodigoSubFuente
��I X
,
��X Y
NombreFuente
��Y e
=
��e f
x
��f g
.
��g h
pfuente
��h o
.
��o p
ValorCadena
��p {
,
��{ |
NombreSubfuente
�� 
=
�� 
x
�� 
.
�� 

psubfuente
�� %
.
��% &
ValorCadena
��& 1
,
��1 2
x
��2 3
.
��3 4
p
��4 5
.
��5 6
TelefonoFijo
��6 B
,
��B C
x
��C D
.
��D E
p
��E F
.
��F G
TelefonoCelular
��G V
,
��V W
x
��W X
.
��X Y
p
��Y Z
.
��Z [
FechaNacimiento
��[ j
,
��j k
NombreReferido
�� 
=
�� 
x
�� 
.
�� 
	preferido
�� $
.
��$ %
Nombres
��% ,
,
��, -%
ApellidoPaternoReferido
��- D
=
��E F
x
��G H
.
��H I
	preferido
��I R
.
��R S
ApellidoPaterno
��S b
,
��b c%
ApellidoMaternoReferido
��d {
=
��| }
x
��~ 
.�� �
	preferido��� �
.��� �
ApellidoMaterno��� �
,��� �
x
�� 
.
�� 

pdireccion
�� 
.
�� 
	Direccion
�� !
,
��! "
x
��" #
.
��# $

pdireccion
��$ .
.
��. /
Departamento_Id
��/ >
,
��> ?
x
��? @
.
��@ A

pdireccion
��A K
.
��K L
Provincia_Id
��L X
,
��X Y
x
��Y Z
.
��Z [

pdireccion
��[ e
.
��e f
Distrito_Id
��f q
,
��q r
Departamento
�� 
=
�� 
x
�� 
.
�� 
ddepartamento
�� %
.
��% &
Nombre
��& ,
,
��, -
	Provincia
��- 6
=
��7 8
x
��9 :
.
��: ;

dprovincia
��; E
.
��E F
Nombre
��F L
,
��L M
Distrito
��M U
=
��U V
x
��W X
.
��X Y
	ddistrito
��Y b
.
��b c
Nombre
��c i
,
��i j
x
�� 	
.
��	 

p
��
 
.
�� 

CodigoSexo
�� 
,
�� 
Sexo
�� 
=
�� 
x
�� 
.
�� 
psexo
�� $
.
��$ %!
ValorAuxiliarCadena
��% 8
,
��8 9
x
��9 :
.
��: ;
p
��; <
.
��< =
Empresa
��= D
,
��D E
x
��E F
.
��F G
p
��G H
.
��H I
CodigoCargo
��I T
,
��T U
NombreCargo
��U `
=
��a b
x
��b c
.
��c d
pcargo
��d j
.
��j k
ValorCadena
��k v
,
��v w
x
��w x
.
��x y
p
��y z
.
��z {
	OtroCargo��{ �
,��� �
x��� �
.��� �
p��� �
.��� �
Referenciador��� �
,��� �
x
�� 	
.
��	 

padn
��
 
.
�� $
NumeroHijosDependiente
�� %
,
��% &
x
��& '
.
��' (
p
��( )
.
��) * 
CorreoElectronico1
��* <
,
��< =
x
��= >
.
��> ?
p
��? @
.
��@ A
MonedaFondo
��A L
,
��L M
x
��M N
.
��N O
p
��O P
.
��P Q

MontoFondo
��Q [
,
��[ \
x
��\ ]
.
��] ^
p
��^ _
.
��_ `
IdReferenciador
��` o
,
��o p
x
�� 	
.
��	 

p
��
 
.
�� 
FlagDescarte
�� 
,
�� 
MotivoDescarteUno
�� *
=
��+ ,
x
��- .
.
��. / 
pmotivodosdescarte
��/ A
.
��A B
ValorCadena
��B M
,
��M N
MotivoDescarteDos
��N _
=
��` a
x
��a b
.
��b c 
pmotivounodescarte
��c u
.
��u v
ValorCadena��v �
,��� �
Producto
�� 
=
�� 
x
�� 
.
�� 
plineanegocio
�� !
.
��! "
ValorCadena
��" -
,
��- .
x
��. /
.
��/ 0
padn
��0 4
.
��4 5!
MonedaPatrimonioAfp
��5 H
,
��H I
x
��I J
.
��J K
padn
��K O
.
��O P 
MontoPatrimonioAfp
��P b
}
��c d
)
��d e
.
��e f
Select
��f l
(
��l m
y
��m n
=>
��o q
new
��r u
	Prospecto
��v 
(�� �
)��� �
{
��	 

IdProspecto
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
IdProspecto
�� (
,
��( )
Nombres
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Nombres
��  
,
��  !
ApellidoPaterno
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
ApellidoPaterno
��! 0
,
��0 1
ApellidoMaterno
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
ApellidoMaterno
��! 0
,
��0 1
NombresApellidos
��	 
=
�� 
string
�� "
.
��" #
Format
��# )
(
��) *
$str
��* 7
,
��7 8
y
��9 :
.
��: ;
Key
��; >
.
��> ?
Nombres
��? F
,
��F G
y
��H I
.
��I J
Key
��J M
.
��M N
ApellidoPaterno
��N ]
,
��] ^
y
��_ `
.
��` a
Key
��a d
.
��d e
ApellidoMaterno
��e t
)
��t u
,
��u v!
CodigoTipoDocumento
��	 
=
�� 
y
��  
.
��  !
Key
��! $
.
��$ %!
CodigoTipoDocumento
��% 8
.
��8 9
Value
��9 >
,
��> ?
NumeroDocumento
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
NumeroDocumento
��! 0
,
��0 1
CodigoFuente
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
CodigoFuente
�� *
.
��* +
Value
��+ 0
,
��0 1
CodigoSubFuente
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
CodigoSubFuente
��! 0
.
��0 1
Value
��1 6
,
��6 7
NombreFuente
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
NombreFuente
�� *
,
��* +
NombreSubFuente
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
NombreSubfuente
��! 0
,
��0 1
TelefonoFijo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
TelefonoFijo
�� *
,
��* +
TelefonoCelular
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
TelefonoCelular
��! 0
,
��0 1
FechaNacimiento
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
FechaNacimiento
��! 0
.
��0 1
Value
��1 6
,
��6 7
	Direccion
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
	Direccion
�� $
,
��$ %
Departamento_Id
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
Departamento_Id
��! 0
,
��0 1
Provincia_Id
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Provincia_Id
�� *
,
��* +
Distrito_Id
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Distrito_Id
�� (
,
��( )
Departamento
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Departamento
�� *
,
��* +
	Provincia
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
	Provincia
�� $
,
��$ %
Distrito
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Distrito
�� "
,
��" #
Edad
��	 
=
�� 
DateTime
�� 
.
�� 
Now
�� 
.
�� 
Year
�� !
-
��" #
y
��$ %
.
��% &
Key
��& )
.
��) *
FechaNacimiento
��* 9
.
��9 :
Value
��: ?
.
��? @
Year
��@ D
,
��D E

CodigoSexo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 

CodigoSexo
�� &
.
��& '
Value
��' ,
,
��, -
Sexo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Sexo
�� 
,
�� 
Empresa
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Empresa
��  
,
��  !
CodigoCargo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
CodigoCargo
�� (
.
��( )
Value
��) .
,
��. /
NombreCargo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
NombreCargo
�� (
,
��( )
	OtroCargo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
	OtroCargo
�� $
,
��$ %
Referenciador
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Referenciador
�� ,
,
��, -
Hijos
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� $
NumeroHijosDependiente
�� -
.
��- .
Value
��. 3
,
��3 4
Correo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
��  
CorreoElectronico1
�� *
,
��* +
MonedaFondo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� !
MonedaPatrimonioAfp
�� 0
.
��0 1
Value
��1 6
,
��6 7

MontoFondo
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
��  
MontoPatrimonioAfp
�� .
.
��. /
Value
��/ 4
,
��4 5
Fuente
��	 
=
�� 
string
�� 
.
�� 
Format
�� 
(
��  
$str
��  ,
,
��, -
y
��. /
.
��/ 0
Key
��0 3
.
��3 4
NombreFuente
��4 @
,
��@ A
string
��B H
.
��H I
IsNullOrEmpty
��I V
(
��V W
y
��W X
.
��X Y
Key
��Y \
.
��\ ]
NombreSubfuente
��] l
)
��l m
?
��n o
$str
��p r
:
��s t
$str
��u x
+
��y z
y
��{ |
.
��| }
Key��} �
.��� �
NombreSubfuente��� �
,��� �
y
�� 
.
�� 
Key
�� 
.
�� 
IdReferenciador
�� &
.
��& '
HasValue
��' /
?
��0 1
y
��2 3
.
��3 4
Key
��4 7
.
��7 8
NombreReferido
��8 F
+
��G H
$str
��I L
+
��M N
y
��O P
.
��P Q
Key
��Q T
.
��T U%
ApellidoPaternoReferido
��U l
+
��m n
$str
��o r
+
��s t
y
��u v
.
��v w
Key
��w z
.
��z {&
ApellidoMaternoReferido��{ �
:��� �
y��� �
.��� �
Key��� �
.��� �
Referenciador��� �
)��� �
,��� �
IdReferenciador
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
IdReferenciador
��! 0
.
��0 1
Value
��1 6
,
��6 7
FlagDescarte
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
FlagDescarte
�� *
,
��* +&
PorcentajeAvanceAnterior
��	 !
=
��# $
(
��% &
int
��& )
)
��) *
(
��* +
(
��+ ,
(
��, -
from
��- 1
citamax
��2 9
in
��: <
_context
��= E
.
��E F
Citas
��F K
join
�� 
porcentajeavance
�� /
in
��0 2
_context
��3 ;
.
��; <
TablaTablas
��< G
on
��H J
new
��K N
{
��O P
citamax
��Q X
.
��X Y0
"CodigoPorcentajeAvanceCalificacion
��Y {
,
��{ |&
idtablaporcentajeavance��} �
=��� �

TablaTabla��� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
��  
new
��! $
{
��% &0
"CodigoPorcentajeAvanceCalificacion
��' I
=
��J K
(
��L M
short
��M R
?
��R S
)
��S T
porcentajeavance
��T d
.
��d e
CodigoCampo
��e p
,
��p q&
idtablaporcentajeavance��r �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �!
CitaMaxPorcentaje��� �
from
�� %
citamaxporcentajeavance
�� 6
in
��7 9
CitaMaxPorcentaje
��: K
.
��K L
DefaultIfEmpty
��L Z
(
��Z [
)
��[ \
where
�� 
citamax
��  '
.
��' (
IdProspecto
��( 3
==
��4 6
y
��7 8
.
��8 9
Key
��9 <
.
��< =
IdProspecto
��= H
select
��  
new
��! $
{
��% &
citamax
��' .
,
��. /%
citamaxporcentajeavance
��0 G
}
��H I
)
�� 
.
�� 
GroupBy
�� 
(
�� 
x
�� 
=>
��  
new
��! $
{
��% &
x
��' (
.
��( )
citamax
��) 0
.
��0 1
IdProspecto
��1 <
}
��= >
)
��> ?
.
�� 
Select
�� 
(
�� 
y
�� 
=>
�� 
new
�� "
{
��# $
PorcentajeMaximo
�� #
=
��$ %
y
��& '
.
��' (
Max
��( +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3%
citamaxporcentajeavance
��3 J
.
��J K
ValorNumerico
��K X
.
��X Y
Value
��Y ^
)
��^ _
}
�� 
)
�� 
)
�� 
.
�� 
First
�� 
(
�� 
)
�� 
.
�� 
PorcentajeMaximo
�� .
)
��. /
,
��/ 0!
TextoMotivoDescarte
��	 
=
�� 
string
�� %
.
��% &
IsNullOrEmpty
��& 3
(
��3 4
y
��4 5
.
��5 6
Key
��6 9
.
��9 :
MotivoDescarteDos
��: K
)
��K L
?
��M N
y
��O P
.
��P Q
Key
��Q T
.
��T U
MotivoDescarteUno
��U f
:
�� 
string
�� 
.
�� 
Format
�� #
(
��# $
$str
��$ -
,
��- .
y
��/ 0
.
��0 1
Key
��1 4
.
��4 5
MotivoDescarteUno
��5 F
,
��F G
y
��H I
.
��I J
Key
��J M
.
��M N
MotivoDescarteDos
��N _
)
��_ `
,
��` a
VisibleDescarte
��	 
=
�� 
y
�� 
.
�� 
Key
��  
.
��  !
FlagDescarte
��! -
.
��- .
Value
��. 3
?
��4 5
false
��6 ;
:
��< =
true
��> B
,
��B C
VisibleAgendar
��	 
=
�� 
(
�� 
y
�� 
.
�� 
Key
��  
.
��  !
FlagDescarte
��! -
.
��- .
Value
��. 3
||
��4 6"
prospectoQueryFilter
��7 K
.
��K L
tab
��L O
==
��P R
$str
��S h
)
��h i
?
��j k
true
��l p
:
��q r
false
��s x
,
��x y
FechaCreacion
��	 
=
�� 
y
�� 
.
�� 
Max
�� 
(
�� 
x
��  
=>
��! #
x
��$ %
.
��% &
p
��& '
.
��' ($
AuditoriaFechaCreacion
��( >
)
��> ?
,
��? @"
FechaUltimaActividad
��	 
=
�� 
y
��  !
.
��! "
Max
��" %
(
��% &
x
��& '
=>
��( *
x
��+ ,
.
��, -
c
��- .
.
��. /$
AuditoriaFechaCreacion
��/ E
)
��E F
,
��F G
Producto
��	 
=
�� 
y
�� 
.
�� 
Key
�� 
.
�� 
Producto
�� "
}
�� 	
)
��	 

;
��
 
return
�� 
result
�� 
;
�� 
}
�� 
public
�� 

IQueryable
��	 
<
�� 
	Prospecto
�� 
>
�� 1
#ObtenerAgendadosRecordatorioLlamada
�� B
(
��B C"
ProspectoQueryFilter
��C W"
prospectoQueryFilter
��X l
,
��l m
List
��n r
<
��r s
int
��s v
>
��v w
idsprospecto��x �
)��� �
{
�� 
var
�� !
listcodigorangosexo
�� 
=
�� "
prospectoQueryFilter
�� 1
.
��1 2

codigosexo
��2 <
!=
��= ?
null
��@ D
?
��E F"
prospectoQueryFilter
��G [
.
��[ \

codigosexo
��\ f
.
��f g
Split
��g l
(
��l m
$char
��m p
)
��p q
.
��q r
Select
��r x
(
��x y
short
��y ~
.
��~ 
Parse�� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� !
listcodigorangoedad
�� 
=
�� "
prospectoQueryFilter
�� 1
.
��1 2
codigorangoedad
��2 A
!=
��B D
null
��E I
?
��J K"
prospectoQueryFilter
��L `
.
��` a
codigorangoedad
��a p
.
��p q
Split
��q v
(
��v w
$char
��w z
)
��z {
.
��{ |
Select��| �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� #
listcodigorangofuente
�� 
=
�� "
prospectoQueryFilter
�� 3
.
��3 4
codigofuente
��4 @
!=
��A C
null
��D H
?
��I J"
prospectoQueryFilter
��K _
.
��_ `
codigofuente
��` l
.
��l m
Split
��m r
(
��r s
$char
��s v
)
��v w
.
��w x
Select
��x ~
(
��~ 
short�� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� &
listcodigorangosubfuente
�� 
=
��  !"
prospectoQueryFilter
��" 6
.
��6 7
codigosubfuente
��7 F
!=
��G I
null
��J N
?
��O P"
prospectoQueryFilter
��Q e
.
��e f
codigosubfuente
��f u
.
��u v
Split
��v {
(
��{ |
$char
��| 
)�� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� $
listcodigorangoingreso
�� 
=
�� "
prospectoQueryFilter
��  4
.
��4 5 
codigorangoingreso
��5 G
!=
��H J
null
��K O
?
��P Q"
prospectoQueryFilter
��R f
.
��f g 
codigorangoingreso
��g y
.
��y z
Split
��z 
(�� �
$char��� �
)��� �
.��� �
Select��� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� "
listcodigorangofondo
�� 
=
�� "
prospectoQueryFilter
�� 2
.
��2 3
codigorangofondo
��3 C
!=
��D F
null
��G K
?
��L M"
prospectoQueryFilter
��N b
.
��b c
codigorangofondo
��c s
.
��s t
Split
��t y
(
��y z
$char
��z }
)
��} ~
.
��~ 
Select�� �
(��� �
short��� �
.��� �
Parse��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
;��� �
var
�� 
result
�� 
=
�� 
(
��  !
from
�� 
r
�� 
in
�� 
_context
�� 
.
�� "
RecordatorioLlamadas
�� /
join
�� 
p
�� 
in
�� 
_context
�� 
.
�� 

Prospectos
�� %
on
��& (
r
��) *
.
��* +
IdProspecto
��+ 6
equals
��7 =
p
��> ?
.
��? @
IdProspecto
��@ K
join
�� 
intermediario
�� 
in
�� 
_context
�� &
.
��& ''
ConsolidadoIntermediarios
��' @
on
��A C
p
��D E
.
��E F(
IdConsolidadoIntermediario
��F `
equals
��a g
intermediario
��h u
.
��u v)
IdConsolidadoIntermediario��v �
join
�� 
adn
�� 
in
�� 
_context
�� 
.
�� 
	AdnRentas
�� &
on
��' )
p
��* +
.
��+ ,
IdProspecto
��, 7
equals
��8 >
adn
��? B
.
��B C
IdProspecto
��C N
into
��O S
ProspectoAdn
��T `
from
�� 
padn
�� 
in
�� 
ProspectoAdn
�� !
.
��! "
DefaultIfEmpty
��" 0
(
��0 1
)
��1 2
join
�� 
fuente
�� 
in
�� 
_context
�� 
.
��  
ListaTablas
��  +
on
��, .
new
��/ 2
{
��3 4
p
��5 6
.
��6 7
CodigoFuente
��7 C
,
��C D
idtablafuente
��E R
=
��S T

TablaTabla
��U _
.
��_ `
FuenteProspecto
��` o
,
��o p
lnegocio
��q y
=
��z {
LineaNegocio��| �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoFuente
�� *
=
��+ ,
(
��- .
short
��. 3
?
��3 4
)
��4 5
fuente
��5 ;
.
��; <
CodigoCampo
��< G
,
��G H
idtablafuente
��I V
=
��W X
fuente
��Y _
.
��_ `
IdTabla
��` g
,
��g h
lnegocio
��i q
=
��r s
fuente
��t z
.
��z {!
CodigoLineaNegocio��{ �
}��� �
into��� �
ProspectoFuente��� �
from
�� 
pfuente
�� 
in
�� 
ProspectoFuente
�� '
.
��' (
DefaultIfEmpty
��( 6
(
��6 7
)
��7 8
join
�� 
	subfuente
�� 
in
�� 
_context
�� "
.
��" #
ListaTablas
��# .
on
��/ 1
new
��2 5
{
��6 7
p
��8 9
.
��9 :
CodigoSubFuente
��: I
,
��I J
idtablaSubfuente
��K [
=
��\ ]

TablaTabla
��^ h
.
��h i
FuenteProspecto
��i x
,
��x y
lnegocio��z �
=��� �
LineaNegocio��� �
.��� �
Renta��� �
}��� �
equals
�� 
new
�� 
{
�� 
CodigoSubFuente
�� -
=
��. /
(
��0 1
short
��1 6
?
��6 7
)
��7 8
	subfuente
��8 A
.
��A B
CodigoCampo
��B M
,
��M N
idtablaSubfuente
��O _
=
��` a
	subfuente
��b k
.
��k l
IdTabla
��l s
,
��s t
lnegocio
��u }
=
��~ 
	subfuente��� �
.��� �"
CodigoLineaNegocio��� �
}��� �
into��� �"
ProspectoSubFuente��� �
from
�� 

psubfuente
�� 
in
��  
ProspectoSubFuente
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
motivounodescarte
�� 
in
�� !
_context
��" *
.
��* +
ListaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
p
��@ A
.
��A B%
CodigoMotivoUnoDescarte
��B Y
,
��Y Z#
idtablamotivodescarte
��[ p
=
��q r

TablaTabla
��s }
.
��} ~
MotivoDescarte��~ �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoUnoDescarte
�� 5
=
��6 7
(
��8 9
short
��9 >
?
��> ?
)
��? @
motivounodescarte
��@ Q
.
��Q R
CodigoCampo
��R ]
,
��] ^#
idtablamotivodescarte
��_ t
=
��u v 
motivounodescarte��w �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoUnoDescarte��� �
from
��  
pmotivounodescarte
�� 
in
��  "(
ProspectoMotivoUnoDescarte
��# =
.
��= >
DefaultIfEmpty
��> L
(
��L M
)
��M N
join
�� 
motivodosdescarte
�� 
in
�� !
_context
��" *
.
��* +
ListaTablas
��+ 6
on
��7 9
new
��: =
{
��> ?
p
��@ A
.
��A B%
CodigoMotivoDosDescarte
��B Y
,
��Y Z#
idtablamotivodescarte
��[ p
=
��q r

TablaTabla
��s }
.
��} ~
MotivoDescarte��~ �
}��� �
equals
�� 
new
�� 
{
�� %
CodigoMotivoDosDescarte
�� 5
=
��6 7
(
��8 9
short
��9 >
?
��> ?
)
��? @
motivodosdescarte
��@ Q
.
��Q R
CodigoCampo
��R ]
,
��] ^#
idtablamotivodescarte
��_ t
=
��u v 
motivodosdescarte��w �
.��� �
IdTabla��� �
}��� �
into��� �*
ProspectoMotivoDosDescarte��� �
from
��  
pmotivodosdescarte
�� 
in
��  "(
ProspectoMotivoDosDescarte
��# =
.
��= >
DefaultIfEmpty
��> L
(
��L M
)
��M N
join
�� 
referido
�� 
in
�� 
_context
�� !
.
��! "

Prospectos
��" ,
on
��- /
p
��0 1
.
��1 2
IdReferenciador
��2 A
equals
��B H
referido
��I Q
.
��Q R
IdProspecto
��R ]
into
��^ b
ProspectoReferido
��c t
from
�� 
	preferido
�� 
in
�� 
ProspectoReferido
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
cargo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� *
on
��+ -
new
��. 1
{
��2 3
p
��4 5
.
��5 6
CodigoCargo
��6 A
,
��A B
idtablacargo
��C O
=
��P Q

TablaTabla
��R \
.
��\ ]
PersonaCargo
��] i
}
��j k
equals
�� 
new
�� 
{
�� 
CodigoCargo
��  +
=
��, -
(
��. /
short
��/ 4
?
��4 5
)
��5 6
cargo
��6 ;
.
��; <
CodigoCampo
��< G
,
��G H
idtablacargo
��I U
=
��V W
cargo
��X ]
.
��] ^
IdTabla
��^ e
}
��f g
into
��h l
ProspectoCargo
��m {
from
�� 
pcargo
�� 
in
�� 
ProspectoCargo
�� %
.
��% &
DefaultIfEmpty
��& 4
(
��4 5
)
��5 6
join
�� 
sexo
�� 
in
�� 
_context
�� 
.
�� 
TablaTablas
�� )
on
��* ,
new
��- 0
{
��1 2
p
��3 4
.
��4 5

CodigoSexo
��5 ?
,
��? @
idtablasexo
��A L
=
��M N

TablaTabla
��O Y
.
��Y Z
Sexo
��Z ^
}
��_ `
equals
�� 
new
�� 
{
�� 

CodigoSexo
�� )
=
��* +
(
��, -
short
��- 2
?
��2 3
)
��3 4
sexo
��4 8
.
��8 9
CodigoCampo
��9 D
,
��D E
idtablasexo
��F Q
=
��R S
sexo
��T X
.
��X Y
IdTabla
��Y `
}
��a b
into
��c g
ProspectoSexo
��h u
from
�� 
psexo
�� 
in
�� 
ProspectoSexo
�� #
.
��# $
DefaultIfEmpty
��$ 2
(
��2 3
)
��3 4
join
�� 
	direccion
�� 
in
�� 
_context
�� "
.
��" #!
DireccionProspectos
��# 6
on
��7 9
p
��: ;
.
��; <
IdProspecto
��< G
equals
��H N
	direccion
��O X
.
��X Y
IdProspecto
��Y d
into
��e i 
ProspectoDireccion
��j |
from
�� 

pdireccion
�� 
in
��  
ProspectoDireccion
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
distrito
�� 
in
�� 
_context
�� !
.
��! "
	Distritos
��" +
on
��, .
new
��/ 2
{
��3 4

pdireccion
��5 ?
.
��? @
Departamento_Id
��@ O
,
��O P

pdireccion
��Q [
.
��[ \
Provincia_Id
��\ h
,
��h i

pdireccion
��j t
.
��t u
Distrito_Id��u �
}��� �
equals
�� 
new
�� 
{
�� 
distrito
�� &
.
��& '
Departamento_Id
��' 6
,
��6 7
distrito
��8 @
.
��@ A
Provincia_Id
��A M
,
��M N
distrito
��O W
.
��W X
Distrito_Id
��X c
}
��d e
into
��f j
DireccionDistrito
��k |
from
�� 
	ddistrito
�� 
in
�� 
DireccionDistrito
�� +
.
��+ ,
DefaultIfEmpty
��, :
(
��: ;
)
��; <
join
�� 
	provincia
�� 
in
�� 
_context
�� "
.
��" #

Provincias
��# -
on
��. 0
new
��1 4
{
��5 6

pdireccion
��7 A
.
��A B
Provincia_Id
��B N
,
��N O

pdireccion
��P Z
.
��Z [
Departamento_Id
��[ j
}
��k l
equals
�� 
new
�� 
{
�� 
	provincia
��  )
.
��) *
Provincia_Id
��* 6
,
��6 7
	provincia
��8 A
.
��A B
Departamento_Id
��B Q
}
��R S
into
��T X 
DireccionProvincia
��Y k
from
�� 

dprovincia
�� 
in
��  
DireccionProvincia
�� -
.
��- .
DefaultIfEmpty
��. <
(
��< =
)
��= >
join
�� 
departamento
�� 
in
�� 
_context
�� %
.
��% &
Departamentos
��& 3
on
��4 6

pdireccion
��7 A
.
��A B
Departamento_Id
��B Q
equals
��R X
departamento
��Y e
.
��e f
Departamento_Id
��f u
into
��v z$
DireccionDepartamento��{ �
from
�� 
ddepartamento
�� 
in
�� #
DireccionDepartamento
�� 3
.
��3 4
DefaultIfEmpty
��4 B
(
��B C
)
��C D
join
�� 
lineanegocio
�� 
in
�� 
_context
�� %
.
��% &
TablaTablas
��& 1
on
��2 4
new
��5 8
{
��9 :
r
��; <
.
��< = 
CodigoLineaNegocio
��= O
,
��O P!
idtablalineanegocio
��Q d
=
��e f

TablaTabla
��g q
.
��q r
LineaNegocio
��r ~
}�� �
equals
�� 
new
�� 
{
��  
CodigoLineaNegocio
�� 1
=
��2 3
(
��4 5
short
��5 :
?
��: ;
)
��; <
lineanegocio
��< H
.
��H I
CodigoCampo
��I T
,
��T U!
idtablalineanegocio
��V i
=
��j k
lineanegocio
��l x
.
��x y
IdTabla��y �
}��� �
into��� �%
ProspectoLineaNegocio��� �
from
�� 
plineanegocio
�� 
in
�� #
ProspectoLineaNegocio
�� 3
.
��3 4
DefaultIfEmpty
��4 B
(
��B C
)
��C D
where
�� 
(
�� 
intermediario
�� 
.
�� !
CodigoIntermediario
�� 0
==
��1 3"
prospectoQueryFilter
��4 H
.
��H I!
codigointermediario
��I \
)
��\ ]
&&
��^ `
(
��
 
p
�� 
.
�� 
Nombres
�� 
.
�� 
Contains
�� 
(
�� "
prospectoQueryFilter
�� 2
.
��2 3
	parametro
��3 <
)
��< =
||
��> @
p
��A B
.
��B C
ApellidoPaterno
��C R
.
��R S
Contains
��S [
(
��[ \"
prospectoQueryFilter
��\ p
.
��p q
	parametro
��q z
)
��z {
||
��| ~
p
�� 
.
�� 
ApellidoMaterno
�� 
.
�� 
Contains
�� %
(
��% &"
prospectoQueryFilter
��& :
.
��: ;
	parametro
��; D
)
��D E
||
��F H
p
��I J
.
��J K
Referenciador
��K X
.
��X Y
Contains
��Y a
(
��a b"
prospectoQueryFilter
��b v
.
��v w
	parametro��w �
)��� �
||��� �
p��� �
.��� �
NumeroDocumento��� �
.��� �
Contains��� �
(��� �$
prospectoQueryFilter��� �
.��� �
	parametro��� �
)��� �
)��� �
&&��� �
(
�� 
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� %
>=
��& ("
prospectoQueryFilter
��) =
.
��= >!
fechacreacioninicio
��> Q
||
��R T"
prospectoQueryFilter
��U i
.
��i j!
fechacreacioninicio
��j }
==��~ �
null��� �
)��� �
&&��� �
(
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� %
<=
��& ("
prospectoQueryFilter
��) =
.
��= >
fechacreacionfin
��> N
||
��O Q"
prospectoQueryFilter
��R f
.
��f g
fechacreacionfin
��g w
==
��x z
null
��{ 
)�� �
)��� �
&&��� �
(
�� 
r
�� 
.
�� $
AuditoriaFechaCreacion
�� $
.
��$ %
Value
��% *
.
��* +
Date
��+ /
==
��0 2
DateTime
��3 ;
.
��; <
Now
��< ?
.
��? @
Date
��@ D
)
��D E
&&
��F H
(
�� 
r
�� 
.
�� 

FlagActivo
�� 
.
�� 
Value
�� 
)
�� 
&&
��  "
!
�� 
idsprospecto
�� 
.
�� 
Contains
�� !
(
��! "
p
��" #
.
��# $
IdProspecto
��$ /
)
��/ 0
&&
��1 3
(
�� !
listcodigorangoedad
�� 
.
��  
Contains
��  (
(
��( )
p
��) *
.
��* +
CodigoRangoEdad
��+ :
.
��: ;
Value
��; @
)
��@ A
||
��B D!
listcodigorangoedad
��E X
==
��Y [
null
��\ `
)
��` a
&&
��b d
(
�� !
listcodigorangosexo
�� 
.
��  
Contains
��  (
(
��( )
p
��) *
.
��* +

CodigoSexo
��+ 5
.
��5 6
Value
��6 ;
)
��; <
||
��= ?!
listcodigorangosexo
��@ S
==
��T V
null
��W [
)
��[ \
&&
��] _
(
�� #
listcodigorangofuente
�� !
.
��! "
Contains
��" *
(
��* +
p
��+ ,
.
��, -
CodigoFuente
��- 9
.
��9 :
Value
��: ?
)
��? @
||
��A C#
listcodigorangofuente
��D Y
==
��Z \
null
��] a
)
��a b
&&
��c e
(
�� &
listcodigorangosubfuente
�� $
.
��$ %
Contains
��% -
(
��- .
p
��. /
.
��/ 0
CodigoSubFuente
��0 ?
.
��? @
Value
��@ E
)
��E F
||
��G I&
listcodigorangosubfuente
��J b
==
��c e
null
��f j
)
��j k
&&
��l n
(
�� $
listcodigorangoingreso
�� "
.
��" #
Contains
��# +
(
��+ ,
p
��, -
.
��- . 
CodigoRangoIngreso
��. @
.
��@ A
Value
��A F
)
��F G
||
��H J$
listcodigorangoingreso
��K a
==
��b d
null
��e i
)
��i j
&&
��k m
(
�� "
listcodigorangofondo
��  
.
��  !
Contains
��! )
(
��) *
p
��* +
.
��+ ,
CodigoRangoFondo
��, <
.
��< =
Value
��= B
)
��B C
||
��D F"
listcodigorangofondo
��G [
==
��\ ^
null
��_ c
)
��c d
select
�� 
new
�� 
{
�� 	
p
��	 

,
��
 
r
��	 

,
��
 
padn
��	 
,
�� 
	preferido
��	 
,
�� 
pfuente
��	 
,
�� 

psubfuente
��	 
,
�� 
psexo
��	 
,
�� 
pcargo
��	 
,
�� 

pdireccion
��	 
,
�� 
	ddistrito
��	 
,
�� 

dprovincia
��	 
,
�� 
ddepartamento
��	 
,
��  
pmotivounodescarte
��	 
,
��  
pmotivodosdescarte
��	 
,
�� 
plineanegocio
��	 
}
�� 	
)
��	 

.
��
 
AsNoTracking
�� 
(
�� 
)
�� 
.
�� 
Select
��  
(
��  !
x
��! "
=>
��# %
new
��& )
	Prospecto
��* 3
{
�� 	
IdProspecto
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdProspecto
�� &
,
��& '
NombresApellidos
��	 
=
�� 
string
�� "
.
��" #
Format
��# )
(
��) *
$str
��* 7
,
��7 8
x
��9 :
.
��: ;
p
��; <
.
��< =
Nombres
��= D
,
��D E
x
��F G
.
��G H
p
��H I
.
��I J
ApellidoPaterno
��J Y
,
��Y Z
x
��[ \
.
��\ ]
p
��] ^
.
��^ _
ApellidoMaterno
��_ n
)
��n o
,
��o p!
CodigoTipoDocumento
��	 
=
�� 
x
��  
.
��  !
p
��! "
.
��" #!
CodigoTipoDocumento
��# 6
.
��6 7
Value
��7 <
,
��< =
NumeroDocumento
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
NumeroDocumento
�� .
,
��. /
Nombres
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Nombres
�� 
,
�� 
ApellidoPaterno
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoPaterno
�� .
,
��. /
ApellidoMaterno
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
ApellidoMaterno
�� .
,
��. /
CodigoFuente
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoFuente
�� (
.
��( )
Value
��) .
,
��. /
CodigoSubFuente
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoSubFuente
�� .
.
��. /
Value
��/ 4
,
��4 5
NombreFuente
��	 
=
�� 
x
�� 
.
�� 
pfuente
�� !
.
��! "
ValorCadena
��" -
,
��- .
NombreSubFuente
��	 
=
�� 
x
�� 
.
�� 

psubfuente
�� '
.
��' (
ValorCadena
��( 3
,
��3 4
TelefonoFijo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoFijo
�� (
,
��( )
TelefonoCelular
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
TelefonoCelular
�� .
,
��. /
FechaNacimiento
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FechaNacimiento
�� .
.
��. /
Value
��/ 4
,
��4 5
	Direccion
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� !
.
��! "
	Direccion
��" +
,
��+ ,
Departamento_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� '
.
��' (
Departamento_Id
��( 7
,
��7 8
Provincia_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� $
.
��$ %
Provincia_Id
��% 1
,
��1 2
Distrito_Id
��	 
=
�� 
x
�� 
.
�� 

pdireccion
�� #
.
��# $
Distrito_Id
��$ /
,
��/ 0
Departamento
��	 
=
�� 
x
�� 
.
�� 
ddepartamento
�� '
.
��' (
Nombre
��( .
,
��. /
	Provincia
��	 
=
�� 
x
�� 
.
�� 

dprovincia
�� !
.
��! "
Nombre
��" (
,
��( )
Distrito
��	 
=
�� 
x
�� 
.
�� 
	ddistrito
�� 
.
��  
Nombre
��  &
,
��& '
Edad
��	 
=
�� 
DateTime
�� 
.
�� 
Now
�� 
.
�� 
Year
�� !
-
��" #
x
��$ %
.
��% &
p
��& '
.
��' (
FechaNacimiento
��( 7
.
��7 8
Value
��8 =
.
��= >
Year
��> B
,
��B C

CodigoSexo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 

CodigoSexo
�� $
.
��$ %
Value
��% *
,
��* +
Sexo
��	 
=
�� 
x
�� 
.
�� 
psexo
�� 
.
�� !
ValorAuxiliarCadena
�� +
,
��+ ,
Empresa
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Empresa
�� 
,
�� 
CodigoCargo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
CodigoCargo
�� &
.
��& '
Value
��' ,
,
��, -
NombreCargo
��	 
=
�� 
x
�� 
.
�� 
pcargo
�� 
.
��  
ValorCadena
��  +
,
��+ ,
	OtroCargo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
	OtroCargo
�� "
,
��" #
Referenciador
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
Referenciador
�� *
,
��* +
Hijos
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
�� $
NumeroHijosDependiente
�� .
.
��. /
Value
��/ 4
,
��4 5
Correo
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
��  
CorreoElectronico1
�� (
,
��( )&
PorcentajeAvanceAnterior
��	 !
=
��# $
(
��% &
int
��& )
)
��) *
(
��* +
(
��+ ,
(
��, -
from
��- 1
citamax
��2 9
in
��: <
_context
��= E
.
��E F
Citas
��F K
join
�� 
porcentajeavance
�� /
in
��0 2
_context
��3 ;
.
��; <
TablaTablas
��< G
on
��H J
new
��K N
{
��O P
citamax
��Q X
.
��X Y0
"CodigoPorcentajeAvanceCalificacion
��Y {
,
��{ |&
idtablaporcentajeavance��} �
=��� �

TablaTabla��� �
.��� �,
PorcentajeAvanceCalificacion��� �
}��� �
equals
��  
new
��! $
{
��% &0
"CodigoPorcentajeAvanceCalificacion
��' I
=
��J K
(
��L M
short
��M R
?
��R S
)
��S T
porcentajeavance
��T d
.
��d e
CodigoCampo
��e p
,
��p q&
idtablaporcentajeavance��r �
=��� � 
porcentajeavance��� �
.��� �
IdTabla��� �
}��� �
into��� �!
CitaMaxPorcentaje��� �
from
�� %
citamaxporcentajeavance
�� 6
in
��7 9
CitaMaxPorcentaje
��: K
.
��K L
DefaultIfEmpty
��L Z
(
��Z [
)
��[ \
where
�� 
citamax
��  '
.
��' (
IdProspecto
��( 3
==
��4 6
x
��7 8
.
��8 9
p
��9 :
.
��: ;
IdProspecto
��; F
select
��  
new
��! $
{
��% &
citamax
��' .
,
��. /%
citamaxporcentajeavance
��0 G
}
��H I
)
�� 
.
�� 
GroupBy
�� 
(
�� 
x
�� 
=>
��  
new
��! $
{
��% &
x
��' (
.
��( )
citamax
��) 0
.
��0 1
IdProspecto
��1 <
}
��= >
)
��> ?
.
�� 
Select
�� 
(
�� 
y
�� 
=>
�� 
new
�� "
{
��# $
PorcentajeMaximo
�� #
=
��$ %
y
��& '
.
��' (
Max
��( +
(
��+ ,
x
��, -
=>
��. 0
x
��1 2
.
��2 3%
citamaxporcentajeavance
��3 J
.
��J K
ValorNumerico
��K X
.
��X Y
Value
��Y ^
)
��^ _
}
�� 
)
�� 
)
�� 
.
�� 
First
�� 
(
�� 
)
�� 
.
�� 
PorcentajeMaximo
�� .
)
��. /
,
��/ 0
MonedaFondo
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
�� !
MonedaPatrimonioAfp
�� 1
.
��1 2
Value
��2 7
,
��7 8

MontoFondo
��	 
=
�� 
x
�� 
.
�� 
padn
�� 
.
��  
MontoPatrimonioAfp
�� /
.
��/ 0
Value
��0 5
,
��5 6
Fuente
��	 
=
�� 
string
�� 
.
�� 
Format
�� 
(
��  
$str
��  ,
,
��, -
x
��. /
.
��/ 0
pfuente
��0 7
.
��7 8
ValorCadena
��8 C
,
��C D
string
��E K
.
��K L
IsNullOrEmpty
��L Y
(
��Y Z
x
��Z [
.
��[ \

psubfuente
��\ f
.
��f g
ValorCadena
��g r
)
��r s
?
��t u
$str
��v x
:
��y z
$str
��{ ~
+�� �
x��� �
.��� �

psubfuente��� �
.��� �
ValorCadena��� �
,��� �
x
�� 
.
�� 
p
�� 
.
�� 
IdReferenciador
�� $
.
��$ %
HasValue
��% -
?
��. /
x
��0 1
.
��1 2
	preferido
��2 ;
.
��; <
Nombres
��< C
+
��D E
$str
��F I
+
��J K
x
��L M
.
��M N
	preferido
��N W
.
��W X
ApellidoPaterno
��X g
+
��h i
$str
��j m
+
��n o
x
��p q
.
��q r
	preferido
��r {
.
��{ |
ApellidoMaterno��| �
:��� �
x��� �
.��� �
p��� �
.��� �
Referenciador��� �
)��� �
,��� �
IdReferenciador
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
IdReferenciador
�� .
.
��. /
Value
��/ 4
,
��4 5
FlagDescarte
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FlagDescarte
�� (
,
��( )!
TextoMotivoDescarte
��	 
=
�� 
string
�� %
.
��% &
IsNullOrEmpty
��& 3
(
��3 4
x
��4 5
.
��5 6 
pmotivodosdescarte
��6 H
.
��H I
ValorCadena
��I T
)
��T U
?
��V W
x
��X Y
.
��Y Z 
pmotivounodescarte
��Z l
.
��l m
ValorCadena
��m x
:
�� 
string
�� 
.
�� 
Format
�� #
(
��# $
$str
��$ -
,
��- .
x
��/ 0
.
��0 1 
pmotivounodescarte
��1 C
.
��C D
ValorCadena
��D O
,
��O P
x
��Q R
.
��R S 
pmotivodosdescarte
��S e
.
��e f
ValorCadena
��f q
)
��q r
,
��r s
VisibleDescarte
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� 
FlagDescarte
�� +
==
��, .
true
��/ 3
?
��4 5
false
��6 ;
:
��< =
true
��> B
,
��B C
VisibleAgendar
��	 
=
�� 
true
�� 
,
�� 
FechaCreacion
��	 
=
�� 
x
�� 
.
�� 
p
�� 
.
�� $
AuditoriaFechaCreacion
�� 3
,
��3 4"
FechaUltimaActividad
��	 
=
�� 
x
��  !
.
��! "
r
��" #
.
��# $$
AuditoriaFechaCreacion
��$ :
,
��: ;
Producto
��	 
=
�� 
x
�� 
.
�� 
plineanegocio
�� #
.
��# $
ValorCadena
��$ /
,
��/ 0
}
�� 	
)
��	 

;
��
 
return
�� 
result
�� 
;
�� 
}
�� 
}
�� 
}�� �[
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
status	 �
)
� �
;
� �
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
;	'' �
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
status	YY �
)
YY� �
;
YY� �
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
}ff ��
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
}{{ ��
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
$str	 �
)
� �
;
� �
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
$str	 �
)
� �
;
� �
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
$str	 �
)
� �
;
� �
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
TelefonoFijo	&&v �
)
&&� �
)
&&� �
;
&&� �
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
TelefonoCelular	((z �
)
((� �
)
((� �
;
((� �
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
$str	11[ �
)
11� �
;
11� �
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
}oo ū
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
$num	 �
)
� �
;
� �
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
$str	S �
)
� �
;
� �
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
}|| �2
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
#RecordatorioLlamadaProspectoCommand	a �
.
� �
TelefonoFijo
� �
)
� �
)
� �
;
� �
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
#RecordatorioLlamadaProspectoCommand	a �
.
� �
TelefonoCelular
� �
)
� �
)
� �
;
� �
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
})) �-
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
$str	Z �
)
� �
;
� �
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
}(( �
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
} ڒ
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
idIntermediario	33v �
:
33� �
int
33� �
.
33� �
Parse
33� �
(
33� �"
_headerConfiguration
33� �
.
33� �!
CodigoIntermediario
33� �
)
33� �
;
33� �
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
correlationId	55{ �
,
55� �
$str
55� �
)
55� �
;
55� �
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
$str	66~ �
+
66� �"
_headerConfiguration
66� �
.
66� �
correlationId
66� �
+
66� �
$str
66� �
+
66� �
$str
66� �
+
66� �
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
fechaactual	77{ �
+
77� �
$str
77� �
+
77� �"
_headerConfiguration
77� �
.
77� �
idIntermediario
77� �
+
77� �
$str
77� �
+
77� �"
_headerConfiguration
77� �
.
77� �!
CodigoIntermediario
77� �
)
77� �
;
77� �
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
correlationId	==} �
,
==� �
result
==� �
)
==� �
;
==� �
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
correlationId	>>x �
,
>>� �
$str
>>� �
,
>>� �
timeMeasure
>>� �
.
>>� �
Elapsed
>>� �
.
>>� �
TotalMilliseconds
>>� �
.
>>� �
ToString
>>� �
(
>>� �
)
>>� �
)
>>� �
;
>>� �
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
fechaactual	KKu �
)
KK� �
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
idIntermediario	OOz �
.
OO� �
ToString
OO� �
(
OO� �
)
OO� �
:
OO� �"
_headerConfiguration
OO� �
.
OO� �!
CodigoIntermediario
OO� �
;
OO� �
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
correlationId	QQ{ �
,
QQ� �
$str
QQ� �
)
QQ� �
;
QQ� �
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
$str	RR~ �
+
RR� �"
_headerConfiguration
RR� �
.
RR� �
correlationId
RR� �
+
RR� �
$str
RR� �
+
RR� �
$str
RR� �
+
RR� �
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
fechaactual	SS{ �
+
SS� �
$str
SS� �
+
SS� �"
_headerConfiguration
SS� �
.
SS� �
idIntermediario
SS� �
)
SS� �
;
SS� �
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
correlationId	YY} �
,
YY� �
result
YY� �
)
YY� �
;
YY� �
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
correlationId	ZZx �
,
ZZ� �
$str
ZZ� �
,
ZZ� �
timeMeasure
ZZ� �
.
ZZ� �
Elapsed
ZZ� �
.
ZZ� �
TotalMilliseconds
ZZ� �
.
ZZ� �
ToString
ZZ� �
(
ZZ� �
)
ZZ� �
)
ZZ� �
;
ZZ� �
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
correlationId	ll| �
,
ll� �
$str
ll� �
)
ll� �
;
ll� �
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
$str	mm �
+
mm� �"
_headerConfiguration
mm� �
.
mm� �
correlationId
mm� �
+
mm� �
$str
mm� �
+
mm� �
$str
mm� �
+
mm� �
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
$str	nnk �
+
nn� �"
_headerConfiguration
nn� �
.
nn� �
idIntermediario
nn� �
)
nn� �
;
nn� �
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
correlationId	tt~ �
,
tt� �
result
tt� �
)
tt� �
;
tt� �
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
correlationId	uuy �
,
uu� �
$str
uu� �
,
uu� �
timeMeasure
uu� �
.
uu� �
Elapsed
uu� �
.
uu� �
TotalMilliseconds
uu� �
.
uu� �
ToString
uu� �
(
uu� �
)
uu� �
)
uu� �
;
uu� �
returnww 
Okww 
(ww 
resultww 
)ww 
;ww 
}xx 	
}yy 
}zz ��
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
auditRequest	66| �
=
66� �"
_headerConfiguration
66� �
.
66� �
auditRequest
66� �
}
66� �
;
66� �
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
correlationId	;;u �
,
;;� �
$str
;;� �
)
;;� �
;
;;� �
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
correlationId	<<z �
,
<<� �
requestModel
<<� �
)
<<� �
;
<<� �
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
correlationId	DDw �
,
DD� �
result
DD� �
)
DD� �
;
DD� �
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
,	EE �
$str
EE� �
,
EE� �
timeMeasure
EE� �
.
EE� �
Elapsed
EE� �
.
EE� �
TotalMilliseconds
EE� �
.
EE� �
ToString
EE� �
(
EE� �
)
EE� �
)
EE� �
;
EE� �
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
actualizarCitaCommand	RRo �
)
RR� �
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
actualizarCitaCommand	TTt �
,
TT� �
auditRequest
TT� �
=
TT� �"
_headerConfiguration
TT� �
.
TT� �
auditRequest
TT� �
}
TT� �
;
TT� �
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
correlationId	YYu �
,
YY� �
$str
YY� �
)
YY� �
;
YY� �
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
correlationId	ZZz �
,
ZZ� �
requestModel
ZZ� �
)
ZZ� �
;
ZZ� �
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
correlationId	aaw �
,
aa� �
result
aa� �
)
aa� �
;
aa� �
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
,	bb �
$str
bb� �
,
bb� �
timeMeasure
bb� �
.
bb� �
Elapsed
bb� �
.
bb� �
TotalMilliseconds
bb� �
.
bb� �
ToString
bb� �
(
bb� �
)
bb� �
)
bb� �
;
bb� �
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
calificarCitaCommand	oom �
)
oo� �
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
calificarCitaCommand	qqr �
,
qq� �
auditRequest
qq� �
=
qq� �"
_headerConfiguration
qq� �
.
qq� �
auditRequest
qq� �
}
qq� �
;
qq� �
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
correlationId	vvv �
,
vv� �
$str
vv� �
)
vv� �
;
vv� �
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
correlationId	ww{ �
,
ww� �
requestModel
ww� �
)
ww� �
;
ww� �
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
correlationId	~~x �
,
~~� �
result
~~� �
)
~~� �
;
~~� �
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
correlationId	s �
,
� �
$str
� �
,
� �
timeMeasure
� �
.
� �
Elapsed
� �
.
� �
TotalMilliseconds
� �
.
� �
ToString
� �
(
� �
)
� �
)
� �
;
� �
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� (
)
��( )
]
��) *
[
�� 	
SwaggerOperation
��	 
(
�� 
Summary
�� !
=
��" #
$str
��$ 9
,
��9 :
Description
��; F
=
��G H
$str
��I ^
)
��^ _
]
��_ `
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %
Status200OK
��% 0
,
��0 1
type
��2 6
:
��6 7
typeof
��8 >
(
��> ?
ResponseModel
��? L
<
��L M

AgendaCita
��M W
>
��W X
)
��X Y
)
��Y Z
]
��Z [
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,
Status200OK
��, 7
,
��7 8
typeof
��9 ?
(
��? @3
%ResponseObtenerNumeroCitaQueryExample
��@ e
)
��e f
)
��f g
]
��g h
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %*
Status500InternalServerError
��% A
,
��A B
type
��C G
:
��G H
typeof
��I O
(
��O P
ResponseModel
��P ]
<
��] ^

AgendaCita
��^ h
>
��h i
)
��i j
)
��j k
]
��k l
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,*
Status500InternalServerError
��, H
,
��H I
typeof
��J P
(
��P Q0
"ResponseInternalServerModelExample
��Q s
)
��s t
)
��t u
]
��u v
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
<
��& '
ResponseModel
��' 4
<
��4 5

AgendaCita
��5 ?
>
��? @
>
��@ A
>
��A B
ObtenerNumeroCita
��C T
(
��T U
string
��U [
idprospecto
��\ g
)
��g h
{
�� 	
	Stopwatch
�� 
timeMeasure
�� !
=
��" #
new
��$ '
	Stopwatch
��( 1
(
��1 2
)
��2 3
;
��3 4
timeMeasure
�� 
.
�� 
Start
�� 
(
�� 
)
�� 
;
��  
_impresionLog
�� 
.
�� 
InicioMetodo
�� &
(
��& '
$str
��' ;
,
��; <"
_headerConfiguration
��= Q
.
��Q R
idTransaccion
��R _
,
��_ `"
_headerConfiguration
��a u
.
��u v
correlationId��v �
,��� �
$str��� �
)��� �
;��� �
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# -
,
��- .
$str
��/ F
+
��G H
$str
��I Q
+
��R S"
_headerConfiguration
��T h
.
��h i
idTransaccion
��i v
+
��w x
$str��y �
+��� �$
_headerConfiguration��� �
.��� �
correlationId��� �
+��� �
$str��� �
+��� �
$str��� �
+��� �
JsonConvert
��  
.
��  !
SerializeObject
��! 0
(
��0 1"
_headerConfiguration
��1 E
.
��E F
auditRequest
��F R
,
��R S

Formatting
��T ^
.
��^ _
Indented
��_ g
)
��g h
+
��i j
$str
��k z
+
��{ |
idprospecto��} �
)��� �
;��� �
var
�� 
result
�� 
=
�� 
await
�� 
_citaQueries
�� +
.
��+ ,
ObtenerNumeroCita
��, =
(
��= >
idprospecto
��> I
,
��I J"
_headerConfiguration
��J ^
.
��^ _
idIntermediario
��_ n
)
��n o
;
��o p
result
�� 
.
�� 
auditResponse
��  
.
��  !
idTransaccion
��! .
=
��/ 0"
_headerConfiguration
��1 E
.
��E F
idTransaccion
��F S
;
��S T
timeMeasure
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
�� 
_impresionLog
�� 
.
�� 
DatosFinMetodo
�� (
(
��( )
$str
��) =
,
��= >"
_headerConfiguration
��? S
.
��S T
idTransaccion
��T a
,
��a b"
_headerConfiguration
��c w
.
��w x
correlationId��x �
,��� �
result��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
	FinMetodo
�� #
(
��# $
$str
��$ 8
,
��8 9"
_headerConfiguration
��: N
.
��N O
idTransaccion
��O \
,
��\ ]"
_headerConfiguration
��^ r
.
��r s
correlationId��s �
,��� �
$str��� �
,��� �
timeMeasure��� �
.��� �
Elapsed��� �
.��� �!
TotalMilliseconds��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� =
)
��= >
]
��> ?
[
�� 	
SwaggerOperation
��	 
(
�� 
Summary
�� !
=
��" #
$str
��$ H
,
��H I
Description
��J U
=
��V W
$str
��X |
)
��| }
]
��} ~
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %
Status200OK
��% 0
,
��0 1
type
��2 6
:
��6 7
typeof
��8 >
(
��> ?
ResponseModel
��? L
<
��L M

AgendaCita
��M W
>
��W X
)
��X Y
)
��Y Z
]
��Z [
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,
Status200OK
��, 7
,
��7 8
typeof
��9 ?
(
��? @3
%ResponseObtenerNumeroCitaQueryExample
��@ e
)
��e f
)
��f g
]
��g h
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %*
Status500InternalServerError
��% A
,
��A B
type
��C G
:
��G H
typeof
��I O
(
��O P
ResponseModel
��P ]
<
��] ^

AgendaCita
��^ h
>
��h i
)
��i j
)
��j k
]
��k l
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,*
Status500InternalServerError
��, H
,
��H I
typeof
��J P
(
��P Q0
"ResponseInternalServerModelExample
��Q s
)
��s t
)
��t u
]
��u v
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
<
��& '
ResponseModel
��' 4
<
��4 5

AgendaCita
��5 ?
>
��? @
>
��@ A
>
��A B%
ValidarFechaHorarioCita
��C Z
(
��Z [
string
��[ a
	fechacita
��b k
,
��k l
string
��m s

horainicio
��t ~
,
��~ 
string��� �
horafin��� �
)��� �
{
�� 	
	Stopwatch
�� 
timeMeasure
�� !
=
��" #
new
��$ '
	Stopwatch
��( 1
(
��1 2
)
��2 3
;
��3 4
timeMeasure
�� 
.
�� 
Start
�� 
(
�� 
)
�� 
;
��  
_impresionLog
�� 
.
�� 
InicioMetodo
�� &
(
��& '
$str
��' ;
,
��; <"
_headerConfiguration
��= Q
.
��Q R
idTransaccion
��R _
,
��_ `"
_headerConfiguration
��a u
.
��u v
correlationId��v �
,��� �
$str��� �
)��� �
;��� �
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# -
,
��- .
$str
��/ F
+
��G H
$str
��I Q
+
��R S"
_headerConfiguration
��T h
.
��h i
idTransaccion
��i v
+
��w x
$str��y �
+��� �$
_headerConfiguration��� �
.��� �
correlationId��� �
+��� �
$str��� �
+��� �
$str��� �
+��� �
JsonConvert
��  
.
��  !
SerializeObject
��! 0
(
��0 1"
_headerConfiguration
��1 E
.
��E F
auditRequest
��F R
,
��R S

Formatting
��T ^
.
��^ _
Indented
��_ g
)
��g h
+
��h i
$str
��i v
+
��w x
	fechacita��y �
+��� �
$str��� �
+��� �

horainicio��� �
+��� �
$str��� �
+��� �
horafin��� �
)��� �
;��� �
var
�� 
result
�� 
=
�� 
await
�� 
_citaQueries
�� +
.
��+ ,-
ValidarFechaHorarioAgendamiento
��, K
(
��K L"
_headerConfiguration
��L `
.
��` a
idIntermediario
��a p
,
��p q
	fechacita
��q z
,
��z {

horainicio��{ �
,��� �
horafin��� �
)��� �
;��� �
result
�� 
.
�� 
auditResponse
��  
.
��  !
idTransaccion
��! .
=
��/ 0"
_headerConfiguration
��1 E
.
��E F
idTransaccion
��F S
;
��S T
timeMeasure
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
�� 
_impresionLog
�� 
.
�� 
DatosFinMetodo
�� (
(
��( )
$str
��) =
,
��= >"
_headerConfiguration
��? S
.
��S T
idTransaccion
��T a
,
��a b"
_headerConfiguration
��c w
.
��w x
correlationId��x �
,��� �
result��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
	FinMetodo
�� #
(
��# $
$str
��$ 8
,
��8 9"
_headerConfiguration
��: N
.
��N O
idTransaccion
��O \
,
��\ ]"
_headerConfiguration
��^ r
.
��r s
correlationId��s �
,��� �
$str��� �
,��� �
timeMeasure��� �
.��� �
Elapsed��� �
.��� �!
TotalMilliseconds��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
consolidadoIntermediarioQueries	,,y �
)
,,� �
)
,,� �
;
,,� �
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
crearProspectoCommand	==m �
)
==� �
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
crearProspectoCommand	@@t �
,
@@� �
auditRequest
@@� �
=
@@� �"
_headerConfiguration
@@� �
.
@@� �
auditRequest
@@� �
}
@@� �
;
@@� �
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
correlationId	FFz �
,
FF� �
$str
FF� �
)
FF� �
;
FF� �
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
correlationId	GG �
,
GG� �
requestModel
GG� �
)
GG� �
;
GG� �!
crearProspectoCommandII !
.II! "&
IdConsolidadoIntermediarioII" <
=II= >
awaitII? D,
 _consolidadoIntermediarioQueriesIIE e
.IIe f.
!ObtenerIdConsolidadoIntermediario	IIf �
(
II� �"
_headerConfiguration
II� �
.
II� �
idIntermediario
II� �
)
II� �
;
II� �!
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
FechaNacimiento	KKz �
.
KK� �
Value
KK� �
,
KK� �"
_headerConfiguration
KK� �
.
KK� �
idIntermediario
KK� �
)
KK� �
:
KK� �
default
KK� �
(
KK� �
short
KK� �
?
KK� �
)
KK� �
;
KK� �!
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
HasValue	LLx �
?
LL� �
awaitMM6 ;
_generalesQueriesMM< M
.MMM N#
ObtenerCodigoRangoFondoMMN e
(MMe f!
crearProspectoCommandMMf {
.MM{ |%
ProspectoAdnRentaCommand	MM| �
.
MM� �!
MonedaPatrimonioAfp
MM� �
.
MM� �
Value
MM� �
,
MM� �"
_headerConfiguration
MM� �
.
MM� �
idIntermediario
MM� �
)
MM� �
:
MM� �
default
MM� �
(
MM� �
short
MM� �
?
MM� �
)
MM� �
;
MM� �
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
correlationId	XX| �
,
XX� �
result
XX� �
)
XX� �
;
XX� �
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
correlationId	YYw �
,
YY� �
$str
YY� �
,
YY� �
timeMeasure
YY� �
.
YY� �
Elapsed
YY� �
.
YY� �
TotalMilliseconds
YY� �
.
YY� �
ToString
YY� �
(
YY� �
)
YY� �
)
YY� �
;
YY� �
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
	prospecto	[[~ �
)
[[� �
;
[[� �
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
actualizarProspectoCommand	ffs �
)
ff� �
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
actualizarProspectoCommand	hh~ �
,
hh� �
auditRequest
hh� �
=
hh� �"
_headerConfiguration
hh� �
.
hh� �
auditRequest
hh� �
}
hh� �
;
hh� �
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
correlationId	nn{ �
,
nn� �
$str
nn� �
)
nn� �
;
nn� �
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
correlationId	oo �
,
oo� �
requestModel
oo� �
)
oo� �
;
oo� �&
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
FechaNacimiento	rr �
.
rr� �
Value
rr� �
,
rr� �"
_headerConfiguration
rr� �
.
rr� �
idIntermediario
rr� �
)
rr� �
:
rr� �
default
rr� �
(
rr� �
short
rr� �
?
rr� �
)
rr� �
;
rr� �&
actualizarProspectoCommandss &
.ss& '
CodigoRangoFondoss' 7
=ss8 9&
actualizarProspectoCommandss: T
.ssT U$
ProspectoAdnRentaCommandssU m
.ssm n 
MonedaPatrimonioAfp	ssn �
.
ss� �
HasValue
ss� �
?
ss� �
awaittt6 ;
_generalesQueriestt< M
.ttM N#
ObtenerCodigoRangoFondottN e
(tte f'
actualizarProspectoCommand	ttf �
.
tt� �&
ProspectoAdnRentaCommand
tt� �
.
tt� �!
MonedaPatrimonioAfp
tt� �
.
tt� �
Value
tt� �
,
tt� �"
_headerConfiguration
tt� �
.
tt� �
idIntermediario
tt� �
)
tt� �
:
tt� �
default
tt� �
(
tt� �
short
tt� �
?
tt� �
)
tt� �
;
tt� �
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
�� 
.
�� 
DatosFinMetodo
�� (
(
��( )
$str
��) B
,
��B C"
_headerConfiguration
��D X
.
��X Y
idTransaccion
��Y f
,
��f g"
_headerConfiguration
��h |
.
��| }
correlationId��} �
,��� �
result��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
	FinMetodo
�� #
(
��# $
$str
��$ =
,
��= >"
_headerConfiguration
��? S
.
��S T
idTransaccion
��T a
,
��a b"
_headerConfiguration
��c w
.
��w x
correlationId��x �
,��� �
$str��� �
,��� �
timeMeasure��� �
.��� �
Elapsed��� �
.��� �!
TotalMilliseconds��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
	prospecto
�� 
.
�� 
Entity
�� #
==
��$ &
null
��' +
?
��, -
CreatedAtAction
��. =
(
��= >
nameof
��> D
(
��D E
	Registrar
��E N
)
��N O
,
��O P
result
��Q W
)
��W X
:
��Y Z
CreatedAtAction
��[ j
(
��j k
nameof
��k q
(
��q r
	Registrar
��r {
)
��{ |
,
��| }
	prospecto��~ �
)��� �
;��� �
}
�� 	
[
�� 	
Route
��	 
(
�� 
$str
�� )
)
��) *
]
��* +
[
�� 	
HttpPut
��	 
]
�� 
[
�� 	
SwaggerOperation
��	 
(
�� 
Summary
�� !
=
��" #
$str
��$ 9
,
��9 :
Description
��; F
=
��G H
$str
��I ^
)
��^ _
]
��_ `
[
�� 	#
SwaggerRequestExample
��	 
(
�� 
typeof
�� %
(
��% &(
ActualizarProspectoCommand
��& @
)
��@ A
,
��A B
typeof
��C I
(
��I J5
'RequestDescartarProspectoCommandExample
��J q
)
��q r
)
��r s
]
��s t
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %
Status201Created
��% 5
,
��5 6
type
��7 ;
:
��; <
typeof
��= C
(
��C D
ResponseModel
��D Q
<
��Q R

EntidadDto
��R \
>
��\ ]
)
��] ^
)
��^ _
]
��_ `
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,
Status201Created
��, <
,
��< =
typeof
��> D
(
��D E6
(ResponseDescartarProspectoCommandExample
��E m
)
��m n
)
��n o
]
��o p
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %*
Status500InternalServerError
��% A
,
��A B
type
��C G
:
��G H
typeof
��I O
(
��O P
ResponseModel
��P ]
<
��] ^

EntidadDto
��^ h
>
��h i
)
��i j
)
��j k
]
��k l
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,*
Status500InternalServerError
��, H
,
��H I
typeof
��J P
(
��P Q0
"ResponseInternalServerModelExample
��Q s
)
��s t
)
��t u
]
��u v
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
<
��& '
ResponseModel
��' 4
<
��4 5

EntidadDto
��5 ?
>
��? @
>
��@ A
>
��A B
	Descartar
��C L
(
��L M
[
��M N
FromBody
��N V
]
��V W'
DescartarProspectoCommand
��X q(
descartarProspectoCommand��r �
)��� �
{
�� 	
RequestModel
�� 
<
�� '
DescartarProspectoCommand
�� 2
>
��2 3
requestModel
��4 @
=
��A B
new
��C F
RequestModel
��G S
<
��S T'
DescartarProspectoCommand
��T m
>
��m n
(
��n o
)
��o p
{
��q r
Entity
��s y
=
��z {(
descartarProspectoCommand��| �
,��� �
auditRequest��� �
=��� �$
_headerConfiguration��� �
.��� �
auditRequest��� �
}��� �
;��� �
	Stopwatch
�� 
timeMeasure
�� !
=
��" #
new
��$ '
	Stopwatch
��( 1
(
��1 2
)
��2 3
;
��3 4
ResponseModel
�� 
<
�� 

EntidadDto
�� $
>
��$ %
result
��& ,
=
��- .
new
��/ 2
ResponseModel
��3 @
<
��@ A

EntidadDto
��A K
>
��K L
(
��L M
)
��M N
;
��N O
timeMeasure
�� 
.
�� 
Start
�� 
(
�� 
)
�� 
;
��  
_impresionLog
�� 
.
�� 
InicioMetodo
�� &
(
��& '
$str
��' @
,
��@ A"
_headerConfiguration
��B V
.
��V W
idTransaccion
��W d
,
��d e"
_headerConfiguration
��f z
.
��z {
correlationId��{ �
,��� �
$str��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
DatosInicioMetodo
�� +
(
��+ ,
$str
��, E
,
��E F"
_headerConfiguration
��G [
.
��[ \
idTransaccion
��\ i
,
��i j"
_headerConfiguration
��k 
.�� �
correlationId��� �
,��� �
requestModel��� �
)��� �
;��� �
try
�� 
{
�� 
result
�� 
=
�� 
await
��  
	_mediator
��! *
.
��* +
Send
��+ /
(
��/ 0'
descartarProspectoCommand
��0 I
)
��I J
;
��J K
}
��L M
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
��  !
result
��" (
.
��( )
Entity
��) /
=
��0 1
new
��2 5

EntidadDto
��6 @
{
��A B
Mensaje
��C J
=
��K L
e
��M N
.
��N O
Message
��O V
.
��V W
ToString
��W _
(
��_ `
)
��` a
}
��b c
;
��c d
}
��e f
result
�� 
.
�� 
auditResponse
��  
.
��  !
idTransaccion
��! .
=
��/ 0"
_headerConfiguration
��1 E
.
��E F
idTransaccion
��F S
;
��S T
timeMeasure
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
�� 
_impresionLog
�� 
.
�� 
DatosFinMetodo
�� (
(
��( )
$str
��) B
,
��B C"
_headerConfiguration
��D X
.
��X Y
idTransaccion
��Y f
,
��f g"
_headerConfiguration
��h |
.
��| }
correlationId��} �
,��� �
result��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
	FinMetodo
�� #
(
��# $
$str
��$ =
,
��= >"
_headerConfiguration
��? S
.
��S T
idTransaccion
��T a
,
��a b"
_headerConfiguration
��c w
.
��w x
correlationId��x �
,��� �
$str��� �
,��� �
timeMeasure��� �
.��� �
Elapsed��� �
.��� �!
TotalMilliseconds��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
��  
)
��  !
]
��! "
[
�� 	
SwaggerOperation
��	 
(
�� 
Summary
�� !
=
��" #
$str
��$ B
,
��B C
Description
��D O
=
��P Q
$str
��R p
)
��p q
]
��q r
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %
Status200OK
��% 0
,
��0 1
type
��2 6
:
��6 7
typeof
��8 >
(
��> ?
ResponseModel
��? L
<
��L M
List
��M Q
<
��Q R
	Prospecto
��R [
>
��[ \
>
��\ ]
)
��] ^
)
��^ _
]
��_ `
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,
Status200OK
��, 7
,
��7 8
typeof
��9 ?
(
��? @3
%ResponseObtenerProspectosQueryExample
��@ e
)
��e f
)
��f g
]
��g h
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %*
Status500InternalServerError
��% A
,
��A B
type
��C G
:
��G H
typeof
��I O
(
��O P
ResponseModel
��P ]
<
��] ^
List
��^ b
<
��b c
	Prospecto
��c l
>
��l m
>
��m n
)
��n o
)
��o p
]
��p q
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,*
Status500InternalServerError
��, H
,
��H I
typeof
��J P
(
��P Q0
"ResponseInternalServerModelExample
��Q s
)
��s t
)
��t u
]
��u v
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
<
��& '
ResponseModel
��' 4
<
��4 5
List
��5 9
<
��9 :
	Prospecto
��: C
>
��C D
>
��D E
>
��E F
>
��F G'
ObtenerProspectoPorFiltro
��H a
(
��a b
[
��b c
	FromQuery
��c l
]
��l m#
ProspectoQueryFilter��m �$
prospectoQueryFilter��� �
)��� �
{
�� 	
	Stopwatch
�� 
timeMeasure
�� !
=
��" #
new
��$ '
	Stopwatch
��( 1
(
��1 2
)
��2 3
;
��3 4
timeMeasure
�� 
.
�� 
Start
�� 
(
�� 
)
�� 
;
��  "
prospectoQueryFilter
��  
.
��  !!
codigointermediario
��! 4
=
��5 6"
_headerConfiguration
��7 K
.
��K L
idIntermediario
��L [
;
��[ \
_impresionLog
�� 
.
�� 
InicioMetodo
�� &
(
��& '
$str
��' @
,
��@ A"
_headerConfiguration
��B V
.
��V W
idTransaccion
��W d
,
��d e"
_headerConfiguration
��f z
.
��z {
correlationId��{ �
,��� �
$str��� �
)��� �
;��� �
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# -
,
��- .
$str
��/ K
+
��L M
$str
��N V
+
��W X"
_headerConfiguration
��Y m
.
��m n
idTransaccion
��n {
+
��| }
$str��~ �
+��� �$
_headerConfiguration��� �
.��� �
correlationId��� �
+��� �
$str��� �
+��� �
$str��� �
+��� �
JsonConvert
��  
.
��  !
SerializeObject
��! 0
(
��0 1"
_headerConfiguration
��1 E
.
��E F
auditRequest
��F R
,
��R S

Formatting
��T ^
.
��^ _
Indented
��_ g
)
��g h
+
��i j
$str��k �
+��� �$
prospectoQueryFilter��� �
)��� �
;��� �
var
�� 
result
�� 
=
�� 
await
�� 
_prospectoQueries
�� 0
.
��0 1'
ObtenerProspectoPorFiltro
��1 J
(
��J K"
prospectoQueryFilter
��K _
)
��_ `
;
��` a
result
�� 
.
�� 
auditResponse
��  
.
��  !
idTransaccion
��! .
=
��/ 0"
_headerConfiguration
��1 E
.
��E F
idTransaccion
��F S
;
��S T
timeMeasure
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
�� 
_impresionLog
�� 
.
�� 
DatosFinMetodo
�� (
(
��( )
$str
��) B
,
��B C"
_headerConfiguration
��D X
.
��X Y
idTransaccion
��Y f
,
��f g"
_headerConfiguration
��h |
.
��| }
correlationId��} �
,��� �
result��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
	FinMetodo
�� #
(
��# $
$str
��$ =
,
��= >"
_headerConfiguration
��? S
.
��S T
idTransaccion
��T a
,
��a b"
_headerConfiguration
��c w
.
��w x
correlationId��x �
,��� �
$str��� �
,��� �
timeMeasure��� �
.��� �
Elapsed��� �
.��� �!
TotalMilliseconds��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� -
)
��- .
]
��. /
[
�� 	
SwaggerOperation
��	 
(
�� 
Summary
�� !
=
��" #
$str
��$ O
,
��O P
Description
��Q \
=
��] ^
$str��_ �
)��� �
]��� �
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %
Status200OK
��% 0
,
��0 1
type
��2 6
:
��6 7
typeof
��8 >
(
��> ?
ResponseModel
��? L
<
��L M
List
��M Q
<
��Q R
	Prospecto
��R [
>
��[ \
>
��\ ]
)
��] ^
)
��^ _
]
��_ `
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,
Status200OK
��, 7
,
��7 8
typeof
��9 ?
(
��? @9
+ResponseObtenerProspectoDetalleQueryExample
��@ k
)
��k l
)
��l m
]
��m n
[
�� 	
SwaggerResponse
��	 
(
�� 
StatusCodes
�� $
.
��$ %*
Status500InternalServerError
��% A
,
��A B
type
��C G
:
��G H
typeof
��I O
(
��O P
ResponseModel
��P ]
<
��] ^(
ActualizarProspectoCommand
��^ x
>
��x y
)
��y z
)
��z {
]
��{ |
[
�� 	$
SwaggerResponseExample
��	 
(
��  
StatusCodes
��  +
.
��+ ,*
Status500InternalServerError
��, H
,
��H I
typeof
��J P
(
��P Q0
"ResponseInternalServerModelExample
��Q s
)
��s t
)
��t u
]
��u v
public
�� 
async
�� 
Task
�� 
<
�� 
ActionResult
�� &
<
��& '
ResponseModel
��' 4
<
��4 5(
ActualizarProspectoCommand
��5 O
>
��O P
>
��P Q
>
��Q R3
%ObtenerProspectoDetallePorIdProspecto
��S x
(
��x y
string
��y 
idprospecto��� �
)��� �
{
�� 	
	Stopwatch
�� 
timeMeasure
�� !
=
��" #
new
��$ '
	Stopwatch
��( 1
(
��1 2
)
��2 3
;
��3 4
timeMeasure
�� 
.
�� 
Start
�� 
(
�� 
)
�� 
;
��  
_impresionLog
�� 
.
�� 
InicioMetodo
�� &
(
��& '
$str
��' @
,
��@ A"
_headerConfiguration
��B V
.
��V W
idTransaccion
��W d
,
��d e"
_headerConfiguration
��f z
.
��z {
correlationId��{ �
,��� �
$str��� �
)��� �
;��� �
_logger
�� 
.
�� 
LogInformation
�� "
(
��" #
$str
��# -
,
��- .
$str
��/ K
+
��L M
$str
��N V
+
��W X"
_headerConfiguration
��Y m
.
��m n
idTransaccion
��n {
+
��| }
$str��~ �
+��� �$
_headerConfiguration��� �
.��� �
correlationId��� �
+��� �
$str��� �
+��� �
$str��� �
+��� �
JsonConvert
��  
.
��  !
SerializeObject
��! 0
(
��0 1"
_headerConfiguration
��1 E
.
��E F
auditRequest
��F R
,
��R S

Formatting
��T ^
.
��^ _
Indented
��_ g
)
��g h
+
��i j
$str
��k z
+
��{ |
idprospecto��} �
)��� �
;��� �
var
�� 
result
�� 
=
�� 
await
�� 
_prospectoQueries
�� 0
.
��0 13
%ObtenerProspectoDetallePorIdProspecto
��1 V
(
��V W
idprospecto
��W b
)
��b c
;
��c d
result
�� 
.
�� 
auditResponse
��  
.
��  !
idTransaccion
��! .
=
��/ 0"
_headerConfiguration
��1 E
.
��E F
idTransaccion
��F S
;
��S T
timeMeasure
�� 
.
�� 
Stop
�� 
(
�� 
)
�� 
;
�� 
_impresionLog
�� 
.
�� 
DatosFinMetodo
�� (
(
��( )
$str
��) B
,
��B C"
_headerConfiguration
��D X
.
��X Y
idTransaccion
��Y f
,
��f g"
_headerConfiguration
��h |
.
��| }
correlationId��} �
,��� �
result��� �
)��� �
;��� �
_impresionLog
�� 
.
�� 
	FinMetodo
�� #
(
��# $
$str
��$ =
,
��= >"
_headerConfiguration
��? S
.
��S T
idTransaccion
��T a
,
��a b"
_headerConfiguration
��c w
.
��w x
correlationId��x �
,��� �
$str��� �
,��� �
timeMeasure��� �
.��� �
Elapsed��� �
.��� �!
TotalMilliseconds��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �r
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
crearRecordatorioLlamadaCommand	**x �
)
**� �
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
Entity	,, �
=
,,� �-
crearRecordatorioLlamadaCommand
,,� �
,
,,� �
auditRequest
,,� �
=
,,� �"
_headerConfiguration
,,� �
.
,,� �
auditRequest
,,� �
}
,,� �
;
,,� �
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
_headerConfiguration	11o �
.
11� �
correlationId
11� �
,
11� �
$str
11� �
)
11� �
;
11� �
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
_headerConfiguration	22t �
.
22� �
correlationId
22� �
,
22� �
requestModel
22� �
)
22� �
;
22� �
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
_headerConfiguration	99q �
.
99� �
correlationId
99� �
,
99� �
result
99� �
)
99� �
;
99� �
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
_headerConfiguration	::l �
.
::� �
correlationId
::� �
,
::� �
$str
::� �
,
::� �
timeMeasure
::� �
.
::� �
Elapsed
::� �
.
::� �
TotalMilliseconds
::� �
.
::� �
ToString
::� �
(
::� �
)
::� �
)
::� �
;
::� �
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
2RequestActualizarRecordatorioLlamadaCommandExample	BBO �
)
BB� �
)
BB� �
]
BB� �
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
$actualizarRecordatorioLlamadaCommand	GG~ �
)
GG� �
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
$ActualizarRecordatorioLlamadaCommand	II_ �
>
II� �
(
II� �
)
II� �
{
II� �
Entity
II� �
=
II� �2
$actualizarRecordatorioLlamadaCommand
II� �
,
II� �
auditRequest
II� �
=
II� �"
_headerConfiguration
II� �
.
II� �
auditRequest
II� �
}
II� �
;
II� �
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
_headerConfiguration	NNo �
.
NN� �
correlationId
NN� �
,
NN� �
$str
NN� �
)
NN� �
;
NN� �
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
_headerConfiguration	OOt �
.
OO� �
correlationId
OO� �
,
OO� �
requestModel
OO� �
)
OO� �
;
OO� �
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
_headerConfiguration	VVq �
.
VV� �
correlationId
VV� �
,
VV� �
result
VV� �
)
VV� �
;
VV� �
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
_headerConfiguration	WWl �
.
WW� �
correlationId
WW� �
,
WW� �
$str
WW� �
,
WW� �
timeMeasure
WW� �
.
WW� �
Elapsed
WW� �
.
WW� �
TotalMilliseconds
WW� �
.
WW� �
ToString
WW� �
(
WW� �
)
WW� �
)
WW� �
;
WW� �
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
}\\ �l
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
consolidadoIntermediarioQueries	##y �
)
##� �
)
##� �
;
##� �
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
)	.. �
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
crearReunionCommand	00p �
,
00� �
auditRequest
00� �
=
00� �"
_headerConfiguration
00� �
.
00� �
auditRequest
00� �
}
00� �
;
00� �
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
correlationId	44x �
,
44� �
$str
44� �
)
44� �
;
44� �
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
correlationId	55} �
,
55� �
requestModel
55� �
)
55� �
;
55� �
crearReunionCommand77 
.77  &
IdConsolidadoIntermediario77  :
=77; <
await77= B,
 _consolidadoIntermediarioQueries77C c
.77c d.
!ObtenerIdConsolidadoIntermediario	77d �
(
77� �"
_headerConfiguration
77� �
.
77� �
idIntermediario
77� �
)
77� �
;
77� �
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
correlationId	<<z �
,
<<� �
result
<<� �
)
<<� �
;
<<� �
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
correlationId	==u �
,
==� �
$str
==� �
,
==� �
timeMeasure
==� �
.
==� �
Elapsed
==� �
.
==� �
TotalMilliseconds
==� �
.
==� �
ToString
==� �
(
==� �
)
==� �
)
==� �
;
==� �
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
actualizarReunionCommand	JJr �
)
JJ� �
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
actualizarReunionCommand	LLz �
,
LL� �
auditRequest
LL� �
=
LL� �"
_headerConfiguration
LL� �
.
LL� �
auditRequest
LL� �
}
LL� �
;
LL� �
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
correlationId	PPx �
,
PP� �
$str
PP� �
)
PP� �
;
PP� �
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
correlationId	QQ} �
,
QQ� �
requestModel
QQ� �
)
QQ� �
;
QQ� �
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
correlationId	WWz �
,
WW� �
result
WW� �
)
WW� �
;
WW� �
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
correlationId	XXu �
,
XX� �
$str
XX� �
,
XX� �
timeMeasure
XX� �
.
XX� �
Elapsed
XX� �
.
XX� �
TotalMilliseconds
XX� �
.
XX� �
ToString
XX� �
(
XX� �
)
XX� �
)
XX� �
;
XX� �
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
}]] �
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
} �	
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
IRequestHandler	w �
<
� �
,
� �
>
� �
)
� �
)
� �
;
� �
} 	
} 
} �
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
} �
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
 IConsolidadoIntermediarioQueries	d �
>
� �
(
� �
)
� �
.
� �&
InstancePerLifetimeScope
� �
(
� �
)
� �
;
� �
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
}"" �
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
(	 �
)
� �
;
� �
} 	
} 
} �)
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
AsImplementedInterfaces	r �
(
� �
)
� �
;
� �
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
AsImplementedInterfaces	| �
(
� �
)
� �
;
� �
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
AsImplementedInterfaces	z �
(
� �
)
� �
;
� �
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
(	 �
)
� �
;
� �
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
AsImplementedInterfaces	p �
(
� �
)
� �
;
� �
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
AsImplementedInterfaces	r �
(
� �
)
� �
;
� �
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
CrearRecordatorioLlamadaCommand	b �
>
� �
>
� �
(
� �
)
� �
.
� �%
AsImplementedInterfaces
� �
(
� �
)
� �
;
� �
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
$ActualizarRecordatorioLlamadaCommand	g �
>
� �
>
� �
(
� �
)
� �
.
� �%
AsImplementedInterfaces
� �
(
� �
)
� �
;
� �
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
AsImplementedInterfaces	!!n �
(
!!� �
)
!!� �
;
!!� �
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
AsImplementedInterfaces	""x �
(
""� �
)
""� �
;
""� �
}$$ 	
}%% 
}&& �
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
)	 �
)
� �
?
� �
$num
� �
:
� �
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
;	 �
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
}"" �
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
} �H
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
�� 
}�� 