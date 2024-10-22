package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasicData;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.UpdateRndPlanBasicRequest;

public interface RndPlanService {

    // TODO: 테스트 용 기능이니 나중에 지우기
    RndPlan getMemberById(Long id);

    RndPlanBasic getBasicInfoBySubAnnNo(final Long subAnnNo);

    Long insertRndPlanBasic(final CreateRndPlanBasicRequest request);

    RndPlanBasicData getBasicDataByRndPlanNo(final Long rndPlanNo);

    void patchBasicInfo(final Long rndPlanNo, final UpdateRndPlanBasicRequest request);

}
