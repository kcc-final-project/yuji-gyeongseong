package com.yujigyeongseong.api.domain.work_lounge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/work-lounge")
@Controller
public class WorkLoungeController {

    @GetMapping
    public String getWorkLoungePage() {
        return "work-lounge/work-lounge";
    }

    @GetMapping("/evaluation-table")
    public String getWorkLoungeEvaluationTablePage() {
        return "work-lounge/evaluation-table";
    }

    @GetMapping("/evaluation-paper")
    public String getWorkLoungeEvaluationPaperPage() {
        return "work-lounge/evaluation-paper";
    }

    @GetMapping("/sharing-opinion")
    public String getWorkLoungeSharingOpinionPage() {
        return "work-lounge/sharing-opinion";
    }

    @GetMapping("/register-list")
    public String getWorkLoungeRegisterListPage() {
        return "work-lounge/register-list";
    }

}
