package org.dan;

import java.util.Map;
import java.util.Set;

/**
 * Daneel Yaitskov
 */
public class AssistPlugin extends RedirectPlugin {

    Set<String> enabledPaymentSystems;

    public AssistPlugin(String name, String ebsId, Set<String> enabledPaymentSystems) {
        super(name, ebsId);
        this.enabledPaymentSystems = enabledPaymentSystems;
    }

    public Set<String> getEnabledPaymentSystems() {
        return enabledPaymentSystems;
    }

    public void setEnabledPaymentSystems(Set<String> enabledPaymentSystems) {
        this.enabledPaymentSystems = enabledPaymentSystems;
    }
}
