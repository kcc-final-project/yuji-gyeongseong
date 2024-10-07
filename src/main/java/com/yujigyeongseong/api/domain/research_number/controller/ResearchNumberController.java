package com.yujigyeongseong.api.domain.research_number.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/research_number")
@Controller
public class ResearchNumberController {

    @GetMapping
    public String researchNumber() {
        return "research-number/research-number-page";
    }
}
