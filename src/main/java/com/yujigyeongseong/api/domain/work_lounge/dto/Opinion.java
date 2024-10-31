package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Opinion {
    private Integer opinionNo;
    private Integer memNo;
    private String content;
    private Timestamp createdAt;
    private Integer readhit;
    private Integer ref;
    private Integer step;
    private Integer depth;
    private Integer delInfo;
    private Timestamp deletedAt;
    private Integer evalCommitteeNo;
    private Integer rndPlanNo;
    private Integer bucketNo;
}
