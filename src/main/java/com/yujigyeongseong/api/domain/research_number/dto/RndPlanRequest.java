package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class RndPlanRequest {
    private final Long rndPlanNo;
    private final String rndTaskNo;
    private final String taskName;
    private final String rndInstitution;
    private final Integer currStep;
    private final String planStatus;
    private final String finalTgtContent;
    private final String rndContent;
    private final String perfContent;
    private final Timestamp submittedAt;
    private final Timestamp createdAt;
    private final Timestamp updatedAt;
    private final Long subAnnNo;
    private final Long memNo;
    private final Long bucketNo;
}
