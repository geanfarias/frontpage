package com.frontpage

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON

class CustomerController {

    def customerService

    def create() { }

    def list() {
        return [customerList: customerService.list()]
    }

    def save () {
        try {
            customerService.save(params)
            render([success: true] as JSON)
        } catch(Exception e) {
            render([success: false, message: "Ocorreu um erro"] as JSON)
        }
    }

    def update() {
        try {
            customerService.update(params)
            Map info = [customer : customerService.getCustomer(params.int("id"))]
            render([success: true, html: g.render(template: "/customer/templates/show/form", model: info)] as JSON)
        } catch(Exception e) {
            render([success: false, message: "Erro ao atualizar"] as JSON)
        }
    }

    def show() {
        return [customer: customerService.getCustomer(params.int("id"))]
    }
}
