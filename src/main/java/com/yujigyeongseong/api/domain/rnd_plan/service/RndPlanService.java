package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.rnd_plan.dto.BasicInfo;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.*;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.MemberResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.RndPlanResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.BasicInfoResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.TaskSummaryResponse;

import java.util.List;

public interface RndPlanService {

    // 기본정보 페이지 조회 API
    BasicInfo getBasicInfoPageBySubAnnNo(final Long subAnnNo);

    // 과제정보 데이터 조회 API
    RndPlanResponse getRndPlanDataBySubAnnNo(final Long subAnnNo);

    // 기본정보 데이터 등록 API
    Long registerBasicInfo(final CreateBasicInfoRequest request);

    // 기본정보 데이터 조회 API
    BasicInfoResponse getBasicInfoDataByRndPlanNo(final Long rndPlanNo);

    // 기본정보 데이터 수정 API
    void updateBasicInfo(final Long rndPlanNo, final UpdateBasicInfoRequest request);

    // 과제요약 데이터 등록 API
    int registerTaskSummary(final CreateTaskSummaryRequest request);

    // 과제요약 데이터 조회 API
    TaskSummaryResponse getTaskSummaryDataByRndPlanNo(final Long rndPlanNo);

    // 연구원 추가용 전체 멤버 조회 API
    List<MemberResponse> getAllMember();

    // 연구기관 데이터 등록 API
    int registerRsrchInstitution(CreateRsrchInstitutionRequest  request);

    // 연구개발비 데이터 등록 API
    int registerRndExpenses(CreateRndExpensesRequest request);

}
