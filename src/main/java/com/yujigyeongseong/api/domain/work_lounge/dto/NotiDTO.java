package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotiDTO {
    private int subAnnNo;
    private String subTitle;
    private String closedAt;

    public void setClosedAt(Timestamp closedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.closedAt = closedAt != null ? formatter.format(closedAt) : null;
    }

    private String finalSelectedAt;

    public void setFinalSelectedAt(Timestamp finalSelectedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.finalSelectedAt = finalSelectedAt != null ? formatter.format(finalSelectedAt) : null;
    }

    private String progStatus;
    private String status;
}
