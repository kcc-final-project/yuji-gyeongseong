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
    private Integer depth;
    private Timestamp createdAt;
    private Timestamp deletedAt;
    private Integer parentOpinionNo;
    private Integer evalCommitteeNo;
    private Integer rndPlanNo;
    private Integer memNo;
    private Integer BucketNo;
}
