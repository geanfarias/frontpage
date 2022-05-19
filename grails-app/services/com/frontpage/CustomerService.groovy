package com.frontpage

import grails.gorm.transactions.*
import com.frontpage.customer.Customer

@Transactional
class CustomerService {
    def save (Map params) {
        Customer customer = new Customer(params)
        customer.save(failOnError: true)
    }

    def list() {
        return Customer.getAll()
    }

    def getCustomer(Integer id) {
        return Customer.get(id)
    }

    def update(Map params) {
        if (params.id) {
            Customer customer = Customer.get(params.int("id"))
            customer.name = params.name
            customer.city = params.city
            customer.email = params.email
            customer.address = params.address
            customer.cep = params.cep
            customer.state = params.state
            customer.district = params.district
            customer.save(flush: true, failOnError: true)
        } else {
            throw new Exception("Erro ao editar")
        }
    }
}