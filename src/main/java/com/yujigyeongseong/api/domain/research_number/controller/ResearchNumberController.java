package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.*;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import com.yujigyeongseong.api.domain.research_number.service.EvalComposeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;

@RequestMapping("/research_number")
@Controller
@RequiredArgsConstructor
public class ResearchNumberController {

    private final EvalCommitteeService evalCommitteeService;
    private final EvalComposeService evalComposeService;

    @GetMapping
    public String researchNumber() {
        return "research-number/research-number-page";
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

    @GetMapping("/business-timeline/{id}")
    public String getNotis(@PathVariable Long id, Model model) {
        List<Noti> notiList = evalCommitteeService.getAllTechNotiByMemberId(id);

        model.addAttribute("noti_list", notiList);

        return "work-lounge/business-timeline";
    }

    @GetMapping("/work-lounge/eval-compose/{id}")
    public String getEvalCompose(@PathVariable Long id, Model model) {

        SubAnnouncement subAnnouncement = evalComposeService.getSubAnnounceById(id);
        EvalCommittee evalCommittee = evalComposeService.getOneEvalCommitteeById(id);
        List<EvalCommittee> evalCommittees = evalComposeService.getAllEvalCommitteeById(id);
        int rndPlanCnt = evalComposeService.getRndPlanCntById(id);
        Long subAnnounceId = id;


        model.addAttribute("subAnnouncement", subAnnouncement);
        model.addAttribute("evalCommittee", evalCommittee);
        model.addAttribute("committees", evalCommittees);
        model.addAttribute("rndPlanCnt", rndPlanCnt);
        model.addAttribute("subAnnounceId", subAnnounceId);

        return "work-lounge/eval-committee-compose";
    }

}
