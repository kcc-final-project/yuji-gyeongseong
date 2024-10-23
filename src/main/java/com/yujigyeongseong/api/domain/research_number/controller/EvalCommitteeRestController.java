package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalNotiRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberDetails;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberEvalRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.SubmitResearchRequest;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import com.yujigyeongseong.api.domain.research_number.service.EvalComposeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RequestMapping("/api/v1/research_number")
@RestController
@RequiredArgsConstructor
public class EvalCommitteeRestController {

    private final EvalCommitteeService evalCommitteeService;
    private final EvalComposeService evalComposeService;

    @PostMapping("/register/research/{memberId}")
    public ResponseEntity<?> registerResearchInformation(@PathVariable Long memberId, @RequestBody SubmitResearchRequest submitRequest) {
        try {
            evalCommitteeService.setCareersByMemberId(memberId, submitRequest.getCareerInfos());
            evalCommitteeService.setAcadAbilitiesByMemberId(memberId, submitRequest.getAcademicInfos());
//            evalCommitteeService.setTechFieldsByMemberId(memberId, submitRequest.getTechnicalInfos());
            return ResponseEntity.ok("연구원 정보 저장 완료");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("연구원 정보 저장 실패: " + e.getMessage());
        }
    }

    @PostMapping("/register/eval/{memberId}")
    public ResponseEntity<?> registerEvalInformation(@RequestBody EvalNotiRequest evalNotiRequest) {
        try {
            evalCommitteeService.setEvalNotiByMemberId(evalNotiRequest);
            return ResponseEntity.ok("후보단 신청 완료");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("후보단 신청 실패: " + e.getMessage());
        }
    }

    @GetMapping("/researchers/{committeeId}")
    public ResponseEntity<List<MemberEvalRequest>> getEvaluationMembersByCommittee(@PathVariable Long committeeId) {
        List<EvaluationMember> evaluationMembers = evalComposeService.getEvaluationMembersByCommittee(committeeId);

        List<MemberEvalRequest> membersDetails = evaluationMembers.stream()
                .map(em -> {
                    MemberDetails member = evalComposeService.getOneMemberDetailWithInstitution(em.getMemNo());
                    return new MemberEvalRequest(member, em);
                })
                .collect(Collectors.toList());

        return ResponseEntity.ok(membersDetails);
    }
}
