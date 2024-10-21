package com.yujigyeongseong.api.domain.announcement.dto;

import lombok.*;

import java.sql.Clob;
import java.sql.SQLException;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Announcement{
    private Long annNo;
    private String totalAnnNo;
    private String totalTitle;
    private Clob content;
    private String competentMinistry;
    private String specInstitution;
    private String annTechFieldName;
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
