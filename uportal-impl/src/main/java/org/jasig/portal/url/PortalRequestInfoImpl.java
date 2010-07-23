/**
 * 
 */
package org.jasig.portal.url;

import java.util.List;
import java.util.Map;


/**
 * Basic implementation of {@link IPortalRequestInfo} - a straightforward java bean.
 * Package private by design - see {@link IPortalUrlProvider} for a means to retrieve
 * an instance.
 * 
 * Default value for "action" is <strong>false</strong>.
 * Default urlState is {@link UrlState#NORMAL}.
 * 
 * @author Nicholas Blair, nblair@doit.wisc.edu
 *
 */
class PortalRequestInfoImpl implements IPortalRequestInfo {

    private String targetedLayoutNodeId;
    private Map<String, List<String>> layoutParameters;
    private IPortletRequestInfo portletRequestInfo;
    private UrlState urlState = UrlState.NORMAL;
    private UrlType urlType = UrlType.RENDER;
    private Map<String, List<String>> portalParameters;
    
    public String getTargetedLayoutNodeId() {
        return this.targetedLayoutNodeId;
    }
    public void setTargetedLayoutNodeId(String targetedLayoutNodeId) {
        this.targetedLayoutNodeId = targetedLayoutNodeId;
    }
    public IPortletRequestInfo getPortletRequestInfo() {
        return this.portletRequestInfo;
    }
    public void setPortletRequestInfo(IPortletRequestInfo portletRequestInfo) {
        this.portletRequestInfo = portletRequestInfo;
    }
    public UrlState getUrlState() {
        return this.urlState;
    }
    public void setUrlState(UrlState urlState) {
        this.urlState = urlState;
    }
    public UrlType getUrlType() {
        return this.urlType;
    }
    public void setUrlType(UrlType urlType) {
        this.urlType = urlType;
    }
    public Map<String, List<String>> getLayoutParameters() {
        return this.layoutParameters;
    }
    public void setLayoutParameters(Map<String, List<String>> layoutParameters) {
        this.layoutParameters = layoutParameters;
    }
    public Map<String, List<String>> getPortalParameters() {
        return this.portalParameters;
    }
    public void setPortalParameters(Map<String, List<String>> portalParameters) {
        this.portalParameters = portalParameters;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((this.layoutParameters == null) ? 0 : this.layoutParameters.hashCode());
        result = prime * result + ((this.portalParameters == null) ? 0 : this.portalParameters.hashCode());
        result = prime * result + ((this.portletRequestInfo == null) ? 0 : this.portletRequestInfo.hashCode());
        result = prime * result + ((this.targetedLayoutNodeId == null) ? 0 : this.targetedLayoutNodeId.hashCode());
        result = prime * result + ((this.urlState == null) ? 0 : this.urlState.hashCode());
        result = prime * result + ((this.urlType == null) ? 0 : this.urlType.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        PortalRequestInfoImpl other = (PortalRequestInfoImpl) obj;
        if (this.layoutParameters == null) {
            if (other.layoutParameters != null) {
                return false;
            }
        }
        else if (!this.layoutParameters.equals(other.layoutParameters)) {
            return false;
        }
        if (this.portalParameters == null) {
            if (other.portalParameters != null) {
                return false;
            }
        }
        else if (!this.portalParameters.equals(other.portalParameters)) {
            return false;
        }
        if (this.portletRequestInfo == null) {
            if (other.portletRequestInfo != null) {
                return false;
            }
        }
        else if (!this.portletRequestInfo.equals(other.portletRequestInfo)) {
            return false;
        }
        if (this.targetedLayoutNodeId == null) {
            if (other.targetedLayoutNodeId != null) {
                return false;
            }
        }
        else if (!this.targetedLayoutNodeId.equals(other.targetedLayoutNodeId)) {
            return false;
        }
        if (this.urlState == null) {
            if (other.urlState != null) {
                return false;
            }
        }
        else if (!this.urlState.equals(other.urlState)) {
            return false;
        }
        if (this.urlType == null) {
            if (other.urlType != null) {
                return false;
            }
        }
        else if (!this.urlType.equals(other.urlType)) {
            return false;
        }
        return true;
    }
    @Override
    public String toString() {
        return "PortalRequestInfoImpl [layoutParameters=" + this.layoutParameters + ", portalParameters="
                + this.portalParameters + ", portletRequestInfo=" + this.portletRequestInfo + ", targetedLayoutNodeId="
                + this.targetedLayoutNodeId + ", urlState=" + this.urlState + ", urlType=" + this.urlType + "]";
    }
}