
<%@ page import="com.alchemysoft.sports.StatSite" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'statSite.label', default: 'StatSite')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'statSite.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="css_class" title="${message(code: 'statSite.css_class.label', default: 'Cssclass')}" />
                        
                            <g:sortableColumn property="css_id" title="${message(code: 'statSite.css_id.label', default: 'Cssid')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'statSite.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="tags" title="${message(code: 'statSite.tags.label', default: 'Tags')}" />
                        
                            <g:sortableColumn property="url" title="${message(code: 'statSite.url.label', default: 'Url')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${statSiteInstanceList}" status="i" var="statSiteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${statSiteInstance.id}">${fieldValue(bean: statSiteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: statSiteInstance, field: "css_class")}</td>
                        
                            <td>${fieldValue(bean: statSiteInstance, field: "css_id")}</td>
                        
                            <td>${fieldValue(bean: statSiteInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: statSiteInstance, field: "tags")}</td>
                        
                            <td>${fieldValue(bean: statSiteInstance, field: "url")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${statSiteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
