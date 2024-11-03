package com.yujigyeongseong.api.domain.rnd_plan.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class RndFee {
    private Long stageNo;

    private Long yearNo;

    private Long govermentFund;

    private Long rndCharge;

    private Long laborCost;

    private Long equipCost;

    private Long rndCost;

    private Long rsrchAllowance;

    private Long rndPlanNo;
}
