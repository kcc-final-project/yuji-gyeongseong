package com.yujigyeongseong.api.domain.rnd_plan.controller;

import com.yujigyeongseong.api.domain.rnd_plan.dto.BasicInfo;
import com.yujigyeongseong.api.domain.rnd_plan.service.RndPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/rnd-plans")
@Controller
@RequiredArgsConstructor
public class RndPlanController {

    private final RndPlanService rndPlanService;

    @GetMapping("/{subAnnNo}")
    public String getRndPlanPage(@PathVariable final Long subAnnNo,
                                 final Model model) {
        model.addAttribute("subAnnNo", subAnnNo);
        return "rnd-plan/rnd-plan";
    }

    // 기본정보 페이지 조회 API
    @GetMapping("/basic")
    public String getRndPlanBasicPage(@RequestParam(required = false) Long subAnnNo,
                                      final Model model) {

        BasicInfo basicInfo = rndPlanService.getBasicInfoPageBySubAnnNo(subAnnNo);
        model.addAttribute("rndPlanBasic", basicInfo);
        return "rnd-plan/basic";
    }

    // 과제요약 페이지 조회 API
    @GetMapping("/task-summary")
    public String getRndPlanTaskSummaryPage() {
        return "rnd-plan/task-summary";
    }

    // 연구기관 페이지 조회 API
    @GetMapping("/rsrch-institution")
    public String getRndPlanRsrchInstitutionPage() {
        return "rnd-plan/rsrch-institution";
    }

    // 연구개발비 페이지 조회 API
    @GetMapping("/rnd-expenses")
    public String getRndPlanRndExpensesPage() {
        return "rnd-plan/rnd-expenses";
    }

    // 첨부파일 페이지 조회 API
    @GetMapping("/additional-file")
    public String getRndPlanAdditionalFilePage() {
        return "rnd-plan/additional-file";
    }

    // 최종제출 페이지 조회 API
    @GetMapping("/final-submit")
    public String getRndPlanFinalSubmitPage() {
        return "rnd-plan/final-submit";
    }

}
