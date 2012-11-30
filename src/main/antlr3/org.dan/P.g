parser grammar P;

options {
   tokenVocab = L;
}

@header {
package org.dan;
}

/** matches all digits */
number: DIGIT+;
