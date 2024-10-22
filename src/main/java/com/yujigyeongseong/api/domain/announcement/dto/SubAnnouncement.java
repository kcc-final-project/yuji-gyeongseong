package com.yujigyeongseong.api.domain.announcement.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SubAnnouncement {
    private Long subAnnNo;
    private String subAnnUniNo;
    private String subTitle;
    private String planType;
    private String taskType;
    private String specInstitutionNo;
    private String techFieldName;
    private String mgrName;
    private String mgrTel;
    private Integer planningYear;
    private Double totalSubsidy;
    private Integer totalDevMonth;
    private Double oneYearSubsidy;
    private Integer oneYearDevMonth;
    private String perfOwner;
    private String annNo;
    private String bucketNo;
}
