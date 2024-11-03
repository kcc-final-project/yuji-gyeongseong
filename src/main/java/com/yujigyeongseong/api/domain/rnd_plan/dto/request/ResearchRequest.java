package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Map;

@NoArgsConstructor
@Data
@ToString
public class ResearchRequest {

    private Long id;

    private String manpowerRole;

    private String name;

    private String partType;

    private Map<String, ResearchJoinPeriodRequest> participationData;

    private String position;

    private Long rsrchNo;
}
