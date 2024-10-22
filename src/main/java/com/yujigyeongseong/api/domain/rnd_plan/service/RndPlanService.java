package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dto.BasicInfo;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.BasicInfoResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.UpdateBasicInfoRequest;

public interface RndPlanService {

    // 기본정보 페이지 조회 API
    BasicInfo getBasicInfoPageBySubAnnNo(final Long subAnnNo);

    // 기본정보 데이터 등록 API
    Long registerBasicInfo(final CreateBasicInfoRequest request);

    // 기본정보 데이터 조회 API
    BasicInfoResponse getBasicInfoDataByRndPlanNo(final Long rndPlanNo);

    // 기본정보 데이터 수정 API
    void updateBasicInfo(final Long rndPlanNo, final UpdateBasicInfoRequest request);

}
