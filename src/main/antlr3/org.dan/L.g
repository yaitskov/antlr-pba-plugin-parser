lexer grammar L;
@header {
package org.dan;
}

LETTER: 'A' .. 'Z' | 'a' .. 'z' | '_';
DIGIT: '0' .. '9';
ID: LETTER (LETTER | DIGIT ) *;
STR
@init { StringBuffer buf = new StringBuffer(); }:
      '"' (esc=ESCAPE { buf.append($esc); }
            | normal =~ ('"'|'\\'|'\n'|'\r') { buf.appendCodePoint($normal); } )*
            '"' ) { $text = buf.toString() ; };
fragment
ESCAPE: '\\' ('\\' { $text = "\"; }
             |'n'  { $text = "\n";}
             |'r'  { $text = "\r";}
             |'"'  { $text = "\"";});

MEMORY: 'remember' | 'forget';

WS: ( ' ' | '\n' | '\r' | '\t' ) + { skip(); };