package com.demo.graphql.coffee.service;

import com.demo.graphql.coffee.model.Coffee;
import com.demo.graphql.coffee.model.Customer;
import com.demo.graphql.coffee.repository.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerService {
    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<Customer> getCustomers() {
        return customerRepository.findAll();
    }

    public Optional<Customer> getCustomerById(Long id) {
        return customerRepository.findById(id);
    }

    public Coffee getCoffee(Customer customer) {
        return customer.getCoffee();
    }
}
