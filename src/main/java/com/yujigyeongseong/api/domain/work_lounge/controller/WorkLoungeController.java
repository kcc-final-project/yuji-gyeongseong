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

    @GetMapping("/business-timeline")
    public String getWorkLoungeBusinessTimelinePage() {
        return "work-lounge/business-timeline";
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

    @GetMapping("/evaluation-task-list")
    public String getWorkLoungeEvaluationTaskListPage() {
        return "work-lounge/evaluation-task-list";
    }

    @GetMapping("/selection-evaluation")
    public String getWorkLoungeSelectionEvaluationPage() {
        return "work-lounge/selection-evaluation";
    }

    @GetMapping("/selection-evaluation-detail")
    public String getWorkLoungeSelectionEvaluationDetailPage() {
        return "work-lounge/selection-evaluation-detail";
    }

    @GetMapping("/radar-chart")
    public String getWorkLoungeRadarChartPage() {
        return "work-lounge/radar-chart";
    }

    @GetMapping("/bubble-chart")
    public String getWorkLoungeBubbleChartPage() {
        return "work-lounge/bubble-chart";
    }

    @GetMapping("/eval-compose")
    public String getWorkLoungeEvalComposePage() {
        return "work-lounge/eval-committee-compose";
    }
}
