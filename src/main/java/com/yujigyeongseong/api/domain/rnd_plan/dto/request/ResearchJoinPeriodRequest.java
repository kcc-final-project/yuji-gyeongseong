package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@NoArgsConstructor
@Data
@ToString
public class ResearchJoinPeriodRequest {

    @JsonProperty("endDate")
    private Timestamp endedAt;

    private String finalDegree;

    private String major;

    private String isParticipated;

    private Long stageNo;

    @JsonProperty("startDate")
    private Timestamp startedAt;

    @JsonProperty("year")
    private String acquireYear;

    private Long yearNo;

    private Long rsrchNo;
}
