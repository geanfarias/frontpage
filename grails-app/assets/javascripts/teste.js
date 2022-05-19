$(document).ready(function () {
    $("form").on("submit", function(e) {
        e.preventDefault();

        if (!$("input[name='name']").val()) return alert("adicione informação de nome")
        if (!$("input[name='cep']").val()) return alert("adicione informação de nome")

        let infosCustomer = {};
        let data = new FormData(document.querySelector("form"));
        data.forEach(function (value, key) {
          infosCustomer[key] = value;
        });

        var url;

        if ($(this).find(".js-customer-id").val()) {
            url = "/customer/update"
        } else {
            url = "/customer/save"
        }

        $.post(url, infosCustomer, function(response) {
            if (response.success) {
                if (response.html) {
                    alert("Edição realizada com sucesso")
                    $(".js-form").html(response.html)
                    return;
                } 

                window.location.href = "/customer/list";
                return;
            } 

            alert(response.message)
        })
    });
});