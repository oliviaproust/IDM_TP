grammar B0tch
import 'Terminals'
import 'tP_IDM-types'
import 'XMLType-types'

entry Robot returns Robot:
    (bloc+=Instruction)+  
;

Add returns Expression:
    SimpleExpression ({Add.x=current} '+' y=Expression)*;

SimpleExpression returns SimpleExpression:
    '(' Expression ')' | ConsultVariable | CallFonction | ConstanteBool | ConstanteStr | ConstanteNum | GetDistance | GetTimestamp;


Expression returns Expression:
    Add | Minus | Times | Divide | And | Or | Inverse | Not | MoreThan | LessThan | Equal 
;
Type returns Type:
    {Type} ('number' | 'boolean' | 'void' | 'string')
;

ConstanteNum returns ConstanteNum : 
    {ConstanteNum} value=EDouble
    ;

ConstanteBool returns ConstanteBool : 
    {ConstanteBool} value=BOOLEAN
    ;

ConstanteStr returns ConstanteStr : 
    {ConstanteStr} value=STRING
    ;
Instruction returns Instruction:
    Movement | Rotation | Loop | DefVariable | Condition | DefFonction | ConsultVariable | SetSpeed | Expression | ReassignVariable
;

Metrique returns Metrique:
    Centimeter | Meter | Millimeter 
;

ConsultVariable returns ConsultVariable:
    defvariable=[DefVariable:ID] 
;

ReassignVariable returns ReassignVariable :
    defvariable=[DefVariable:ID] "=" valeur=Expression
;

CallFonction returns CallFonction:
    refFonction=[DefFonction:ID ] '(' (parametres+=Expression  ("," parametres+=Expression  )* )?')'
;

Parametre returns Parametre:
    ^type=Type libelle=ID
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
    'var' ^type=Type libelle=ID '=' valeur=Expression ('in' Metrique)?
;


DefFonction returns DefFonction:
    'let' ^type=Type libelle=ID '(' (parametres+=Parametre ("," parametres+=Parametre  )*)? ')' '{' (bloc+=Instruction)* '}'  
;

Movement returns Movement:
    direction=Direction distance=Expression 'in' metrique=Metrique  
;

Rotation returns Rotation:
    sens=SensRotation degre=Expression
;

Loop returns Loop:
    'loop' condition=Expression '{' (bloc+=Instruction)* '}'  
;

Condition returns Condition:
    'if'  condition=Expression 'then' '{' (then+=Instruction)* '}' 'else' '{' (else+=Instruction  )* '}'   
;

SetSpeed returns SetSpeed:
    'setSpeed' '('vitesse=Expression 'in' metrique=Metrique  ')'  
;

GetTimestamp returns GetTimestamp:
    {GetTimestamp} 'getTimestamp()'  
;

GetDistance returns GetDistance:
    {GetTimestamp} 'getDistance()'  
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


