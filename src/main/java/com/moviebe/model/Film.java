package com.moviebe.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Table(name = "film_table")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Film {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer filmId;
    @Column(name = "thumbnail")
    private String thumbnail;
    @Column(name = "filmName")
    private String filmName;
    @Column(name = "tags")
    private String tags;
    @Column(name = "description")
    private String description;
    @Column(name = "director")
    private String director;
    @Column(name = "mainCharacter")
    private String mainCharacter;
    @Column(name = "filmVideo")
    private String filmVideo;
    @Column(name = "addDate")
    private Date addDate;
}
