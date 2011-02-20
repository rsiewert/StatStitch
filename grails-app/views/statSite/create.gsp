

<%@ page import="com.alchemysoft.sports.StatSite" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'statSite.label', default: 'StatSite')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${statSiteInstance}">
            <div class="errors">
                <g:renderErrors bean="${statSiteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="css_class"><g:message code="statSite.css_class.label" default="Cssclass" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statSiteInstance, field: 'css_class', 'errors')}">
                                    <g:textField name="css_class" value="${statSiteInstance?.css_class}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="css_id"><g:message code="statSite.css_id.label" default="Cssid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statSiteInstance, field: 'css_id', 'errors')}">
                                    <g:textField name="css_id" value="${statSiteInstance?.css_id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="statSite.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statSiteInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${statSiteInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tags"><g:message code="statSite.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statSiteInstance, field: 'tags', 'errors')}">
                                    <g:textField name="tags" value="${statSiteInstance?.tags}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="statSite.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: statSiteInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${statSiteInstance?.url}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
