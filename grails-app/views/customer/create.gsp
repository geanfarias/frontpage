<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js"/>
    </head>
    <body>
        <form action="${ g.createLink(controller: 'customer', action: 'save') }">
            <input type="text" name="name" placeholder="name">
            <input type="text" name="email" placeholder="email">
            <input type="text" name="cep" placeholder="cep">
            <input type="text" name="address" placeholder="address">
            <input type="text" name="district" placeholder="district">
            <input type="text" name="city" placeholder="city">
            <input type="text" name="state" placeholder="state">
            <button type="submit">Criar</button>
        </form>

        <asset:javascript src="teste.js" />
    </body>
</html>
