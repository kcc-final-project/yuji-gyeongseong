package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Opinion {
    private int opinionNo;
    private int memNo;
    private String content;
    private String createdAt;

    public void setCreatedAt(Timestamp createdAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        this.createdAt = createdAt != null ? formatter.format(createdAt) : null;
    }

    private int readhit;
    private int ref;
    private int step;
    private int depth;
    private int delInfo;
    private Timestamp deletedAt;
    private int evalCommitteeNo;
    private int rndPlanNo;
    private int bucketNo;
}
