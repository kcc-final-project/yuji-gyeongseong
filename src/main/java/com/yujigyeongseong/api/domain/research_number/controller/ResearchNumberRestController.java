package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.request.*;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import com.yujigyeongseong.api.domain.research_number.service.EvalComposeService;
import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/api/v1/research-number")
@RestController
@RequiredArgsConstructor
@Slf4j
public class ResearchNumberRestController {

    private final EvalCommitteeService evalCommitteeService;
    private final EvalComposeService evalComposeService;

    @PostMapping("/register/research/{memberId}")
    public ResponseEntity<?> registerResearchInformation(@AuthenticationPrincipal PrincipalDetail principalDetail, @RequestBody SubmitResearchRequest submitRequest, HttpSession session) {

        // 세션 연결
        Long id = principalDetail.getId();

        String rsrcNo = "572834" + id;
        session.setAttribute("rsrcNo",rsrcNo);

        try {
            evalCommitteeService.setCareersByMemberId(id, submitRequest.getCareerInfos());
            evalCommitteeService.setAcadAbilitiesByMemberId(id, submitRequest.getAcademicInfos());
//            evalCommitteeService.setTechFieldsByMemberId(memberId, submitRequest.getTechnicalInfos());

            // 연구원 번호 저장
            evalCommitteeService.setRsrcNoByMemberId(id);

            return ResponseEntity.ok("연구원 정보 저장 완료");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("연구원 정보 저장 실패: " + e.getMessage());
        }
    }

    @PostMapping("/register/eval/{memberId}")
    public ResponseEntity<?> registerEvalInformation(@AuthenticationPrincipal PrincipalDetail principalDetail, @RequestBody EvalNotiRequest evalNotiRequest) {
        try {
            evalNotiRequest.setMemNo(principalDetail.getId());
            evalCommitteeService.setEvalNotiByMemberId(evalNotiRequest);
            return ResponseEntity.ok("후보단 신청 완료");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("후보단 신청 실패: " + e.getMessage());
        }
    }

    @PostMapping("/register/noti/{memberId}")
    public ResponseEntity<?> registerEvalNotiInformation(@RequestBody EvalNotiRequest evalNotiRequest) {
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

        List<MemberEvalRequest> membersDetails = new ArrayList<>();
        for (EvaluationMember em : evaluationMembers) {
            MemberDetails member = evalComposeService.getOneMemberDetailWithInstitution(em.getMemNo());
            MemberEvalRequest memberRequest = new MemberEvalRequest(member, em);
            membersDetails.add(memberRequest);
        }

        return ResponseEntity.ok(membersDetails);
    }

    @PostMapping("/update/evalMember/{memberId}/{notiContentNo}")
    public ResponseEntity<?> setEvaluationMemberByNotiContentNo(@RequestBody EvalMemberRequest evalMemberRequest, @PathVariable Long memberId, @PathVariable Long notiContentNo) {

        evalComposeService.setEvaluationMemberByNotiContentNo(memberId, notiContentNo, evalMemberRequest);

        return ResponseEntity.ok(HttpStatus.OK);
    }

    // 워크라운지 컨트롤러 이동
    @PostMapping("/update/noti/{notificationNo}")
    public ResponseEntity<?> setNotiByNotificationNo(@PathVariable Long notificationNo) {

        evalComposeService.setNotiByNotificationNo(notificationNo);

        return ResponseEntity.ok(HttpStatus.OK);
    }
}
