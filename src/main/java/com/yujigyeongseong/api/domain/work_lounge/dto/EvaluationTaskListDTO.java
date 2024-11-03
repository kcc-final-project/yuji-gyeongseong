package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationTaskListDTO {
    private String evalCommitteeNo;
    private String name;
    private String subTitle;
    private String evalStartedAt;
    private String evalClosedAt;
    private int memNo;

    public void setEvalStartedAt(Timestamp evalStartedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.evalStartedAt = evalStartedAt != null ? formatter.format(evalStartedAt) : null;
    }

    public void setEvalClosedAt(Timestamp evalClosedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.evalClosedAt = evalClosedAt != null ? formatter.format(evalClosedAt) : null;
    }

    private String evalStatus;

}
