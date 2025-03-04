grammar B0tch
import 'Terminals'
import 'tP_IDM-types'
import 'XMLType-types'

entry Add returns Add:
     x=Expression "+" y=Expression 
;

Expression returns Expression:
    ConsultVariable | Constante | CallFonction | Add | Minus | Times | Divide | And | Or | Inverse | Not | MoreThan | LessThan | Equal 
;

Type returns Type:
    Number | Boolean | Void 
;

Instruction returns Instruction:
    Movement | Rotation | Loop | DefVariable | Condition | DefFonction | ConsultVariable | Constante | SetSpeed | getTimestamp | CallFonction | Add | Minus | Times | Divide | And | Or | Inverse | Not | MoreThan | LessThan | Equal 
;

Metrique returns Metrique:
    Centimeter | Meter | Millimeter 
;

ConsultVariable returns ConsultVariable:
    defvariable=[DefVariable:EString ] 
;

Constante returns Constante:
    value=Double 
;

CallFonction returns CallFonction:
    refFonction=[DefFonction:EString ] '(' (parametres+=Expression  ("," parametres+=Expression  )* )?')'
;

Parametre returns Parametre:
    ^type=Type libelle=String0

Minus returns Minus:
    x=Expression  '-' y=Expression
;

Times returns Times:
    x=Expression  '*' y=Expression  
;

Divide returns Divide:
    x=Expression  '/' y=Expression
;

And returns And:
    x=Expression  '&&' y=Expression   
;

Or returns Or:
    x=Expression  '||' y=Expression 
;

Inverse returns Inverse:
    '!' x=Expression 
;

Not returns Not:
    '-' x=Expression  
;

MoreThan returns MoreThan:
    x=Expression  '>' y=Expression 
;

LessThan returns LessThan:
    x=Expression  '<' y=Expression 
;

Equal returns Equal:
    x=Expression  '==' y=Expression
;

DefVariable returns DefVariable:
    'var' ^type=Type libelle=EString '=' valeur=Expression 
;

EString returns string:
    STRING | ID 
;

Number returns Number:
    {Number} 'Number'  
;

Boolean returns Boolean:
    {Boolean} 'Boolean'  
;

Void returns Void:
    {Void} 'Void'  
;

Double returns Double:
    'Double' 
;

String0 returns String:
    'String' 
;

DefFonction returns DefFonction:
    'let' ^type=Type libelle=String0 '(' parametres+=Parametre  ("," parametres+=Parametre  )* ')' '{' (bloc+=Instruction  ("," bloc+=Instruction  )*)? '}'  
;

Movement returns Movement:
    direction=Direction distance=Double 'in' metrique=Metrique  
;

Rotation returns Rotation:
    sens=SensRotation degre=Double
;

Loop returns Loop:
    'loop' condition=Expression '{' (bloc+=Instruction  (bloc+=Instruction)* )? '}'  
;

Condition returns Condition:
    'if'  condition=Expression 'then' '{' (then+=Instruction  ("," then+=Instruction  )*)? 'else' '{' (else+=Instruction  ("," else+=Instruction  )*)? '}' '}'  
;

SetSpeed returns SetSpeed:
    'SetSpeed' '('vitesse=EDouble 'in' metrique=Metrique  ')'  
;

getTimestamp returns getTimestamp:
    'getTimestamp()'  
;

Direction returns Direction:
    Direction_Forward | Direction_Backward | Direction_Left | Direction_Right
;
Direction_Forward returns Direction_Forward: 'Forward' ;
Direction_Backward returns Direction_Backward: 'Backward' ;
Direction_Left returns Direction_Left: 'Left' ;
Direction_Right returns Direction_Right: 'Right' ;

Centimeter returns Centimeter:
    {Centimeter} 'Centimeter'  
;

Meter returns Meter:
    {Meter} 'Meter'  
;

Millimeter returns Millimeter:
    {Millimeter} 'Millimeter'  
;

SensRotation returns SensRotation:
    SensRotation_Clock | SensRotation_CounterClock
;
SensRotation_Clock returns SensRotation_Clock: 'Clock' ;
SensRotation_CounterClock returns SensRotation_CounterClock: 'CounterClock' ;

EDouble returns number:
    '-'? INT? '.' INT (('E' | 'e' )'-'? INT )?  
;

