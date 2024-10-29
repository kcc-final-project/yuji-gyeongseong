package com.yujigyeongseong.api.domain.announcement.dto.request;

import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncement;
import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SubAnnouncementRequest {
    private Long annNo;
    private String totalAnnNo;
    private String totalTitle;
    private String content;
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
    private List<SubAnnouncement> subAnnouncements;
}
