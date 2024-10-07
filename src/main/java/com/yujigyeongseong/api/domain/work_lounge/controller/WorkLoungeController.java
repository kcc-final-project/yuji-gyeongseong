package com.yujigyeongseong.api.domain.work_lounge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/work-lounge")
@Controller
public class WorkLoungeController {

    @GetMapping
    public String getWorkLoungePage() {
        return "work-lounge/work-lounge-evaluation-table";
    }

}
