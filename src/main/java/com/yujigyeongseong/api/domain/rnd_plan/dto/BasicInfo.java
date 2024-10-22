package com.yujigyeongseong.api.domain.rnd_plan.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@ToString
public class BasicInfo {

    private final String totalTitle; // 통합공고명 (공고)

    private final String annType; // 공모유형 (공고)

    private final String receptionType; // 접수유형 (공고)

    private final String subTitle; // 공모분야명 (공모분야)

    private final String taskType;// 과제구분 (공모분야)

    private final Integer planningYear; // 시행연도 (공모분야)

    private final String techFieldName; // 기술분야 (공모분야)

    private final String perfOwner; // 성과물 소유주체 (공모분야)

}
