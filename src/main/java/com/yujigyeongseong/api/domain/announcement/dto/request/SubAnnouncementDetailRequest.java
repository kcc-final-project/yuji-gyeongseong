package com.yujigyeongseong.api.domain.announcement.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SubAnnouncementDetailRequest {
    private Long subAnnNo;
    private String totalTitle;
    private String subAnnUniNo;
    private String subTitle;
    private String specInstitution;
    private String specInstitutionNo;
    private String techFieldName;
    private Double totalSubsidy;
    private Integer totalDevMonth;
    private String mgrName;
    private String mgrTel;
    private Integer planningYear;
    private String annType;
    private Double oneYearSubsidy;
    private Integer oneYearDevMonth;
    private Long annNo;
    private Long bucketNo;
}
