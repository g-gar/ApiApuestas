�
ZC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\repository\src\DbConnectionPool.cs
	namespace 	

repository
 
{ 
public 

class 
DbConnectionPool !
:" #
IDbConnectionPool$ 5
{6 7
public 
R 
execute 
< 
T 
, 
R 
> 
( 
T  
dto! $
,$ %
Func& *
<* +
Dto+ .
,. /
R0 1
>1 2
fn3 5
)5 6
where7 <
T= >
:? @
classA F
,F G
DtoH K
{ 	
return 
fn 
. 
Invoke 
( 
dto  
)  !
;! "
}		 	
public 
void 
execute 
< 
T 
> 
( 
T  
dto! $
,$ %
Action& ,
<, -
T- .
>. /
fn0 2
)2 3
where4 9
T: ;
:< =
class> C
,C D
DtoE H
{ 	
fn
.
Invoke
(
dto
)
;
} 	
public 
void 
execute 
( 
Action "
fn# %
)% &
{ 	
fn 
. 
Invoke 
( 
) 
; 
} 	
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
} 	
~ 	
DbConnectionPool	 
( 
) 
{   	
Dispose!! 
(!! 
false!! 
)!! 
;!! 
}"" 	
}## 
}$$ �
YC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\repository\src\EventRepository.cs
	namespace 	

repository
 
{ 
public 

class 
EventRepository  
:! "
IEventRepository# 3
{3 4
private		 
readonly		 
ILogger		  
logger		! '
;		' (
private

 
readonly

 
IDbConnectionPool

 *
dbConnectionPool

+ ;
;

; <
public 
EventRepository 
( 
IDbConnectionPool 0
dbConnectionPool1 A
,A B
ILoggerC J
loggerK Q
)Q R
{
this 
. 
dbConnectionPool !
=" #
dbConnectionPool$ 4
;4 5
this 
. 
logger 
= 
logger  
;  !
} 	
public 
void 
	addPlayer 
( 
int !
eventId" )
,) *
double+ 1
quota2 7
,7 8
int9 <
position= E
)E F
{ 	
dbConnectionPool 
. 
execute $
($ %
new% (
AddPlayerDto) 5
(5 6
)6 7
{ 
EventId 
= 
eventId !
,! "
Quota 
= 
quota 
, 
Position 
= 
position #
} 
,
dto 
=> 
logger 
. 
LogInformation +
(+ ,
$", .
{. /
dto/ 2
}2 3
"3 4
)4 5
)5 6
;6 7
} 	
public 
void 
createEvent 
(  
int  #
type$ (
,( )
string* 0
description1 <
,< =
object> D
dateE I
)I J
{ 	
} 	
public!! 
void!! 
terminateEvent!! "
(!!" #
int!!# &
eventId!!' .
,!!. /
int!!0 3
playerWinnerId!!4 B
)!!B C
{"" 	
}$$ 	
public&& 
void&& 
	createBet&& 
(&& 
int&& !
eventId&&" )
,&&) *
int&&+ .
playerId&&/ 7
,&&7 8
double&&9 ?
amount&&@ F
,&&F G
int&&H K
winner&&L R
)&&R S
{'' 	
})) 	
public++ 
void++ 
Dispose++ 
(++ 
)++ 
{,, 	
Dispose-- 
(-- 
true-- 
)-- 
;-- 
GC.. 
... 
SuppressFinalize.. 
(..  
this..  $
)..$ %
;..% &
}// 	
	protected11 
virtual11 
void11 
Dispose11 &
(11& '
bool11' +
	disposing11, 5
)115 6
{22 	
}44 	
~55 	
EventRepository55	 
(55 
)55 
{66 	
Dispose77 
(77 
false77 
)77 
;77 
}88 	
}99 
}:: �	
[C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\repository\src\IDbConnectionPool.cs
	namespace 	

repository
 
{ 
public 

	interface 
IDbConnectionPool &
:' (
IDisposable) 4
{5 6
public 
R 
execute 
< 
T 
, 
R 
> 
( 
T  
dto! $
,$ %
Func& *
<* +
Dto+ .
,. /
R0 1
>1 2
fn3 5
)5 6
where7 <
T= >
:? @
classA F
,F G
DtoH K
;K L
public 
void 
execute 
< 
T 
> 
( 
T  
dto! $
,$ %
Action& ,
<, -
T- .
>. /
fn0 2
)2 3
where4 9
T: ;
:< =
class> C
,C D
DtoE H
;H I
public 
void 
execute 
( 
Action "
fn# %
)% &
;& '
}		 
}

 �
ZC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\repository\src\RepositoryModule.cs
	namespace 	

repository
 
{ 
public 

static 
class 
RepositoryModule (
{( )
public 
static 
IServiceCollection (2
&ConfigureRepositoryDependencyInjection) O
(O P
thisP T
IServiceCollectionU g
serviceCollectionh y
)y z
{ 	
return		 
serviceCollection		 $
.

 
AddSingleton

 
<

 
IEventRepository

 .
,

. /
EventRepository

0 ?
>

? @
(

@ A
)

A B
. 
AddSingleton 
< "
ITransactionRepository 4
,4 5!
TransactionRepository6 K
>K L
(L M
)M N
. 
AddSingleton 
< 
IUserRepository -
,- .
UserRepository/ =
>= >
(> ?
)? @
;@ A
}
} 
} �
_C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\repository\src\TransactionRepository.cs
	namespace 	

repository
 
{ 
public 

class !
TransactionRepository &
:' ("
ITransactionRepository) ?
{@ A
private 
readonly 
IDbConnectionPool *
dbConnectionPool+ ;
;; <
public		 !
TransactionRepository		 $
(		$ %
IDbConnectionPool		% 6
dbConnectionPool		7 G
)		G H
{

 	
this 
. 
dbConnectionPool !
=" #
dbConnectionPool$ 4
;4 5
} 	
public 
int 
create 
( 
int 
userId $
,$ %
int& )
type* .
,. /
double0 6
amount7 =
)= >
{ 	
return 
default 
( 
int 
) 
;  
} 	
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{ 	
} 	
~ 	!
TransactionRepository	 
( 
)  
{ 	
Dispose 
( 
false 
) 
; 
}   	
}!! 
}"" �
XC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\repository\src\UserRepository.cs
	namespace 	

repository
 
{ 
public 

class 
UserRepository 
:  !
IUserRepository" 1
{2 3
private 
readonly 
IDbConnectionPool *
dbConnectionPool+ ;
;; <
public		 
UserRepository		 
(		 
IDbConnectionPool		 /
dbConnectionPool		0 @
)		@ A
{

 	
this 
. 
dbConnectionPool !
=" #
dbConnectionPool$ 4
;4 5
} 	
public 
void 
register 
( 
string #
dni$ '
,' (
string) /
username0 8
,8 9
string: @
passwordA I
)I J
{ 	
} 	
public 
bool 
authenticate  
(  !
string! '
username( 0
,0 1
string2 8
password9 A
)A B
{ 	
return 
default 
( 
bool 
)  
;  !
} 	
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
	protected 
virtual 
void 
Dispose &
(& '
bool' +
	disposing, 5
)5 6
{   	
}"" 	
~## 	
UserRepository##	 
(## 
)## 
{$$ 	
Dispose%% 
(%% 
false%% 
)%% 
;%% 
}&& 	
}'' 
}(( 