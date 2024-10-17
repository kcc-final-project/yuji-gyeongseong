package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class TechField {
    private final Long techFieldNo;
    private final String name;
    private final String code;
    private final Long parentTechFieldNo;
}
