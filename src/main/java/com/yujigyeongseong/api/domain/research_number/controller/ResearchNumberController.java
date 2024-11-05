package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.*;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import com.yujigyeongseong.api.domain.research_number.service.EvalComposeService;
import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ResearchNumberController {

    private final EvalCommitteeService evalCommitteeService;
    private final EvalComposeService evalComposeService;

    @GetMapping("/research-number")
    public String researchNumber() {
        return "research-number/research-number-page";
    }

    @GetMapping("/eval-committee")
    public String evalCommittee(Model model,  @AuthenticationPrincipal PrincipalDetail principalDetail) {

        List<AcadAbility> academicList = evalCommitteeService.getAllAcadAbilitiesByMemberId(principalDetail.getId());
        List<Career> careerList = evalCommitteeService.getAllCareersByMemberId(principalDetail.getId());
        List<String> techNameList = evalCommitteeService.getAllTechFieldNameByMemberId(principalDetail.getId());

        model.addAttribute("academic_list", academicList);
        model.addAttribute("career_list", careerList);
        model.addAttribute("tech_name_list", techNameList);

        return "research-number/eval-committee-register";
    }

    @GetMapping("/business-timeline")
    public String getNotis(Model model, @AuthenticationPrincipal PrincipalDetail principalDetail) {

        List<Noti> notiList = evalCommitteeService.getAllTechNotiByMemberId(principalDetail.getId());

        model.addAttribute("noti_list", notiList);

        return "work-lounge/business-timeline";
    }

    @GetMapping("/work-lounge/eval-list/eval-compose/{id}")
    public String getEvalCompose(@PathVariable Long id, Model model) {

        SubAnnounce subAnnounce = evalComposeService.getSubAnnounceById(id);
        EvalCommittee evalCommittee = evalComposeService.getOneEvalCommitteeById(id);
        List<EvalCommittee> evalCommittees = evalComposeService.getAllEvalCommitteeById(id);
        int rndPlanCnt = evalComposeService.getRndPlanCntById(id);
        Long subAnnounceId = id;

        model.addAttribute("subAnnNo", id);
        model.addAttribute("subAnnounce", subAnnounce);
        model.addAttribute("evalCommittee", evalCommittee);
        model.addAttribute("committees", evalCommittees);
        model.addAttribute("rndPlanCnt", rndPlanCnt);
        model.addAttribute("subAnnounceId", subAnnounceId);

        return "work-lounge/eval-committee-compose";
    }

    @GetMapping("/socket-test")
    public String socketTest(){
        return "research-number/socket-test";
    }
}
