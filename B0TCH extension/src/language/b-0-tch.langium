grammar B0tch
import 'Terminals'
import 'tP_IDM-types'
import 'XMLType-types'

entry Robot returns Robot:
    (bloc+=Instruction)+  
;

// Add returns Add:
//      x=Expression "+" y=Expression 
// ;\n
Add returns Expression:
    SimpleExpression ({Add.x=current} '+' y=Expression)*;

SimpleExpression:
    '(' Expression ')';


Expression returns Expression:
    ConsultVariable | Constante | CallFonction | Add | Minus | Times | Divide | And | Or | Inverse | Not | MoreThan | LessThan | Equal 
;

Type returns Type:
    EDouble | Boolean | Void | Str
;

Instruction returns Instruction:
    Movement | Rotation | Loop | DefVariable | Condition | DefFonction | ConsultVariable | Constante | SetSpeed | GetTimestamp | CallFonction | Add | Minus | Times | Divide | And | Or | Inverse | Not | MoreThan | LessThan | Equal 
;

Metrique returns Metrique:
    Centimeter | Meter | Millimeter 
;

ConsultVariable returns ConsultVariable:
    defvariable=[DefVariable:ID ] 
;

Constante returns Constante:
    value=EDouble 
;

CallFonction returns CallFonction:
    refFonction=[DefFonction:ID ] '(' (parametres+=Expression  ("," parametres+=Expression  )* )?')'
;

Parametre returns Parametre:
    ^type=Type libelle=Str
;
Minus returns Minus:
    SimpleExpression ({Minus.x=current} '-' y=Expression)*
;

Times returns Times:
    SimpleExpression ({Times.x=current} '*' y=Expression)*
;

Divide returns Divide:
    SimpleExpression ({Divide.x=current} '/' y=Expression)*
;

And returns And:
    SimpleExpression ({And.x=current} '&&' y=Expression)* 
;

Or returns Or:
    SimpleExpression ({Or.x=current} '||' y=Expression)*
;

Inverse returns Inverse:
    '!' x=Expression 
;

Not returns Not:
    '-' x=Expression  
;

MoreThan returns MoreThan:
    SimpleExpression ({MoreThan.x=current} '>' y=Expression)*
;

LessThan returns LessThan:
    SimpleExpression ({LessThan.x=current} '<' y=Expression)*
;

Equal returns Equal:
    SimpleExpression ({Equal.x=current} '==' y=Expression)*
;

DefVariable returns DefVariable:
    'var' ^type=Type libelle=ID '=' valeur=Expression 
;

EString returns string:
    STRING | ID 
;

// Num returns Num:
//     {Num} 'number'  
// ;

Boolean returns Boolean:
    {Boolean} 'boolean'  
;

Void returns Void:
    {Void} 'void'  
;

// Double returns Num:
//     {Num} 'double' 
// ;

Str returns Str:
    STRING
;



DefFonction returns DefFonction:
    'let' ^type=Type libelle=ID '(' (parametres+=Parametre ("," parametres+=Parametre  )*)? ')' '{' (bloc+=Instruction)* '}'  
;

Movement returns Movement:
    direction=Direction distance=EDouble 'in' metrique=Metrique  
;

Rotation returns Rotation:
    sens=SensRotation degre=EDouble
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

GetTimestamp returns GetTimestamp:
    {GetTimestamp} 'getTimestamp()'  
;

Direction returns Direction:
    Direction_Forward | Direction_Backward | Direction_Left | Direction_Right
;
Direction_Forward returns Direction_Forward: 'Forward' ;
Direction_Backward returns Direction_Backward: 'Backward' ;
Direction_Left returns Direction_Left: 'Left' ;
Direction_Right returns Direction_Right: 'Right' ;

Centimeter returns Centimeter:
    {Centimeter} 'cm'  
;

Meter returns Meter:
    {Meter} 'm'  
;

Millimeter returns Millimeter:
    {Millimeter} 'mm'  
;

SensRotation returns SensRotation:
    SensRotation_Clock | SensRotation_CounterClock
;
SensRotation_Clock returns SensRotation_Clock: 'Clock' ;
SensRotation_CounterClock returns SensRotation_CounterClock: 'CounterClock' ;

EDouble returns number:
    '-'? INT ('.' INT (('E' | 'e' )'-'? INT )? )? 
;

