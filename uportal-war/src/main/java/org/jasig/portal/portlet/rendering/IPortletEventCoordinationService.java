/**
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work
 * for additional information regarding copyright ownership.
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a
 * copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.jasig.portal.portlet.rendering;

import java.util.Queue;

import javax.portlet.Event;
import javax.servlet.http.HttpServletRequest;

import org.apache.pluto.container.EventCoordinationService;
import org.jasig.portal.portlet.om.IPortletWindowId;

/**
 * Service that manages handling and queueing portlet events
 * 
 * @author Eric Dalquist
 * @version $Revision$
 */
public interface IPortletEventCoordinationService extends EventCoordinationService {
    /**
     * Get all of the queued events for the current request
     */
    public Queue<Event> getQueuedEvents(HttpServletRequest request);
    
    /**
     * Remove events from the Queue determing which {@link IPortletWindowId}s it targets and then add it to the
     * {@link PortletEventQueue}
     */
    public void resolveQueueEvents(PortletEventQueue resolvedEvents, Queue<Event> events, HttpServletRequest request);
}