package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EvaluationTable {
    private Long evaluationTableNo;
    private String title;
    private String description;
    private String formType;
    private Long techFieldNo;

}
