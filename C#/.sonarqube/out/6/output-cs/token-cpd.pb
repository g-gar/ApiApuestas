∂#
^C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rest\src\controller\EventController.cs
	namespace 	
rest
 
. 

controller 
{ 
[		 
ApiController		 
]		 
[

 
Route

 

(


 
$str

 $
)

$ %
]

% &
public 

class 
EventController  
:! "
ControllerBase# 1
{1 2
private 
readonly 
Command  
<  !
AddPlayerDto! -
>- .
addPlayerCommand/ ?
;? @
private 
readonly 
Command  
<  !
CreateEventDto! /
>/ 0
createEventCommand1 C
;C D
private 
readonly 
Command  
<  !
TerminateEventDto! 2
>2 3!
terminateEventCommand4 I
;I J
private 
readonly 
Command  
<  !
CreateBetDto! -
>- .
createBetCommand/ ?
;? @
public 
EventController 
( 
Command &
<& '
AddPlayerDto' 3
>3 4
addPlayerCommand5 E
,E F
CommandG N
<N O
CreateEventDtoO ]
>] ^
createEventCommand_ q
,q r
Commands z
<z {
TerminateEventDto	{ å
>
å ç#
terminateEventCommand
é £
,
£ §
Command
• ¨
<
¨ ≠
CreateBetDto
≠ π
>
π ∫
createBetCommand
ª À
)
À Ã
{ 	
this 
. 
addPlayerCommand !
=" #
addPlayerCommand$ 4
;4 5
this 
. 
createEventCommand #
=$ %
createEventCommand& 8
;8 9
this 
. !
terminateEventCommand &
=' (!
terminateEventCommand) >
;> ?
this 
. 
createBetCommand !
=" #
createBetCommand$ 4
;4 5
} 	
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str '
)' (
]( )
public 
IActionResult 
	addPlayer &
