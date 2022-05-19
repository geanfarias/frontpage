package com.frontpage.customer

class Customer {

    String name
    String email
    String cep
    String address
    String district
    String city
    String state

    static constraints = {
        name size: 5..150
        email size: 5..120
    }
}
