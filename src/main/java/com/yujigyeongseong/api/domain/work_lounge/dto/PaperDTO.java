package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaperDTO {
    private Integer evaluationTableNo;
    private String title;
    private String description;
    private String formType;
    private String techFieldName;
    private Integer questionNo;
    private String type;
    private String content;

}
