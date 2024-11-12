package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class EvaluationFormRequest {
    private String title;
    private String description;
    private String formType;
    private Long techFieldNo;
    private List<Question> questions;

    public EvaluationFormRequest(String title, String description, String formType, Long techFieldNo) {
        this.title = title;
        this.description = description;
        this.formType = formType;
        this.techFieldNo = techFieldNo;
    }
}
