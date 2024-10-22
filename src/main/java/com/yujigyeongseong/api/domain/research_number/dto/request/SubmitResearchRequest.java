package com.yujigyeongseong.api.domain.research_number.dto.request;

import com.yujigyeongseong.api.domain.research_number.dto.TechField;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@Builder
@AllArgsConstructor
@Getter
public class SubmitResearchRequest {
    private List<AcadRequest> academicInfos;
    private List<CareerRequest> careerInfos;
    private List<TechField> technicalInfos;
}
