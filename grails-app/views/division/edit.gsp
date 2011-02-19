

<%@ page import="com.alchemysoft.sports.Division" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'division.label', default: 'Division')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${divisionInstance}">
            <div class="errors">
                <g:renderErrors bean="${divisionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${divisionInstance?.id}" />
                <g:hiddenField name="version" value="${divisionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="conference"><g:message code="division.conference.label" default="Conference" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'conference', 'errors')}">
                                    <g:select name="conference.id" from="${com.alchemysoft.sports.Conference.list()}" optionKey="id" value="${divisionInstance?.conference?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="division.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${divisionInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="teams"><g:message code="division.teams.label" default="Teams" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: divisionInstance, field: 'teams', 'errors')}">
                                    
<ul>
<g:each in="${divisionInstance?.teams?}" var="t">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="team" action="create" params="['division.id': divisionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
