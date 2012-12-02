lexer grammar L;
@header {
package org.dan;
}

@members {
  @Override
  public void reportError(RecognitionException e) {
    super.reportError(e);
    throw new InvalidConfException("invalid lexer");
  }
}

LETTER: 'A' .. 'Z' | 'a' .. 'z' | '_';
DIGIT: '0' .. '9';
MEMORY: ('remember' | 'forget' );

REDIRECT: 'redirect';
DIRECT: 'direct' ;
CASH: 'cash' ;
ASSIST: 'assist';
WEBM: 'webmoney';
YM: 'yandexmoney';
QIWI: 'qiwi';
CARD: 'cards';

LBRACE: '[';
RBRACE: ']';

ID: LETTER (LETTER | DIGIT ) *;
STR
@init { StringBuffer buf = new StringBuffer(); }:
      '"' (esc=ESCAPE { buf.append($esc); }
            | normal =~ ('"'|'\\'|'\n'|'\r')
              { buf.appendCodePoint($normal); } )*
          '"' { setText(buf.toString()) ; } ;



WS: ( ' ' | '\n' | '\r' | '\t' ) + { skip(); };

fragment
ESCAPE: '\\'
        (
        '\\' { setText("\\"); }
             |'n'  { setText("\n");}
             |'r'  { setText("\r");}
             |'"'  { setText("\"");});

