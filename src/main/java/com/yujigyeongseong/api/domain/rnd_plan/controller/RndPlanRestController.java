package com.yujigyeongseong.api.domain.rnd_plan.controller;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.service.RndPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/v1/rnd-plan")
@RestController
@RequiredArgsConstructor
public class RndPlanRestController {

    private final RndPlanService rndPlanService;

    @GetMapping("/{id}")
    public ResponseEntity<RndPlan> getRndPlanById(@PathVariable Long id) {
        RndPlan member = rndPlanService.getMemberById(id);
        return ResponseEntity.ok(member);
    }

}
