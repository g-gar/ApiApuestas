¿
RC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\Entrypoint.cs
	namespace 	
rabbitmq
 
{ 
public 

class 

EntryPoint 
{ 
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IRabbitService '
_rabbitService( 6
;6 7
public 

EntryPoint 
( 
IRabbitService (
rabbitService) 6
,6 7
ILogger8 ?
logger@ F
)F G
{ 	
_rabbitService 
= 
rabbitService *
;* +
_logger 
= 
logger 
; 
} 	
public 
void 
Start 
( 
) 
{ 	
new 
Thread 
( 
( 
) 
=> 
{ 
while 
( 
true 
) 
{ 
Thread%% 
.%% 
Sleep%%  
(%%  !
$num%%! %
)%%% &
;%%& '
}&& 
}'' 
)'' 
.'' 
Start'' 
('' 
)'' 
;'' 
}(( 	
public** 

EntryPoint** 
registerConsumer** *
(*** +
params**+ 1!
ConsumerConfiguration**2 G
[**G H
]**H I"
consumerConfigurations**J `
)**` a
{++ 	
foreach,, 
(,, !
ConsumerConfiguration,, *
c,,+ ,
in,,- /"
consumerConfigurations,,0 F
),,F G
{-- 
_rabbitService.. 
... 
	Subscribe.. (
(..( )
c..) *
...* +
exchange..+ 3
,..3 4
c..5 6
...6 7
queue..7 <
,..< =
c..> ?
...? @
handler..@ G
,..G H
c..I J
...J K

routingKey..K U
,..U V
c..W X
...X Y
type..Y ]
,..] ^
c.._ `
...` a
durable..a h
)..h i
;..i j
}// 
return11 
this11 
;11 
}22 	
}33 
}44 ì
sC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\messagehandler\AbstractRabbitMessageHandler.cs
	namespace

 	
rabbitmq


 
.

 
messagehandler

 !
{

" #
public 

abstract 
class (
AbstractRabbitMessageHandler 6
:7 8!
IRabbitMessageHandler9 N
{N O
	protected 
readonly 
ILogger "
_logger# *
;* +
public 
List 
< 
Payload 
> 
Payloads %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public (
AbstractRabbitMessageHandler +
(+ ,
ILogger, 3
logger4 :
): ;
{ 	
_logger 
= 
logger 
; 
Payloads 
= 
new 
List 
<  
Payload  '
>' (
(( )
)) *
;* +
} 	
public 
void 
Handle 
( 
BasicGetResult )
result* 0
)0 1
{ 	
ProcessPayload 
( 
new 
Payload &
(& '
)' (
{ 
Body 
= 
Encoding 
.  
UTF8  $
.$ %
	GetString% .
(. /
result/ 5
.5 6
Body6 :
): ;
,; <
	MessageId 
= 
result "
." #
BasicProperties# 2
.2 3
	MessageId3 <
,< =
CorrelationId 
= 
result  &
.& '
BasicProperties' 6
.6 7
CorrelationId7 D
,D E
ReplyTo 
= 
result  
.  !
BasicProperties! 0
.0 1
ReplyTo1 8
} 
) 
; 
} 	
public   
void   
Handle   
(   
object   !
model  " '
,  ' (!
BasicDeliverEventArgs  ) >
result  ? E
)  E F
{!! 	
ProcessPayload"" 
("" 
new"" 
Payload"" &
(""& '
)""' (
{## 
Body$$ 
=$$ 
Encoding$$ 
.$$  
UTF8$$  $
.$$$ %
	GetString$$% .
($$. /
result$$/ 5
.$$5 6
Body$$6 :
)$$: ;
,$$; <
	MessageId%% 
=%% 
result%% "
.%%" #
BasicProperties%%# 2
.%%2 3
	MessageId%%3 <
,%%< =
CorrelationId&& 
=&& 
result&&  &
.&&& '
BasicProperties&&' 6
.&&6 7
CorrelationId&&7 D
,&&D E
ReplyTo'' 
='' 
result''  
.''  !
BasicProperties''! 0
.''0 1
ReplyTo''1 8
}(( 
)(( 
;(( 
})) 	
public++ 
void++ 
ProcessPayload++ "
(++" #
Payload++# *
payload+++ 2
)++2 3
{,, 	
Payloads-- 
.-- 
Add-- 
(-- 
payload--  
)--  !
;--! "
_logger.. 
... 
LogInformation.. "
(.." #
$str..# 9
,..9 :
payload..; B
...B C
ToString..C K
(..K L
)..L M
)..M N
;..N O
execute// 
(// 
payload// 
)// 
;// 
}00 	
public22 
abstract22 
void22 
execute22 $
(22$ %
Payload22% ,
payload22- 4
)224 5
;225 6
}33 
}44 «
nC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\messagehandler\AddPlayerMessageHandler.cs
	namespace

 	
rabbitmq


 
.

 
messagehandler

 !
{

" #
public 

class #
AddPlayerMessageHandler (
:) *(
AbstractRabbitMessageHandler+ G
{G H
private 
readonly 
Command  
<  !
AddPlayerDto! -
>- .
_command/ 7
;7 8
public #
AddPlayerMessageHandler &
(& '
ILogger' .
logger/ 5
,5 6
Command7 >
<> ?
AddPlayerDto? K
>K L
commandM T
)T U
:V W
baseX \
(\ ]
logger] c
)c d
{ 	
_command 
= 
command 
; 
} 	
public 
override 
void 
execute $
($ %
Payload% ,
payload- 4
)4 5
=>6 8
_command9 A
.A B
executeCommandB P
(P Q
JsonConvertQ \
.\ ]
DeserializeObject] n
<n o
AddPlayerDtoo {
>{ |
(| }
payload	} Ñ
.
Ñ Ö
Body
Ö â
)
â ä
??
ã ç
throw
é ì
new
î ó'
InvalidOperationException
ò ±
(
± ≤
)
≤ ≥
)
≥ ¥
;
¥ µ
} 
} ä
nC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\messagehandler\CreateBetMessageHandler.cs
	namespace		 	
rabbitmq		
 
.		 
messagehandler		 !
{		! "
public

 

class

 #
CreateBetMessageHandler

 (
:

) *(
AbstractRabbitMessageHandler

+ G
{

H I
private 
readonly 
Command  
<  !
CreateBetDto! -
>- .
command/ 6
;6 7
public #
CreateBetMessageHandler &
(& '
ILogger' .
logger/ 5
,5 6
Command7 >
<> ?
CreateBetDto? K
>K L
commandM T
)T U
:V W
baseX \
(\ ]
logger] c
)c d
{ 	
this 
. 
command 
= 
command "
;" #
} 	
public 
override 
void 
execute $
($ %
Payload% ,
payload- 4
)4 5
=>6 8
this9 =
.= >
command> E
.E F
executeCommandF T
(T U
JsonConvertU `
.` a
DeserializeObjecta r
<r s
CreateBetDtos 
>	 Ä
(
Ä Å
payload
Å à
.
à â
Body
â ç
)
ç é
??
è ë
throw
í ó
new
ò õ'
InvalidOperationException
ú µ
(
µ ∂
)
∂ ∑
)
∑ ∏
;
∏ π
} 
} û
rC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\messagehandler\RegisterEventMessageHandler.cs
	namespace		 	
rabbitmq		
 
.		 
messagehandler		 !
{		" #
public

 

class

 '
RegisterEventMessageHandler

 ,
:

- .(
AbstractRabbitMessageHandler

/ K
{

L M
private 
readonly 
Command  
<  !
CreateEventDto! /
>/ 0
command1 8
;8 9
public '
RegisterEventMessageHandler *
(* +
ILogger+ 2
logger3 9
,9 :
Command; B
<B C
CreateEventDtoC Q
>Q R
commandS Z
)Z [
:\ ]
base^ b
(b c
loggerc i
)i j
{ 	
this 
. 
command 
= 
command "
;" #
} 	
public 
override 
void 
execute $
($ %
Payload% ,
payload- 4
)4 5
=>6 8
this9 =
.= >
command> E
.E F
executeCommandF T
(T U
JsonConvertU `
.` a
DeserializeObjecta r
<r s
CreateEventDto	s Å
>
Å Ç
(
Ç É
payload
É ä
.
ä ã
Body
ã è
)
è ê
??
ë ì
throw
î ô
new
ö ù'
InvalidOperationException
û ∑
(
∑ ∏
)
∏ π
)
π ∫
;
∫ ª
} 
} ò
qC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\messagehandler\RegisterUserMessageHandler.cs
	namespace		 	
rabbitmq		
 
.		 
messagehandler		 !
{		! "
public

 

class

 &
RegisterUserMessageHandler

 +
:

, -(
AbstractRabbitMessageHandler

. J
{

K L
private 
readonly 
Command  
<  !
CreateUserDto! .
>. /
command0 7
;7 8
public &
RegisterUserMessageHandler )
() *
ILogger* 1
logger2 8
,8 9
Command: A
<A B
CreateUserDtoB O
>O P
commandQ X
)X Y
:Z [
base\ `
(` a
loggera g
)g h
{ 	
this 
. 
command 
= 
command "
;" #
} 	
public 
override 
void 
execute $
($ %
Payload% ,
payload- 4
)4 5
=>6 8
this9 =
.= >
command> E
.E F
executeCommandF T
(T U
JsonConvertU `
.` a
DeserializeObjecta r
<r s
CreateUserDto	s Ä
>
Ä Å
(
Å Ç
payload
Ç â
.
â ä
Body
ä é
)
é è
??
ê í
throw
ì ò
new
ô ú'
InvalidOperationException
ù ∂
(
∂ ∑
)
∑ ∏
)
∏ π
;
π ∫
} 
} ™
sC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\messagehandler\TerminateEventMessageHandler.cs
	namespace		 	
rabbitmq		
 
.		 
messagehandler		 !
{		! "
public

 

class

 (
TerminateEventMessageHandler

 -
:

. /(
AbstractRabbitMessageHandler

0 L
{

M N
private 
readonly 
Command  
<  !
TerminateEventDto! 2
>2 3
command4 ;
;; <
public (
TerminateEventMessageHandler +
(+ ,
ILogger, 3
logger4 :
,: ;
Command< C
<C D
TerminateEventDtoD U
>U V
commandW ^
)^ _
:` a
baseb f
(f g
loggerg m
)m n
{ 	
this 
. 
command 
= 
command "
;" #
} 	
public 
override 
void 
execute $
($ %
Payload% ,
payload- 4
)4 5
=>6 8
this9 =
.= >
command> E
.E F
executeCommandF T
(T U
JsonConvertU `
.` a
DeserializeObjecta r
<r s
TerminateEventDto	s Ñ
>
Ñ Ö
(
Ö Ü
payload
Ü ç
.
ç é
Body
é í
)
í ì
??
î ñ
throw
ó ú
new
ù †'
InvalidOperationException
° ∫
(
∫ ª
)
ª º
)
º Ω
;
Ω æ
} 
} ‰	
cC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\model\ConsumerConfiguration.cs
	namespace 	
rabbitmq
 
. 
model 
{ 
public 

class !
ConsumerConfiguration &
{& '
public 
string 
exchange 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
queue 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 

routingKey  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
durable 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
type		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 !
IRabbitMessageHandler

 $
handler

% ,
{

- .
get

/ 2
;

2 3
set

4 7
;

7 8
}

9 :
} 
} åE
OC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\rabbitmq\src\Program.cs
	namespace 	
rabbitmq
 
{ 
public 

class 
Program 
{ 
private 
static 
IConfiguration %
configuration& 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
static 
IServiceCollection (
configureServices) :
(: ;
string; A
[A B
]B C
argsD H
)H I
{ 	
configuration 
= 
new  
ConfigurationBuilder  4
(4 5
)5 6
. 
SetBasePath 
( 
$" 
{  
	Directory  )
.) *
	GetParent* 3
(3 4

AppContext4 >
.> ?
BaseDirectory? L
)L M
.M N
FullNameN V
}V W
$strW f
"f g
)g h
.   
AddJsonFile   
(   
$str   /
,  / 0
false  1 6
)  6 7
.!! 
AddJsonFile!! 
(!! 
$str!! ,
,!!, -
true!!. 2
)!!2 3
."" 
Build"" 
("" 
)"" 
;"" 
var%% 
loggerFactory%% 
=%% 
LoggerFactory%%  -
.%%- .
Create%%. 4
(%%4 5
builder%%5 <
=>%%= ?
{&& 
builder'' 
.(( 
AddConfiguration(( %
(((% &
configuration((& 3
.((3 4

GetSection((4 >
(((> ?
$str((? H
)((H I
)((I J
.)) 
AddGelf)) 
()) 
))) 
;)) 
}** 
)** 
;** 
return,, 
new,, 
ServiceCollection,, (
(,,( )
),,) *
.-- 
AddSingleton-- 
(-- 
configuration-- +
)--+ ,
... 
AddSingleton.. 
(.. 
configuration.. +
...+ ,

GetSection.., 6
(..6 7
$str..7 J
)..J K
...K L
Get..L O
<..O P
ConnectionFactory..P a
>..a b
(..b c
)..c d
)..d e
.// 2
&ConfigureRepositoryDependencyInjection// 7
(//7 8
)//8 9
.00 ,
 ConfigureCoreDependencyInjection00 1
(001 2
)002 3
.11 
AddSingleton11 
<11 
IRabbitService11 ,
,11, -
RabbitService11. ;
<11; <"
DefaultRabbitPublisher11< R
,11R S!
DefaultRabbitConsumer11T i
>11i j
>11j k
(11k l
)11l m
.22 
AddTransient22 
<22 

EntryPoint22 (
>22( )
(22) *
)22* +
.33 
AddTransient33 
<33 #
AddPlayerMessageHandler33 5
>335 6
(336 7
)337 8
.44 
AddTransient44 
<44 '
RegisterEventMessageHandler44 9
>449 :
(44: ;
)44; <
.55 
AddTransient55 
<55 (
TerminateEventMessageHandler55 :
>55: ;
(55; <
)55< =
.66 
AddTransient66 
<66 #
CreateBetMessageHandler66 5
>665 6
(666 7
)667 8
.77 
AddTransient77 
<77 &
RegisterUserMessageHandler77 8
>778 9
(779 :
)77: ;
;77; <
}88 	
public:: 
static:: 
void:: 
Main:: 
(::  
string::  &
[::& '
]::' (
args::) -
)::- .
{;; 	
ServiceProvider<< 
serviceProvider<< +
=<<, -
configureServices<</ @
(<<@ A
args<<A E
)<<E F
.== 
AddSingleton== 
<== 
ILogger== %
>==% &
(==& '
LoggerFactory==' 4
.==4 5
Create==5 ;
(==; <
builder==< C
=>==D F
builder==G N
.==N O
AddConfiguration==O _
(==_ `
configuration==` m
.==m n

GetSection==n x
(==x y
$str	==y Ç
)
==Ç É
)
==É Ñ
.
==Ñ Ö
AddGelf
==Ö å
(
==å ç
)
==ç é
)
==é è
.
==è ê
CreateLogger
==ê ú
<
==ú ù
Program
==ù §
>
==§ •
(
==• ¶
)
==¶ ß
)
==ß ®
.>>  
BuildServiceProvider>> %
(>>% &
)>>& '
;>>' (
serviceProvider?? 
.?? 

GetService?? &
<??& '

EntryPoint??' 1
>??1 2
(??2 3
)??3 4
???4 5
.AA 
registerConsumerAA !
(AA! "
newAA" %!
ConsumerConfigurationAA& ;
(AA; <
)AA< =
{BB 
exchangeCC 
=CC 
$strCC /
,CC/ 0
queueDD 
=DD 
$strDD '
,DD' (
handlerEE 
=EE 
serviceProviderEE -
.EE- .

GetServiceEE. 8
<EE8 9#
AddPlayerMessageHandlerEE9 P
>EEP Q
(EEQ R
)EER S
,EES T

routingKeyFF 
=FF  
$strFF! 2
,FF2 3
typeGG 
=GG 
$strGG #
,GG# $
durableHH 
=HH 
trueHH "
}II 
)II 
.JJ 
registerConsumerJJ !
(JJ! "
newJJ" %!
ConsumerConfigurationJJ& ;
(JJ; <
)JJ< =
{KK 
exchangeLL 
=LL 
$strLL /
,LL/ 0
queueMM 
=MM 
$strMM +
,MM+ ,
handlerNN 
=NN 
serviceProviderNN -
.NN- .

GetServiceNN. 8
<NN8 9'
RegisterEventMessageHandlerNN9 T
>NNT U
(NNU V
)NNV W
,NNW X

routingKeyOO 
=OO  
$strOO! 6
,OO6 7
typePP 
=PP 
$strPP #
,PP# $
durableQQ 
=QQ 
trueQQ "
}RR 
)RR 
.SS 
registerConsumerSS !
(SS! "
newSS" %!
ConsumerConfigurationSS& ;
(SS; <
)SS< =
{TT 
exchangeUU 
=UU 
$strUU /
,UU/ 0
queueVV 
=VV 
$strVV ,
,VV, -
handlerWW 
=WW 
serviceProviderWW -
.WW- .

GetServiceWW. 8
<WW8 9(
TerminateEventMessageHandlerWW9 U
>WWU V
(WWV W
)WWW X
,WWX Y

routingKeyXX 
=XX  
$strXX! 7
,XX7 8
typeYY 
=YY 
$strYY #
,YY# $
durableZZ 
=ZZ 
trueZZ "
}[[ 
)[[ 
.\\ 
registerConsumer\\ !
(\\! "
new\\" %!
ConsumerConfiguration\\& ;
(\\; <
)\\< =
{]] 
exchange^^ 
=^^ 
$str^^ /
,^^/ 0
queue__ 
=__ 
$str__ '
,__' (
handler`` 
=`` 
serviceProvider`` -
.``- .

GetService``. 8
<``8 9#
CreateBetMessageHandler``9 P
>``P Q
(``Q R
)``R S
,``S T

routingKeyaa 
=aa  
$straa! 2
,aa2 3
typebb 
=bb 
$strbb #
,bb# $
durablecc 
=cc 
truecc "
}dd 
)dd 
.ee 
registerConsumeree !
(ee! "
newee" %!
ConsumerConfigurationee& ;
(ee; <
)ee< =
{ff 
exchangegg 
=gg 
$strgg /
,gg/ 0
queuehh 
=hh 
$strhh *
,hh* +
handlerii 
=ii 
serviceProviderii -
.ii- .

GetServiceii. 8
<ii8 9&
RegisterUserMessageHandlerii9 S
>iiS T
(iiT U
)iiU V
,iiV W

routingKeyjj 
=jj  
$strjj! 4
,jj4 5
typekk 
=kk 
$strkk #
,kk# $
durablell 
=ll 
truell "
}mm 
)mm 
.nn 
Startnn 
(nn 
)nn 
;nn 
}oo 	
}pp 
}qq 