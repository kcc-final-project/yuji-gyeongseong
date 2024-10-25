package com.yujigyeongseong.api.domain.research_number.dto.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class MemberDetails {
    private final Long memNo;
    private final Long rsrchNo;
    private final String name;
    private final String institutionName;
    private final String iarType;
}
