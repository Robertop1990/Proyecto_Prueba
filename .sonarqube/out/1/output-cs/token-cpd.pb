≤i
BD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\AgendaContext.cs
	namespace 	
Agenda
 
. 
Infrastucture 
{ 
public 

class 
AgendaContext 
:  
	DbContext! *
,* +
IUnitOfWork, 7
{ 
public 
const 
string 
PROSPECTO_SCHEMA ,
=- .
$str/ :
;: ;
public 
const 
string 
GENERALES_SCHEMA ,
=- .
$str/ :
;: ;
public 
const 
string 
RENTAS_SHEMA (
=) *
$str+ 3
;3 4
public 
DbSet 
< $
ConsolidadoIntermediario -
>- .%
ConsolidadoIntermediarios/ H
{I J
getK N
;N O
setP S
;S T
}U V
public 
DbSet 
< 
	Prospecto 
> 

Prospectos  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
	RangoEdad 
> 

RangoEdads  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
RangoIngreso !
>! "
RangoIngresos# 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
DbSet 
< 
Referido 
> 
	Referidos (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DbSet 
< 
DireccionProspecto '
>' (
DireccionProspectos) <
{= >
get? B
;B C
setD G
;G H
}I J
public 
DbSet 
< 
Departamento !
>! "
Departamentos# 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
DbSet 
< 
	Provincia 
> 

Provincias  *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
DbSet 
< 
Distrito 
> 
	Distritos (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public   
DbSet   
<   
AdnRenta   
>   
	AdnRentas   (
{  ) *
get  + .
;  . /
set  0 3
;  3 4
}  5 6
public!! 
DbSet!! 
<!! 
Cita!! 
>!! 
Citas!!  
{!!! "
get!!# &
;!!& '
set!!( +
;!!+ ,
}!!- .
public"" 
DbSet"" 
<"" 
Reunion"" 
>"" 
Reunions"" &
{""' (
get"") ,
;"", -
set"". 1
;""1 2
}""3 4
public## 
DbSet## 
<## 
RecordatorioLlamada## (
>##( ) 
RecordatorioLlamadas##* >
{##? @
get##A D
;##D E
set##F I
;##I J
}##K L
public$$ 
DbSet$$ 
<$$ 

ListaTabla$$ 
>$$  
ListaTablas$$! ,
{$$- .
get$$/ 2
;$$2 3
set$$4 7
;$$7 8
}$$9 :
public%% 
DbSet%% 
<%% 
TablaTablas%%  
>%%  !
TablaTablas%%" -
{%%. /
get%%0 3
;%%3 4
set%%5 8
;%%8 9
}%%: ;
public&& 
DbSet&& 
<&& 
	Actividad&& 
>&& 

Actividads&&  *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
private(( 
readonly(( 
	IMediator(( "
	_mediator((# ,
;((, -
private)) !
IDbContextTransaction)) %
_currentTransaction))& 9
;))9 :
public++ 
AgendaContext++ 
(++ 
DbContextOptions++ -
<++- .
AgendaContext++. ;
>++; <
options++= D
)++D E
:++F G
base++H L
(++L M
options++M T
)++T U
{++V W
}++X Y
public,, !
IDbContextTransaction,, $!
GetCurrentTransaction,,% :
(,,: ;
),,; <
=>,,= ?
_currentTransaction,,@ S
;,,S T
public-- 
bool--  
HasActiveTransaction-- (
=>--) +
_currentTransaction--, ?
!=--@ B
null--C G
;--G H
public// 
AgendaContext// 
(// 
DbContextOptions// -
<//- .
AgendaContext//. ;
>//; <
options//= D
,//D E
	IMediator//F O
mediator//P X
)//X Y
://Z [
base//\ `
(//` a
options//a h
)//h i
{00 	
	_mediator11 
=11 
mediator11  
??11! #
throw11$ )
new11* -!
ArgumentNullException11. C
(11C D
nameof11D J
(11J K
mediator11K S
)11S T
)11T U
;11U V
System22 
.22 
Diagnostics22 
.22 
Debug22 $
.22$ %
	WriteLine22% .
(22. /
$str22/ G
+22H I
this22J N
.22N O
GetHashCode22O Z
(22Z [
)22[ \
)22\ ]
;22] ^
}33 	
	protected55 
override55 
void55 
OnModelCreating55  /
(55/ 0
ModelBuilder550 <
modelBuilder55= I
)55I J
{66 	
modelBuilder77 
.77 
ApplyConfiguration77 +
(77+ ,
new77, /;
/ConsolidadoIntermediarioEntityTypeConfiguration770 _
(77_ `
)77` a
)77a b
;77b c
modelBuilder88 
.88 
ApplyConfiguration88 +
(88+ ,
new88, /,
 ProspectoEntityTypeConfiguration880 P
(88P Q
)88Q R
)88R S
;88S T
modelBuilder99 
.99 
ApplyConfiguration99 +
(99+ ,
new99, /,
 DireccionEntityTypeConfiguration990 P
(99P Q
)99Q R
)99R S
;99S T
modelBuilder:: 
.:: 
ApplyConfiguration:: +
(::+ ,
new::, //
#DepartamentoEntityTypeConfiguration::0 S
(::S T
)::T U
)::U V
;::V W
modelBuilder;; 
.;; 
ApplyConfiguration;; +
(;;+ ,
new;;, /,
 ProvinciaEntityTypeConfiguration;;0 P
(;;P Q
);;Q R
);;R S
;;;S T
modelBuilder<< 
.<< 
ApplyConfiguration<< +
(<<+ ,
new<<, /+
DistritoEntityTypeConfiguration<<0 O
(<<O P
)<<P Q
)<<Q R
;<<R S
modelBuilder== 
.== 
ApplyConfiguration== +
(==+ ,
new==, /+
AdnRentaEntityTypeConfiguration==0 O
(==O P
)==P Q
)==Q R
;==R S
modelBuilder>> 
.>> 
ApplyConfiguration>> +
(>>+ ,
new>>, /'
CitaEntityTypeConfiguration>>0 K
(>>K L
)>>L M
)>>M N
;>>N O
modelBuilder?? 
.?? 
ApplyConfiguration?? +
(??+ ,
new??, /6
*RecordatorioLlamadaEntityTypeConfiguration??0 Z
(??Z [
)??[ \
)??\ ]
;??] ^
modelBuilder@@ 
.@@ 
ApplyConfiguration@@ +
(@@+ ,
new@@, /*
ReunionEntityTypeConfiguration@@0 N
(@@N O
)@@O P
)@@P Q
;@@Q R
modelBuilderAA 
.AA 
ApplyConfigurationAA +
(AA+ ,
newAA, /-
!ListaTablaEntityTypeConfigurationAA0 Q
(AAQ R
)AAR S
)AAS T
;AAT U
modelBuilderBB 
.BB 
ApplyConfigurationBB +
(BB+ ,
newBB, /+
ReferidoEntityTypeConfigurationBB0 O
(BBO P
)BBP Q
)BBQ R
;BBR S
modelBuilderCC 
.CC 
ApplyConfigurationCC +
(CC+ ,
newCC, /,
 RangoEdadEntityTypeConfigurationCC0 P
(CCP Q
)CCQ R
)CCR S
;CCS T
modelBuilderDD 
.DD 
ApplyConfigurationDD +
(DD+ ,
newDD, //
#RangoIngresoEntityTypeConfigurationDD0 S
(DDS T
)DDT U
)DDU V
;DDV W
modelBuilderEE 
.EE 
ApplyConfigurationEE +
(EE+ ,
newEE, /.
"TablaTablasEntityTypeConfigurationEE0 R
(EER S
)EES T
)EET U
;EEU V
modelBuilderFF 
.FF 
ApplyConfigurationFF +
(FF+ ,
newFF, /,
 ActividadEntityTypeConfigurationFF0 P
(FFP Q
)FFQ R
)FFR S
;FFS T
}GG 	
publicHH 
asyncHH 
TaskHH 
<HH 
boolHH 
>HH 
SaveEntitiesAsyncHH  1
(HH1 2
CancellationTokenHH2 C
cancellationTokenHHD U
=HHV W
defaultHHX _
(HH_ `
CancellationTokenHH` q
)HHq r
)HHr s
{II 	
awaitJJ 
	_mediatorJJ 
.JJ %
DispatchDomainEventsAsyncJJ 5
(JJ5 6
thisJJ6 :
)JJ: ;
;JJ; <
varLL 
resultLL 
=LL 
awaitLL 
baseLL #
.LL# $
SaveChangesAsyncLL$ 4
(LL4 5
cancellationTokenLL5 F
)LLF G
;LLG H
returnNN 
trueNN 
;NN 
}OO 	
publicPP 
asyncPP 
TaskPP 
<PP !
IDbContextTransactionPP /
>PP/ 0!
BeginTransactionAsyncPP1 F
(PPF G
)PPG H
{QQ 	
ifRR 
(RR 
_currentTransactionRR #
!=RR$ &
nullRR' +
)RR+ ,
returnRR- 3
nullRR4 8
;RR8 9
_currentTransactionTT 
=TT  !
awaitTT" '
DatabaseTT( 0
.TT0 1!
BeginTransactionAsyncTT1 F
(TTF G
IsolationLevelTTG U
.TTU V
ReadCommittedTTV c
)TTc d
;TTd e
returnVV 
_currentTransactionVV &
;VV& '
}WW 	
publicXX 
asyncXX 
TaskXX "
CommitTransactionAsyncXX 0
(XX0 1!
IDbContextTransactionXX1 F
transactionXXG R
)XXR S
{YY 	
ifZZ 
(ZZ 
transactionZZ 
==ZZ 
nullZZ #
)ZZ# $
throwZZ% *
newZZ+ .!
ArgumentNullExceptionZZ/ D
(ZZD E
nameofZZE K
(ZZK L
transactionZZL W
)ZZW X
)ZZX Y
;ZZY Z
if[[ 
([[ 
transaction[[ 
!=[[ 
_currentTransaction[[ 2
)[[2 3
throw[[4 9
new[[: =%
InvalidOperationException[[> W
([[W X
$"[[X Z
Transacci√≥n [[Z f
{[[f g
transaction[[g r
.[[r s
TransactionId	[[s Ä
}
[[Ä Å
 no es actual
[[Å é
"
[[é è
)
[[è ê
;
[[ê ë
try]] 
{^^ 
await__ 
SaveChangesAsync__ &
(__& '
)__' (
;__( )
transaction`` 
.`` 
Commit`` "
(``" #
)``# $
;``$ %
}aa 
catchbb 
{cc 
RollbackTransactiondd #
(dd# $
)dd$ %
;dd% &
throwee 
;ee 
}ff 
finallygg 
{hh 
ifii 
(ii 
_currentTransactionii &
!=ii' )
nullii* .
)ii. /
{jj 
_currentTransactionkk '
.kk' (
Disposekk( /
(kk/ 0
)kk0 1
;kk1 2
_currentTransactionll '
=ll( )
nullll* .
;ll. /
}mm 
}nn 
}oo 	
publicqq 
voidqq 
RollbackTransactionqq '
(qq' (
)qq( )
{rr 	
tryss 
{tt 
_currentTransactionuu #
?uu# $
.uu$ %
Rollbackuu% -
(uu- .
)uu. /
;uu/ 0
}vv 
finallyww 
{xx 
ifyy 
(yy 
_currentTransactionyy &
!=yy' )
nullyy* .
)yy. /
{zz 
_currentTransaction{{ '
.{{' (
Dispose{{( /
({{/ 0
){{0 1
;{{1 2
_currentTransaction|| '
=||( )
null||* .
;||. /
}}} 
}~~ 
} 	
}
ÄÄ 
}ÅÅ ø
jD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ActividadEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	,
 ActividadEntityTypeConfiguration
 *
:+ ,$
IEntityTypeConfiguration- E
<E F
	ActividadF O
>O P
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
	Actividad		0 9
>		9 :
builder		; B
)		B C
{

 	
builder 
. 
ToTable 
( 
$str '
,' (
AgendaContext) 6
.6 7
GENERALES_SCHEMA7 G
)G H
;H I
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdActividad" -
)- .
;. /
} 	
} 
} ª
iD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\AdnRentaEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	+
AdnRentaEntityTypeConfiguration
 )
:* +$
IEntityTypeConfiguration, D
<D E
AdnRentaE M
>M N
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
AdnRenta		0 8
>		8 9
builder		: A
)		A B
{

 	
builder 
. 
ToTable 
( 
$str '
,' (
AgendaContext( 5
.5 6
PROSPECTO_SCHEMA6 F
)F G
;G H
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdProspecto" -
)- .
;. /
} 	
} 
} “
eD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\CitaEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class		 	'
CitaEntityTypeConfiguration		
 %
:		& '$
IEntityTypeConfiguration		( @
<		@ A
Cita		A E
>		E F
{

 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
Cita0 4
>4 5
builder6 =
)= >
{ 	
builder 
. 
ToTable 
( 
$str "
," #
AgendaContext$ 1
.1 2
PROSPECTO_SCHEMA2 B
)B C
;C D
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdCita" (
)( )
;) *
builder 
. 
HasOne 
( 
a 
=> 
a  !
.! "
RecordatorioLlamada" 5
)5 6
. 
WithOne $
($ %
b% &
=>' )
b* +
.+ ,
Cita, 0
)0 1
. 
HasForeignKey *
<* +
RecordatorioLlamada+ >
>> ?
(? @
b@ A
=>B D
bE F
.F G
IdCitaG M
)M N
;N O
} 	
} 
} ä	
yD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ConsolidadoIntermediarioEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	;
/ConsolidadoIntermediarioEntityTypeConfiguration
 9
:: ;$
IEntityTypeConfiguration< T
<T U$
ConsolidadoIntermediarioU m
>m n
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0$
ConsolidadoIntermediario

0 H
>

H I
builder

J Q
)

Q R
{ 	
builder 
. 
ToTable 
( 
$str 7
,7 8
AgendaContext9 F
.F G
GENERALES_SCHEMAG W
)W X
;X Y
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "&
IdConsolidadoIntermediario" <
)< =
;= >
} 	
} 
} œ
mD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\DepartamentoEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	/
#DepartamentoEntityTypeConfiguration
 -
:. /$
IEntityTypeConfiguration0 H
<H I
DepartamentoI U
>U V
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
Departamento		0 <
>		< =
builder		> E
)		E F
{

 	
builder 
. 
ToTable 
( 
$str *
,* +
AgendaContext, 9
.9 :
GENERALES_SCHEMA: J
)J K
;K L
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Departamento_Id" 1
)1 2
;2 3
} 	
} 
} Õ
jD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\DireccionEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	,
 DireccionEntityTypeConfiguration
 *
:+ ,$
IEntityTypeConfiguration- E
<E F
DireccionProspectoF X
>X Y
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0
DireccionProspecto

0 B
>

B C
builder

D K
)

K L
{ 	
builder 
. 
ToTable 
( 
$str 1
,1 2
AgendaContext3 @
.@ A
RENTAS_SHEMAA M
)M N
;N O
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdDireccion" -
)- .
;. /
} 	
} 
} †
iD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\DistritoEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	+
DistritoEntityTypeConfiguration
 )
:* +$
IEntityTypeConfiguration, D
<D E
DistritoE M
>M N
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
Distrito		0 8
>		8 9
builder		: A
)		A B
{

 	
builder 
. 
ToTable 
( 
$str &
,& '
AgendaContext( 5
.5 6
GENERALES_SCHEMA6 F
)F G
;G H
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Departamento_Id" 1
)1 2
;2 3
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Provincia_Id" .
). /
;/ 0
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Distrito_Id" -
)- .
;. /
builder 
. 
HasOne 
( 
d 
=> 
d  !
.! "
	Provincia" +
)+ ,
.% &
WithMany& .
(. /
p/ 0
=>1 3
p4 5
.5 6
	Distritos6 ?
)? @
.% &
HasForeignKey& 3
(3 4
d4 5
=>6 8
d9 :
.: ;
Provincia_Id; G
)G H
;H I
builder 
. 
HasOne 
( 
di 
=>  
di! #
.# $
Departamento$ 0
)0 1
.% &
WithMany& .
(. /
de/ 1
=>2 4
de5 7
.7 8
	Distritos8 A
)A B
.% &
HasForeignKey& 3
(3 4
di4 6
=>7 9
di: <
.< =
Departamento_Id= L
)L M
;M N
} 	
} 
} ƒ
kD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ListaTablaEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	-
!ListaTablaEntityTypeConfiguration
 +
:, -$
IEntityTypeConfiguration. F
<F G

ListaTablaG Q
>Q R
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0

ListaTabla		0 :
>		: ;
builder		< C
)		C D
{

 	
builder 
. 
ToTable 
( 
$str )
,) *
AgendaContext+ 8
.8 9
GENERALES_SCHEMA9 I
)I J
;J K
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdListaTabla" .
). /
;/ 0
} 	
} 
} Å
jD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ProspectoEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class		 	,
 ProspectoEntityTypeConfiguration		
 *
:		+ ,$
IEntityTypeConfiguration		- E
<		E F
	Prospecto		F O
>		O P
{

 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
	Prospecto0 9
>9 :
builder; B
)B C
{ 	
builder 
. 
ToTable 
( 
$str '
,' (
AgendaContext) 6
.6 7
PROSPECTO_SCHEMA7 G
)G H
;H I
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdProspecto" -
)- .
;. /
builder 
. 
HasOne 
( 
a 
=> 
a  !
.! "
AdnRenta" *
)* +
. 
WithOne $
($ %
b% &
=>' )
b* +
.+ ,
	Prospecto, 5
)5 6
. 
HasForeignKey *
<* +
AdnRenta+ 3
>3 4
(4 5
b5 6
=>7 9
b: ;
.; <
IdProspecto< G
)G H
;H I
builder 
. 
HasOne 
( 
a 
=> 
a  !
.! "
Cita" &
)& '
. 
WithOne $
($ %
b% &
=>' )
b* +
.+ ,
	Prospecto, 5
)5 6
. 
HasForeignKey *
<* +
Cita+ /
>/ 0
(0 1
b1 2
=>3 5
b6 7
.7 8
IdProspecto8 C
)C D
;D E
builder 
. 
HasOne 
( 
a 
=> 
a  !
.! "
RecordatorioLlamada" 5
)5 6
. 
WithOne $
($ %
b% &
=>' )
b* +
.+ ,
	Prospecto, 5
)5 6
. 
HasForeignKey *
<* +
RecordatorioLlamada+ >
>> ?
(? @
b@ A
=>B D
bE F
.F G
IdProspectoG R
)R S
;S T
builder 
. 
HasOne 
( 
a 
=> 
a  !
.! "
DireccionProspecto" 4
)4 5
. 
WithOne $
($ %
b% &
=>' )
b* +
.+ ,
	Prospecto, 5
)5 6
. 
HasForeignKey *
<* +
DireccionProspecto+ =
>= >
(> ?
b? @
=>A C
bD E
.E F
IdProspectoF Q
)Q R
;R S
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Referido" *
)* +
. 
WithOne $
($ %
r% &
=>' )
r* +
.+ ,
	Prospecto, 5
)5 6
. 
HasForeignKey *
<* +
Referido+ 3
>3 4
(4 5
r5 6
=>7 9
r: ;
.; <
IdProspecto< G
)G H
;H I
} 	
}   
}!! ˜
jD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ProvinciaEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	,
 ProvinciaEntityTypeConfiguration
 *
:+ ,$
IEntityTypeConfiguration- E
<E F
	ProvinciaF O
>O P
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
	Provincia		0 9
>		9 :
builder		; B
)		B C
{

 	
builder 
. 
ToTable 
( 
$str '
,' (
AgendaContext) 6
.6 7
GENERALES_SCHEMA7 G
)G H
;H I
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Provincia_Id" .
). /
;/ 0
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
Departamento_Id" 1
)1 2
;2 3
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Departamento" .
). /
.% &
WithMany& .
(. /
de/ 1
=>2 4
de5 7
.7 8

Provincias8 B
)B C
.% &
HasForeignKey& 3
(3 4
p4 5
=>6 8
p9 :
.: ;
Departamento_Id; J
)J K
;K L
} 	
} 
} √
jD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\RangoEdadEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	,
 RangoEdadEntityTypeConfiguration
 *
:+ ,$
IEntityTypeConfiguration- E
<E F
	RangoEdadF O
>O P
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0
	RangoEdad

0 9
>

9 :
builder

; B
)

B C
{ 	
builder 
. 
ToTable 
( 
$str (
,( )
AgendaContext* 7
.7 8
GENERALES_SCHEMA8 H
)H I
;I J
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
CodigoRangoEdad" 1
)1 2
;2 3
} 	
} 
} “
mD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\RangoIngresoEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	/
#RangoIngresoEntityTypeConfiguration
 -
:. /$
IEntityTypeConfiguration0 H
<H I
RangoIngresoI U
>U V
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
RangoIngreso		0 <
>		< =
builder		> E
)		E F
{

 	
builder 
. 
ToTable 
( 
$str +
,+ ,
AgendaContext- :
.: ;
GENERALES_SCHEMA; K
)K L
;L M
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
CodigoRangoIngreso" 4
)4 5
;5 6
} 	
} 
} Ò
tD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\RecordatorioLlamadaEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	6
*RecordatorioLlamadaEntityTypeConfiguration
 4
:5 6$
IEntityTypeConfiguration7 O
<O P
RecordatorioLlamadaP c
>c d
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0
RecordatorioLlamada

0 C
>

C D
builder

E L
)

L M
{ 	
builder 
. 
ToTable 
( 
$str 2
,2 3
AgendaContext4 A
.A B
PROSPECTO_SCHEMAB R
)R S
;S T
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "!
IdRecordatorioLlamada" 7
)7 8
;8 9
} 	
} 
} ∫
iD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ReferidoEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	+
ReferidoEntityTypeConfiguration
 )
:* +$
IEntityTypeConfiguration, D
<D E
ReferidoE M
>M N
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
Referido		0 8
>		8 9
builder		: A
)		A B
{

 	
builder 
. 
ToTable 
( 
$str &
,& '
AgendaContext( 5
.5 6
PROSPECTO_SCHEMA6 F
)F G
;G H
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "

IdReferido" ,
), -
;- .
} 	
} 
} µ
hD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\ReunionEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	*
ReunionEntityTypeConfiguration
 (
:) *$
IEntityTypeConfiguration+ C
<C D
ReunionD K
>K L
{ 
public		 
void		 
	Configure		 
(		 
EntityTypeBuilder		 /
<		/ 0
Reunion		0 7
>		7 8
builder		9 @
)		@ A
{

 	
builder 
. 
ToTable 
( 
$str %
,% &
AgendaContext' 4
.4 5
PROSPECTO_SCHEMA5 E
)E F
;F G
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
	IdReunion" +
)+ ,
;, -
} 	
} 
} …
lD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\EntityConfigurations\TablaTablasEntityTypeConfiguration.cs
	namespace 	
Agenda
 
. 
Infrastucture 
.  
EntityConfigurations 3
{ 
class 	.
"TablaTablasEntityTypeConfiguration
 ,
:- .$
IEntityTypeConfiguration/ G
<G H
TablaTablasH S
>S T
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0
TablaTablas

0 ;
>

; <
builder

= D
)

D E
{ 	
builder 
. 
ToTable 
( 
$str *
,* +
AgendaContext, 9
.9 :
GENERALES_SCHEMA: J
)J K
;K L
builder 
. 
HasKey 
( 
x 
=> 
x  !
.! "
IdTablaTablas" /
)/ 0
;0 1
} 	
} 
} Ò
[D:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\Logging\CustomLoggerProviderExtensions.cs
	namespace 	
Agenda
 
. 
Infrastucture 
. 
Logging &
{ 
public 

static 
class *
CustomLoggerProviderExtensions 6
{ 
public		 
static		 
IWebHostBuilder		 %#
UseCustomLoggerProvider		& =
(		= >
this		> B
IWebHostBuilder		C R
builder		S Z
)		Z [
{

 	
	ConfigApp 
	configApp 
=  !
new" %
	ConfigApp& /
(/ 0
)0 1
;1 2
long 
_FileSizeLimitBytes $
=% &
	configApp' 0
.0 1
TamanoMaximoLog1 @
*A B
$numC G
*H I
$numJ N
;N O
string 
_FileLogName 
=  !
	configApp" +
.+ ,
RutaArchivoLog, :
;: ;
Log 
. 
Logger 
= 
new 
LoggerConfiguration 0
(0 1
)1 2
. 
WriteTo 
. 
File 
( 
_FileLogName *
,* +
rollOnFileSizeLimit '
:' (
true) -
,- .
fileSizeLimitBytes &
:& '
_FileSizeLimitBytes( ;
,; <"
retainedFileCountLimit *
:* +
$num, -
,- .
buffered 
: 
false #
,# $
outputTemplate "
:" #
$str$ x
)x y
. 
CreateLogger 
( 
) 
;  
builder 
. 

UseSerilog 
( 
)  
;  !
return 
builder 
; 
} 	
} 
} ë
FD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\MediatorExtension.cs
	namespace 	
Agenda
 
. 
Infrastucture 
{ 
static 

class 
MediatorExtension "
{		 
public

 
static

 
async

 
Task

  %
DispatchDomainEventsAsync

! :
(

: ;
this

; ?
	IMediator

@ I
mediator

J R
,

R S
AgendaContext

T a
context

b i
)

i j
{ 	
var 
domainEntities 
=  
context! (
.( )
ChangeTracker) 6
.6 7
Entries7 >
<> ?
Entity? E
>E F
(F G
)G H
.6 7
Where7 <
(< =
x= >
=>? A
xB C
.C D
EntityD J
.J K
DomainEventsK W
.W X
AnyX [
([ \
)\ ]
)] ^
;^ _
var 
domainEvents 
= 
domainEntities -
.- .

SelectMany. 8
(8 9
x9 :
=>; =
x> ?
.? @
Entity@ F
.F G
DomainEventsG S
)S T
.T U
ToListU [
([ \
)\ ]
;] ^
domainEntities 
. 
ToList !
(! "
)" #
.# $
ForEach$ +
(+ ,
entity, 2
=>3 5
entity6 <
.< =
Entity= C
.C D
ClearDomainEventsD U
(U V
)V W
)W X
;X Y
foreach 
( 
var 
domainEvent $
in% '
domainEvents( 4
)4 5
await 
mediator 
. 
Publish &
(& '
domainEvent' 2
)2 3
;3 4
} 	
} 
} Ñ
PD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\Repositories\CitaRepository.cs
	namespace 	
Agenda
 
. 
Infrastucture 
. 
Repositories +
{ 
public 

class 
CitaRepository 
:  !
ICitaRepository" 1
{		 
private

 
readonly

 
AgendaContext

 &
_context

' /
;

/ 0
public 
IUnitOfWork 

UnitOfWork %
{& '
get( +
{, -
return. 4
_context5 =
;= >
}? @
}A B
public 
CitaRepository 
( 
AgendaContext +
context, 3
)3 4
=>5 7
_context8 @
=A B
contextC J
??K M
throwN S
newT W!
ArgumentNullExceptionX m
(m n
nameofn t
(t u
contextu |
)| }
)} ~
;~ 
public 
void 
Agregar 
( 
Cita  
cita! %
)% &
{ 	
cita 
. "
AuditoriaFechaCreacion '
=( )
DateTime* 2
.2 3
Now3 6
;6 7
cita 
. 
	Prospecto 
= 
null !
;! "
_context 
. 
Citas 
. 
Add 
( 
cita #
)# $
;$ %
} 	
public 
void 

Actualizar 
( 
Cita #
cita$ (
)( )
{ 	
var 
response 
= 
_context #
.# $
Citas$ )
.) *
Where* /
(/ 0
x0 1
=>2 4
x5 6
.6 7
IdCita7 =
==> @
citaA E
.E F
IdCitaF L
)L M
.M N
FirstOrDefaultN \
(\ ]
)] ^
;^ _
if 
( 
response 
!= 
null 
)  
{ 
response 
. 
	Ubicacion "
=# $
cita% )
.) *
	Ubicacion* 3
;3 4
response 
. 
CodigoDepartamento +
=, -
cita. 2
.2 3
CodigoDepartamento3 E
;E F
response 
. 
CodigoProvincia (
=) *
cita+ /
./ 0
CodigoProvincia0 ?
;? @
response 
. 
CodigoDistrito '
=( )
cita* .
.. /
CodigoDistrito/ =
;= >
response 
. 
	FechaCita "
=# $
cita% )
.) *
	FechaCita* 3
;3 4
response 
. 

HoraInicio #
=$ %
cita& *
.* +

HoraInicio+ 5
;5 6
response 
. 
HoraFin  
=! "
cita# '
.' (
HoraFin( /
;/ 0
response   
.   "
CodigoMotivoReagendado   /
=  0 1
cita  2 6
.  6 7"
CodigoMotivoReagendado  7 M
;  M N
response!! 
.!! 
FlagUrlTeams!! %
=!!& '
cita!!( ,
.!!, -
FlagUrlTeams!!- 9
;!!9 :
response"" 
."" 
UrlTeams"" !
=""" #
cita""$ (
.""( )
UrlTeams"") 1
;""1 2
response## 
.## &
AuditoriaFechaModificacion## 3
=##4 5
DateTime##6 >
.##> ?
Now##? B
;##B C
response$$ 
.$$ (
AuditoriaUsuarioModificacion$$ 5
=$$6 7
cita$$8 <
.$$< =(
AuditoriaUsuarioModificacion$$= Y
;$$Y Z
}%% 
}&& 	
public(( 
void((  
ActualizarReagendado(( (
(((( )
Cita(() -
cita((. 2
)((2 3
{)) 	
var** 
response** 
=** 
ObtenerCitaPorId** +
(**+ ,
cita**, 0
.**0 1
IdCita**1 7
)**7 8
;**8 9
if++ 
(++ 
response++ 
!=++ 
null++ 
)++  
{,, 
response.. 
... "
CodigoMotivoReagendado.. /
=..0 1
null..2 6
;..6 7
response// 
.// 
	FechaCita// "
=//# $
cita//% )
.//) *
	FechaCita//* 3
;//3 4
response00 
.00 

HoraInicio00 #
=00$ %
cita00& *
.00* +

HoraInicio00+ 5
;005 6
response11 
.11 
HoraFin11  
=11! "
cita11# '
.11' (
HoraFin11( /
;11/ 0
response22 
.22 
	Ubicacion22 "
=22# $
!22% &
string22& ,
.22, -
IsNullOrEmpty22- :
(22: ;
cita22; ?
.22? @
	Ubicacion22@ I
)22I J
?22K L
cita22M Q
.22Q R
	Ubicacion22R [
:22\ ]
response22^ f
.22f g
	Ubicacion22g p
;22p q
response33 
.33 
CodigoDepartamento33 +
=33, -
cita33. 2
.332 3
CodigoDepartamento333 E
.33E F
HasValue33F N
?33O P
cita33Q U
.33U V
CodigoDepartamento33V h
:33h i
response33j r
.33r s
CodigoDepartamento	33s Ö
;
33Ö Ü
response44 
.44 
CodigoProvincia44 (
=44) *
cita44+ /
.44/ 0
CodigoProvincia440 ?
.44? @
HasValue44@ H
?44I J
cita44J N
.44N O
CodigoProvincia44O ^
:44^ _
response44` h
.44h i
CodigoProvincia44i x
;44x y
response55 
.55 
CodigoDistrito55 '
=55( )
cita55* .
.55. /
CodigoDistrito55/ =
.55= >
HasValue55> F
?55G H
cita55I M
.55M N
CodigoDistrito55N \
:55\ ]
response55^ f
.55f g
CodigoDistrito55g u
;55u v
response66 
.66 
FlagUrlTeams66 %
=66& '
cita66( ,
.66, -
FlagUrlTeams66- 9
;669 :
response77 
.77 
UrlTeams77 !
=77" #
cita77$ (
.77( )
UrlTeams77) 1
;771 2
response88 
.88 "
AuditoriaFechaCreacion88 /
=880 1
DateTime882 :
.88: ;
Now88; >
;88> ?
response99 
.99 $
AuditoriaUsuarioCreacion99 1
=992 3
cita994 8
.998 9(
AuditoriaUsuarioModificacion999 U
;99U V
response:: 
.:: &
AuditoriaFechaModificacion:: 3
=::4 5
null::6 :
;::: ;
response;; 
.;; (
AuditoriaUsuarioModificacion;; 5
=;;6 7
null;;8 <
;;;< =
_context<< 
.<< 
Citas<< 
.<< 
Add<< "
(<<" #
response<<# +
)<<+ ,
;<<, -
Cita?? "
actualizarcitaanterior?? +
=??, -
new??. 1
Cita??2 6
(??6 7
)??7 8
;??8 9"
actualizarcitaanterior@@ &
.@@& '
IdCita@@' -
=@@. /
cita@@0 4
.@@4 5
IdCita@@5 ;
;@@; <"
actualizarcitaanteriorAA &
.AA& '&
AuditoriaFechaModificacionAA' A
=AAB C
DateTimeAAD L
.AAL M
NowAAM P
;AAP Q"
actualizarcitaanteriorBB &
.BB& '(
AuditoriaUsuarioModificacionBB' C
=BBD E
citaBBF J
.BBJ K(
AuditoriaUsuarioModificacionBBK g
;BBg h"
actualizarcitaanteriorCC &
.CC& '"
CodigoMotivoReagendadoCC' =
=CC> ?
citaCC@ D
.CCD E"
CodigoMotivoReagendadoCCE [
;CC[ \
varDD 
entryDD 
=DD 
_contextDD $
.DD$ %
CitasDD% *
.DD* +
AttachDD+ 1
(DD1 2"
actualizarcitaanteriorDD2 H
)DDH I
;DDI J
entryEE 
.EE 
PropertyEE 
(EE 
xEE  
=>EE! #
xEE$ %
.EE% &&
AuditoriaFechaModificacionEE& @
)EE@ A
.EEA B

IsModifiedEEB L
=EEM N
trueEEO S
;EES T
entryFF 
.FF 
PropertyFF 
(FF 
xFF  
=>FF! #
xFF$ %
.FF% &(
AuditoriaUsuarioModificacionFF& B
)FFB C
.FFC D

IsModifiedFFD N
=FFO P
trueFFQ U
;FFU V
entryGG 
.GG 
PropertyGG 
(GG 
xGG  
=>GG! #
xGG$ %
.GG% &"
CodigoMotivoReagendadoGG& <
)GG< =
.GG= >

IsModifiedGG> H
=GGI J
trueGGK O
;GGO P
}HH 
}II 	
publicJJ 
voidJJ 
	CalificarJJ 
(JJ 
CitaJJ "
citaJJ# '
)JJ' (
{KK 	
varLL 
responseLL 
=LL 
_contextLL #
.LL# $
CitasLL$ )
.LL) *
WhereLL* /
(LL/ 0
xLL0 1
=>LL2 4
xLL5 6
.LL6 7
IdCitaLL7 =
==LL> @
citaLLA E
.LLE F
IdCitaLLF L
)LLL M
.LLM N
FirstOrDefaultLLN \
(LL\ ]
)LL] ^
;LL^ _
ifNN 
(NN 
responseNN 
!=NN 
nullNN 
)NN  
{OO 
responsePP 
.PP 
FlagCalificacionPP )
=PP* +
citaPP, 0
.PP0 1
FlagCalificacionPP1 A
;PPA B
responseQQ 
.QQ "
CodigoTipoCalificacionQQ /
=QQ0 1
citaQQ2 6
.QQ6 7"
CodigoTipoCalificacionQQ7 M
;QQM N
responseRR 
.RR -
!CodigoTipoExperienciaCalificacionRR :
=RR; <
citaRR= A
.RRA B-
!CodigoTipoExperienciaCalificacionRRB c
;RRc d
responseSS 
.SS (
CodigoMotivoCitaNoConcretadaSS 5
=SS6 7
citaSS8 <
.SS< =(
CodigoMotivoCitaNoConcretadaSS= Y
;SSY Z
responseTT 
.TT .
"CodigoPorcentajeAvanceCalificacionTT ;
=TT< =
citaTT> B
.TTB C.
"CodigoPorcentajeAvanceCalificacionTTC e
;TTe f
responseUU 
.UU 
FechaEstimadaCierreUU ,
=UU- .
citaUU/ 3
.UU3 4
FechaEstimadaCierreUU4 G
;UUG H
responseVV 
.VV "
ComentarioCalificacionVV /
=VV0 1
citaVV2 6
.VV6 7"
ComentarioCalificacionVV7 M
;VVM N
responseWW 
.WW &
AuditoriaFechaModificacionWW 3
=WW4 5
DateTimeWW6 >
.WW> ?
NowWW? B
;WWB C
responseXX 
.XX (
AuditoriaUsuarioModificacionXX 5
=XX6 7
citaXX8 <
.XX< =(
AuditoriaUsuarioModificacionXX= Y
;XXY Z
}YY 
}ZZ 	
public\\ 
void\\ -
!CalificarMultipleCitaNoConcretada\\ 5
(\\5 6
int\\6 9
idprospecto\\: E
,\\E F
string\\G M
mensajenoconcretada\\N a
)\\a b
{]] 	
var^^ 
response^^ 
=^^ 
_context^^ #
.^^# $
Citas^^$ )
.^^) *
Where^^* /
(^^/ 0
x^^0 1
=>^^2 4
x^^5 6
.^^6 7
IdProspecto^^7 B
==^^C E
idprospecto^^F Q
&&^^R T
!^^U V
x^^V W
.^^W X
FlagCalificacion^^X h
.^^h i
HasValue^^i q
&&__1 3
(__4 5
x__5 6
.__6 7"
CodigoMotivoReagendado__7 M
==__N P
null__Q U
||__V X
x__Y Z
.__Z ["
CodigoMotivoReagendado__[ q
==__r t
$num__u v
||__w y
x__z {
.__{ |#
CodigoMotivoReagendado	__| í
==
__ì ï
$num
__ñ ó
)
__ó ò
)
__ò ô
;
__ô ö
if`` 
(`` 
response`` 
.`` 
Any`` 
(`` 
)`` 
)`` 
{aa 
foreachbb 
(bb 
varbb 
citabb !
inbb" $
responsebb% -
)bb- .
{cc 
citadd 
.dd 
FlagCalificaciondd )
=dd* +
truedd, 0
;dd0 1
citaee 
.ee "
CodigoTipoCalificacionee /
=ee0 1
$numee2 3
;ee3 4
citaff 
.ff (
CodigoMotivoCitaNoConcretadaff 5
=ff6 7
$numff8 9
;ff9 :
citagg 
.gg "
ComentarioCalificaciongg /
=gg0 1
mensajenoconcretadagg2 E
;ggE F
citahh 
.hh &
AuditoriaFechaModificacionhh 3
=hh4 5
DateTimehh6 >
.hh> ?
Nowhh? B
;hhB C
}ii 
}jj 
}kk 	
publicll 
Citall 
ObtenerCitaPorIdll $
(ll$ %
intll% (
idcitall) /
)ll/ 0
{mm 	
returnnn 
_contextnn 
.nn 
Citasnn !
.nn! "
Wherenn" '
(nn' (
xnn( )
=>nn* ,
xnn- .
.nn. /
IdCitann/ 5
==nn6 8
idcitann9 ?
)nn? @
.oo 
Selectoo 
(oo 
xoo 
=>oo 
newoo  
Citaoo! %
{pp 
IdProspectopp 
=pp 
xpp  !
.pp! "
IdProspectopp" -
,pp- .
IdCitaDispositivoqq #
=qq$ %
$numqq& '
,qq' (
NumeroEntrevistarr "
=rr# $
xrr% &
.rr& '
NumeroEntrevistarr' 7
,rr7 8
CodigoEstadoss 
=ss  
xss! "
.ss" #
CodigoEstadoss# /
,ss/ 0
CodigoResultadott !
=tt" #
xtt$ %
.tt% &
CodigoResultadott& 5
.tt5 6
Valuett6 ;
,tt; < 
CodigoEtapaProspectouu &
=uu' (
xuu) *
.uu* + 
CodigoEtapaProspectouu+ ?
,uu? @
ReferenciaUbicacionvv %
=vv& '
xvv( )
.vv) *
ReferenciaUbicacionvv* =
,vv= >
FlagInvitadoGAww  
=ww! "
xww# $
.ww$ %
FlagInvitadoGAww% 3
,ww3 4
FlagInvitadoGUxx  
=xx! "
xxx# $
.xx$ %
FlagInvitadoGUxx% 3
,xx3 4'
CodigoIntermediarioCreacionyy -
=yy. /
xyy0 1
.yy1 2'
CodigoIntermediarioCreacionyy2 M
,yyM N
CodigoLineaNegociozz $
=zz% &
xzz' (
.zz( )
CodigoLineaNegociozz) ;
.zz; <
Valuezz< A
,zzA B
Descripcion{{ 
={{ 
x{{  !
.{{! "
Descripcion{{" -
,{{- .
AlertaMinutosAntes|| $
=||% &
x||' (
.||( )
AlertaMinutosAntes||) ;
}}} 
)}} 
.}} 
FirstOrDefault}} !
(}}! "
)}}" #
;}}# $
}~~ 	
} 
}ÄÄ  í
UD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\Repositories\ProspectoRepository.cs
	namespace		 	
Agenda		
 
.		 
Infrastucture		 
.		 
Repositories		 +
{

 
public 

class 
ProspectoRepository $
:% & 
IProspectoRepository' ;
{ 
private 
readonly 
AgendaContext &
_context' /
;/ 0
public 
IUnitOfWork 

UnitOfWork %
{& '
get( +
{, -
return. 4
_context5 =
;= >
}? @
}A B
public 
ProspectoRepository "
(" #
AgendaContext# 0
context1 8
)8 9
=>: <
_context= E
=F G
contextH O
??P R
throwS X
newY \!
ArgumentNullException] r
(r s
nameofs y
(y z
context	z Å
)
Å Ç
)
Ç É
;
É Ñ
public 
void 
Agregar 
( 
	Prospecto %
	prospecto& /
)/ 0
{ 	
	prospecto 
. "
AuditoriaFechaCreacion ,
=- .
DateTime/ 7
.7 8
Now8 ;
;; <
_context 
. 

Prospectos 
.  
Add  #
(# $
	prospecto$ -
)- .
;. /
} 	
public 
void 

Actualizar 
( 
	Prospecto (
	prospecto) 2
)2 3
{ 	
var 
response 
= 
_context #
.# $

Prospectos$ .
.. /
Where/ 4
(4 5
x5 6
=>7 9
x: ;
.; <
IdProspecto< G
==H J
	prospectoK T
.T U
IdProspectoU `
)` a
.. /
Include/ 6
(6 7
a7 8
=>9 ;
a< =
.= >
AdnRenta> F
)F G
.. /
Include/ 6
(6 7
d7 8
=>9 ;
d< =
.= >
DireccionProspecto> P
)P Q
.Q R
FirstOrDefaultR `
(` a
)a b
;b c
if 
( 
response 
!= 
null  
)  !
{ 
if   
(   
	prospecto   
.   
CodigoFuente   *
==  + -
$num  . /
)  / 0
{!! 
var"" 
responsereferido"" (
="") *
_context""+ 3
.""3 4
	Referidos""4 =
.""= >
Where""> C
(""C D
x""D E
=>""F H
x""I J
.""J K
IdProspecto""K V
==""W Y
response""Z b
.""b c
IdReferenciador""c r
&&##3 5
x##6 7
.##7 8
Nombres##8 ?
==##@ B
response##C K
.##K L
Nombres##L S
&&##T V
x##W X
.##X Y
ApellidoPaterno##Y h
==##i k
response##l t
.##t u
ApellidoPaterno	##u Ñ
&&$$3 5
x$$6 7
.$$7 8
Telefono$$8 @
==$$A C
response$$D L
.$$L M
TelefonoFijo$$M Y
)$$Y Z
.$$Z [
FirstOrDefault$$[ i
($$i j
)$$j k
;$$k l
responsereferido&& $
.&&$ %
Nombres&&% ,
=&&- .
	prospecto&&/ 8
.&&8 9
Nombres&&9 @
;&&@ A
responsereferido'' $
.''$ %
ApellidoPaterno''% 4
=''5 6
	prospecto''7 @
.''@ A
ApellidoPaterno''A P
;''P Q
responsereferido(( $
.(($ %
Telefono((% -
=((. /
	prospecto((0 9
.((9 :
TelefonoFijo((: F
;((F G
})) 
response++ 
.++ 
CodigoTipoDocumento++ ,
=++- .
	prospecto++/ 8
.++8 9
CodigoTipoDocumento++9 L
;++L M
response,, 
.,, 
NumeroDocumento,, (
=,,) *
	prospecto,,+ 4
.,,4 5
NumeroDocumento,,5 D
;,,D E
response-- 
.-- 
Nombres--  
=--! "
	prospecto--# ,
.--, -
Nombres--- 4
;--4 5
response.. 
... 
ApellidoPaterno.. (
=..) *
	prospecto..+ 4
...4 5
ApellidoPaterno..5 D
;..D E
response// 
.// 
ApellidoMaterno// (
=//) *
	prospecto//+ 4
.//4 5
ApellidoMaterno//5 D
;//D E
response00 
.00 
FechaNacimiento00 (
=00) *
	prospecto00+ 4
.004 5
FechaNacimiento005 D
;00D E
response11 
.11 

CodigoSexo11 #
=11$ %
	prospecto11& /
.11/ 0

CodigoSexo110 :
;11: ;
response22 
.22 
CodigoFuente22 %
=22& '
	prospecto22( 1
.221 2
CodigoFuente222 >
;22> ?
response33 
.33 
CodigoSubFuente33 (
=33) *
	prospecto33+ 4
.334 5
CodigoSubFuente335 D
;33D E
response44 
.44 
Referenciador44 &
=44' (
	prospecto44) 2
.442 3
Referenciador443 @
;44@ A
response55 
.55 
CodigoEtapa55 $
=55% &
	prospecto55' 0
.550 1
CodigoEtapa551 <
;55< =
response66 
.66 
CodigoEstado66 %
=66& '
	prospecto66( 1
.661 2
CodigoEstado662 >
;66> ?
response77 
.77 
MonedaFondo77 $
=77% &
	prospecto77' 0
.770 1
MonedaFondo771 <
;77< =
response88 
.88 
CodigoRangoEdad88 (
=88) *
	prospecto88+ 4
.884 5
CodigoRangoEdad885 D
;88D E
response99 
.99 
CodigoRangoFondo99 )
=99* +
	prospecto99, 5
.995 6
CodigoRangoFondo996 F
;99F G
response:: 
.:: 

MontoFondo:: #
=::$ %
	prospecto::& /
.::/ 0

MontoFondo::0 :
;::: ;
response;; 
.;; 
Empresa;;  
=;;! "
	prospecto;;# ,
.;;, -
Empresa;;- 4
;;;4 5
response<< 
.<< 
CodigoCargo<< $
=<<% &
	prospecto<<' 0
.<<0 1
CodigoCargo<<1 <
;<<< =
response== 
.== 
	OtroCargo== "
===# $
	prospecto==% .
.==. /
	OtroCargo==/ 8
;==8 9
response>> 
.>> 
FlagHijo>> !
=>>" #
	prospecto>>$ -
.>>- .
FlagHijo>>. 6
;>>6 7
response?? 
.?? 
TelefonoFijo?? %
=??& '
	prospecto??( 1
.??1 2
TelefonoFijo??2 >
;??> ?
response@@ 
.@@ 
TelefonoCelular@@ (
=@@) *
	prospecto@@+ 4
.@@4 5
TelefonoCelular@@5 D
;@@D E
responseAA 
.AA 
CorreoElectronico1AA +
=AA, -
	prospectoAA. 7
.AA7 8
CorreoElectronico1AA8 J
;AAJ K
responseBB 
.BB &
AuditoriaFechaModificacionBB 3
=BB4 5
DateTimeBB6 >
.BB> ?
NowBB? B
;BBB C
responseCC 
.CC (
AuditoriaUsuarioModificacionCC 5
=CC6 7
	prospectoCC8 A
.CCA B(
AuditoriaUsuarioModificacionCCB ^
;CC^ _
ifFF 
(FF 
	prospectoFF 
.FF 
DireccionProspectoFF 0
!=FF1 3
nullFF4 8
)FF8 9
{GG 
ifHH 
(HH 
responseHH  
.HH  !
DireccionProspectoHH! 3
==HH4 6
nullHH7 ;
)HH; <
_contextII  
.II  !
DireccionProspectosII! 4
.II4 5
AddII5 8
(II8 9
	prospectoII9 B
.IIB C
DireccionProspectoIIC U
)IIU V
;IIV W
elseJJ 
{KK 
responseLL  
.LL  !
DireccionProspectoLL! 3
.LL3 4
	DireccionLL4 =
=LL> ?
	prospectoLL@ I
.LLI J
DireccionProspectoLLJ \
.LL\ ]
	DireccionLL] f
;LLf g
responseMM  
.MM  !
DireccionProspectoMM! 3
.MM3 4
Departamento_IdMM4 C
=MMD E
	prospectoMMF O
.MMO P
DireccionProspectoMMP b
.MMb c
Departamento_IdMMc r
;MMr s
responseNN  
.NN  !
DireccionProspectoNN! 3
.NN3 4
Provincia_IdNN4 @
=NNA B
	prospectoNNC L
.NNL M
DireccionProspectoNNM _
.NN_ `
Provincia_IdNN` l
;NNl m
responseOO  
.OO  !
DireccionProspectoOO! 3
.OO3 4
Distrito_IdOO4 ?
=OO@ A
	prospectoOOB K
.OOK L
DireccionProspectoOOL ^
.OO^ _
Distrito_IdOO_ j
;OOj k
}PP 
}QQ 
ifTT 
(TT 
responseTT 
.TT 
AdnRentaTT %
!=TT& (
nullTT) -
)TT- .
{UU 
responseVV 
.VV 
AdnRentaVV %
.VV% &
MonedaPatrimonioAfpVV& 9
=VV: ;
	prospectoVV< E
.VVE F
AdnRentaVVF N
.VVN O
MonedaPatrimonioAfpVVO b
;VVb c
responseWW 
.WW 
AdnRentaWW %
.WW% &
MontoPatrimonioAfpWW& 8
=WW9 :
	prospectoWW; D
.WWD E
AdnRentaWWE M
.WWM N
MontoPatrimonioAfpWWN `
;WW` a
responseXX 
.XX 
AdnRentaXX %
.XX% &
PorcentajeAvanceXX& 6
=XX7 8
	prospectoXX9 B
.XXB C
AdnRentaXXC K
.XXK L
PorcentajeAvanceXXL \
;XX\ ]
responseYY 
.YY 
AdnRentaYY %
.YY% &$
PorcentajeAvanceCompletoYY& >
=YY? @
	prospectoYYA J
.YYJ K
AdnRentaYYK S
.YYS T$
PorcentajeAvanceCompletoYYT l
;YYl m
responseZZ 
.ZZ 
AdnRentaZZ %
.ZZ% &&
AuditoriaFechaModificacionZZ& @
=ZZA B
DateTimeZZC K
.ZZK L
NowZZL O
;ZZO P
response[[ 
.[[ 
AdnRenta[[ %
.[[% &(
AuditoriaUsuarioModificacion[[& B
=[[C D
	prospecto[[E N
.[[N O(
AuditoriaUsuarioModificacion[[O k
;[[k l
}\\ 
else]] 
{^^ 
_context__ 
.__ 
	AdnRentas__ &
.__& '
Add__' *
(__* +
	prospecto__+ 4
.__4 5
AdnRenta__5 =
)__= >
;__> ?
}`` 
}aa 
}bb 	
publicdd 
voiddd 
	Descartardd 
(dd 
	Prospectodd '
	prospectodd( 1
)dd1 2
{ee 	
varff 
responseff 
=ff 
_contextff #
.ff# $

Prospectosff$ .
.ff. /
Whereff/ 4
(ff4 5
xff5 6
=>ff7 9
xff: ;
.ff; <
IdProspectoff< G
==ffH J
	prospectoffK T
.ffT U
IdProspectoffU `
)ff` a
.ffa b
FirstOrDefaultffb p
(ffp q
)ffq r
;ffr s
ifhh 
(hh 
responsehh 
!=hh 
nullhh 
)hh 
{ii 
responsejj 
.jj 
FlagDescartejj %
=jj& '
	prospectojj( 1
.jj1 2
FlagDescartejj2 >
;jj> ?
responsekk 
.kk #
CodigoMotivoUnoDescartekk 0
=kk1 2
	prospectokk3 <
.kk< =#
CodigoMotivoUnoDescartekk= T
;kkT U
responsell 
.ll #
CodigoMotivoDosDescartell 0
=ll1 2
	prospectoll3 <
.ll< =#
CodigoMotivoDosDescartell= T
;llT U
responsemm 
.mm $
CodigoMotivoTresDescartemm 1
=mm2 3
	prospectomm4 =
.mm= >$
CodigoMotivoTresDescartemm> V
;mmV W
responsenn 
.nn $
TextoMontivoTresDescartenn 1
=nn2 3
	prospectonn4 =
.nn= >$
TextoMontivoTresDescartenn> V
;nnV W
responseoo 
.oo #
FechaMotivoTresDescarteoo 0
=oo1 2
	prospectooo3 <
.oo< =#
FechaMotivoTresDescarteoo= T
;ooT U
responsepp 
.pp &
AuditoriaFechaModificacionpp 3
=pp4 5
DateTimepp6 >
.pp> ?
Nowpp? B
;ppB C
responseqq 
.qq (
AuditoriaUsuarioModificacionqq 5
=qq6 7
	prospectoqq8 A
.qqA B(
AuditoriaUsuarioModificacionqqB ^
;qq^ _
}rr 
ifuu 
(uu 
	prospectouu 
.uu #
FechaMotivoTresDescarteuu 0
!=uu1 3
nulluu4 8
)uu8 9
{vv 
RecordatorioLlamadaww #
recordatorioLlamadaww$ 7
=ww8 9
newww: =
RecordatorioLlamadaww> Q
(wwQ R
)wwR S
;wwS T
recordatorioLlamadaxx #
.xx# $
IdProspectoxx$ /
=xx0 1
	prospectoxx2 ;
.xx; <
IdProspectoxx< G
;xxG H
recordatorioLlamadayy #
.yy# $
FechaRecordatorioyy$ 5
=yy6 7
	prospectoyy8 A
.yyA B#
FechaMotivoTresDescarteyyB Y
.yyY Z
ValueyyZ _
;yy_ `
recordatorioLlamadazz #
.zz# $,
 IdRecordatorioLlamadaDispositivozz$ D
=zzE F
$numzzG H
;zzH I
recordatorioLlamada{{ #
.{{# $

FlagActivo{{$ .
={{/ 0
true{{1 5
;{{5 6
recordatorioLlamada|| #
.||# $

HoraInicio||$ .
=||/ 0
TimeSpan||1 9
.||9 :
Parse||: ?
(||? @
$str||@ G
)||G H
;||H I
recordatorioLlamada}} #
.}}# $
HoraFin}}$ +
=}}, -
TimeSpan}}. 6
.}}6 7
Parse}}7 <
(}}< =
$str}}= D
)}}D E
;}}E F
recordatorioLlamada~~ #
.~~# $
CodigoLineaNegocio~~$ 6
=~~7 8
$num~~9 ;
;~~; <
recordatorioLlamada #
.# $"
AuditoriaFechaCreacion$ :
=; <
DateTime= E
.E F
NowF I
;I J!
recordatorioLlamada
ÄÄ #
.
ÄÄ# $&
AuditoriaUsuarioCreacion
ÄÄ$ <
=
ÄÄ= >
	prospecto
ÄÄ? H
.
ÄÄH I*
AuditoriaUsuarioModificacion
ÄÄI e
;
ÄÄe f
_context
ÇÇ 
.
ÇÇ "
RecordatorioLlamadas
ÇÇ -
.
ÇÇ- .
Add
ÇÇ. 1
(
ÇÇ1 2!
recordatorioLlamada
ÇÇ2 E
)
ÇÇE F
;
ÇÇF G
}
ÉÉ 
}
ÑÑ 	
public
ÜÜ 
void
ÜÜ 
ActivarProspecto
ÜÜ $
(
ÜÜ$ %
	Prospecto
ÜÜ% .
	prospecto
ÜÜ/ 8
)
ÜÜ8 9
{
áá 	
var
àà 
response
àà 
=
àà 
_context
àà #
.
àà# $

Prospectos
àà$ .
.
àà. /
Where
àà/ 4
(
àà4 5
x
àà5 6
=>
àà7 9
x
àà: ;
.
àà; <
IdProspecto
àà< G
==
ààH J
	prospecto
ààK T
.
ààT U
IdProspecto
ààU `
)
àà` a
.
ààa b
FirstOrDefault
ààb p
(
ààp q
)
ààq r
;
ààr s
if
ää 
(
ää 
response
ää 
!=
ää 
null
ää  
)
ää  !
{
ãã 
response
åå 
.
åå 
TelefonoCelular
åå (
=
åå) *
string
åå+ 1
.
åå1 2
IsNullOrEmpty
åå2 ?
(
åå? @
	prospecto
åå@ I
.
ååI J
TelefonoCelular
ååJ Y
)
ååY Z
?
åå[ \
response
åå] e
.
ååe f
TelefonoCelular
ååf u
:
ååv w
	prospectoååx Å
.ååÅ Ç
TelefonoCelularååÇ ë
;ååë í
response
çç 
.
çç 
TelefonoFijo
çç %
=
çç& '
string
çç( .
.
çç. /
IsNullOrEmpty
çç/ <
(
çç< =
	prospecto
çç= F
.
ççF G
TelefonoFijo
ççG S
)
ççS T
?
ççU V
response
ççW _
.
çç_ `
TelefonoFijo
çç` l
:
ççm n
	prospecto
çço x
.
ççx y
TelefonoFijoççy Ö
;ççÖ Ü
response
éé 
.
éé 
FlagDescarte
éé %
=
éé& '
null
éé( ,
;
éé, -
response
èè 
.
èè %
CodigoMotivoUnoDescarte
èè 0
=
èè1 2
null
èè3 7
;
èè7 8
response
êê 
.
êê %
CodigoMotivoDosDescarte
êê 0
=
êê1 2
null
êê3 7
;
êê7 8
response
ëë 
.
ëë &
CodigoMotivoTresDescarte
ëë 1
=
ëë2 3
null
ëë4 8
;
ëë8 9
response
íí 
.
íí &
TextoMontivoTresDescarte
íí 1
=
íí2 3
null
íí4 8
;
íí8 9
response
ìì 
.
ìì %
FechaMotivoTresDescarte
ìì 0
=
ìì1 2
null
ìì3 7
;
ìì7 8
}
îî 
}
ïï 	
public
ññ 
Task
ññ 
<
ññ 
	Prospecto
ññ 
>
ññ 
Obtener
ññ &
(
ññ& '
int
ññ' *
prospectoId
ññ+ 6
)
ññ6 7
{
óó 	
throw
òò 
new
òò %
NotImplementedException
òò -
(
òò- .
)
òò. /
;
òò/ 0
}
ôô 	
}
öö 
}úú ≥K
_D:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\Repositories\RecordatorioLlamadaRepository.cs
	namespace 	
Agenda
 
. 
Infrastucture 
. 
Repositories +
{ 
public 

class )
RecordatorioLlamadaRepository .
:/ 0*
IRecordatorioLlamadaRepository1 O
{		 
private

 
readonly

 
AgendaContext

 &
_context

' /
;

/ 0
public 
IUnitOfWork 

UnitOfWork %
{& '
get( +
{, -
return. 4
_context5 =
;= >
}? @
}A B
public )
RecordatorioLlamadaRepository ,
(, -
AgendaContext- :
context; B
)B C
=>D F
_contextG O
=P Q
contextR Y
??Z \
throw] b
newc f!
ArgumentNullExceptiong |
(| }
nameof	} É
(
É Ñ
context
Ñ ã
)
ã å
)
å ç
;
ç é
public 
void 
Agregar 
( 
RecordatorioLlamada /
recordatorioLlamada0 C
)C D
{ 	
var 
	prospecto 
= 
_context $
.$ %

Prospectos% /
./ 0
Where0 5
(5 6
x6 7
=>8 :
x; <
.< =
IdProspecto= H
==I K
recordatorioLlamadaL _
._ `
IdProspecto` k
)k l
.l m
FirstOrDefaultm {
({ |
)| }
;} ~
if 
( 
	prospecto 
!= 
null !
)! "
{ 
	prospecto 
. 
TelefonoCelular )
=* +
recordatorioLlamada, ?
.? @
	Prospecto@ I
.I J
TelefonoCelularJ Y
;Y Z
	prospecto 
. 
TelefonoFijo &
=' (
recordatorioLlamada) <
.< =
	Prospecto= F
.F G
TelefonoFijoG S
;S T
} 
recordatorioLlamada 
.  
	Prospecto  )
=* +
null, 0
;0 1
recordatorioLlamada 
.  "
AuditoriaFechaCreacion  6
=7 8
DateTime9 A
.A B
NowB E
;E F
_context 
.  
RecordatorioLlamadas )
.) *
Add* -
(- .
recordatorioLlamada. A
)A B
;B C
} 	
public 
void 

Actualizar 
( 
RecordatorioLlamada 2
recordatorioLlamada3 F
)F G
{ 	
var 
response 
= 
_context #
.# $ 
RecordatorioLlamadas$ 8
.8 9
Where9 >
(> ?
x? @
=>A C
xD E
.E F!
IdRecordatorioLlamadaF [
==\ ^
recordatorioLlamada_ r
.r s"
IdRecordatorioLlamada	s à
)
à â
.
â ä
FirstOrDefault
ä ò
(
ò ô
)
ô ö
;
ö õ
if!! 
(!! 
response!! 
!=!! 
null!!  
)!!  !
{"" 
response## 
.## 
AlertaMinutosAntes## +
=##, -
recordatorioLlamada##. A
.##A B
AlertaMinutosAntes##B T
;##T U
response$$ 
.$$ 
Descripcion$$ $
=$$% &
recordatorioLlamada$$' :
.$$: ;
Descripcion$$; F
;$$F G
response%% 
.%% &
AuditoriaFechaModificacion%% 3
=%%4 5
DateTime%%6 >
.%%> ?
Now%%? B
;%%B C
response&& 
.&& (
AuditoriaUsuarioModificacion&& 5
=&&6 7
recordatorioLlamada&&8 K
.&&K L(
AuditoriaUsuarioModificacion&&L h
;&&h i
}'' 
}(( 	
public** 
void**  
ActualizarReagendado** (
(**( )
RecordatorioLlamada**) <
recordatorioLlamada**= P
)**P Q
{++ 	
var,, 
response,, 
=,, +
ObtenerRecordatorioLlamadaPorId,, :
(,,: ;
recordatorioLlamada,,; N
.,,N O!
IdRecordatorioLlamada,,O d
),,d e
;,,e f
if-- 
(-- 
response-- 
!=-- 
null--  
)--  !
{.. 
response00 
.00 
FechaRecordatorio00 *
=00+ ,
recordatorioLlamada00- @
.00@ A
FechaRecordatorio00A R
;00R S
response11 
.11 

HoraInicio11 #
=11$ %
recordatorioLlamada11& 9
.119 :

HoraInicio11: D
;11D E
response22 
.22 
HoraFin22  
=22! "
recordatorioLlamada22# 6
.226 7
HoraFin227 >
;22> ?
response44 
.44 
AlertaMinutosAntes44 +
=44, -
recordatorioLlamada44. A
.44A B
AlertaMinutosAntes44B T
;44T U
response55 
.55 "
AuditoriaFechaCreacion55 /
=550 1
DateTime552 :
.55: ;
Now55; >
;55> ?
response66 
.66 $
AuditoriaUsuarioCreacion66 1
=662 3
recordatorioLlamada664 G
.66G H(
AuditoriaUsuarioModificacion66H d
;66d e
response77 
.77 &
AuditoriaFechaModificacion77 3
=774 5
null776 :
;77: ;
response88 
.88 (
AuditoriaUsuarioModificacion88 5
=886 7
null888 <
;88< =
_context99 
.99  
RecordatorioLlamadas99 -
.99- .
Add99. 1
(991 2
response992 :
)99: ;
;99; <
RecordatorioLlamada<< #'
recordatoriollamadaanterior<<$ ?
=<<@ A
new<<B E
RecordatorioLlamada<<F Y
(<<Y Z
)<<Z [
;<<[ \'
recordatoriollamadaanterior== +
.==+ ,!
IdRecordatorioLlamada==, A
===B C
recordatorioLlamada==D W
.==W X!
IdRecordatorioLlamada==X m
;==m n'
recordatoriollamadaanterior>> +
.>>+ ,

FlagActivo>>, 6
=>>7 8
false>>9 >
;>>> ?'
recordatoriollamadaanterior?? +
.??+ ,&
AuditoriaFechaModificacion??, F
=??G H
DateTime??I Q
.??Q R
Now??R U
;??U V'
recordatoriollamadaanterior@@ +
.@@+ ,(
AuditoriaUsuarioModificacion@@, H
=@@I J
recordatorioLlamada@@K ^
.@@^ _(
AuditoriaUsuarioModificacion@@_ {
;@@{ |
varAA 
entryAA 
=AA 
_contextAA $
.AA$ % 
RecordatorioLlamadasAA% 9
.AA9 :
AttachAA: @
(AA@ A'
recordatoriollamadaanteriorAAA \
)AA\ ]
;AA] ^
entryBB 
.BB 
PropertyBB 
(BB 
xBB  
=>BB! #
xBB$ %
.BB% &&
AuditoriaFechaModificacionBB& @
)BB@ A
.BBA B

IsModifiedBBB L
=BBM N
trueBBO S
;BBS T
entryCC 
.CC 
PropertyCC 
(CC 
xCC  
=>CC! #
xCC$ %
.CC% &(
AuditoriaUsuarioModificacionCC& B
)CCB C
.CCC D

IsModifiedCCD N
=CCO P
trueCCQ U
;CCU V
entryDD 
.DD 
PropertyDD 
(DD 
xDD  
=>DD! #
xDD$ %
.DD% &

FlagActivoDD& 0
)DD0 1
.DD1 2

IsModifiedDD2 <
=DD= >
trueDD? C
;DDC D
}EE 
}FF 	
publicHH 
RecordatorioLlamadaHH "+
ObtenerRecordatorioLlamadaPorIdHH# B
(HHB C
intHHC F!
idrecordatoriollamadaHHG \
)HH\ ]
{II 	
returnJJ 
_contextJJ 
.JJ  
RecordatorioLlamadasJJ 0
.JJ0 1
WhereJJ1 6
(JJ6 7
xJJ7 8
=>JJ9 ;
xJJ< =
.JJ= >!
IdRecordatorioLlamadaJJ> S
==JJT V!
idrecordatoriollamadaJJW l
)JJl m
.KK 
SelectKK 
(KK 
xKK 
=>KK 
newKK  
RecordatorioLlamadaKK! 4
{LL 
IdProspectoMM 
=MM  !
xMM" #
.MM# $
IdProspectoMM$ /
,MM/ 0,
 IdRecordatorioLlamadaDispositivoNN 4
=NN5 6
xNN7 8
.NN8 9,
 IdRecordatorioLlamadaDispositivoNN9 Y
,NNY Z
CodigoLineaNegocioOO &
=OO' (
xOO) *
.OO* +
CodigoLineaNegocioOO+ =
,OO= >

FlagActivoPP 
=PP  
xPP! "
.PP" #

FlagActivoPP# -
,PP- .
DescripcionQQ 
=QQ  !
xQQ" #
.QQ# $
DescripcionQQ$ /
}RR 
)RR 
.RR 
FirstOrDefaultRR !
(RR! "
)RR" #
;RR# $
}SS 	
}TT 
}UU ·$
SD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\Repositories\ReunionRepository.cs
	namespace 	
Agenda
 
. 
Infrastucture 
. 
Repositories +
{ 
public 

class 
ReunionRepository "
:# $
IReunionRepository% 7
{		 
private

 
readonly

 
AgendaContext

 &
_context

' /
;

/ 0
public 
IUnitOfWork 

UnitOfWork %
{& '
get( +
{, -
return. 4
_context5 =
;= >
}? @
}A B
public 
ReunionRepository  
(  !
AgendaContext! .
context/ 6
)6 7
=>8 :
_context; C
=D E
contextF M
??N P
throwQ V
newW Z!
ArgumentNullException[ p
(p q
nameofq w
(w x
contextx 
)	 Ä
)
Ä Å
;
Å Ç
public 
Reunion 
Agregar 
( 
Reunion &
reunion' .
). /
{ 	
reunion 
. "
AuditoriaFechaCreacion *
=+ ,
DateTime- 5
.5 6
Now6 9
;9 :
return 
_context 
. 
Reunions $
.$ %
Add% (
(( )
reunion) 0
)0 1
.1 2
Entity2 8
;8 9
} 	
public 
int 

Actualizar 
( 
Reunion %
reunion& -
)- .
{ 	
var 
response 
= 
_context #
.# $
Reunions$ ,
., -
Where- 2
(2 3
x3 4
=>5 7
x8 9
.9 :
	IdReunion: C
==D F
reunionG N
.N O
	IdReunionO X
)X Y
.Y Z
FirstOrDefaultZ h
(h i
)i j
;j k
if 
( 
response 
!= 
null  
)  !
{ 
response 
. 
FechaReunion %
=& '
reunion( /
./ 0
FechaReunion0 <
;< =
response 
. 

HoraInicio #
=$ %
reunion& -
.- .

HoraInicio. 8
;8 9
response 
. 
HoraFin  
=! "
reunion# *
.* +
HoraFin+ 2
;2 3
response 
. 
	Ubicacion "
=# $
reunion% ,
., -
	Ubicacion- 6
;6 7
response 
. 
CodigoDepartamento +
=, -
reunion. 5
.5 6
CodigoDepartamento6 H
;H I
response   
.   
CodigoProvincia   (
=  ) *
reunion  + 2
.  2 3
CodigoProvincia  3 B
;  B C
response!! 
.!! 
CodigoDistrito!! '
=!!( )
reunion!!* 1
.!!1 2
CodigoDistrito!!2 @
;!!@ A
response"" 
."" 
FlagUrlTeams"" %
=""& '
reunion""( /
.""/ 0
FlagUrlTeams""0 <
;""< =
response## 
.## 
UrlTeams## !
=##" #
reunion##$ +
.##+ ,
UrlTeams##, 4
;##4 5
response$$ 
.$$ &
AuditoriaFechaModificacion$$ 3
=$$4 5
DateTime$$6 >
.$$> ?
Now$$? B
;$$B C
response%% 
.%% (
AuditoriaUsuarioModificacion%% 5
=%%6 7
reunion%%8 ?
.%%? @(
AuditoriaUsuarioModificacion%%@ \
;%%\ ]
}&& 
return(( 
response(( 
!=(( 
null(( #
?(($ %
response((& .
.((. /
	IdReunion((/ 8
:((9 :
$num((; <
;((< =
})) 	
public** 
int** 
Eliminar** 
(** 
Reunion** #
reunion**$ +
)**+ ,
{++ 	
_context,, 
.,, 
Reunions,, 
.,, 
Remove,, $
(,,$ %
reunion,,% ,
),,, -
;,,- .
return.. 
reunion.. 
... 
	IdReunion.. $
;..$ %
}// 	
}00 
}11 ª
JD:\Proyecto-Agenda-Mejoras-1\Agenda.Infrastucture\Utilitarios\ConfigApp.cs
	namespace 	
Agenda
 
. 
Infrastucture 
. 
Utilitarios *
{ 
public 

class 
	ConfigApp 
{ 
private 
long 
_TamanoMaximoLog %
=& '
$num( )
;) *
private 
string 
_RutaArchivoLog &
=' (
string) /
./ 0
Empty0 5
;5 6
public 
long 
TamanoMaximoLog #
{$ %
get& )
=>* ,
_TamanoMaximoLog- =
;= >
}? @
public 
string 
RutaArchivoLog $
{% &
get' *
=>+ -
_RutaArchivoLog. =
;= >
}? @
public 
	ConfigApp 
( 
) 
{ 	&
LeerParametrosDesdeArchivo &
(& '
)' (
;( )
} 	
private 
void &
LeerParametrosDesdeArchivo /
(/ 0
)0 1
{ 	
var  
configurationBuilder $
=% &
new' * 
ConfigurationBuilder+ ?
(? @
)@ A
. 
SetBasePath 
( 
Path 
. 
GetDirectoryName .
(. /
Assembly/ 7
.7 8
GetEntryAssembly8 H
(H I
)I J
.J K
LocationK S
)S T
)T U
. 
AddJsonFile 
( 
$str +
)+ ,
;, -
IConfigurationRoot 
root #
=$ % 
configurationBuilder& :
.: ;
Build; @
(@ A
)A B
;B C!
IConfigurationSection !

properties" ,
=- .
root/ 3
.3 4

GetSection4 >
(> ?
$str? K
)K L
;L M
_TamanoMaximoLog   
=   

properties   )
.  ) *
GetValue  * 2
<  2 3
long  3 7
>  7 8
(  8 9
$str  9 J
)  J K
;  K L
_RutaArchivoLog!! 
=!! 

properties!! (
.!!( )
GetValue!!) 1
<!!1 2
string!!2 8
>!!8 9
(!!9 :
$str!!: L
)!!L M
;!!M N
}"" 	
}## 
}$$ 