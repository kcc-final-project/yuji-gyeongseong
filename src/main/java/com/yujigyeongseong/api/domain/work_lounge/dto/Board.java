package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {
    private int opinionNo;
    private int memNo;
    private String memName;
    private String content;
    private String createdAt;

    public void setCreatedAt(Timestamp createdAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.createdAt = createdAt != null ? formatter.format(createdAt) : null;
    }

    private int readhit;
    private int ref;
    private int step;
    private int depth;
    private int delInfo;
    private String deletedAt;

    public void setDeletedAt(Timestamp deletedAt) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.deletedAt = deletedAt != null ? formatter.format(deletedAt) : null;
    }

    private Integer evalCommitteeNo;
    private Integer rndPlanNo;
    private Integer bucketNo;

}
