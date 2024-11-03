package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@NoArgsConstructor
@Data
@ToString
public class CreateRsrchInstitutionRequest {

    private Integer currentStep;

    private Long rndPlanNo;

    private List<ResearchRequest> rsrchMembersData;

}
