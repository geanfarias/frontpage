<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Asaas - Cadastro Clientes</title>

    <asset:stylesheet src="index/style.css"/>
</head>
<body>
<div class="loading hide js-loading">
Aguarde
</div>

<div class="container customer-form-container js-customer-form-container">
    <form class="row js-customer-form needs-validation">
        <div class="form-group col-md-12">
            <label for="name">Nome</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group col-md-12">
            <label for="cpf">CPF</label>
            <input type="text" class="form-control js-cpf" id="cpf" name="cpf" required>
        </div>
        <div class="form-group col-md-12">
            <label for="phone">Telefone</label>
            <input type="text" class="form-control js-phone" id="phone" name="phone">
        </div>
        <div class="form-group col-md-12">
            <label for="email">E-mail</label>
            <input type="text" class="form-control js-email" id="email" name="email">
        </div>
        <div class="form-group col-md-12">
            <label for="cep">CEP</label>
            <input type="text" class="form-control js-cep" id="cep" name="cep" required>
        </div>
        <div class="form-group col-md-12">
            <label for="street">Rua</label>
            <input type="text" class="form-control js-street" id="street" name="street">
        </div>
        <div class="form-group col-md-12">
            <label for="district">Bairro</label>
            <input type="text" class="form-control js-district" id="district" name="district">
        </div>
        <div class="form-group col-md-12">
            <label for="city">Cidade</label>
            <input type="text" class="form-control js-city" id="city" name="city">
        </div>
        <div class="form-group col-md-12">
            <label for="state">Estado</label>
            <input type="text" class="form-control js-state" id="state" name="state">
        </div>
        <div class="form-group col-md-12">
            <button class="btn btn-primary form-control" type="submit">Enviar</button>
        </div>
    </form>
</div>

    <asset:javascript src="input-mask.js"/>
    <asset:javascript src="index/IndexController.js"/>
</body>
</html>
