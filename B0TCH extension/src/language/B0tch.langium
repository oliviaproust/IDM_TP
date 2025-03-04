grammar B0Tch
import 'Terminals'
import 'tP_IDM-types'
import 'XMLType-types'

entry Add returns Add:
    'Add' '{' 'x' x=Expression  'y' y=Expression  '}'  
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
    'ConsultVariable' '{' 'defvariable' defvariable=[DefVariable:EString ] '}'  
;

Constante returns Constante:
    {Constante} 'Constante' '{' ('value' value=Double  )? '}'  
;

CallFonction returns CallFonction:
    'CallFonction' '{' ('libelle' libelle=String0  )? 'refFonction' refFonction=[DefFonction:EString ] '}'  
;

Minus returns Minus:
    'Minus' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

Times returns Times:
    'Times' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

Divide returns Divide:
    'Divide' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

And returns And:
    'And' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

Or returns Or:
    'Or' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

Inverse returns Inverse:
    'Inverse' '{' 'x' x=Expression  '}'  
;

Not returns Not:
    'Not' '{' 'x' x=Expression  '}'  
;

MoreThan returns MoreThan:
    'MoreThan' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

LessThan returns LessThan:
    'LessThan' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

Equal returns Equal:
    'Equal' '{' 'x' x=Expression  'y' y=Expression  '}'  
;

DefVariable returns DefVariable:
    'DefVariable' '{' ('libelle' libelle=EString  )? 'type' ^type=Type  'valeur' valeur=Expression  '}'  
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
    {DefFonction} 'DefFonction' '{' ('libelle' libelle=String0  )? ('bloc' '{' bloc+=Instruction  ("," bloc+=Instruction  )* '}' )? '}'  
;

Movement returns Movement:
    'Movement' '{' ('direction' direction=Direction  )? ('distance' distance=Double  )? 'metrique' metrique=Metrique  '}'  
;

Rotation returns Rotation:
    {Rotation} 'Rotation' '{' ('sens' sens=SensRotation  )? ('degre' degre=Double  )? '}'  
;

Loop returns Loop:
    'Loop' '{' ('bloc' '{' bloc+=Instruction  ("," bloc+=Instruction  )* '}' )? 'condition' condition=Expression  '}'  
;

Condition returns Condition:
    'Condition' '{' ('bloc' '{' bloc+=Instruction  ("," bloc+=Instruction  )* '}' )? 'condition' condition=Expression  '}'  
;

SetSpeed returns SetSpeed:
    'SetSpeed' '{' ('vitesse' vitesse=EDouble  )? 'metrique' metrique=Metrique  '}'  
;

getTimestamp returns getTimestamp:
    {getTimestamp} 'getTimestamp'  
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

