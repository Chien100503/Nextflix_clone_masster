package com.moviebe.service;

import com.moviebe.exception.ResourceNotFoundException;
import com.moviebe.model.Film;
import com.moviebe.repository.FilmRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class FilmServiceImplement implements FilmService {

    @Autowired
    private FilmRepository filmRepository;

    @Override
    public Film createPost(Film film) {
        if(film.getFilmName().isEmpty()){
            throw new ResourceNotFoundException(false, "Film Name can not be null");
        }
        try {
            film.setAddDate(new Date());
            return filmRepository.save(film);
        }catch (Exception e){
            throw new ResourceNotFoundException(false, "Something wrong!");
        }
    }

    @Override
    public Film getById(Integer id) {
        return filmRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException(false, "Not found"));
    }

    @Override
    public Film updatePost(Film film, Integer id) {
        Film f = filmRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(false, "Not found"));
        f.setThumbnail(film.getThumbnail());
        f.setFilmName(film.getFilmName());
        f.setTags(film.getTags());
        f.setDescription(film.getDescription());
        f.setDirector(film.getDirector());
        f.setMainCharacter(film.getMainCharacter());
        f.setAddDate(new Date());

        return filmRepository.save(f);
    }

    @Override
    public void deleteFilm(Integer id) {
        Film film = filmRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException(false, "Not found"));
        filmRepository.delete(film);
    }

    @Override
    public List<Film> getAllPost() {

        return filmRepository.findAll();
    }
}
