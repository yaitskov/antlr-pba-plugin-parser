package org.dan;


import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CharStream;
import org.antlr.runtime.CommonTokenStream;
import org.antlr.runtime.RecognitionException;

/**
 * Daneel Yaitskov
 */
public class EntryPoint {

    public static void main(String[] args) throws RecognitionException {
        CharStream input = new ANTLRStringStream("1234");
        L l = new L(input);
        CommonTokenStream stream = new CommonTokenStream(l);
        P p = new P(stream);
        p.number();
    }
}
