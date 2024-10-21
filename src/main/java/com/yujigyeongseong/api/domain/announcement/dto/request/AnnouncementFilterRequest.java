package com.yujigyeongseong.api.domain.announcement.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AnnouncementFilterRequest {
    private String keyword;
    private String date;
    private String activeText;
    private String latest;
    private List<String> checkedSogan;
    private List<String> checkedJunmun;
    private List<String> checkedGisul;
}
