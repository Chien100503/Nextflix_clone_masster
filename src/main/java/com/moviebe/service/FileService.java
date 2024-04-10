package com.moviebe.service;

import com.moviebe.model.FileModel;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

@Service
public interface FileService {
    FileModel uploadFilm (String path, MultipartFile file) throws IOException;

    InputStream getVideoFile(String path, String fileName, int id) throws FileNotFoundException;
}
