package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SelectEvaluationDTO {
    private Long subAnnNo;
    private String evalStatus;
    private String subTitle;
    private String startDate;

    public void setStartDate(Timestamp startDate) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.startDate = startDate != null ? formatter.format(startDate) : null;
    }

    private String finalSelectedAt;

    public void setFinalSelectedAt(Timestamp finalSelectedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.finalSelectedAt = finalSelectedAt != null ? formatter.format(finalSelectedAt) : null;
    }

    private int rndPlanNo;
    private String rndTaskNo;
    private String taskName;
    private String rndInstitution;
    private String roundName;
    private int totalScore;
    private String planStatus;
    private String committeeName;
    private String selCompletedAt;

    public void setSelCompletedAt(Timestamp selCompletedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.selCompletedAt = selCompletedAt != null ? formatter.format(selCompletedAt) : null;
    }

    private String coName;
    private String insName;
    private String corsName;
    private int score;

}
