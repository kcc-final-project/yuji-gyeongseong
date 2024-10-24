package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class EvalCommittee {
    private final Long evalCommitteeNo;
    private final String name;
    private final Integer peopleCount;
    private final Timestamp evalStartedAt;
    private final Timestamp evalClosedAt;
    private final String progStatus;
    private final Timestamp createdAt;
    private final Timestamp updatedAt;
    private final Long subAnnNo;
}
