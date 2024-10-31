package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationPaperDTO {
    private String totalTitle;
    private String rndTaskNo;
    private int rndPlanNo;
    private String taskName;
    private String rndInstitution;
    private String evalCompletedAt;

    public void setEvalCompletedAt(Timestamp evalCompletedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.evalCompletedAt = evalCompletedAt != null ? formatter.format(evalCompletedAt) : null;
    }

    private String name;
    private String rndMem;
    private String etMem;
    private String etname;
    private String affilType;
    private String affilDept;
    private String position;
    private String type;
    private String formType;

}
