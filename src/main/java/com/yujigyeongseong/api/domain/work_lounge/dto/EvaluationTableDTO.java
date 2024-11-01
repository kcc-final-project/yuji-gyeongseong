package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Data
@NoArgsConstructor
public class EvaluationTableDTO {
    private String totalTitle;
    private String status;
    private String startedAt;
    private String closedAt;
    private List<SubTitleDTO> subTitles;

    public void setStartedAt(Timestamp startedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.startedAt = startedAt != null ? formatter.format(startedAt) : null;
    }

    public void setClosedAt(Timestamp closedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.closedAt = closedAt != null ? formatter.format(closedAt) : null;
    }

    public EvaluationTableDTO(String totalTitle, String status, String startedAt, String closedAt) {
        this.totalTitle = totalTitle;
        this.status = status;
        this.startedAt = startedAt;
        this.closedAt = closedAt;
    }
}
