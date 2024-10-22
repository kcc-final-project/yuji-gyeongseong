package com.yujigyeongseong.api.domain.rnd_plan.controller;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasicData;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.UpdateRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.service.RndPlanService;
import com.yujigyeongseong.api.global.dto.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.OK;

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
    public ResponseEntity<?> saveRndPlanBasic(@RequestBody CreateRndPlanBasicRequest request) {
        Long rndPlanNo = rndPlanService.insertRndPlanBasic(request);
        return ApiResponse.success(CREATED, rndPlanNo);
    }

    @GetMapping("/basic/{rndPlanNo}")
    public ResponseEntity<?> getRndPlanBasic(@PathVariable Long rndPlanNo) {
        RndPlanBasicData rndPlanBasicData = rndPlanService.getBasicDataByRndPlanNo(rndPlanNo);
        return ApiResponse.success(OK, rndPlanBasicData);
    }

    @PatchMapping("/basic/{rndPlanNo}")
    public ResponseEntity<?> patchRndPlanBasic(@PathVariable Long rndPlanNo,
                                               @RequestBody UpdateRndPlanBasicRequest request) {
        rndPlanService.patchBasicInfo(rndPlanNo, request);
        return ApiResponse.success(OK);
    }

}
