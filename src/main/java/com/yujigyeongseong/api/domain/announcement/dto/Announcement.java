package com.yujigyeongseong.api.domain.announcement.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Announcement{
    private int annNo;
    private String totalAnnNo;
    private String totalTitle;
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
