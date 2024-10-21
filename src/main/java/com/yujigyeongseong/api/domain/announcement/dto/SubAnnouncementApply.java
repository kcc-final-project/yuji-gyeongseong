package com.yujigyeongseong.api.domain.announcement.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SubAnnouncementApply {
    private Long annNo;
    private String totalTitle;
    private int bucketNo;
    private String annType;
    private List<SubAnnouncement> subAnnouncements;
}
