package com.yujigyeongseong.api.domain.research_number.dto;
import lombok.*;

@RequiredArgsConstructor
@Getter

public class SubAnnouncement {
    private final Long subAnnNo;
    private final String subAnnUniNo;
    private final String subTitle;
    private final String planType;
    private final String taskType;
    private final String specInstitutionNo;
    private final String techFieldName;
    private final String mgrName;
    private final String mgrTel;
    private final Integer planningYear;
    private final Double totalSubsidy;
    private final Integer totalDevMonth;
    private final Double oneYearSubsidy;
    private final Integer oneYearDevMonth;
    private final String perfOwner;
    private final String annNo;
    private final String bucketNo;
}
