package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterListDTO {
    private String totalTitle;
    private String subTitle;
    private String annType;
    private String startedAt;
    private String closedAt;

    public void setStartedAt(Timestamp startedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.startedAt = startedAt != null ? formatter.format(startedAt) : null;
    }

    public void setClosedAt(Timestamp closedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.closedAt = closedAt != null ? formatter.format(closedAt) : null;
    }

    private String status;
    private String submittedAt;

    public void setSubmittedAt(Timestamp submittedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.submittedAt = submittedAt != null ? formatter.format(submittedAt) : null;
    }

    private String planStatus;
    private Integer rndPlanNo;
}
