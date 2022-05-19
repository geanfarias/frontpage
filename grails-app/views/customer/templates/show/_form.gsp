<form action="${ g.createLink(controller: 'customer', action: 'save') }">
    <input type="hidden" class="js-customer-id" name="id" value="${ customer.id }">
    <input type="text" name="name" placeholder="name" value="${ customer.name }" readonly>
    <input type="text" name="email" placeholder="email" value="${ customer.email }" readonly>
    <input type="text" name="cep" placeholder="cep" value="${ customer.cep }" readonly>
    <input type="text" name="address" placeholder="address" value="${ customer.address }" readonly>
    <input type="text" name="district" placeholder="district" value="${ customer.district }" readonly>
    <input type="text" name="city" placeholder="city" value="${ customer.city }" readonly>
    <input type="text" name="state" placeholder="state" value="${ customer.state }" readonly>
    <button class="js-edit">Editar</button>
    <button type="submit" class="js-send-button hide">Salvar</button>
</form>