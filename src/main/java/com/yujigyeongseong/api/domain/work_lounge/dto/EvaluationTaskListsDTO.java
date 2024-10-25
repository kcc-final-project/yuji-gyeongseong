package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationTaskListsDTO {
    private String taskName;
    private String rndInstitution;
    private String name;
    private String evalCompletedAt;

    public void setEvalCompletedAt(Timestamp evalCompletedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.evalCompletedAt = evalCompletedAt != null ? formatter.format(evalCompletedAt) : null;
    }

    private String evalStatus;
}
