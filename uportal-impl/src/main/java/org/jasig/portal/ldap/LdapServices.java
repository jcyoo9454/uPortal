/**
 * Copyright (c) 2000-2009, Jasig, Inc.
 * See license distributed with this file and available online at
 * https://www.ja-sig.org/svn/jasig-parent/tags/rel-10/license-header.txt
 */
package org.jasig.portal.ldap;

import java.util.Collections;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jasig.portal.spring.PortalApplicationContextLocator;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;

/**
 * Provides LDAP access in a way similar to a relational DBMS. This class
 * was modified for the 2.4 release to function more like {@link org.jasig.portal.RDBMServices}.
 * The class should be used via the static {@link #getDefaultLdapServer()} and
 * {@link #getLdapServer(String name)} methods.
 * <br>
 * <br>
 * Post 3.0 this class looks for an ILdapServer in the portal spring context
 * named 'defaultLdapServer' to use as the default LDAP server.
 * 
 * @author Eric Dalquist
 * @version $Revision$
 * @deprecated The prefered way to access configured ldap servers is using dependency injection and accessing the LdapContext instances in the spring context.
 */
public final class LdapServices {  
    private static final String DEFAULT_LDAP_SERVER_NAME = "defaultLdapServer";

    private static final Log LOG = LogFactory.getLog(LdapServices.class);

    /**
     * Get the default {@link ILdapServer} by looking for a ILdapServer bean named
     * 'defaultLdapServer' in the portal spring context.
     * 
     * @return The default {@link ILdapServer}. 
     */
    public static ILdapServer getDefaultLdapServer() {
        return getLdapServer(DEFAULT_LDAP_SERVER_NAME);
    }
    
    /**
     * Get the {@link ILdapServer} from the portal spring context with the
     * specified name.
     * 
     * @param name The name of the ILdapServer to return.
     * @return An {@link ILdapServer} with the specified name, <code>null</code> if there is no connection with the specified name.
     */
    public static ILdapServer getLdapServer(String name) {
        final ApplicationContext applicationContext = PortalApplicationContextLocator.getApplicationContext();
        
        ILdapServer ldapServer = null;
        try {
            ldapServer = (ILdapServer)applicationContext.getBean(name, ILdapServer.class);
        }
        catch (NoSuchBeanDefinitionException nsbde) {
            //Ignore the exception for not finding the named bean.
        }

        if (LOG.isDebugEnabled()) {
            LOG.debug("Found ILdapServer='" + ldapServer + "' for name='" + name + "'");
        }
        
        return ldapServer;
    }
  
    /**
     * Get a {@link Map} of {@link ILdapServer} instances from the spring configuration.
     * 
     * @return A {@link Map} of {@link ILdapServer} instances.
     */
    @SuppressWarnings("unchecked")
    public static Map<String, ILdapServer> getLdapServerMap() {
        final ApplicationContext applicationContext = PortalApplicationContextLocator.getApplicationContext();
        final Map<String, ILdapServer> ldapServers = applicationContext.getBeansOfType(ILdapServer.class);
        
        if (LOG.isDebugEnabled()) {
            LOG.debug("Found Map of ILdapServers=" + ldapServers + "'");
        }
        
        return Collections.unmodifiableMap(ldapServers);
    }
    
    /**
     * This class only provides static methods.
     */
    private LdapServices() {
        // private constructor prevents instantiation of this 
        // static service-providing class
    }  
}