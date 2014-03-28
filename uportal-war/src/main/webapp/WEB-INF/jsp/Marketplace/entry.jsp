<%--
    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%@ include file="/WEB-INF/jsp/include.jsp"%>
<style>
    .marketplace_wrapper{
        min-height:250px;
    }
    .marketplace_description_title h2{
        font-family:'Arial Bold', 'Arial';
        font-weight:700;
        font-size:13px;
        color:#000000;
        text-align:left;
    }
    .marketplace_portlet_title{
        font-family: 'Arial Bold', 'Arial';
        font-weight:700;
        font-size:18px;
        color:#26507D;
        text-align:left;
    }
    .marketplace_description_body{
        font-family:'Arial';
        font-weight:400;
        font-size:12px;
        color:#000000;
        text-align:left;
    }
    .marketplace_dropdown_menu li a{
        font-size:14px;
        text-align:left;
        color:#000000;
    }
    .marketplace_dropdown_button{
        background-color:#666666;
    }
    .marketplace_dropdown_button:first-child{
        color:#FFFFFF
    }
    .marketplace_button_group>.btn-group:last-child>.btn:first-child{
        border-bottom-left-radius:5px;
        border-top-left-radius:5px;
    }
    .marketplace_button_group>.btn-group:first-child>.dropdown-toggle{
        border-top-right-radius:5px;
        border-bottom-right-radius:5px;
    }
    .marketplace_carousel_inner div img{
        margin:auto;
    }
    .marketplace_section_header{
        font-family:'Arial Bold', 'Arial';
        font-weight:700;
        font-size: 16px;
        color:#000000;
        text-align:left;
        font-style: normal;
        text-transform:uppercase;
    }
    .marketplace_release_date{
        font-family:'Arial';
        font-weight:400;
        font-size:14px;
        color: #000000;
        text-align:left;
        font-style:normal;
        padding-left:5px;
    }
    .marketplace_release_notes{
        padding-left:0px;
    }

    .marketplace_release_note{
        display:none;
    }

    .marketplace_wrapper li{
        font-family:'Arial';
        font-weight:400;
        font-size:14px;
        color:#000000;
        text-align:left;
        font-style:normal;
        list-style:none;
        padding-left:20px;
    }

    .marketplace_show{
        display:block;
    }
    
    #marketplace_show_more_less_link{
        font-family: 'Arial';
        font-weight: 400;
        font-size: 14px;
        color: #26507D;
        float: right;
        cursor: pointer;
    }
    
    .marketplace_average_rating .rating-input{
       padding: 0;
    }
    
    .marketplace_user_rating{
       outline-style: solid;
       outline-color: grey;
       margin-left: 0px;
       outline-width: thin;
    }
    
    .marketplace_carousel_inner img {
        max-height : 20em;
    }

    
</style>

