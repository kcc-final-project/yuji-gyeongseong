package com.yujigyeongseong.api.domain.rnd_plan.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AppController {
    @GetMapping("/")
    public String home() {
        return "Helloj World";
    }
}