(& '
AddPlayerDto' 3
dto4 7
)7 8
=>9 ;
Ok< >
(> ?
addPlayerCommand? O
.O P
executeCommandP ^
(^ _
dto_ b
)b c
)c d
??e g
Problemh o
(o p
)p q
;q r
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
) 
]  
public   
IActionResult   
createEvent   (
(  ( )
CreateEventDto  ) 7
dto  8 ;
)  ; <
=>  = ?
Ok  @ B
(  B C
createEventCommand  C U
.  U V
executeCommand  V d
(  d e
dto  e h
)  h i
)  i j
??  k m
Problem  n u
(  u v
)  v w
;  w x
["" 	
HttpPost""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
IActionResult$$ 
terminateEvent$$ +
($$+ ,
TerminateEventDto$$, =
dto$$> A
)$$A B
=>$$C E
Ok$$F H
($$H I!
terminateEventCommand$$I ^
.$$^ _
executeCommand$$_ m
($$m n
dto$$n q
)$$q r
)$$r s
??$$t v
Problem$$w ~
($$~ 
)	$$ Ä
;
$$Ä Å
[&& 	
HttpPost&&	 
]&& 
['' 	
Route''	 
('' 
$str'' 
)'' 
]'' 
public(( 
IActionResult(( 
bet((  
(((  !
CreateBetDto((! -
dto((. 1
)((1 2
=>((3 5
Ok((6 8
(((8 9
createBetCommand((9 I
.((I J
executeCommand((J X
(((X Y
dto((Y \
)((\ ]
)((] ^
??((_ a
Problem((b i
(((i j
)((j k
;((k l
}** 
}++ ´
dC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rest\src\controller\TransactionController.cs
	namespace 	
ApiApuestas
 
. 

controller  
{  !
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		  
public

 

class

 !
TransactionController

 &
:

' (
ControllerBase

) 7
{

7 8
private 
readonly 
Command  
<  ! 
CreateTransactionDto! 5
,5 6
int7 :
>: ;$
createTransactionCommand< T
;T U
public !
TransactionController $
($ %
Command% ,
<, - 
CreateTransactionDto- A
,A B
intC F
>F G$
createTransactionCommandH `
)` a
{ 	
this 
. $
createTransactionCommand )
=* +$
createTransactionCommand, D
;D E
} 	
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
IActionResult 
create #
(# $ 
CreateTransactionDto$ 8
dto9 <
)< =
=>> @
OkA C
(C D$
createTransactionCommandD \
.\ ]
executeCommand] k
(k l
dtol o
)o p
)p q
??r t
Problemu |
(| }
)} ~
;~ 
} 
} ì
]C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rest\src\controller\UserController.cs
	namespace		 	
ApiApuestas		
 
.		 

controller		  
{		  !
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{0 1
private 
readonly 
ILogger  
<  !
Program! (
>( )
logger* 0
;0 1
private 
readonly 
Command  
<  !
CreateUserDto! .
>. /
createUserCommand0 A
;A B
private 
readonly 
Command  
<  !
AuthenticateUserDto! 4
,4 5
bool6 :
>: ;#
authenticateUserCommand< S
;S T
public 
UserController 
( 
Command %
<% &
CreateUserDto& 3
>3 4
createUserCommand5 F
,F G
CommandH O
<O P
AuthenticateUserDtoP c
,c d
boole i
>i j$
authenticateUserCommand	k Ç
,
Ç É
ILogger
Ñ ã
<
ã å
Program
å ì
>
ì î
logger
ï õ
)
õ ú
{ 	
this 
. 
createUserCommand "
=# $
createUserCommand% 6
;6 7
this 
. #
authenticateUserCommand (
=) *#
authenticateUserCommand+ B
;B C
this 
. 
logger 
= 
logger  
;  !
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
create #
(# $
[$ %
FromBody% -
]- .
CreateUserDto/ <
dto= @
)@ A
{ 	
return 
Ok 
( 
createUserCommand '
.' (
executeCommand( 6
(6 7
dto7 :
): ;
); <
??= ?
Problem@ G
(G H
$strH ^
)^ _
;_ `
} 	
[ 	
HttpPost	 
] 
[   	
Route  	 
(   
$str   
)   
]   
public!! 
IActionResult!! 
authenticate!! )
(!!) *
AuthenticateUserDto!!* =
dto!!> A
)!!A B
{"" 	
return## 
Ok## 
(## #
authenticateUserCommand## -
.##- .
executeCommand##. <
(##< =
dto##= @
)##@ A
)##A B
??##C E
Problem##F M
(##M N
$str##N n
)##n o
;##o p
}$$ 	
}%% 
}&& ¨
rC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rest\src\delegationhandler\LogRequestAndResponseHandler.cs
	namespace 	
rest
 
. 
delegationhandler  
{! "
public 

class (
LogRequestAndResponseHandler -
:. /
DelegatingHandler0 A
{A B
private

 
readonly

 
ILogger

  
logger

! '
;

' (
public (
LogRequestAndResponseHandler +
(+ ,
ILogger, 3
logger4 :
): ;
{ 	
this 
. 
logger 
= 
logger  
;  !
} 	
	protected 
override 
async  
Task! %
<% &
HttpResponseMessage& 9
>9 :
	SendAsync; D
(D E
HttpRequestMessageE W
requestX _
,_ `
CancellationTokena r
cancellationToken	s Ñ
)
Ñ Ö
{ 	
if 
( 
request 
. 
Content 
!=  "
null# '
)' (
{ 
string 
requestBody "
=# $
await% *
request+ 2
.2 3
Content3 :
.: ;
ReadAsStringAsync; L
(L M
)M N
;N O
logger 
. 
LogInformation %
(% &
requestBody& 1
)1 2
;2 3
} 
HttpResponseMessage 
result  &
=' (
await) .
base/ 3
.3 4
	SendAsync4 =
(= >
request> E
,E F
cancellationTokenG X
)X Y
;Y Z
if 
( 
result 
. 
Content 
!= !
null" &
)& '
{ 
string 
responseBody #
=$ %
await& +
result, 2
.2 3
Content3 :
.: ;
ReadAsStringAsync; L
(L M
)M N
;N O
logger   
.   
LogInformation   %
(  % &
responseBody  & 2
)  2 3
;  3 4
}!! 
return## 
result## 
;## 
}$$ 	
}%% 
}&& ô
KC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rest\src\Program.cs
	namespace 	
rest
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
{ 	
return 
Host 
.  
CreateDefaultBuilder ,
(, -
args- 1
)1 2
. 
UseContentRoot 
(  
	Directory  )
.) *
GetCurrentDirectory* =
(= >
)> ?
)? @
. %
ConfigureAppConfiguration *
(* +
(+ ,
builderContext, :
,: ;
config< B
)B C
=>D F
{ 
config 
. 
AddJsonFile &
(& '
$str' D
,D E
optionalF N
:N O
falseP U
)U V
;V W
config 
. 
AddJsonFile &
(& '
$str' P
,P Q
optionalR Z
:Z [
false\ a
)a b
;b c
} 
) 
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 
ConfigureLogging )
() *
builder* 1
=>2 4
builder5 <
.< =
AddGelf= D
(D E
)E F
)F G
. 

UseStartup #
<# $
Startup$ +
>+ ,
(, -
)- .
;. /
}   
)   
;   
}!! 	
}"" 
}## “
LC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rest\src\Starturp.cs
	namespace 	
rest
 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{( )
c* +
.+ ,

SwaggerDoc, 6
(6 7
$str7 ;
,; <
new= @
OpenApiInfoA L
{M N
TitleN S
=T U
$strV h
,h i
Versionj q
=r s
$strt x
}x y
)y z
;z {
}| }
)} ~
;~ 
var 
serviceProvider 
=  !
services" *
.* + 
BuildServiceProvider+ ?
(? @
)@ A
;A B
var 
logger 
= 
serviceProvider (
.( )

GetService) 3
<3 4
ILogger4 ;
<; <
Program< C
>C D
>D E
(E F
)F G
;G H
services   
.   
AddSingleton   !
(  ! "
typeof  " (
(  ( )
ILogger  ) 0
)  0 1
,  1 2
logger  3 9
)  9 :
;  : ;
services!! 
.!! ,
 ConfigureCoreDependencyInjection!! 5
(!!5 6
)!!6 7
;!!7 8
services"" 
."" 2
&ConfigureRepositoryDependencyInjection"" ;
(""; <
)""< =
;""= >
}## 	
public&& 
void&& 
	Configure&& 
(&& 
IApplicationBuilder&& 1
app&&2 5
,&&5 6
IWebHostEnvironment&&7 J
env&&K N
,&&N O
ILoggerFactory&&P ^
loggerFactory&&_ l
)&&l m
{'' 	
if(( 
((( 
env(( 
.(( 
IsDevelopment(( !
(((! "
)((" #
)((# $
{)) 
app** 
.** %
UseDeveloperExceptionPage** -
(**- .
)**. /
;**/ 0
app++ 
.++ 

UseSwagger++ 
(++ 
)++  
;++  !
app,, 
.,, 
UseSwaggerUI,,  
(,,  !
c,,! "
=>,,# %
c,,& '
.,,' (
SwaggerEndpoint,,( 7
(,,7 8
$str,,8 R
,,,R S
$str,,T i
),,i j
),,j k
;,,k l
}-- 
app11 
.11 

UseRouting11 
(11 
)11 
;11 
app77 
.77 
UseEndpoints77 
(77 
	endpoints77 &
=>77' )
{77* +
	endpoints77, 5
.775 6
MapControllers776 D
(77D E
)77E F
;77F G
}77H I
)77I J
;77J K
}88 	
};; 
}<< 