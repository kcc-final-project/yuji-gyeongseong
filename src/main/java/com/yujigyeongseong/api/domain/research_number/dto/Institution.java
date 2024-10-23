package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class Institution {
    private final Long institutionNo;
    private final String name;
    private final String businessRegisterNo;
    private final String address;
    private final String companyType;
    private final String iarType;
}
