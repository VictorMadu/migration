package com.victorebubemadu.migration.model;

import jakarta.persistence.*;


/**
 * Post
 */
@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long creator;


    private String title;

    private String content;
    
    private int totalLikes;

}