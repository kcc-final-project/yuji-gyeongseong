package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class AcadAbility {
    private final Long acad_ability_no;
    private final String ability_type;
    private final String org_name;
    private final String acquired_country;
    private final String major_affiliation;
    private final String major_field;
    private final String major_name;
    private final Timestamp acquired_at;
    private final Timestamp created_at;
    private final Timestamp updated_at;
    private final Long mem_no;
}
