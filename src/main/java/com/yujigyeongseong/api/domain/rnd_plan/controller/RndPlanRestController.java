package com.yujigyeongseong.api.domain.rnd_plan.controller;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.SaveRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.service.RndPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api/v1/rnd-plans")
@RestController
@RequiredArgsConstructor
public class RndPlanRestController {

    private final RndPlanService rndPlanService;

    // TODO: 테스트 용이라 나중에 삭제해야 함
    @GetMapping("/{id}")
    public ResponseEntity<RndPlan> getRndPlanById(@PathVariable Long id) {
        RndPlan member = rndPlanService.getMemberById(id);
        return ResponseEntity.ok(member);
    }

    @PostMapping("/basic")
    public ResponseEntity<?> saveRndPlanBasic(@RequestBody SaveRndPlanBasicRequest request) {
        rndPlanService.insertRndPlanBasic(request);
        return null;
    }

}
