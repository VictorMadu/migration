package com.victorebubemadu.migration.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.victorebubemadu.migration.model.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
    
}
