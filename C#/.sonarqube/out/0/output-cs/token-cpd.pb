≈`
PC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\framework\src\Command.cs
	namespace 	
	framework
 
{ 
public 

abstract 
class 
Command !
<! "
T" #
,# $
R% &
>& '
:( )
ICommand* 2
<2 3
T3 4
,4 5
R6 7
>7 8
where9 >
T? @
:A B
classC H
,H I
DtoJ M
{N O
	protected 
readonly 
ILogger "
_logger# *
;* +
	protected 
readonly 
LogLevel #
	_logLevel$ -
;- .
	protected 
string 
_startTemplate '
;' (
	protected		 
string		 
_endTemplate		 %
;		% &
	protected

 
R

 
?

 
_result

 
;

 
	protected 
Command 
( 
ILogger !
logger" (
,( )
LogLevel* 2
logLevel3 ;
=< =
LogLevel> F
.F G
InformationG R
,R S
stringT Z
startTemplate[ h
=i j
$str	k §
,
§ •
string
¶ ¨
endTemplate
≠ ∏
=
π ∫
$str
ª ç
)
ç é
{ 	
_logger 
= 
logger 
; 
	_logLevel 
= 
logLevel  
;  !
_startTemplate 
= 
startTemplate *
;* +
_endTemplate 
= 
endTemplate &
;& '
} 	
	protected 
void 
beginExecute #
(# $
LogLevel$ ,
level- 2
,2 3
string4 :
template; C
,C D
paramsE K
objectL R
[R S
]S T
argsU Y
)Y Z
=>[ ]
_logger^ e
.e f
Logf i
(i j
levelj o
,o p
templateq y
,y z
this{ 
.	 Ä
GetType
Ä á
(
á à
)
à â
.
â ä
FullName
ä í
,
í ì
args
î ò
)
ò ô
;
ô ö
	protected 
void 

endExecute !
(! "
LogLevel" *
level+ 0
,0 1
string2 8
template9 A
,A B
paramsC I
objectJ P
[P Q
]Q R
argsS W
)W X
=>Y [
_logger\ c
.c d
Logd g
(g h
levelh m
,m n
templateo w
,w x
thisy }
.} ~
GetType	~ Ö
(
Ö Ü
)
Ü á
.
á à
FullName
à ê
,
ê ë
args
í ñ
)
ñ ó
;
ó ò
	protected 
abstract 
R 
execute $
($ %
T% &
arg' *
)* +
;+ ,
public 
abstract 
bool 
checkPreconditions /
(/ 0
T0 1
arg2 5
)5 6
;6 7
public 
R 
? 
executeCommand  
(  !
T! "
arg# &
)& '
{ 	
_result 
= 
default 
( 
R 
?  
)  !
;! "
beginExecute 
( 
	_logLevel "
," #
_startTemplate$ 2
,2 3
arg4 7
)7 8
;8 9
if 
( 
checkPreconditions "
(" #
arg# &
)& '
)' (
{   
_result!! 
=!! 
execute!! !
(!!! "
arg!!" %
)!!% &
;!!& '
}"" 

endExecute## 
(## 
	_logLevel##  
,##  !
_endTemplate##" .
,##. /
arg##0 3
)##3 4
;##4 5
return$$ 
_result$$ 
;$$ 
}%% 	
}&& 
public(( 

abstract(( 
class(( 
Command(( !
<((! "
T((" #
>((# $
:(($ %
ICommand((& .
<((. /
T((/ 0
,((0 1
Void((2 6
>((6 7
where((8 =
T((> ?
:((? @
class((A F
,((F G
Dto((H K
{((L M
	protected)) 
readonly)) 
ILogger)) "
_logger))# *
;))* +
	protected** 
readonly** 
LogLevel** #
	_logLevel**$ -
;**- .
	protected++ 
readonly++ 
string++ !
_startTemplate++" 0
;++0 1
	protected,, 
readonly,, 
string,, !
_endTemplate,," .
;,,. /
	protected.. 
Command.. 
(.. 
ILogger.. !
logger.." (
,..( )
LogLevel..* 2
logLevel..3 ;
=..< =
LogLevel..> F
...F G
Information..G R
,..R S
string..T Z
startTemplate..[ h
=..i j
$str	..k §
,
..§ •
string
..¶ ¨
endTemplate
..≠ ∏
=
..π ∫
$str
..ª ˜
)
..˜ ¯
{// 	
_logger00 
=00 
logger00 
;00 
	_logLevel11 
=11 
logLevel11  
;11  !
_startTemplate22 
=22 
startTemplate22 *
;22* +
_endTemplate33 
=33 
endTemplate33 &
;33& '
}44 	
	protected66 
void66 
beginExecute66 #
(66# $
LogLevel66$ ,
level66- 2
,662 3
string664 :
template66; C
,66C D
T66E F
arg66G J
)66J K
=>66L N
_logger66O V
.66V W
Log66W Z
(66Z [
level66[ `
,66` a
template66b j
,66j k
this66l p
.66p q
GetType66q x
(66x y
)66y z
.66z {
FullName	66{ É
,
66É Ñ
arg
66Ö à
)
66à â
;
66â ä
	protected77 
void77 

endExecute77 !
(77! "
LogLevel77" *
level77+ 0
,770 1
string772 8
template779 A
,77A B
T77C D
arg77E H
)77H I
=>77J L
_logger77M T
.77T U
Log77U X
(77X Y
level77Y ^
,77^ _
template77` h
,77h i
this77j n
.77n o
GetType77o v
(77v w
)77w x
.77x y
FullName	77y Å
,
77Å Ç
arg
77É Ü
)
77Ü á
;
77á à
	protected99 
abstract99 
void99 
execute99  '
(99' (
T99( )
arg99* -
)99- .
;99. /
public;; 
abstract;; 
bool;; 
checkPreconditions;; /
(;;/ 0
T;;0 1
arg;;2 5
);;5 6
;;;6 7
public== 
Void== 
?== 
executeCommand== #
(==# $
T==$ %
arg==& )
)==) *
{>> 	
beginExecute?? 
(?? 
	_logLevel?? "
,??" #
_startTemplate??$ 2
,??2 3
arg??4 7
)??7 8
;??8 9
if@@ 
(@@ 
checkPreconditions@@ "
(@@" #
arg@@# &
)@@& '
)@@' (
{AA 
executeBB 
(BB 
argBB 
)BB 
;BB 
}CC 

endExecuteDD 
(DD 
	_logLevelDD  
,DD  !
_endTemplateDD" .
,DD. /
argDD0 3
)DD3 4
;DD4 5
returnEE 
defaultEE 
(EE 
VoidEE 
)EE  
;EE  !
}FF 	
}GG 
publicII 

abstractII 
classII 
CommandII !
:II" #
ICommandII$ ,
<II, -
VoidII- 1
>II1 2
{II3 4
	protectedJJ 
readonlyJJ 
ILoggerJJ "
_loggerJJ# *
;JJ* +
	protectedKK 
readonlyKK 
LogLevelKK #
	_logLevelKK$ -
;KK- .
	protectedLL 
readonlyLL 
stringLL !
_startTemplateLL" 0
;LL0 1
	protectedMM 
readonlyMM 
stringMM !
_endTemplateMM" .
;MM. /
	protectedOO 
CommandOO 
(OO 
ILoggerOO !
loggerOO" (
,OO( )
LogLevelOO* 2
logLevelOO3 ;
=OO< =
LogLevelOO> F
.OOF G
InformationOOG R
,OOR S
stringOOT Z
startTemplateOO[ h
=OOi j
$str	OOk §
,
OO§ •
string
OO¶ ¨
endTemplate
OO≠ ∏
=
OOπ ∫
$str
OOª ˜
)
OO˜ ¯
{PP 	
_loggerQQ 
=QQ 
loggerQQ 
;QQ 
	_logLevelRR 
=RR 
logLevelRR  
;RR  !
_startTemplateSS 
=SS 
startTemplateSS *
;SS* +
_endTemplateTT 
=TT 
endTemplateTT &
;TT& '
}UU 	
	protectedWW 
voidWW 
beginExecuteWW #
(WW# $
LogLevelWW$ ,
levelWW- 2
,WW2 3
stringWW4 :
templateWW; C
,WWC D
paramsWWE K
objectWWL R
[WWR S
]WWS T
argsWWU Y
)WWY Z
=>WW[ ]
_loggerWW^ e
.WWe f
LogWWf i
(WWi j
levelWWj o
,WWo p
templateWWq y
,WWy z
thisWW{ 
.	WW Ä
GetType
WWÄ á
(
WWá à
)
WWà â
.
WWâ ä
FullName
WWä í
,
WWí ì
args
WWî ò
)
WWò ô
;
WWô ö
	protectedXX 
voidXX 

endExecuteXX !
(XX! "
LogLevelXX" *
levelXX+ 0
,XX0 1
stringXX2 8
templateXX9 A
,XXA B
paramsXXC I
objectXXJ P
[XXP Q
]XXQ R
argsXXS W
)XXW X
=>XXY [
_loggerXX\ c
.XXc d
LogXXd g
(XXg h
levelXXh m
,XXm n
templateXXo w
,XXw x
thisXXy }
.XX} ~
GetType	XX~ Ö
(
XXÖ Ü
)
XXÜ á
.
XXá à
FullName
XXà ê
,
XXê ë
args
XXí ñ
)
XXñ ó
;
XXó ò
	protectedZZ 
abstractZZ 
voidZZ 
executeZZ  '
(ZZ' (
)ZZ( )
;ZZ) *
public\\ 
abstract\\ 
bool\\ 
checkPreconditions\\ /
(\\/ 0
)\\0 1
;\\1 2
public^^ 
Void^^ 
?^^ 
executeCommand^^ #
(^^# $
)^^$ %
{__ 	
beginExecute`` 
(`` 
	_logLevel`` "
,``" #
_startTemplate``$ 2
,``2 3
Array``4 9
.``9 :
Empty``: ?
<``? @
object``@ F
>``F G
(``G H
)``H I
)``I J
;``J K
ifaa 
(aa 
checkPreconditionsaa "
(aa" #
)aa# $
)aa$ %
{bb 
executecc 
(cc 
)cc 
;cc 
}dd 

endExecuteee 
(ee 
	_logLevelee  
,ee  !
_endTemplateee" .
,ee. /
Arrayee0 5
.ee5 6
Emptyee6 ;
<ee; <
objectee< B
>eeB C
(eeC D
)eeD E
)eeE F
;eeF G
returnff 
defaultff 
(ff 
Voidff 
)ff  
;ff  !
}gg 	
}hh 
}ii 
LC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\framework\src\Dto.cs
	namespace 	
	framework
 
{ 
public 

	interface 
Dto 
{ 
} 
} ﬂ
_C:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\framework\src\extensions\DtoToString.cs
	namespace 	
	framework
 
. 

extensions 
{ 
public 

static 
class 
DtoToString #
{# $
public 
static 
string 
ToStringImproved -
(- .
this. 2
Dto3 6
obj7 :
): ;
{ 	
string 
result 
= 
obj 
.  
GetType  '
(' (
)( )
.) *
FullName* 2
+3 4
$str5 8
;8 9
Type		 
t		 
=		 
obj		 
.		 
GetType		  
(		  !
)		! "
;		" #
PropertyInfo

 
[

 
]

 
pi

 
=

  
t

! "
.

" #
GetProperties

# 0
(

0 1
)

1 2
;

2 3
foreach 
( 
PropertyInfo !
p" #
in$ &
pi' )
)) *
{ 
result 
+= 
$" 
{ 
p 
. 
Name #
}# $
$str$ %
{% &
p& '
.' (
GetValue( 0
(0 1
obj1 4
)4 5
}5 6
"6 7
;7 8
} 
return 
result 
+ 
$str  
;  !
} 	
} 
} ä

QC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\framework\src\ICommand.cs
	namespace 	
	framework
 
{ 
public 

	interface 
ICommand 
{ 
} 
public 

	interface 
ICommand 
< 
in  
T! "
," #
out$ '
R( )
>) *
:+ ,
ICommand- 5
where6 ;
T< =
:> ?
Dto@ C
{D E
public 
bool 
checkPreconditions &
(& '
T' (
arg) ,
), -
;- .
public		 
R		 
?		 
executeCommand		  
(		  !
T		! "
arg		# &
)		& '
;		' (
} 
public 

	interface 
ICommand 
< 
out !
R" #
># $
:% &
ICommand' /
{0 1
public 
bool 
checkPreconditions &
(& '
)' (
;( )
public 
R 
? 
executeCommand  
(  !
)! "
;" #
} 
} Â
MC:\Users\gabriel.garciafernan\Desktop\ApiApuestasgit\C#\framework\src\Void.cs
	namespace 	
	framework
 
{ 
public 

sealed 
class 
Void 
{ 
private 
Void 
( 
) 
{ 	
} 	
} 
} 