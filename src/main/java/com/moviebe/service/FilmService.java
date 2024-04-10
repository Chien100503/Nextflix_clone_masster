package com.moviebe.service;

import com.moviebe.model.Film;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FilmService{
    public Film createPost(Film film);
    public Film getById(Integer id);
    public Film updatePost(Film film, Integer id);
    public void deleteFilm(Integer id);
    public List<Film> getAllPost();

}
