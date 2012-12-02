lexer grammar L;
@header {
package org.dan;
}

@members {
  private boolean keywordExpected = true;
  @Override
  public void reportError(RecognitionException e) {
    super.reportError(e);
    throw new InvalidConfException("invalid lexer");
  }
}

LETTER: 'A' .. 'Z' | 'a' .. 'z' | '_';
DIGIT: '0' .. '9';
PEND: ';' { keywordExpected = true; };
MEMORY: ('remember' | 'forget' );

REDIRECT: { keywordExpected }? 'redirect' { keywordExpected = false; };
DIRECT: { keywordExpected }? 'direct' { keywordExpected = false; } ;
CASH: { keywordExpected }? 'cash' { keywordExpected = false; } ;
ASSIST: { keywordExpected }? 'assist' { keywordExpected = false; };
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

