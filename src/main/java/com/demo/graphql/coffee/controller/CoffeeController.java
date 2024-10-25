package com.demo.graphql.coffee.controller;

import com.demo.graphql.coffee.model.Coffee;
import com.demo.graphql.coffee.model.Customer;
import com.demo.graphql.coffee.model.Size;
import com.demo.graphql.coffee.service.CoffeeService;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.graphql.data.method.annotation.SchemaMapping;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Optional;

@Controller
public class CoffeeController {
    private final CoffeeService coffeeService;

    public CoffeeController(CoffeeService coffeeService) {
        this.coffeeService = coffeeService;
    }

    @QueryMapping(name = "findAllCoffees")
    public List<Coffee> findAll() {
        return coffeeService.findAll();
    }

    @Secured("ROLE_ADMIN")
    @QueryMapping(name = "findCoffeeById")
    public Optional<Coffee> findById(@Argument Long id) {
        return coffeeService.findOne(id);
    }

    @Secured("ROLE_USER")
    @MutationMapping(name = "createCoffee")
    public Coffee create(@Argument String name, @Argument Size size) {
        return coffeeService.create(name, size);
    }

    @MutationMapping(name = "updateCoffee")
    public Coffee update(@Argument Long id, @Argument String name, @Argument Size size) {
        return coffeeService.update(id, name, size);
    }

    @MutationMapping(name = "deleteCoffee")
    public Coffee delete(@Argument Long id) {
        return coffeeService.delete(id);
    }

    @SchemaMapping
    public List<Customer> lovers(Coffee coffee) {
        return coffeeService.getCoffeeLovers(coffee);
    }
}
