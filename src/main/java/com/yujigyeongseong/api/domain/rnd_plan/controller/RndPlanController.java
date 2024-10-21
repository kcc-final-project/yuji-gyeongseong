package com.yujigyeongseong.api.domain.rnd_plan.controller;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
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
    public String getRndPlanPage(@PathVariable Long subAnnNo, Model model) {
        model.addAttribute("subAnnNo", subAnnNo);
        return "rnd-plan/rnd-plan";
    }

    @GetMapping("/basic")
    public String getRndPlanBasicPage(@RequestParam(required = false) Long subAnnNo, Model model) {
        RndPlanBasic rndPlanBasic = rndPlanService.getBasicInfoBySubAnnNo(subAnnNo);
        model.addAttribute("rndPlanBasic", rndPlanBasic);

        return "rnd-plan/basic";
    }

    @GetMapping("/task-summary")
    public String getRndPlanTaskSummaryPage() {
        return "rnd-plan/task-summary";
    }

    @GetMapping("/rsrch-institution")
    public String getRndPlanRsrchInstitutionPage() {
        return "rnd-plan/rsrch-institution";
    }

    @GetMapping("/rnd-expenses")
    public String getRndPlanRndExpensesPage() {
        return "rnd-plan/rnd-expenses";
    }

    @GetMapping("/additional-file")
    public String getRndPlanAdditionalFilePage() {
        return "rnd-plan/additional-file";
    }

    @GetMapping("/final-submit")
    public String getRndPlanFinalSubmitPage() {
        return "rnd-plan/final-submit";
    }

}
