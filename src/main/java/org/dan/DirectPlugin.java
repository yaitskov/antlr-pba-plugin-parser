package org.dan;

/**
 * Daneel Yaitskov
 */
public class DirectPlugin extends Plugin {
    private boolean remember;

    public DirectPlugin(String name, String ebsId, boolean remember) {
        super(name, ebsId);
        this.remember = remember;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }
}
