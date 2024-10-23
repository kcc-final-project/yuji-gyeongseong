package com.yujigyeongseong.api.domain.rnd_plan.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@RequiredArgsConstructor
@Getter
@ToString
public class RndPeriod {

    private final Long rndPlanNo; // 연구개발계획서 번호

    private final Integer stageNo; // 단계

    private final Integer yearNo; // 연차

    private final LocalDate startedAt; // 연구개발시작일

    private final LocalDate endedAt; // 연구개발종료일

    private final Integer mxnth; // 개월

}
