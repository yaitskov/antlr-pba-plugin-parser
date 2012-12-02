package org.dan;

/**
 * Daneel Yaitskov
 */
public class Plugin {
    private String name;
    private String ebsId;

    public Plugin(String name, String ebsId) {
        this.name = name;
        this.ebsId = ebsId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEbsId() {
        return ebsId;
    }

    public void setEbsId(String ebsId) {
        this.ebsId = ebsId;
    }
}
