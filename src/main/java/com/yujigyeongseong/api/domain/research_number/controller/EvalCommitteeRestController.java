package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.EvalCommittee;
import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.request.*;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import com.yujigyeongseong.api.domain.research_number.service.EvalComposeService;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndExpensesRequest;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/api/v1/evaluation")
@RestController
@RequiredArgsConstructor
public class EvalCommitteeRestController {

    private static final Logger log = LoggerFactory.getLogger(EvalCommitteeRestController.class);
    private final EvalComposeService evalComposeService;

    @PostMapping("/register/eval-committee/{subAnnNo}")
    public ResponseEntity<?> setEvalCommitteesBySubAnnNo(@PathVariable Long subAnnNo , @RequestBody EvalPercentRequest request) {

        int rndPlanCnt = evalComposeService.getRndPlanCntById(subAnnNo);

        // 평가위원회 구성
        evalComposeService.setEvalCommitteesBySubAnnNo(subAnnNo, rndPlanCnt ,request);

        // 평가위원회 구성원 구성
        int evalCommitteeCnt = evalComposeService.getEvalCommitteeCntById(subAnnNo);

        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping("/committees/{subAnnNo}")
    public ResponseEntity<?> getEvalCommitteesBySubAnnNo(@PathVariable Long subAnnNo) {

        List<EvalCommittee> evalCommittee = evalComposeService.getAllEvalCommitteeById(subAnnNo);

        return ResponseEntity.ok(evalCommittee);
    }

/*    @GetMapping("/check-committee/{subAnnNo}")
    public ResponseEntity<?> getCheckEvalCommitteesBySubAnnNo(@PathVariable Long subAnnNo) {

        List<EvalCommittee> evalCommittee = evalComposeService.getAllEvalCommitteeById(subAnnNo);

        return ResponseEntity.ok(evalCommittee);
    }*/

}
