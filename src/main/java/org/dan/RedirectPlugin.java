package org.dan;

/**
 * Daneel Yaitskov
 */
public class RedirectPlugin extends Plugin {

    private int pluginId;

    public int getPluginId() {
        return pluginId;
    }

    public void setPluginId(int pluginId) {
        this.pluginId = pluginId;
    }

    public RedirectPlugin(String name, String ebsId, int pluginId) {
        super(name, ebsId);
        this.pluginId = pluginId;
    }
}
