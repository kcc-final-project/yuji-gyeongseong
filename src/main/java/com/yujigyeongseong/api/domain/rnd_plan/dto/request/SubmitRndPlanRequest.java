package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Builder
@AllArgsConstructor
@Getter
public class SubmitRndPlanRequest {
    // Test Request
    private String taskName;

}
