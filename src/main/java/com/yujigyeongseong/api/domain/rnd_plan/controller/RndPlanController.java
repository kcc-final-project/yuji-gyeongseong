package com.yujigyeongseong.api.domain.rnd_plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/rnd-plan")
@Controller
public class RndPlanController {

    @GetMapping
    public String getRndPlanPage() {
        return "common/common-header";
    }

}
