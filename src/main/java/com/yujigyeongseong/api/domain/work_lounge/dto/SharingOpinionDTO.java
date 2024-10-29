package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SharingOpinionDTO {
    private String evalStatus;
    private String taskName;
    private String rndInstitution;
    private String rndName;
    private String evalStartedAt;
    private String evalClosedAt;

    public void setEvalStartedAt(Timestamp evalStartedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.evalStartedAt = evalStartedAt != null ? formatter.format(evalStartedAt) : null;
    }

    public void setEvalClosedAt(Timestamp evalClosedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.evalClosedAt = evalClosedAt != null ? formatter.format(evalClosedAt) : null;
    }

    private Integer evalCommitteeNo;
    private String evMem;
    private String name;
}