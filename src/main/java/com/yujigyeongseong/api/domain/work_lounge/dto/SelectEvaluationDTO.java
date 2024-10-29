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
    private String totalTitle;
    private String subTitle;
    private String closedAt;
    private String finalSelectedAt;

    public void setClosedAt(Timestamp closedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.closedAt = closedAt != null ? formatter.format(closedAt) : null;
    }

    public void setFinalSelectedAt(Timestamp finalSelectedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.finalSelectedAt = finalSelectedAt != null ? formatter.format(finalSelectedAt) : null;
    }

    private String evalStatus;
    private String rndTaskNo;
    private String taskName;
    private String rndInstitution;
    private String rndName;
    private String totalScore;
    private String planStatus;
    private String name;
    private String selCompletedAt;
    private String start;
    private Integer subAnnNo;

    public void setSelCompletedAt(Timestamp selCompletedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.selCompletedAt = selCompletedAt != null ? formatter.format(selCompletedAt) : null;
    }
    public void setStart(Timestamp start) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.start = start != null ? formatter.format(start) : null;
    }

    private String coName;
    private String insName;
    private String corsName;
    private Integer score;

}
