package com.moviebe.controller;

import com.moviebe.model.FileModel;
import com.moviebe.model.Film;
import com.moviebe.repository.FilmRepository;
import com.moviebe.service.FileService;
import com.moviebe.service.FilmService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin
@RequestMapping("/api/film")
public class FilmController {

    @Value("${project.video}")
    private String path;

    @Autowired
    private FilmService filmService;

    @Autowired
    private FileService fileService;

    @Autowired
    private FilmRepository filmRepository;

    @PostMapping("/add")
    public ResponseEntity<?> addFilm(@RequestBody Film film){
        return new ResponseEntity<Film>(filmService.createPost(film), HttpStatus.OK);
    }

    @GetMapping("/getAll")
    public ResponseEntity<?> getFilm(){
        return new ResponseEntity<List<Film>>(filmService.getAllPost(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public Film getFilmById(@PathVariable Integer id){
        return filmService.getById(id);
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<?> updateFilm(@RequestBody Film film, @PathVariable Integer id){
        return new ResponseEntity<Film>(filmService.updatePost(film, id), HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public String deleteFilm(@PathVariable Integer id) throws IOException{
        Optional<Film> film = filmRepository.findById(id);
        Path extractPath = Paths.get(path + File.separator + film.get().getFilmVideo());
        System.out.println(extractPath);
        try {
            Files.deleteIfExists(extractPath);
        }catch (Exception e){
            e.getMessage();
        }
        filmService.deleteFilm(id);
        return "Delete Successfully";
    }

    @PostMapping("/post/{id}")
    public  Film uploadingFilm(@RequestParam("video") MultipartFile film,@PathVariable Integer id) throws IOException {
            Film f = filmService.getById(id);
            FileModel fileModel = fileService.uploadFilm(path, film);
            f.setFilmVideo(fileModel.getFilmFileName());
        return filmService.updatePost(f, id);
    }

    @GetMapping("/play/{id}")
    public void playFilm(@PathVariable Integer id, HttpServletResponse response) throws IOException {
        Optional<Film> film = filmRepository.findById(id);
        InputStream resource = fileService.getVideoFile(path, film.get().getFilmVideo(), id);
        response.setContentType(MediaType.ALL_VALUE);
        StreamUtils.copy(resource, response.getOutputStream());
    }
}
