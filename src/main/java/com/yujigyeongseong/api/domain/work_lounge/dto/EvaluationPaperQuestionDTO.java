package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationPaperQuestionDTO {
    private String title;
    private String description;
    private String formType;
    private String questionNo;
    private String type;
    private String content;
}
