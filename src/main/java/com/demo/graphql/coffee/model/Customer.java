package com.demo.graphql.coffee.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity(name = "customers")
@Getter
@Setter
@NoArgsConstructor
public class Customer{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String name;

    private String password;

    @ManyToOne
    @JoinColumn(name = "coffee_id")
    private Coffee coffee;

    public Customer(String name, String password) {
        this.name = name;
        this.password = password;
    }
}