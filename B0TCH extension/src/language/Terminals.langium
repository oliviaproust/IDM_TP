terminal BOOLEAN returns boolean:'TRUE'|'FALSE';
terminal ID returns string:'^'? ('a' ..'z' | 'A' ..'Z' | '_' )('a' ..'z' | 'A' ..'Z' | '_' | '0' ..'9' )* ;
terminal INT returns number:'0' ..'9' +;
terminal STRING returns string:'"' ('\\' . |  !('\\' | '"' ))*'"'  | "'" ('\\' . |  !('\\' | "'" ))* '"'  ;
hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
hidden terminal WS returns string:(' ' | '\t' | '\r' | '\n' )+;
terminal ANY_OTHER returns string:.;
