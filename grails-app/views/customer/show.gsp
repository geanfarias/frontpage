<!DOCTYPE html>
<html>
    <head>
        <style>
            .hide {
                display: none;
            }

            input:read-only {
                background: gray;
            }
        </style>
        <asset:javascript src="application.js"/>
        <asset:javascript src="teste.js"/>
    </head>
    <body>
        <div class="js-form">
            <g:render template="/customer/templates/show/form" />
        </div>

        <script>
            $(document).ready(function() {
                var listaInput = $("input");

                $(".js-edit").on("click", function(e) {
                    e.preventDefault();
                    $(this).addClass("hide")
                    $(".js-send-button").removeClass("hide")

                    listaInput.each(function(index, input) {
                        $(input).removeAttr("readonly")
                    })
                });
            })
        </script>
    </body>
</html>
