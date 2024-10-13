package com.demo.graphql.coffee.service;

import com.demo.graphql.coffee.model.Coffee;
import com.demo.graphql.coffee.model.Customer;
import com.demo.graphql.coffee.model.Size;
import com.demo.graphql.coffee.repository.CoffeeRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CoffeeService {
    private final CoffeeRepository coffeeRepository;

    public CoffeeService(CoffeeRepository coffeeRepository) {
        this.coffeeRepository = coffeeRepository;
    }

    public List<Coffee> findAll() {
        return coffeeRepository.findAll();
    }

    public Optional<Coffee> findOne(Long id) {
        return coffeeRepository.findById(id);
    }

    public Coffee create(String name, Size size) {
        Coffee coffee = new Coffee(name, size);
        coffeeRepository.save(coffee);
        return coffee;
    }

    public Coffee update(Long id, String name, Size size) {
        Coffee coffee = coffeeRepository.findById(id).orElseThrow(IllegalArgumentException::new);
        coffee.setName(name);
        coffee.setSize(size);
        coffeeRepository.save(coffee);
        return coffee;
    }

    public Coffee delete(Long id) {
        Optional<Coffee> optional = coffeeRepository.findById(id);
        if (optional.isPresent()) {
            Coffee coffee = optional.get();
            coffeeRepository.delete(coffee);
        }
        return null;
    }

    public List<Customer> getCoffeeLovers(Coffee coffee) {
        return coffee.getCustomers();
    }
}