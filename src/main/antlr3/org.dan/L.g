lexer grammar L;
@header {
package org.dan;
}


DIGIT: '0' .. '9' {
        System.out.println("new digit " + $text);
} ;

