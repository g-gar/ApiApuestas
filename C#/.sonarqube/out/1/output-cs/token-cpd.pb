÷
mC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitConfiguration.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{ 
public 
	interface  
IRabbitConfiguration &
{ 
ConnectionFactory 
ConnectionFactory %
{& '
get( +
;+ ,
}- .
string 
Exchange	 
{ 
get 
; 
} 
string		 
Queue			 
{		 
get		 
;		 
}		 
string

 

RoutingKey

	 
{

 
get

 
;

 
}

 
string 
Type	 
{ 
get 
; 
} 
bool 
Durable 
{ 
get 
; 
} 
ushort 
? 	
QoS
 
{ 
get 
; 
} 
} 
} ±
hC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitConsumer.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{ 
public 
	interface 
IRabbitConsumer !
:" # 
IRabbitConsumerSetup$ 8
{ 
void 
Get 

(
 !
IRabbitMessageHandler  
messageHandler! /
)/ 0
;0 1
void 
Consume 
( !
IRabbitMessageHandler $
messageHandler% 3
)3 4
;4 5
} 
} Ø
mC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitConsumerSetup.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{ 
public 
	interface  
IRabbitConsumerSetup &
:' (
IDisposable) 4
{ 
IRabbitConsumer 
Setup 
( 
RabbitConfiguration +
rabbitConfiguration, ?
)? @
;@ A
}		 
}

 Ê
nC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitMessageHandler.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{ 
public 
	interface !
IRabbitMessageHandler '
{		 
List

 
<

 
Payload

 
>

 
Payloads

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
void 
Handle 
( 
BasicGetResult 
result #
)# $
;$ %
void 
Handle 
( 
object 
model 
, !
BasicDeliverEventArgs 1
result2 8
)8 9
;9 :
} 
} »
iC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitPublisher.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{ 
public 
	interface 
IRabbitPublisher "
:# $!
IRabbitPublisherSetup% :
{ 
void 
Publish 
( 
IEnumerable 
< 
Payload "
>" #
payloads$ ,
), -
;- .
}		 
}

 ä
nC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitPublisherSetup.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{ 
public 
	interface !
IRabbitPublisherSetup '
{ 
IRabbitPublisher 
Setup 
( 
RabbitConfiguration ,
rabbitConfiguration- @
)@ A
;A B
} 
}		 â
gC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Interfaces\IRabbitService.cs
	namespace 	
	Messaging
 
. 
Core 
. 

