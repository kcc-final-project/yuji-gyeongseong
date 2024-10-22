package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/research_number")
@Controller
@RequiredArgsConstructor
public class ResearchNumberController {

    private final EvalCommitteeService evalCommitteeService;

    @GetMapping
    public String researchNumber() {
        return "research-number/research-number-page";
    }

    @GetMapping("/test")
    public String test() {
        return "work-lounge/business-timeline";
    }

    @GetMapping("/eval_committee")
    public String evalCommittee() {
        return "research-number/eval-committee-register";
    }

    @GetMapping("/eval-committee/{id}")
    public String getResearchNumber(@PathVariable Long id, Model model) {
        List<AcadAbility> academicList = evalCommitteeService.getAllAcadAbilitiesByMemberId(id);
        List<Career> careerList = evalCommitteeService.getAllCareersByMemberId(id);
        List<String> techNameList = evalCommitteeService.getAllTechFieldNameByMemberId(id);

        model.addAttribute("academic_list", academicList);
        model.addAttribute("career_list", careerList);
        model.addAttribute("tech_name_list", techNameList);

        return "research-number/eval-committee-register";
    }
}
