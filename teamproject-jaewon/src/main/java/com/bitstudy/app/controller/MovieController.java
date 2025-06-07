package com.bitstudy.app.controller;

import com.bitstudy.app.domain.MovieDto;
import com.bitstudy.app.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
public class MovieController {

    @Autowired
    MovieService movieService;

    @CrossOrigin(origins = "*")
    @GetMapping("/movies")
    public List<MovieDto> getMovies() {
        return movieService.selectAll(); // 영화 상세 페이지
    }
}
