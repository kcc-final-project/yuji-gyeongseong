package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class Career {
    private final Long career_no;
    private final String org_name;
    private final String dept_name;
    private final String career_type;
    private final Timestamp started_at;
    private final Timestamp ended_at;
    private final Timestamp created_at;
    private final Timestamp updated_at;
    private final Long mem_no;
}
