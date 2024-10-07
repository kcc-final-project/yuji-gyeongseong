package com.yujigyeongseong.api.domain.rnd_plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/rnd-plan")
@Controller
public class RndPlanController {

    @GetMapping
    public String getRndPlanPage() {
        return "rnd-plan/rnd-plan";
    }

    @GetMapping("/basic")
    public String getRndPlanBasicPage() {
        return "rnd-plan/basic";
    }

    @GetMapping("/task-summary")
    public String getRndPlanTaskSummaryPage() {
        return "rnd-plan/task-summary";
    }

}
