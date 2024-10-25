package com.demo.graphql.coffee.controller;

import com.demo.graphql.coffee.model.Coffee;
import com.demo.graphql.coffee.model.Customer;
import com.demo.graphql.coffee.service.CustomerService;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.graphql.data.method.annotation.SchemaMapping;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Optional;

@Controller
public class CustomerController {
    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @QueryMapping(name = "findAllCustomers")
    public List<Customer> findAll() {
        return customerService.getCustomers();
    }

    @QueryMapping(name = "findCustomerById")
    public Optional<Customer> findById(@Argument Long id) {
        return customerService.getCustomerById(id);
    }

    @SchemaMapping
    public Coffee favCoffee(Customer customer) {
        return customerService.getCoffee(customer);
    }
}