Interfaces #
{# $
public 

	interface 
IRabbitService #
{$ %
void 
Publish 
( 
IEnumerable  
<  !
Payload! (
>( )
payloads* 2
,2 3
string4 :
exchange; C
,C D
stringE K

routingKeyL V
=W X
$strY [
,[ \
string] c
typed h
=i j
$strk s
,s t
boolu y
durable	z Å
=
Ç É
false
Ñ â
)
â ä
;
ä ã
void 
Get 
( 
string 
exchange  
,  !
string" (
queue) .
,. /!
IRabbitMessageHandler0 E
messageHandlerF T
,T U
stringV \

routingKey] g
=h i
$strj l
,l m
stringn t
typeu y
=z {
$str	| Ñ
,
Ñ Ö
bool
Ü ä
durable
ã í
=
ì î
false
ï ö
)
ö õ
;
õ ú
Guid		 
	Subscribe		 
(		 
string		 
exchange		 &
,		& '
string		( .
queue		/ 4
,		4 5!
IRabbitMessageHandler		6 K
messageHandler		L Z
,		Z [
string		\ b

routingKey		c m
=		n o
$str		p r
,		r s
string		t z
type		{ 
=
		Ä Å
$str
		Ç ä
,
		ä ã
bool
		å ê
durable
		ë ò
=
		ô ö
false
		õ †
,
		† °
ushort
		¢ ®
?
		® ©
qos
		™ ≠
=
		Æ Ø
null
		∞ ¥
)
		¥ µ
;
		µ ∂
void

 
Unsubscribe

 
(

 
Guid

 

consumerId

 (
)

( )
;

) *
} 
} æ5
jC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Models\DefaultRabbitConsumer.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Models 
{ 
public		 
class		 !
DefaultRabbitConsumer		 #
:		$ %
IRabbitConsumer		& 5
{

 
private 	
RabbitConfiguration
  
_rabbitConfiguration 2
;2 3
private 	
IConnection
 
_connection !
;! "
private 	
IModel
 
_channel 
; 
private 	!
EventingBasicConsumer
 
	_consumer  )
;) *
public 
IRabbitConsumer	 
Setup 
( 
RabbitConfiguration 2
rabbitConfiguration3 F
)F G
{  
_rabbitConfiguration 
= 
rabbitConfiguration -
;- .
_connection 
=  
_rabbitConfiguration %
.% &
ConnectionFactory& 7
.7 8
CreateConnection8 H
(H I
)I J
;J K
_channel 
= 
_connection 
. 
CreateModel %
(% &
)& '
;' (
_channel 
. 
ExchangeDeclare 
(  
_rabbitConfiguration 0
.0 1
Exchange1 9
,9 : 
_rabbitConfiguration; O
.O P
TypeP T
,T U 
_rabbitConfigurationV j
.j k
Durablek r
,r s
falset y
)y z
;z {
_channel 
. 
QueueDeclare 
(  
_rabbitConfiguration -
.- .
Queue. 3
,3 4 
_rabbitConfiguration5 I
.I J
DurableJ Q
,Q R
falseS X
,X Y
falseZ _
,_ `
nulla e
)e f
;f g
_channel 
. 
	QueueBind 
(  
_rabbitConfiguration *
.* +
Queue+ 0
,0 1 
_rabbitConfiguration2 F
.F G
ExchangeG O
,O P 
_rabbitConfigurationQ e
.e f

RoutingKeyf p
)p q
;q r
if 
(  
_rabbitConfiguration 
. 
QoS 
.  
HasValue  (
)( )
{ 
_channel 
. 
BasicQos 
( 
$num 
,  
_rabbitConfiguration -
.- .
QoS. 1
.1 2
Value2 7
,7 8
false9 >
)> ?
;? @
} 
return 	
this
 
; 
} 
public!! 
void!!	 
Get!! 
(!! !
IRabbitMessageHandler!! '
messageHandler!!( 6
)!!6 7
{"" 
if## 
(##  
_rabbitConfiguration## 
==## 
null## #
)### $
throw$$ 	
new$$
  
ApplicationException$$ "
($$" #
$str$$# E
)$$E F
;$$F G
var&& 
result&& 
=&& 
_channel&& 
.&& 
BasicGet&& !
(&&! " 
_rabbitConfiguration&&" 6
.&&6 7
Queue&&7 <
,&&< =
true&&> B
)&&B C
;&&C D
while'' 
(''	 

result''
 
!='' 
null'' 
)'' 
{(( 
messageHandler)) 
.)) 
Handle)) 
()) 
result))  
)))  !
;))! "
result** 

=** 
_channel** 
.** 
BasicGet** 
(**  
_rabbitConfiguration** 3
.**3 4
Queue**4 9
,**9 :
true**; ?
)**? @
;**@ A
}++ 
},, 
public.. 
void..	 
Consume.. 
(.. !
IRabbitMessageHandler.. +
messageHandler.., :
)..: ;
{// 
if00 
(00  
_rabbitConfiguration00 
==00 
null00 #
)00# $
throw11 	
new11
  
ApplicationException11 "
(11" #
$str11# E
)11E F
;11F G
if33 
(33 
messageHandler33 
==33 
null33 
)33 
throw44 	
new44
 !
ArgumentNullException44 #
(44# $
nameof44$ *
(44* +
messageHandler44+ 9
)449 :
)44: ;
;44; <
	_consumer66 
=66 
new66 !
EventingBasicConsumer66 (
(66( )
_channel66) 1
)661 2
;662 3
	_consumer77 
.77 
Received77 
+=77 
(77 
model77 
,77  
result77! '
)77' (
=>77) +
{88 
try99 
{:: 
_channel;; 
.;; 
BasicAck;; 
(;; 
result;; 
.;; 
DeliveryTag;; )
,;;) *
false;;+ 0
);;0 1
;;;1 2
messageHandler<< 
.<< 
Handle<< 
(<< 
model<<  
,<<  !
result<<" (
)<<( )
;<<) *
}== 
catch>> 	
(>>
 
	Exception>> 
ex>> 
)>> 
{?? 
}AA 
}BB 
;BB 
_channelDD 
.DD 
BasicConsumeDD 
(DD  
_rabbitConfigurationDD -
.DD- .
QueueDD. 3
,DD3 4
falseDD5 :
,DD: ;
	_consumerDD< E
)DDE F
;DDF G
}EE 
publicGG 
voidGG	 
DisposeGG 
(GG 
)GG 
{HH 
ifII 
(II 
_channelII 
?II 
.II 
IsOpenII 
==II 
trueII 
&&II  "
	_consumerII# ,
!=II- /
nullII0 4
)II4 5
{JJ 
_channelKK 
.KK 
BasicCancelKK 
(KK 
	_consumerKK "
.KK" #
ConsumerTagKK# .
)KK. /
;KK/ 0
}LL 
_channelNN 
?NN 
.NN 
DisposeNN 
(NN 
)NN 
;NN 
_connectionOO 
?OO 
.OO 
DisposeOO 
(OO 
)OO 
;OO 
}PP 
}QQ 
}RR «
kC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Models\DefaultRabbitPublisher.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Models 
{ 
public		 
class		 "
DefaultRabbitPublisher		 $
:		% &
IRabbitPublisher		' 7
{

 
private 	
RabbitConfiguration
  
_rabbitConfiguration 2
;2 3
public 
IRabbitPublisher	 
Setup 
(  
RabbitConfiguration  3
rabbitConfiguration4 G
)G H
{  
_rabbitConfiguration 
= 
rabbitConfiguration -
;- .
return 	
this
 
; 
} 
public 
void	 
Publish 
( 
IEnumerable !
<! "
Payload" )
>) *
payloads+ 3
)3 4
{ 
using 
(	 

var
 

connection 
=  
_rabbitConfiguration /
./ 0
ConnectionFactory0 A
.A B
CreateConnectionB R
(R S
)S T
)T U
using 
(	 

var
 
channel 
= 

connection "
." #
CreateModel# .
(. /
)/ 0
)0 1
{ 
channel 
. 
ExchangeDeclare 
(  
_rabbitConfiguration 0
.0 1
Exchange1 9
,9 : 
_rabbitConfiguration; O
.O P
TypeP T
,T U 
_rabbitConfigurationV j
.j k
Durablek r
,r s
falset y
,y z
null{ 
)	 Ä
;
Ä Å
var 
i 	
=
 
$num 
; 
while 	
(
 
i 
< 
payloads 
. 
Count 
( 
) 
)  
{ 
var 

properties	 
= 
channel 
. !
CreateBasicProperties 3
(3 4
)4 5
;5 6
var 
payload	 
= 
payloads 
. 
	ElementAt %
(% &
i& '
)' (
;( )

properties 
. 
CorrelationId 
= 
payload  '
.' (
CorrelationId( 5
??6 8
$str9 ;
;; <

properties 
. 
ReplyTo 
= 
payload !
.! "
ReplyTo" )
??* ,
$str- /
;/ 0
var   
body  	 
=   
Encoding   
.   
UTF8   
.   
GetBytes   &
(  & '
payload  ' .
.  . /
Body  / 3
)  3 4
;  4 5
try"" 
{## 
channel$$ 
.$$ 
BasicPublish$$ 
($$  
_rabbitConfiguration$$ /
.$$/ 0
Exchange$$0 8
,$$8 9 
_rabbitConfiguration$$: N
.$$N O

RoutingKey$$O Y
,$$Y Z
true$$[ _
,$$_ `

properties$$a k
,$$k l
body$$m q
)$$q r
;$$r s
i%% 
++%% 	
;%%	 

}&& 
catch'' 

('' 
	Exception'' 
ex'' 
)'' 
{(( 
}** 
}++ 
},, 
}-- 
}.. 
}// ‰
aC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Models\GenericEvent.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Models 
{ 
public 
class 
GenericEvent 
{ 
public 
string	 
Body 
{ 
get 
; 
set 
;  
}! "
} 
} Ã
\C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Models\Payload.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Models 
{ 
public 
class 
Payload 
{ 
public 
string	 
Label 
{ 
get 
; 
set  
;  !
}" #
public 
string	 
	MessageId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string	 
CorrelationId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string	 
ReplyTo 
{ 
get 
; 
set "
;" #
}$ %
public		 
string			 
Body		 
{		 
get		 
;		 
set		 
;		  
}		! "
}

 
} Á
hC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Models\RabbitConfiguration.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Models 
{ 
public 
class 
RabbitConfiguration !
:" # 
IRabbitConfiguration$ 8
{ 
public 
RabbitConfiguration	 
( 
ConnectionFactory .
connectionFactory/ @
,@ A
stringB H
exchangeI Q
,Q R
stringS Y

routingKeyZ d
,d e
stringf l
typem q
,q r
bools w
durablex 
,	 Ä
string
Å á
queue
à ç
=
é è
$str
ê í
,
í ì
ushort
î ö
?
ö õ
qos
ú ü
=
† °
null
¢ ¶
)
¶ ß
{		 
ConnectionFactory

 
=

 
connectionFactory

 (
;

( )
Exchange 
= 
exchange 
; 
Queue 
=	 

queue 
; 

RoutingKey 
= 

routingKey 
; 
Type 
= 	
type
 
; 
Durable 

= 
durable 
; 
QoS 
= 
qos	 
; 
} 
public 
ConnectionFactory	 
ConnectionFactory ,
{- .
get/ 2
;2 3
}4 5
public 
string	 
Exchange 
{ 
get 
; 
}  !
public 
string	 
Queue 
{ 
get 
; 
} 
public 
string	 

RoutingKey 
{ 
get  
;  !
}" #
public 
string	 
Type 
{ 
get 
; 
} 
public 
bool	 
Durable 
{ 
get 
; 
} 
public 
ushort	 
? 
QoS 
{ 
get 
; 
} 
} 
} Ã
iC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Models\RabbitMessageHandler.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Models 
{ 
public		 
class		  
RabbitMessageHandler		 "
:		# $!
IRabbitMessageHandler		% :
{

 
public 
List	 
< 
Payload 
> 
Payloads 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
new0 3
List4 8
<8 9
Payload9 @
>@ A
(A B
)B C
;C D
public 
void	 
Handle 
( 
BasicGetResult #
result$ *
)* +
{ 
Payloads 
. 
Add 
( 
new 
Payload 
( 
) 
{ 
Body 
=	 

Encoding 
. 
UTF8 
. 
	GetString "
(" #
result# )
.) *
Body* .
). /
,/ 0
	MessageId 
= 
result 
. 
BasicProperties &
.& '
	MessageId' 0
,0 1
CorrelationId 
= 
result 
. 
BasicProperties *
.* +
CorrelationId+ 8
,8 9
ReplyTo 
= 
result 
. 
BasicProperties $
.$ %
ReplyTo% ,
} 
) 
; 
} 
public 
void	 
Handle 
( 
object 
model !
,! "!
BasicDeliverEventArgs# 8
result9 ?
)? @
{ 
Payloads 
. 
Add 
( 
new 
Payload 
( 
) 
{ 
Body 
=	 

Encoding 
. 
UTF8 
. 
	GetString "
(" #
result# )
.) *
Body* .
). /
,/ 0
	MessageId 
= 
result 
. 
BasicProperties &
.& '
	MessageId' 0
,0 1
CorrelationId 
= 
result 
. 
BasicProperties *
.* +
CorrelationId+ 8
,8 9
ReplyTo 
= 
result 
. 
BasicProperties $
.$ %
ReplyTo% ,
}   
)   
;   
}!! 
}"" 
}## Ã4
dC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\Messaging.Core\src\Services\RabbitService.cs
	namespace 	
	Messaging
 
. 
Core 
. 
Services !
{		 
public

 
class

 
RabbitService

 
<

 

TPublisher

 &
,

& '
	TConsumer

( 1
>

1 2
:

3 4
IRabbitService

5 C
where

D I

TPublisher

J T
:

U V
class

W \
,

\ ]!
IRabbitPublisherSetup

^ s
,

s t
new

u x
(

x y
)

y z
where	

{ Ä
	TConsumer


Å ä
:


ã å
class


ç í
,


í ì"
IRabbitConsumerSetup


î ®
,


® ©
new


™ ≠
(


≠ Æ
)


Æ Ø
{ 
private 	
readonly
 
ConnectionFactory $
_connectionFactory% 7
;7 8
private 	
readonly
  
ConcurrentDictionary '
<' (
Guid( ,
,, -
	TConsumer. 7
>7 8

_consumers9 C
=D E
newF I 
ConcurrentDictionaryJ ^
<^ _
Guid_ c
,c d
	TConsumere n
>n o
(o p
)p q
;q r
public 
RabbitService	 
( 
ConnectionFactory (
connectionFactory) :
): ;
{ 
_connectionFactory 
= 
connectionFactory )
;) *
} 
public 
void	 
Publish 
( 
IEnumerable !
<! "
Payload" )
>) *
payloads+ 3
,3 4
string5 ;
exchange< D
,D E
stringF L

routingKeyM W
=X Y
$strZ \
,\ ]
string^ d
typee i
=j k
$strl t
,t u
boolv z
durable	{ Ç
=
É Ñ
false
Ö ä
)
ä ã
{ 
var 
rabbitConfiguration 
= 
new  
RabbitConfiguration! 4
(4 5
_connectionFactory5 G
,G H
exchangeI Q
,Q R

routingKeyS ]
,] ^
type_ c
,c d
durablee l
)l m
;m n
var 
messagePublisher 
= 
new 

TPublisher (
(( )
)) *
;* +
messagePublisher 
. 
Setup 
( 
rabbitConfiguration -
)- .
.. /
Publish/ 6
(6 7
payloads7 ?
)? @
;@ A
} 
public 
void	 
Get 
( 
string 
exchange !
,! "
string# )
queue* /
,/ 0!
IRabbitMessageHandler1 F
messageHandlerG U
,U V
stringW ]