<c:set var="n"><portlet:namespace/></c:set>
<div id="${n}" class="marketplace_wrapper">
    <div>
        <div class="row">
            <div class="col-md-6 col-xs-6 marketplace_portlet_title">${portlet.title}</div>
            <div class="col-md-6 col-xs-6" class="${n}go_button">
                <div class="btn-group marketplace_button_group" style="float:right">
                    <a href="${renderRequest.contextPath}/p/${portlet.FName}/render.uP" id="marketplace_go_button" class="btn btn-default marketplace_dropdown_button">Go</a>
                    <button type="button" class="btn btn-default dropdown-toggle marketplace_dropdown_button" data-toggle="dropdown">
                        <span class="caret"></span>
                        <span class="sr-only"></span>
                    </button>
                    <ul class="dropdown-menu marketplace_dropdown_menu" role="menu"  style="right: 0; left: auto;">
                        <li><a href="${renderRequest.contextPath}/p/${portlet.FName}/render.uP">Go</a></li>
                        <li><a href="#">Add to Favorites</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Share on Twitter</a></li>
                        <li><a href="#">Share on Facebook</a></li>
                        <li><a href="javascript:;" title='<spring:message code="link.to" text="Link to ..." />' data-toggle="modal" data-target="#${n}copy-modal" id="${n}linkto"><spring:message code="link.to" text="Link to ..." /></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 marketplace_description_title"><h2>${portlet.title}</h2></div>
            <div class="col-sm-12 marketplace_description_body">${portlet.description}</div>
        </div>
        <br>
        <%-- Now let's add some Preferences --%>
        <%-- Start with Screen shots and what not --%>
        <%--TODO replace carousel with more accessibility friendly element --%>
        <c:if test="${not empty portlet.screenShots}">
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <p>
                        <span class="marketplace_section_header"><spring:message code="screenshots.cap" text="SCREENSHOTS/VIDEOS"/></span>
                    </p>
                    <div id="marketplace_screenshots_and_videos" class="carousel slide" data-ride="carousel" data-interval="9000" data-wrap="true">
                        <c:set var="validUrlCount" value="0"/>
                        <c:forEach var="screenShot" items="${portlet.screenShots}">
                            <c:set var="imageUrl" value="${screenShot.url}" />
                            <c:if test="${up:isValidUrl(imageUrl)}">
                                <div class="carousel-inner marketplace_carousel_inner">
                                    <div class="item marketplace_screen_shots">
                                       <img src="${imageUrl}" alt="screenshot for portlet">
                                        <c:if test="${not empty screenShot.captions}">
                                            <div class="carousel-caption">
                                                <c:forEach var="portletCaption" items="${screenShot.captions}">
                                                    <h3>${portletCaption}</h3>
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                        <c:set var="validUrlCount" value="${validUrlCount + 1}" />
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <ol class="carousel-indicators marketplace_carousel_indicators">
                            <c:forEach var="i" begin="1" end="${validUrlCount}">
                                <li data-target="#marketplace_screenshots_and_videos" data-slide-to="${i}"></li>
                            </c:forEach>
                        </ol>
                        <c:if test="${validUrlCount gt 1}">
                            <a class="left carousel-control" href="#marketplace_screenshots_and_videos" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#marketplace_screenshots_and_videos" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>
        <br>
        <div class="row col-xs-12" style="clear:both;">
            <p>
                <span class="marketplace_section_header"><spring:message code="rating.and.review.cap" text="RATINGS & REVIEWS"/></span>
            </p>
                <div class="marketplace_average_rating col-xs-3 col-sm-2">
                <div><input type="number" data-max="5" data-min="1" value="${portlet.rating}" data-readonly="true" name="My Rating System" id="Demo" class="rating"/></div>
                <div></div>
                </div>
                <div id="marketplace_users_rated col-xs-3"><span id="marketplace_average_rating_description">(${portlet.usersRated} reviews)</span></div>
           <br>
           <div class="marketplace_user_rating row col-xs-12">
                <br>
                <span class="marketplace_user_rating_prompt"><spring:message code="rate.this.portlet" text="Rate this portlet"/></span>
                <br>
               <p class="help-block marketplace_rating_instructions">
                   <c:choose>
                       <c:when test="${rating == null || rating == 0}"> <%-- zero rating means unrated --%>
                           <spring:message code="rating.instructions.unrated"
                                           text='You have not yet rated "{0}".'
                                           arguments="${portlet.title}"
                                           htmlEscape="true" />
                       </c:when>
                       <c:otherwise>
                           <spring:message code="rating.instructions.rated"
                                           text='You have already rated "{0}"; adjust your rating if you wish.'
                                           arguments="${portlet.title}"
                                           htmlEscape="true" />
                       </c:otherwise>
                   </c:choose>
               </p>

                <div class="col-xs-4">
                    <input type="number" data-max="5" data-min="1" value="${rating}" name="marketplace_rate_this_portlet" class="rating marketplace_user_rating_star_system"/>
                </div>
                <br>
                <form role="form">
                    <div class="form-group">
                        <textarea class="form-control col-xs-12 col-med-6" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default" style="float:right" ><spring:message code="submit" text="Submit"/></button>
                    </div>
                </form>
                <br><br>            
           </div>
            <br>
        </div>
        <c:if test="${not empty portlet.portletReleaseNotes.releaseNotes}">
            <div class="row">
                <div class = "col-xs-12 col-md-4">
                    <br>
                    <p>
                        <span class="marketplace_section_header"><spring:message code="whats.new" text="What's New"/></span>
                        <c:if test="${not empty portlet.portletReleaseNotes.releaseDate}">
                            <span class="marketplace_release_date"> (Released <joda:format value="${portlet.portletReleaseNotes.releaseDate}" pattern="dd-MM-yyyy" />)</span>
                        </c:if>
                        
                    </p>
                    <p>
                        <c:if test="${not empty portlet.portletReleaseNotes.releaseNotes}">
                            <ul class="marketplace_release_notes">
                                <c:forEach var="releaseNote" items="${portlet.portletReleaseNotes.releaseNotes}">
                                    <li class="marketplace_release_note">- ${releaseNote}</li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </p>
                    <c:if test="${fn:length(portlet.portletReleaseNotes.releaseNotes) gt 3}">
                        <span><a id="marketplace_show_more_less_link"><spring:message code="more" text="More"/></a></span>
                    </c:if>
                </div>
            </div>
        </c:if>
        <br>
        <c:set var="relatedPortlets" value="${portlet.randomSamplingRelatedPortlets}"/>
        <c:if test="${not empty relatedPortlets}">
            <div class="row">
                <div class = "col-xs-12 col-md-4">
                    <span class="marketplace_section_header"><spring:message code="related.portlets" text="RELATED APPS" /></span>
                    <c:forEach var="relatedPortlet" items="${relatedPortlets}">
                        <portlet:renderURL var="mktplaceEntryURL" windowState="MAXIMIZED">
                            <portlet:param name="action" value="view"/>
                            <portlet:param name="fName" value="${relatedPortlet.FName}"/>
                        </portlet:renderURL>
                        <li>- <a href="${mktplaceEntryURL}">${relatedPortlet.name}</a></li>
                    </c:forEach>
                </div>
            </div>
            <br>
        </c:if>
        <c:set var="portletCategories" value="${portlet.parentCategories}"/>
        <c:if test="${not empty portletCategories}">
            <div class="row">
            <div class = "col-xs-12 col-md-4">
                <span class="marketplace_section_header"><spring:message code="categories" text="CATEGORIES" /></span>
                    <c:forEach var="portletCategory" items="${portletCategories}">
                        <portlet:renderURL var="initialViewWithFilterURL" windowState="MAXIMIZED">
                            <portlet:param name="initialFilter" value="${portletCategory.name}"/>
                        </portlet:renderURL>
                        <li>- <a href="${initialViewWithFilterURL}">${portletCategory.name}</a></li>
                    </c:forEach>
                </div>
            </div>
            <br>
        </c:if>
        <div class="row col-xs-12" style="clear:both;">
            <portlet:renderURL var="initialViewURL" windowState="MAXIMIZED"  >
            </portlet:renderURL>
            <div class="col-xs-4">
            </div>
            <div class="col-xs-4">
            </div>
            <div class="col-xs-4" style="float:left">
                <a href="${initialViewURL}"><spring:message code="back.to.list" text="Back to List"/></a>
            </div>
        </div>
    </div>                      
