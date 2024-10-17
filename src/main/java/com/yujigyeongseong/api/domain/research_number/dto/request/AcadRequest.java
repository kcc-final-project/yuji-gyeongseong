package com.yujigyeongseong.api.domain.research_number.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class AcadRequest {
    private String abilityType;
    private String orgName;
    private String acquiredCountry;
    private String majorAffiliation;
    private String majorField;
    private String majorName;
    private Timestamp acquiredAt;
}
