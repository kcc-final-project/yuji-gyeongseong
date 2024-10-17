package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class AcadAbility {
    private final Long acadAbilityNo;
    private final String abilityType;
    private final String orgName;
    private final String acquiredCountry;
    private final String majorAffiliation;
    private final String majorField;
    private final String majorName;
    private final Timestamp acquiredAt;
    private final Timestamp createdAt;
    private final Timestamp updatedAt;
    private final Long memNo;
}
