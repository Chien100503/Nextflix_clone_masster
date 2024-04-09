package com.moviebe.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestToken {
    @GetMapping("test")
    public ResponseEntity<String> test(){
        return ResponseEntity.ok("Hello world");
    }

    @GetMapping("admin")
    public ResponseEntity<String> admin(){
        return ResponseEntity.ok("Hello admin");
    }
}
