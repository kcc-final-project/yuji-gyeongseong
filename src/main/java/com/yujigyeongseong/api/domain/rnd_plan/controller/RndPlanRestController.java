package com.yujigyeongseong.api.domain.rnd_plan.controller;

import com.yujigyeongseong.api.domain.rnd_plan.dto.response.RndPlanResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateTaskSummaryRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.BasicInfoResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.UpdateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.TaskSummaryResponse;
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

    // 과제정보 데이터 조회 API
    @GetMapping("/{rndPlanNo}")
    public ResponseEntity<?> getRndPlan(@PathVariable Long rndPlanNo) {
        RndPlanResponse rndPlanResponse = rndPlanService.getRndPlanDataBySubAnnNo(rndPlanNo);
        return ApiResponse.success(OK, rndPlanResponse);
    }

    // 기본정보 데이터 등록 API
    @PostMapping("/basic")
    public ResponseEntity<?> saveRndPlanBasic(@RequestBody final CreateBasicInfoRequest request) {
        Long rndPlanNo = rndPlanService.registerBasicInfo(request);
        return ApiResponse.success(CREATED, rndPlanNo);
    }

    // 기본정보 데이터 조회 API
    @GetMapping("/basic/{rndPlanNo}")
    public ResponseEntity<?> getRndPlanBasic(@PathVariable final Long rndPlanNo) {
        BasicInfoResponse basicInfoResponse = rndPlanService.getBasicInfoDataByRndPlanNo(rndPlanNo);
        return ApiResponse.success(OK, basicInfoResponse);
    }

    // 기본정보 데이터 수정 API
    @PatchMapping("/basic/{rndPlanNo}")
    public ResponseEntity<?> patchRndPlanBasic(@PathVariable final Long rndPlanNo,
                                               @RequestBody final UpdateBasicInfoRequest request) {
        rndPlanService.updateBasicInfo(rndPlanNo, request);
        return ApiResponse.success(OK);
    }

    // 과제요약 데이터 등록 API
    @PostMapping("/task-summary")
    public ResponseEntity<?> saveRndPlanTaskSummary(@RequestBody final CreateTaskSummaryRequest request) {
        int currStep = rndPlanService.registerTaskSummary(request);
        return ApiResponse.success(CREATED, currStep);
    }

    // 과제요약 데이터 조회 API
    @GetMapping("/task-summary/{rndPlanNo}")
    public ResponseEntity<?> getRndPlanTaskSummary(@PathVariable final Long rndPlanNo) {
        TaskSummaryResponse taskSummaryResponse = rndPlanService.getTaskSummaryDataByRndPlanNo(rndPlanNo);
        return ApiResponse.success(OK, taskSummaryResponse);
    }

}
