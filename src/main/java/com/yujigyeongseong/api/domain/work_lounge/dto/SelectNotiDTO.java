package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Data
@NoArgsConstructor
public class SelectNotiDTO {
    private String totalTitle;
    private String evalStatus;
    private List<NotiDTO> notiTypes;

    public SelectNotiDTO(String totalTitle, String start, String evalStatus, String progStatus, String finalSelectedAt, String closedAt) {
        this.totalTitle = totalTitle;
        this.evalStatus = evalStatus;
    }
}