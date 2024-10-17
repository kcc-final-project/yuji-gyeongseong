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

public class CareerRequest {
    private String orgName;
    private String deptName;
    private String careerType;
    private Timestamp startedAt;
    private Timestamp endedAt;
}
