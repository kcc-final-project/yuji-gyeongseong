package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubTitleDTO {
    private Integer subAnnNo; // 서브 타이틀의 고유 식별자
    private String subTitle; // 서브 타이틀의 텍스트
}