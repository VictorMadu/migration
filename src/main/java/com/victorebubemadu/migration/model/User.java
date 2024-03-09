package com.victorebubemadu.migration.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;


/**
 * User
 */
@Entity
@Table(
        name = "UserAccount",
        uniqueConstraints = {
            @UniqueConstraint(columnNames = {"userName"})
        })
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String userName;

    private LocalDateTime birthDate;
}