</div>
<div class="modal fade" id="${n}copy-modal" tabindex="-1" role="dialog" aria-labelledby="LinkToModal" aria-hidden="true">
    <div class="modal-dialog" style="text-align:center">
        <div class="modal-content" style="white-space: nowrap">
            <h4 class="modal-title">
                <strong>
                    <spring:message code="link.to.this" text="Link to This"/>
                </strong>
            </h4>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputDeep" class="col-sm-2 control-label"><spring:message code="link" text="Link"/></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputDeep" value="${deepLink}"></input>
                    </div>
                </div>
                <c:if test="${not empty shortURL }">
                    <div class="form-group">
                        <label for="smallLink" class="col-sm-2 control-label"><spring:message code="shortLink" text="Short Link"/></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="smallLink" value="${shortURL}"></input>
                        </div>
                    </div>
                </c:if>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="Close"/></button>
            </div>
        </div>
    </div>
</div>
<portlet:resourceURL id="saveRating" var="saveRatingUrl" />
<script type="text/javascript">
up.jQuery(function() {
    var $ = up.jQuery;
    $(document).ready( function () {
        $(".marketplace_screen_shots:first").addClass("active");
        $(".marketplace_carousel_indicators>li:first-child").addClass("active");
        $(".marketplace_release_notes>li:nth-child(-n+3)").addClass("marketplace_show");
        $('#${n}copy-modal').modal('hide');
        var lengthLink = $('#marketplace_show_more_less_link');
        if(lengthLink != undefined) {
            lengthLink = lengthLink[0];
            lengthLink.onclick = toggleNotesDisplayLength;
            function toggleNotesDisplayLength(){
                var currentText = lengthLink.innerHTML;
                if($.trim(currentText) == 'More'){
                    $(".marketplace_release_notes>li").addClass("marketplace_show");
                    lengthLink.innerHTML="Less";
                }else{
                    $(".marketplace_release_notes>li:not(:nth-child(-n+3))").removeClass("marketplace_show");
                    lengthLink.innerHTML="More";
                }
            }
        }        
    });
    
    $(".marketplace_user_rating_star_system" ).change(function() {
        $.ajax({
           url: '${saveRatingUrl}',
           data: {rating: $(this).val(), portletFName: "${portlet.FName}"},
           type: 'POST',
           success: function(){
               $('#up-notification').noty({
                   text: '<spring:message code="rating.saved.successfully" text="Success"/>',
                   layout: 'TopCenter',
                   type: 'success'
               });
               $(".marketplace_rating_instructions").text(
                       '<spring:message code="rating.instructions.rated.now"
                                        text='You have now rated "{0}"; update your rating if you wish.'
                                        arguments="${portlet.title}"
                                        htmlEscape="false"
                        />'); <%-- htmlEscape is false to avoid double-escaping, since .text() escapes. --%>
           },
           error: function(){
               $('#up-notification').noty({
                   text: '<spring:message code="rating.retrieved.unsuccessfully" text="Failure"/>',
                   layout: 'TopCenter',
                   type: 'error'
               });
           }
        });
      });
});

</script>
