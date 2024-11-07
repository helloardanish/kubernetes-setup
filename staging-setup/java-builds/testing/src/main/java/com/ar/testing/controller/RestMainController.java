package com.ar.testing.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class RestMainController {

    @RequestMapping("/test")
    public String test() {
        return "Hello World";
    }
}
