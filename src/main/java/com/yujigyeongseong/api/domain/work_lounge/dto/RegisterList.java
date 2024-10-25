package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class RegisterList {
    private int annNo;
    private String totalAnnNo;
    private String totalTitle;
    private String content;
    private String competentMinistry;
    private String specInstitution;
    private String annType;
    private int subAnnCount;
    private String receptionType;
    private String status;
    private String startedAt;
    private String closedAt;
    private String createdAt;
    private String updatedAt;
    private int bucketNo;
}
