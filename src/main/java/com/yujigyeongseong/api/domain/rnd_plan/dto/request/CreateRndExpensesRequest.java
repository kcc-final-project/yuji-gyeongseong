package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndFee;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@NoArgsConstructor
@Data
@ToString
public class CreateRndExpensesRequest {
    private Integer currentStep;

    private Long rndPlanNo;

    private List<RndFee> rndExpensesData;
}
