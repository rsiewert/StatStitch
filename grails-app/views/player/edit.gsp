

<%@ page import="com.alchemysoft.sports.Player" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
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
            <g:hasErrors bean="${playerInstance}">
            <div class="errors">
                <g:renderErrors bean="${playerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${playerInstance?.id}" />
                <g:hiddenField name="version" value="${playerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="college"><g:message code="player.college.label" default="College" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'college', 'errors')}">
                                    <g:textField name="college" value="${playerInstance?.college}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dob"><g:message code="player.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'dob', 'errors')}">
                                    <g:textField name="dob" value="${playerInstance?.dob}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="player.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${playerInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="player_position"><g:message code="player.player_position.label" default="Playerposition" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'player_position', 'errors')}">
                                    <g:textField name="player_position" value="${playerInstance?.player_position}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="team"><g:message code="player.team.label" default="Team" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'team', 'errors')}">
                                    <g:select name="team.id" from="${com.alchemysoft.sports.Team.list()}" optionKey="id" value="${playerInstance?.team?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="yearsPlayed"><g:message code="player.yearsPlayed.label" default="Years Played" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: playerInstance, field: 'yearsPlayed', 'errors')}">
                                    <g:textField name="yearsPlayed" value="${playerInstance?.yearsPlayed}" />
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
