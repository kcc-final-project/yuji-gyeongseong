package com.yujigyeongseong.api.domain.member.DTO;

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

