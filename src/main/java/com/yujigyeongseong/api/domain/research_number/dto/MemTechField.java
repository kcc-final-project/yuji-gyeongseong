package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class MemTechField {
    private final Long memNo;
    private final Long techFieldNo;
    private final Timestamp createdAt;
    private final Timestamp updatedAt;
}
