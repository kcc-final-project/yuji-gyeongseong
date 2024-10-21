package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.SaveRndPlanBasicRequest;

public interface RndPlanService {

    // TODO: 테스트 용 기능이니 나중에 지우기
    RndPlan getMemberById(Long id);

    RndPlanBasic getBasicInfoBySubAnnNo(final Long subAnnNo);

    boolean insertRndPlanBasic(final SaveRndPlanBasicRequest request);

}
