package com.yujigyeongseong.api.domain.rnd_plan.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
public class RndField {

    private Long rndPlanNo; // 연구개발계획서 번호

    private final String name; // 기술분류명

    private final Integer weight; // 가중치

    private final Integer rank; // 순위


    public void assignRndPlanNo(final Long rndPlanNo) {
        this.rndPlanNo = rndPlanNo;
    }

}
