<html>
<head>
    <title>Document</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>3</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>CEP</th>
                <th>Endereço</th>
            </tr>
        </thead>
        <tbody>
            <g:each var="customer" in="${ customerList }">
                <tr>
                    <td>3</td>
                    <td> <a href="${ g.createLink(controller: 'customer', action: 'show', id: customer.id) }"> ${ customer.name } </a></td>
                    <td>${ customer.email }</td>
                    <td>${ customer.cep }</td>
                    <td>${ customer.address }</td>
                </tr>
            </g:each>
        </tbody>
    </table>
</body>
</html>