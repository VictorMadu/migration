package com.victorebubemadu.migration.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.victorebubemadu.migration.model.User;

public interface UserRepository  extends JpaRepository<User, Long> {
    
}
