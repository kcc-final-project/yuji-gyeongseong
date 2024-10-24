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
}