routingKey^ h
=i j
$strk m
,m n
stringo u
typev z
={ |
$str	} Ö
,
Ö Ü
bool
á ã
durable
å ì
=
î ï
false
ñ õ
)
õ ú
{ 
var 
rabbitConfiguration 
= 
new  
RabbitConfiguration! 4
(4 5
_connectionFactory5 G
,G H
exchangeI Q
,Q R

routingKeyS ]
,] ^
type_ c
,c d
durablee l
,l m
queuen s
)s t
;t u
using 
(	 

var
 
messageConsumer 
= 
new  #
	TConsumer$ -
(- .
). /
)/ 0
{ 
messageConsumer   
.   
Setup   
(   
rabbitConfiguration   -
)  - .
.  . /
Get  / 2
(  2 3
messageHandler  3 A
)  A B
;  B C
}!! 
}"" 
public$$ 
Guid$$	 
	Subscribe$$ 
($$ 
string$$ 
exchange$$ '
,$$' (
string$$) /
queue$$0 5
,$$5 6!
IRabbitMessageHandler$$7 L
messageHandler$$M [
,$$[ \
string$$] c

routingKey$$d n
=$$o p
$str$$q s
,$$s t
string$$u {
type	$$| Ä
=
$$Å Ç
$str
$$É ã
,
$$ã å
bool
$$ç ë
durable
$$í ô
=
$$ö õ
false
$$ú °
,
$$° ¢
ushort
$$£ ©
?
$$© ™
qos
$$´ Æ
=
$$Ø ∞
null
$$± µ
)
$$µ ∂
{%% 
var&& 
rabbitConfiguration&& 
=&& 
new&&  
RabbitConfiguration&&! 4
(&&4 5
_connectionFactory&&5 G
,&&G H
exchange&&I Q
,&&Q R

routingKey&&S ]
,&&] ^
type&&_ c
,&&c d
durable&&e l
,&&l m
queue&&n s
,&&s t
qos&&u x
)&&x y
;&&y z
var'' 
consumer'' 
='' 
new'' 
	TConsumer'' 
(''  
)''  !
;''! "
var(( 

consumerId(( 
=(( 
Guid(( 
.(( 
NewGuid((  
(((  !
)((! "
;((" #

_consumers)) 
.)) 
TryAdd)) 
()) 

consumerId)) 
,))  
consumer))! )
)))) *
;))* +
consumer** 
.** 
Setup** 
(** 
rabbitConfiguration** %
)**% &
.**& '
Consume**' .
(**. /
messageHandler**/ =
)**= >
;**> ?
return,, 	

consumerId,,
 
;,, 
}-- 
public// 
void//	 
Unsubscribe// 
(// 
Guid// 

consumerId// )
)//) *
{00 
var11 
consumer11 
=11 

_consumers11 
[11 

consumerId11 '
]11' (
;11( )
consumer22 
.22 
Dispose22 
(22 
)22 
;22 

_consumers33 
.33 
	TryRemove33 
(33 

consumerId33 "
,33" #
out33$ '
	TConsumer33( 1
_332 3
)333 4
;334 5
}44 
}55 
}66 