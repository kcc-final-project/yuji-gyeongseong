package com.yujigyeongseong.api.domain.member.DTO.request;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class SelectInstitutionRequest {
    private final String name;
    private final String businessRegisterNo;
    private final String companyType;


}
