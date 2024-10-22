package com.yujigyeongseong.api.domain.rnd_plan.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
public class StageContent {

    private final Long rndPlanNo; // 연구개발계획서 번호

    private final Integer stageNo; // 단계

    private final String stgTgtContent; // 단계목표내용

    private final String rndContent; // 연구개발내용

}
