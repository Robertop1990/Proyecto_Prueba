Ö	
UD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\CitaAggregate\Actividad.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
CitaAggregate( 5
{ 
public 

class 
	Actividad 
{ 
public 
int 
IdActividad 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
short 
CodigoEtapa  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 

NumeroCita 
{ 
get  #
;# $
set% (
;( )
}* +
public 
short 
CodigoLineaNegocio '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public		 
string		 
Etiqueta		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} œ9
PD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\CitaAggregate\Cita.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
CitaAggregate( 5
{ 
public		 

class		 
Cita		 
:		 
IAggregateRoot		 &
{

 
public 
int 
IdCita 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
IdCitaDispositivo $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
IdGrupoProducto #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
NumeroEntrevista #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
short 
CodigoEstado !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
? 
CodigoResultado %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
? 
	FechaCita "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
TimeSpan 
? 

HoraInicio #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TimeSpan 
? 
HoraFin  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
	Ubicacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
CodigoDepartamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoProvincia %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoDistrito $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
ReferenciaUbicacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
? 
FlagInvitadoGU #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
? 
FlagInvitadoGA #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
short 
? 
AlertaMinutosAntes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
int '
CodigoIntermediarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
int 
? +
CodigoIntermediarioModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
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
?!! "
CodigoMotivoReagendado!! ,
{!!- .
get!!/ 2
;!!2 3
set!!4 7
;!!7 8
}!!9 :
public"" 
short"" 
?""  
CodigoMotivoDescarte"" *
{""+ ,
get""- 0
;""0 1
set""2 5
;""5 6
}""7 8
public## 
short## 
?## 
CodigoLineaNegocio## (
{##) *
get##+ .
;##. /
set##0 3
;##3 4
}##5 6
public$$ 
string$$ 
Descripcion$$ !
{$$" #
get$$$ '
;$$' (
set$$) ,
;$$, -
}$$. /
public%% 
bool%% 
?%% 
FlagCalificacion%% %
{%%& '
get%%( +
;%%+ ,
set%%- 0
;%%0 1
}%%2 3
public&& 
short&& 
?&& "
CodigoTipoCalificacion&& ,
{&&- .
get&&/ 2
;&&2 3
set&&4 7
;&&7 8
}&&9 :
public'' 
short'' 
?'' -
!CodigoTipoExperienciaCalificacion'' 7
{''8 9
get'': =
;''= >
set''? B
;''B C
}''D E
public(( 
short(( 
?(( (
CodigoMotivoCitaNoConcretada(( 2
{((3 4
get((5 8
;((8 9
set((: =
;((= >
}((? @
public)) 
short)) 
?)) .
"CodigoPorcentajeAvanceCalificacion)) 8
{))9 :
get)); >
;))> ?
set))@ C
;))C D
}))E F
public** 
bool** 
?** 
FlagUrlTeams** !
{**" #
get**$ '
;**' (
set**) ,
;**, -
}**. /
public++ 
string++ 
UrlTeams++ 
{++  
get++! $
;++$ %
set++& )
;++) *
}+++ ,
public,, 
DateTime,, 
?,, 
FechaEstimadaCierre,, ,
{,,- .
get,,/ 2
;,,2 3
set,,4 7
;,,7 8
},,9 :
public-- 
string-- "
ComentarioCalificacion-- ,
{--- .
get--/ 2
;--2 3
set--4 7
;--7 8
}--9 :
public.. 
DateTime.. 
?.. "
AuditoriaFechaCreacion.. /
{..0 1
get..2 5
;..5 6
set..7 :
;..: ;
}..< =
public// 
string// $
AuditoriaUsuarioCreacion// .
{/// 0
get//1 4
;//4 5
set//6 9
;//9 :
}//; <
public00 
DateTime00 
?00 &
AuditoriaFechaModificacion00 3
{004 5
get006 9
;009 :
set00; >
;00> ?
}00@ A
public11 
string11 (
AuditoriaUsuarioModificacion11 2
{113 4
get115 8
;118 9
set11: =
;11= >
}11? @
public77 
	Prospecto77 
	Prospecto77 "
{77# $
get77% (
;77( )
set77* -
;77- .
}77/ 0
public88 
RecordatorioLlamada88 "
RecordatorioLlamada88# 6
{887 8
get889 <
;88< =
set88> A
;88A B
}88C D
}:: 
};; ú
`D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\CitaAggregate\CitaMovimientoEstado.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
CitaAggregate( 5
{ 
public 

class  
CitaMovimientoEstado %
:& '
IAggregateRoot( 6
{ 
public 
int 
IdMovimiento 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
IdCita		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
short

 
CodigoEstado

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
short 
CodigoResultado $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
? *
AuditoriaFechaMovimientoEstado 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
string ,
 AuditoriaUsuarioMovimientoEstado 6
{7 8
get9 <
;< =
set> A
;A B
}C D
} 
} ß

[D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\CitaAggregate\ICitaRepository.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
CitaAggregate( 5
{ 
public 

	interface 
ICitaRepository $
:% &
IRepository' 2
<2 3
Cita3 7
>7 8
{ 
void 
Agregar 
( 
Cita 
cita 
) 
;  
void		 

Actualizar		 
(		 
Cita		 
cita		 !
)		! "
;		" #
void

 
	Calificar

 
(

 
Cita

 
cita

  
)

  !
;

! "
Cita 
ObtenerCitaPorId 
( 
int !
idcita" (
)( )
;) *
void  
ActualizarReagendado !
(! "
Cita" &
cita' +
)+ ,
;, -
void -
!CalificarMultipleCitaNoConcretada .
(. /
int/ 2
idprospecto3 >
,> ?
string@ F
mensajenoconcretadaG Z
)Z [
;[ \
} 
} ‹
YD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\AdnRenta.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
AdnRenta 
: 
IAggregateRoot *
{ 
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
 
decimal

 

TipoCambio

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
int 
? "
NumeroHijosDependiente *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
short 
? 
MonedaPatrimonioAfp )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
decimal 
? 
MontoPatrimonioAfp *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
int 
? 
PorcentajeAvance $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? $
PorcentajeAvanceCompleto ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
DateTime 
? "
AuditoriaFechaCreacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string $
AuditoriaUsuarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
	Prospecto 
	Prospecto "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ˚
iD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\ConsolidadoIntermediario.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class $
ConsolidadoIntermediario )
{ 
public 
int &
IdConsolidadoIntermediario -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public 
int 
CodigoIntermediario &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
NombreRazonSocial '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public		 
int		 
?		 !
CodigoIntermediarioGU		 )
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
 
NombreGU

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
CorreoElectronicoGU )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
? !
CodigoIntermediarioGA )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
NombreGA 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
CorreoElectronicoGA )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} È
]D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\Departamento.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
Departamento 
{ 
public 
short 
Departamento_Id $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
string		 
Nombre		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public 
ICollection 
< 
	Provincia $
>$ %

Provincias& 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
ICollection 
< 
Distrito #
># $
	Distritos% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} À
cD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\DireccionProspecto.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
DireccionProspecto #
:$ %
IAggregateRoot& 4
{ 
public		 
int		 
IdDireccion		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
IdProspecto

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
Departamento_Id $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
short 
Provincia_Id !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
Distrito_Id  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 

FlagActivo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
? 
TipoDireccion #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
DateTime 
? "
AuditoriaFechaCreacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string $
AuditoriaUsuarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
	Prospecto 
	Prospecto "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ∂

YD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\Distrito.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
Distrito 
{ 
public 
short 
Distrito_Id  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
Provincia_Id !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
Departamento_Id $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
string		 
Nombre		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public 
Departamento 
Departamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
	Provincia 
	Provincia "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} π	
eD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\IProspectoRepository.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

	interface  
IProspectoRepository )
:* +
IRepository, 7
<7 8
	Prospecto8 A
>A B
{ 
void 
Agregar 
( 
	Prospecto 
	prospecto (
)( )
;) *
void		 

Actualizar		 
(		 
	Prospecto		 !
	prospecto		" +
)		+ ,
;		, -
void

 
	Descartar

 
(

 
	Prospecto

  
	prospecto

! *
)

* +
;

+ ,
void 
ActivarProspecto 
( 
	Prospecto '
	prospecto( 1
)1 2
;2 3
Task 
< 
	Prospecto 
> 
Obtener 
(  
int  #
prospectoId$ /
)/ 0
;0 1
} 
} ∂

[D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\ListaTabla.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 

ListaTabla 
{ 
public 
int 
IdListaTabla 
{  !
get" %
;% &
set' *
;* +
}, -
public 
short 
IdTabla 
{ 
get "
;" #
set$ '
;' (
}) *
public 
short 
CodigoCampo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
ValorCadena		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
decimal

 
ValorNumerico

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
short 
CodigoLineaNegocio '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} ∂T
ZD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\Prospecto.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
	Prospecto 
: 
IAggregateRoot +
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
int 
IdProspecto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
short 
? 
CodigoTipoDocumento )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
NumeroDocumento %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Nombres 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ApellidoPaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ApellidoMaterno %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
? 
FechaNacimiento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 
CodigoRangoEdad %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
short 
? 
CodigoRangoIngreso (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
? 

CodigoSexo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
? 
MonedaFondo !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
? 

MontoFondo "
{# $
get% (
;( )
set* -
;- .
}/ 0
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
string 
CorreoElectronico1 (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
TelefonoFijo "
{# $
get% (
;( )
set* -
;- .
}/ 0
public   
string   
TelefonoCelular   %
{  & '
get  ( +
;  + ,
set  - 0
;  0 1
}  2 3
public!! 
short!! 
CodigoEstado!! !
{!!" #
get!!$ '
;!!' (
set!!) ,
;!!, -
}!!. /
public"" 
short"" 
CodigoEtapa""  
{""! "
get""# &
;""& '
set""( +
;""+ ,
}""- .
public## 
int## 
?## 
IdReferenciador## #
{##$ %
get##& )
;##) *
set##+ .
;##. /
}##0 1
public$$ 
string$$ 
Referenciador$$ #
{$$$ %
get$$& )
;$$) *
set$$+ .
;$$. /
}$$0 1
public%% 
bool%% 
?%% 
FlagDescarte%% !
{%%" #
get%%$ '
;%%' (
set%%) ,
;%%, -
}%%. /
public&& 
short&& 
?&& #
CodigoMotivoUnoDescarte&& -
{&&. /
get&&0 3
;&&3 4
set&&5 8
;&&8 9
}&&: ;
public'' 
short'' 
?'' #
CodigoMotivoDosDescarte'' -
{''. /
get''0 3
;''3 4
set''5 8
;''8 9
}'': ;
public(( 
short(( 
?(( $
CodigoMotivoTresDescarte(( .
{((/ 0
get((1 4
;((4 5
set((6 9
;((9 :
}((; <
public)) 
string)) $
TextoMontivoTresDescarte)) .
{))/ 0
get))1 4
;))4 5
set))6 9
;))9 :
})); <
public** 
short** 
?** 
CodigoRangoFondo** &
{**' (
get**) ,
;**, -
set**. 1
;**1 2
}**3 4
public++ 
DateTime++ 
?++ #
FechaMotivoTresDescarte++ 0
{++1 2
get++3 6
;++6 7
set++8 ;
;++; <
}++= >
public,, 
DateTime,, 
?,, "
AuditoriaFechaCreacion,, /
{,,0 1
get,,2 5
;,,5 6
set,,7 :
;,,: ;
},,< =
public-- 
string-- $
AuditoriaUsuarioCreacion-- .
{--/ 0
get--1 4
;--4 5
set--6 9
;--9 :
}--; <
public.. 
DateTime.. 
?.. &
AuditoriaFechaModificacion.. 3
{..4 5
get..6 9
;..9 :
set..; >
;..> ?
}..@ A
public// 
string// (
AuditoriaUsuarioModificacion// 2
{//3 4
get//5 8
;//8 9
set//: =
;//= >
}//? @
public55 
AdnRenta55 
AdnRenta55  
{55! "
get55# &
;55& '
set55( +
;55+ ,
}55- .
public66 
Cita66 
Cita66 
{66 
get66 
;66 
set66  #
;66# $
}66% &
public77 
RecordatorioLlamada77 "
RecordatorioLlamada77# 6
{777 8
get779 <
;77< =
set77> A
;77A B
}77C D
public88 
DireccionProspecto88 !
DireccionProspecto88" 4
{885 6
get887 :
;88: ;
set88< ?
;88? @
}88A B
public99 
Referido99 
Referido99  
{99! "
get99# &
;99& '
set99( +
;99+ ,
}99- .
public>> 
	Prospecto>> 
(>> 
)>> 
{?? 	
}AA 	
publicDD 
	ProspectoDD 
(DD 
intDD 
IdProspectoDD (
,DD( )
boolDD* .
?DD. /
FlagDescarteDD0 <
,DD< =
shortDD> C
?DDC D#
CodigoMotivoUnoDescarteDDE \
,DD\ ]
shortDD] b
?DDb c#
CodigoMotivoDosDescarteDDd {
,DD{ |
short	DD| Å
?
DDÅ Ç&
CodigoMotivoTresDescarte
DDÉ õ
,
DDõ ú
stringEE $
TextoMontivoTresDescarteEE  8
,EE8 9
DateTimeEE9 A
?EEA B#
FechaMotivoTresDescarteEEC Z
,EEZ [
DateTimeEE[ c
?EEc d&
AuditoriaFechaModificacionEEe 
,	EE Ä
string
EEÅ á*
AuditoriaUsuarioModificacion
EEà §
)FF 
{GG 	
thisHH 
.HH 
IdProspectoHH 
=HH 
IdProspectoHH *
;HH* +
thisII 
.II 
FlagDescarteII 
=II 
FlagDescarteII  ,
;II, -
thisJJ 
.JJ #
CodigoMotivoUnoDescarteJJ (
=JJ) *#
CodigoMotivoUnoDescarteJJ+ B
;JJB C
thisKK 
.KK #
CodigoMotivoDosDescarteKK (
=KK) *#
CodigoMotivoDosDescarteKK+ B
;KKB C
thisLL 
.LL $
CodigoMotivoTresDescarteLL )
=LL* +$
CodigoMotivoTresDescarteLL, D
;LLD E
thisMM 
.MM $
TextoMontivoTresDescarteMM )
=MM* +$
TextoMontivoTresDescarteMM, D
;MMD E
thisNN 
.NN #
FechaMotivoTresDescarteNN (
=NN) *#
FechaMotivoTresDescarteNN+ B
;NNB C
thisOO 
.OO (
AuditoriaUsuarioModificacionOO -
=OO. /(
AuditoriaUsuarioModificacionOO0 L
;OOL M
thisPP 
.PP &
AuditoriaFechaModificacionPP +
=PP, -&
AuditoriaFechaModificacionPP. H
;PPH I
}QQ 	
publicSS 
	ProspectoSS 
(SS 
intSS 
IdProspectoSS (
,SS( )
stringSS) /
TelefonoCelularSS0 ?
,SS? @
stringSS@ F
TelefonoFijoSSG S
,SSS T
DateTimeSST \
?SS\ ]&
AuditoriaFechaModificacionSS^ x
,SSx y
string	SSz Ä*
AuditoriaUsuarioModificacion
SSÅ ù
)
SSù û
{TT 	
thisUU 
.UU 
IdProspectoUU 
=UU 
IdProspectoUU *
;UU* +
thisVV 
.VV 
TelefonoCelularVV  
=VV! "
TelefonoCelularVV# 2
;VV2 3
thisWW 
.WW 
TelefonoFijoWW 
=WW 
TelefonoFijoWW  ,
;WW, -
thisXX 
.XX (
AuditoriaUsuarioModificacionXX -
=XX. /(
AuditoriaUsuarioModificacionXX0 L
;XXL M
thisYY 
.YY &
AuditoriaFechaModificacionYY +
=YY, -&
AuditoriaFechaModificacionYY. H
;YYH I
}ZZ 	
}\\ 
}]] –	
ZD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\Provincia.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
	Provincia 
{ 
public 
short 
Provincia_Id !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
short		 
Departamento_Id		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
string

 
Nombre

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
ICollection 
< 
Distrito #
># $
	Distritos% .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
Departamento 
Departamento (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ≠

ZD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\RangoEdad.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
	RangoEdad 
{ 
public 
short 
CodigoRangoEdad $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
short 
CodigoCanal  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
short		 
RangoInicio		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
short

 
RangoFin

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
bool 

FlagActivo 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ≤

]D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\RangoIngreso.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
RangoIngreso 
{ 
public 
short 
CodigoRangoIngreso '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
short 
CodigoCanal  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
RangoInicio 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
RangoFin		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
bool

 

FlagActivo

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
} 
YD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\Referido.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
Referido 
: 
IAggregateRoot )
{ 
public		 
int		 

IdReferido		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
int

 
IdProspecto

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
int !
IdReferidoDispositivo (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
short 
CodigoTipoReferido '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
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
string 
Telefono 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
? 

FlagActivo 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
virtual 
	Prospecto  
	Prospecto! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ù
\D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ProspectoAggregate\TablaTablas.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ProspectoAggregate( :
{ 
public 

class 
TablaTablas 
{ 
public 
int 
IdTablaTablas  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
short 
IdTabla 
{ 
get "
;" #
set$ '
;' (
}) *
public 
short 
CodigoCampo  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
string		 
ValorCadena		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
decimal

 
?

 
ValorNumerico

 %
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
string 
ValorAuxiliarCadena )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string  
ValorAuxiliarCadena2 *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
bool 
? 

FlagActivo 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} Ù
yD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\RecordatorioLlamadaAggregate\IRecordatorioLlamadaRepository.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' ((
RecordatorioLlamadaAggregate( D
{ 
public 

	interface *
IRecordatorioLlamadaRepository 3
:4 5
IRepository6 A
<A B
RecordatorioLlamadaB U
>U V
{ 
void 
Agregar 
( 
RecordatorioLlamada (
recordatorioLlamada) <
)< =
;= >
void 

Actualizar 
( 
RecordatorioLlamada +
recordatorioLlamada, ?
)? @
;@ A
void		  
ActualizarReagendado		 !
(		! "
RecordatorioLlamada		" 5
recordatorioLlamada		6 I
)		I J
;		J K
}

 
} •
nD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\RecordatorioLlamadaAggregate\RecordatorioLlamada.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' ((
RecordatorioLlamadaAggregate( D
{ 
public 

class 
RecordatorioLlamada $
:% &
IAggregateRoot' 5
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
public 
TimeSpan 
? 

HoraInicio #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TimeSpan 
? 
HoraFin  
{! "
get# &
;& '
set( +
;+ ,
}- .
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
DateTime 
? "
AuditoriaFechaCreacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string $
AuditoriaUsuarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
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
}? @
public 
	Prospecto 
	Prospecto "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Cita 
Cita 
{ 
get 
; 
set  #
;# $
}% &
}!! 
}"" „
`D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ReunionAggegate\IReunionRepository.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ReunionAggegate( 7
{ 
public 

	interface 
IReunionRepository '
:( )
IRepository* 5
<5 6
Reunion6 =
>= >
{ 
Reunion 
Agregar 
( 
Reunion 
reunion  '
)' (
;( )
int 

Actualizar 
( 
Reunion 
reunion &
)& '
;' (
int		 
Eliminar		 
(		 
Reunion		 
reunion		 $
)		$ %
;		% &
}

 
} ø 
UD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\AggregatesModel\ReunionAggegate\Reunion.cs
	namespace 	
Agenda
 
. 
Domain 
. 
AggregatesModel '
.' (
ReunionAggegate( 7
{ 
public 

class 
Reunion 
: 
IAggregateRoot )
{ 
public 
int 
	IdReunion 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 &
IdConsolidadoIntermediario		 -
{		. /
get		0 3
;		3 4
set		5 8
;		8 9
}		: ;
public

 
int

  
IdReunionDispositivo

 '
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
public 
short 
? 
CodigoTipoReunion '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DateTime 
FechaReunion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
TimeSpan 

HoraInicio "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
TimeSpan 
HoraFin 
{  !
get" %
;% &
set' *
;* +
}, -
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
public 
string 
ReferenciaUbicacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
bool 
? 
FlagInvitadoGU #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
? 
FlagInvitadoGA #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
short 
? 
AlertaMinutosAntes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool 
? 
FlagUrlTeams !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
UrlTeams 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? "
AuditoriaFechaCreacion /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
string $
AuditoriaUsuarioCreacion .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
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
} 
} ´
ND:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\Exceptions\AgendaDomainException.cs
	namespace 	
Agenda
 
. 
Domain 
. 

Exceptions "
{ 
public 

class !
AgendaDomainException &
:' (
	Exception) 2
{ 
public !
AgendaDomainException $
($ %
)% &
{ 	
}
 
public

 !
AgendaDomainException

 $
(

$ %
string

% +
message

, 3
)

3 4
: 
base 
( 
message 
) 
{ 	
}
 
public !
AgendaDomainException $
($ %
string% +
message, 3
,3 4
	Exception5 >
innerException? M
)M N
: 
base 
( 
message 
, 
innerException *
)* +
{ 	
}
 
} 
} ˙
=D:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\SeedWork\Entity.cs
	namespace 	
Agenda
 
. 
Domain 
. 
SeedWork  
{ 
public 

abstract 
class 
Entity  
{ 
public		 
DateTime		 
?		 "
AuditoriaFechaCreacion		 /
{		0 1
get		2 5
;		5 6
set		7 :
;		: ;
}		< =
public

 
string

 $
AuditoriaUsuarioCreacion

 .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
DateTime 
? &
AuditoriaFechaModificacion 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
string (
AuditoriaUsuarioModificacion 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
private 
List 
< 
INotification "
>" #
_domainEvents$ 1
;1 2
public 
IReadOnlyCollection "
<" #
INotification# 0
>0 1
DomainEvents2 >
=>? A
_domainEventsB O
?O P
.P Q

AsReadOnlyQ [
([ \
)\ ]
;] ^
public 
void 
AddDomainEvent "
(" #
INotification# 0
	eventItem1 :
): ;
{ 	
_domainEvents 
= 
_domainEvents )
??* ,
new- 0
List1 5
<5 6
INotification6 C
>C D
(D E
)E F
;F G
_domainEvents 
. 
Add 
( 
	eventItem '
)' (
;( )
} 	
public 
void 
RemoveDomainEvent %
(% &
INotification& 3
	eventItem4 =
)= >
{ 	
_domainEvents 
? 
. 
Remove !
(! "
	eventItem" +
)+ ,
;, -
} 	
public 
void 
ClearDomainEvents %
(% &
)& '
{ 	
_domainEvents 
? 
. 
Clear  
(  !
)! "
;" #
} 	
}   
}!! ∑
ED:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\SeedWork\IAggregateRoot.cs
	namespace 	
Agenda
 
. 
Domain 
. 
SeedWork  
{ 
public 

	interface 
IAggregateRoot #
{ 
} 
} ö
BD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\SeedWork\IRepository.cs
	namespace 	
Agenda
 
. 
Domain 
. 
SeedWork  
{ 
public 

	interface 
IRepository  
<  !
T! "
>" #
where$ )
T* +
:, -
IAggregateRoot. <
{ 
IUnitOfWork 

UnitOfWork 
{  
get! $
;$ %
}& '
} 
} ±
BD:\Proyecto-Agenda-Mejoras-1\Agenda.Domain\SeedWork\IUnitOfWork.cs
	namespace 	
Agenda
 
. 
Domain 
. 
SeedWork  
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
Task		 
<		 
int		 
>		 
SaveChangesAsync		 "
(		" #
CancellationToken		# 4
cancellationToken		5 F
=		G H
default		I P
(		P Q
CancellationToken		Q b
)		b c
)		c d
;		d e
Task

 
<

 
bool

 
>

 
SaveEntitiesAsync

 $
(

$ %
CancellationToken

% 6
cancellationToken

7 H
=

I J
default

K R
(

R S
CancellationToken

S d
)

d e
)

e f
;

f g
} 
} 