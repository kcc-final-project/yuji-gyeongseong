package com.yujigyeongseong.api.domain.rnd_plan.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
public class RndPlan {

    private final Long subAnnNo; // 공모분야 번호

    private final String taskName; // 과제명

    private final String rndTaskNo; // 연구개발 과제번호

    private final String researcherName; // 연구책임자명

    private final String institutionName; // 연구개발기관

}
