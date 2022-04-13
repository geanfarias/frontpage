function IndexController() {
    var _this = this;
    this.reference = document.getElementsByClassName("js-customer-form-container")[0];

    const loadingBackground = document.getElementsByClassName("js-loading")[0];
    const customerForm = this.reference.getElementsByClassName("js-customer-form")[0];
    const cpfReference = this.reference.getElementsByClassName("js-cpf")[0];
    const phoneReference = this.reference.getElementsByClassName("js-phone")[0];
    const emailReference = this.reference.getElementsByClassName("js-email")[0];
    const cepReference = this.reference.getElementsByClassName("js-cep")[0];
    const cityReference = this.reference.getElementsByClassName("js-city")[0];
    const districtReference = this.reference.getElementsByClassName("js-district")[0];
    const streetReference = this.reference.getElementsByClassName("js-street")[0];
    const stateReference = this.reference.getElementsByClassName("js-state")[0];

    const requisicoes = (url, data, method) => fetch(url, { method: method, body: data }).then(result => result.json())

    this.init = function() {
        setMask();
        bindCepReference();
        bindSubmitForm();
    }

    var setMask = function() {
        new Inputmask({mask: "999.999.999-99", showMaskOnHover: false, keepStatic: true}).mask(cpfReference);
        new Inputmask({mask: ["(99) 9999-9999", "(99) 9 9999-9999"], showMaskOnHover: false, keepStatic: true}).mask(phoneReference);
        new Inputmask({mask: "99999-999", showMaskOnHover: false, keepStatic: true}).mask(cepReference);
        new Inputmask("email", { showMaskOnHover: false }).mask(emailReference);
    }

    var bindSubmitForm = function() {
        customerForm.addEventListener("submit", function(eventSubmit) {
            eventSubmit.preventDefault();

            if (!verifyCpf(cpfReference.value.replace(/\D/g, ''))) {
                alert("CPF inválido");
                return;
            }

            console.log($(customerForm).serializeArray());
            alert("Formulário enviado com sucesso");
            customerForm.reset();
        });
    };

    var bindCepReference = function() {
        cepReference.addEventListener("input", function() {
            if (cepReference.value) {
                let cepValue = cepReference.value.replace(/\D/g, '');
                let cepRegex = /^[0-9]{8}$/;
                if (cepRegex.test(cepValue)) {
                    cepReference.blur();
                    loadingBackground.classList.remove("hide");
                    requisicoes("https://viacep.com.br/ws/" + cepValue + "/json", null, "get")
                        .then(function (dados) {
                            loadingBackground.classList.add("hide");
                            if (!("erro" in dados)) {
                                if (dados.localidade) {
                                    cityReference.value = dados.localidade;
                                }

                                if (dados.bairro) {
                                    districtReference.value = dados.bairro;
                                }
                                
                                streetReference.value = dados.logradouro;
                                stateReference.value = dados.uf;
                            }
                            else {
                                alert("Cep não encontrado");
                                cityReference.value = "";
                                districtReference.value = "";
                                streetReference.value = "";
                                stateReference.value = "";
                            }
                        })
                }
            }
        })
    };

    var verifyCpf = function(cpf) {
        var Soma;
        var Resto;
        Soma = 0;
        if (cpf == "00000000000") return false;
        
        for (let i=1; i<=9; i++) {
            Soma = Soma + parseInt(cpf.substring(i-1, i)) * (11 - i);
        }

        Resto = (Soma * 10) % 11;

        if ((Resto == 10) || (Resto == 11))  Resto = 0;
        if (Resto != parseInt(cpf.substring(9, 10)) ) return false;

        Soma = 0;

        for (let i = 1; i <= 10; i++) { 
            Soma = Soma + parseInt(cpf.substring(i-1, i)) * (12 - i);
        }

        Resto = (Soma * 10) % 11;

        if ((Resto == 10) || (Resto == 11))  Resto = 0;
        if (Resto != parseInt(cpf.substring(10, 11) ) ) return false;
        return true;
    }
}

var indexController;
document.addEventListener("DOMContentLoaded", function() {
    indexController = new IndexController();
    indexController.init();
});