parser grammar P;

options {
   tokenVocab = L;
}

@header {
package org.dan;
}

plugins returns [ List<Plugin> plugins ]
@init { plugins = new ArrayList<Plugin>(); }:  WS? plugin+;
plugin:  'direct' WS jbilName=STR WS pbaName=ID WS mem=MEMORY WS
        { plugins.add(new DirectPlugin($jbilName.text, $pbaName.text, true); }
        |  'redirect' WS jbilName=STR WS pbaName=ID WS
        { plugins.add(new RedirectPlugin($jbilName.text, $pbaName.text); }
        | 'assist' WS jbilName=STR WS pbaName=ID WS paySystems WS
        { plugins.add(new AssistPlugin($jbilName.text, $pbaName.text, $paySystems.enabledPaySystems); }
        | 'cash' WS jbilName=STR WS pbaName=ID WS
        { plugins.add(new CashPlugin($jbilName.text, $pbaName.text); }

paySystems returns [ Set<String> enabledPaySystems ]
@init { $enabledPaySystems = new HashSet<String>(); }:
   '[' WS? ( 'webmoney' { $enabledPaySystems.add('WPayment'); }
     |'yandexmoney' { $enabledPaySystems.add('YPayment'); }
     |'qiwi'  { $enabledPaySystems.add('QIWIPayment'); }
     |'cards' { $enabledPaySystems.add('CardPayment'); } )
     (WS ( 'webmoney' { $enabledPaySystems.add('WPayment'); }
              |'yandexmoney' { $enabledPaySystems.add('YPayment'); }
              |'qiwi'  { $enabledPaySystems.add('QIWIPayment'); }
              |'cards' { $enabledPaySystems.add('CardPayment'); } )  )*
     WS?  ']' ;