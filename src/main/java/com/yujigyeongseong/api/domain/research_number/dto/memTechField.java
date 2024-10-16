package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class memTechField {
    private final Long mem_no;
    private final Long tech_field_no;
    private final Timestamp created_at;
    private final Timestamp updated_at;
}
