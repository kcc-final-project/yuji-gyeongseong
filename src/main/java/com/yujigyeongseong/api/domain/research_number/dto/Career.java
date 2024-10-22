package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class Career {
    private final Long careerNo;
    private final String orgName;
    private final String deptName;
    private final String careerType;
    private final Timestamp startedAt;
    private final Timestamp endedAt;
    private final Timestamp createdAt;
    private final Timestamp updatedAt;
    private final Long memNo;
}
