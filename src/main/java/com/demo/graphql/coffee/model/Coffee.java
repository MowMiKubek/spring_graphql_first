package com.demo.graphql.coffee.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity(name = "coffee")
@NoArgsConstructor
@Getter
@Setter
public class Coffee {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;

    String name;

    @Enumerated(EnumType.STRING)
    Size size;

    @OneToMany(mappedBy = "coffee", fetch = FetchType.LAZY)
    List<Customer> customers;

    public Coffee(String name, Size size) {
        this.name = name;
        this.size = size;
    }
}
