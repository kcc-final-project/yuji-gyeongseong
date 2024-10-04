package com.yujigyeongseong.api.domain.rnd_plan.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class RndPlan {

    private final Long rndPlanNo;
    private final String taskName;

}
