·
\C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\AddPlayerCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class 
AddPlayerCommand !
:" #
Command$ +
<+ ,
AddPlayerDto, 8
>8 9
{: ;
private

 
readonly

 
IEventRepository

 )
_eventRepository

* :
;

: ;
public 
AddPlayerCommand 
(  
IEventRepository  0
eventRepository1 @
,@ A
ILoggerB I
loggerJ P
)P Q
:R S
baseT X
(X Y
loggerY _
)_ `
{ 	
_eventRepository 
= 
eventRepository .
;. /
} 	
	protected 
override 
void 
execute  '
(' (
AddPlayerDto( 4
dto5 8
)8 9
=>: <
_eventRepository= M
.M N
	addPlayerN W
(W X
dtoX [
.[ \
EventId\ c
,c d
dtoe h
.h i
Quotai n
,n o
dtop s
.s t
Positiont |
)| }
;} ~
public 
override 
bool 
checkPreconditions /
(/ 0
AddPlayerDto0 <
dto= @
)@ A
=>B D
trueE I
;I J
} 
} ½
cC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\AuthenticateUserCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class #
AuthenticateUserCommand (
:) *
Command+ 2
<2 3
AuthenticateUserDto3 F
,F G
boolH L
>L M
{N O
private		 
readonly		 
IUserRepository		 (
_userRepository		) 8
;		8 9
public #
AuthenticateUserCommand &
(& '
IUserRepository' 6
userRepository7 E
,E F
ILoggerG N
loggerO U
)U V
:W X
baseY ]
(] ^
logger^ d
)d e
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
	protected 
override 
bool 
execute  '
(' (
AuthenticateUserDto( ;
dto< ?
)? @
=>A C
_userRepositoryD S
.S T
authenticateT `
(` a
dtoa d
.d e
Usernamee m
,m n
dtoo r
.r s
Passwords {
){ |
;| }
public 
override 
bool 
checkPreconditions /
(/ 0
AuthenticateUserDto0 C
dtoD G
)G H
=>I K
trueL P
;P Q
} 
} ‚
\C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\CreateBetCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class 
CreateBetCommand !
:" #
Command$ +
<+ ,
CreateBetDto, 8
>8 9
{: ;
private		 
readonly		 
IEventRepository		 )
_eventRepository		* :
;		: ;
public 
CreateBetCommand 
(  
IEventRepository  0
eventRepository1 @
,@ A
ILoggerB I
loggerJ P
)P Q
:R S
baseT X
(X Y
loggerY _
)_ `
{ 	
_eventRepository 
= 
eventRepository .
;. /
} 	
	protected 
override 
void 
execute  '
(' (
CreateBetDto( 4
dto5 8
)8 9
=>: <
_eventRepository= M
.M N
	createBetN W
(W X
dtoX [
.[ \
EventId\ c
,c d
dtoe h
.h i
UserIdi o
,o p
dtoq t
.t u
Amountu {
,{ |
dto	} €
.
€ 
Winner
 ‡
)
‡ ˆ
;
ˆ ‰
public 
override 
bool 
checkPreconditions /
(/ 0
CreateBetDto0 <
dto= @
)@ A
=>B D
trueE I
;I J
} 
} Ç
^C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\CreateEventCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class 
CreateEventCommand #
:$ %
Command& -
<- .
CreateEventDto. <
>< =
{= >
private		 
readonly		 
IEventRepository		 )
_eventRepository		* :
;		: ;
public 
CreateEventCommand !
(! "
IEventRepository" 2
eventRepository3 B
,B C
ILoggerD K
loggerL R
)R S
:T U
baseV Z
(Z [
logger[ a
)a b
{ 	
_eventRepository 
= 
eventRepository .
;. /
} 	
	protected 
override 
void 
execute  '
(' (
CreateEventDto( 6
dto7 :
): ;
=>< >
_eventRepository? O
.O P
createEventP [
([ \
dto\ _
._ `
Type` d
,d e
dtof i
.i j
Descriptionj u
,u v
dtow z
.z {
Date{ 
)	 €
;
€ 
public 
override 
bool 
checkPreconditions /
(/ 0
CreateEventDto0 >
dto? B
)B C
=>D F
trueG K
;K L
} 
} ®
dC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\CreateTransactionCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class $
CreateTransactionCommand )
:* +
Command, 3
<3 4 
CreateTransactionDto4 H
,H I
intJ M
>M N
{N O
private		 
readonly		 "
ITransactionRepository		 /"
_transactionRepository		0 F
;		F G
public $
CreateTransactionCommand '
(' ("
ITransactionRepository( >!
transactionRepository? T
,T U
ILoggerV ]
logger^ d
)d e
:f g
baseh l
(l m
loggerm s
)s t
{ 	"
_transactionRepository "
=# $!
transactionRepository% :
;: ;
} 	
	protected 
override 
int 
execute &
(& ' 
CreateTransactionDto' ;
dto< ?
)? @
=>A C"
_transactionRepositoryD Z
.Z [
create[ a
(a b
dtob e
.e f
UserIdf l
,l m
dton q
.q r
Typer v
,v w
dtox {
.{ |
Amount	| ‚
)
‚ ƒ
;
ƒ „
public 
override 
bool 
checkPreconditions /
(/ 0 
CreateTransactionDto0 D
dtoE H
)H I
=>J L
trueM Q
;Q R
} 
} º
_C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\RegisterUserCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class 
RegisterUserCommand $
:% &
Command' .
<. /
CreateUserDto/ <
>< =
{= >
private		 
readonly		 
IUserRepository		 (
_userRepository		) 8
;		8 9
public 
RegisterUserCommand "
(" #
IUserRepository# 2
userRepository3 A
,A B
ILoggerC J
loggerK Q
)Q R
:S T
baseU Y
(Y Z
loggerZ `
)` a
{ 	
_userRepository 
= 
userRepository ,
;, -
} 	
	protected 
override 
void 
execute  '
(' (
CreateUserDto( 5
dto6 9
)9 :
=>; =
_userRepository> M
.M N
registerN V
(V W
dtoW Z
.Z [
Dni[ ^
,^ _
dto` c
.c d
Usernamed l
,l m
dton q
.q r
Passwordr z
)z {
;{ |
public 
override 
bool 
checkPreconditions /
(/ 0
CreateUserDto0 =
dto> A
)A B
=>C E
trueF J
;J K
} 
} ˜
aC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\command\TerminateEventCommand.cs
	namespace 	
core
 
. 
command 
{ 
public 

class !
TerminateEventCommand &
:' (
Command) 0
<0 1
TerminateEventDto1 B
>B C
{C D
private		 
readonly		 
IEventRepository		 )
_eventRepository		* :
;		: ;
public !
TerminateEventCommand $
($ %
IEventRepository% 5
eventRepository6 E
,E F
ILoggerG N
loggerO U
)U V
:W X
baseY ]
(] ^
logger^ d
)d e
{ 	
_eventRepository 
= 
eventRepository .
;. /
} 	
	protected 
override 
void 
execute  '
(' (
TerminateEventDto( 9
dto: =
)= >
=>? A
_eventRepositoryB R
.R S
terminateEventS a
(a b
dtob e
.e f
EventIdf m
,m n
dtoo r
.r s
WinnerIds {
)| }
;} ~
public 
override 
bool 
checkPreconditions /
(/ 0
TerminateEventDto0 A
dtoB E
)E F
=>G I
trueJ N
;N O
} 
} Ó
NC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\CoreModule.cs
	namespace 	
core
 
{ 
public 

static 
class 

CoreModule "
{# $
public 
static 
IServiceCollection (,
 ConfigureCoreDependencyInjection) I
(I J
thisJ N
IServiceCollectionO a
serviceCollectionb s
)s t
{		 	
return

 
serviceCollection

 $
. 
AddTransient 
< 
Command %
<% &
AddPlayerDto& 2
>2 3
,3 4
AddPlayerCommand5 E
>E F
(F G
)G H
. 
AddTransient 
< 
Command %
<% &
AuthenticateUserDto& 9
,9 :
bool; ?
>? @
,@ A#
AuthenticateUserCommandB Y
>Y Z
(Z [
)[ \
. 
AddTransient 
< 
Command %
<% &
CreateBetDto& 2
>2 3
,3 4
CreateBetCommand5 E
>E F
(F G
)G H
. 
AddTransient 
< 
Command %
<% &
CreateEventDto& 4
>4 5
,5 6
CreateEventCommand7 I
>I J
(J K
)K L
. 
AddTransient 
< 
Command %
<% & 
CreateTransactionDto& :
,: ;
int< ?
>? @
,@ A$
CreateTransactionCommandB Z
>Z [
([ \
)\ ]
. 
AddTransient 
< 
Command %
<% &
CreateUserDto& 3
>3 4
,4 5
RegisterUserCommand6 I
>I J
(J K
)K L
. 
AddTransient 
< 
Command %
<% &
TerminateEventDto& 7
>7 8
,8 9!
TerminateEventCommand: O
>O P
(P Q
)Q R
;R S
} 	
} 
} Ø

_C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\repository\IEventRepository.cs
	namespace 	
core
 
. 

repository 
{ 
public 

	interface 
IEventRepository %
:& '
IDisposable( 3
{4 5
public 
void 
	addPlayer 
( 
int !
eventId" )
,) *
double+ 1
quota2 7
,7 8
int9 <
position= E
)E F
;F G
public 
void 
createEvent 
(  
int  #
type$ (
,( )
string* 0
description1 <
,< =
object> D
dateE I
)I J
;J K
public 
void 
terminateEvent "
(" #
int# &
eventId' .
,. /
int0 3
playerWinnerId4 B
)B C
;C D
public 
void 
	createBet 
( 
int !
eventId" )
,) *
int+ .
playerId/ 7
,7 8
double9 ?
amount@ F
,F G
intH K
winnerL R
)R S
;S T
}		 
}

 Ú
eC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\repository\ITransactionRepository.cs
	namespace 	
core
 
. 

repository 
{ 
public 

	interface "
ITransactionRepository +
:, -
IDisposable. 9
{: ;
public 
int 
create 
( 
int 
userId $
,$ %
int& )
type* .
,. /
double0 6
amount7 =
)= >
;> ?
} 
} ¨
^C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\core\src\repository\IUserRepository.cs
	namespace 	
core
 
. 

repository 
{ 
public 

	interface 
IUserRepository $
:% &
IDisposable' 2
{3 4
public 
void 
register 
( 
string #
dni$ '
,' (
string) /
username0 8
,8 9
string: @
passwordA I
)I J
;J K
public 
bool 
authenticate  
(  !
string! '
username( 0
,0 1
string2 8
password9 A
)A B
;B C
} 
} 