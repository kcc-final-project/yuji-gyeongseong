package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class techField {
    private final Long tech_field_no;
    private final String name;
    private final String code;
    private final Long parent_tech_field_no;
}
