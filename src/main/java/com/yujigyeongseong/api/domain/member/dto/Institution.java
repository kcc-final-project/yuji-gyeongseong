package com.yujigyeongseong.api.domain.member.dto;

import lombok.*;

@Getter
@Setter
@RequiredArgsConstructor
public class Institution {
    private final Long institutionNo;
    private final String name;
    private final String businessRegisterNo;
    private final String address;
    private final String companyType;
    private final String iarType;
}
