package com.yujigyeongseong.api.domain.research_number.dto.request;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Data
@ToString
public class EvalPercentRequest {
    private Integer researchInstituteRate;
    private Integer educationInstituteRate;
    private Integer professionalInstituteRate;
}
