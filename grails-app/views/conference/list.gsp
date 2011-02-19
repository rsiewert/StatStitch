
<%@ page import="com.alchemysoft.sports.Conference" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'conference.label', default: 'Conference')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'conference.id.label', default: 'Id')}" />
                        
                            <th><g:message code="conference.league.label" default="League" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'conference.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${conferenceInstanceList}" status="i" var="conferenceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${conferenceInstance.id}">${fieldValue(bean: conferenceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: conferenceInstance, field: "league")}</td>
                        
                            <td>${fieldValue(bean: conferenceInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${conferenceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
