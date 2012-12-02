parser grammar P;

options {
   tokenVocab = L;
}

@header {
package org.dan;
import java.util.Set;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
}

@members {
  @Override
  public void reportError(RecognitionException e) {
    super.reportError(e);
    throw new InvalidConfException("invalid lexer");
  }
}


plugins returns [ List<Plugin> plugins ]
@init { $plugins = new ArrayList<Plugin>(); }:
     ( plugin PEND { $plugins.add($plugin.plugin); } ) +;
plugin returns [ Plugin plugin ]:
        DIRECT  jbilName=STR  pbaName=STR  mem=MEMORY
        { $plugin = new DirectPlugin($jbilName.text, $pbaName.text, "remember".equals($mem.text)); }
        |  REDIRECT  jbilName=STR  pbaName=STR
        { $plugin = new RedirectPlugin($jbilName.text, $pbaName.text); }
        | ASSIST  jbilName=STR  pbaName=STR  paySystems
        { $plugin = new AssistPlugin($jbilName.text, $pbaName.text,
                                       $paySystems.enabledPaySystems); }
        | CASH  jbilName=STR  pbaName=STR
        { $plugin = new CashPlugin($jbilName.text, $pbaName.text); }  ;

paySystems returns [ Set<String> enabledPaySystems ]
@init { $enabledPaySystems = new HashSet<String>(); }:
   LBRACE  ( WEBM { $enabledPaySystems.add("WPayment"); }
     |YM { $enabledPaySystems.add("YPayment"); }
     |QIWI  { $enabledPaySystems.add("QIWIPayment"); }
     |CARD { $enabledPaySystems.add("CardPayment"); } )
     ( ( WEBM { $enabledPaySystems.add("WPayment"); }
              |YM { $enabledPaySystems.add("YPayment"); }
              |QIWI  { $enabledPaySystems.add("QIWIPayment"); }
              |CARD { $enabledPaySystems.add("CardPayment"); } )  )*
       RBRACE ;

