package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import lombok.*;

@NoArgsConstructor
@Getter
@ToString
public class RndField {

    private Long rndPlanNo;
    private String name;
    private Integer weight;
    private Integer rank;

    public void assignRndPlanNo(Long rndPlanNo) {
        this.rndPlanNo = rndPlanNo;
    }
    
}
