package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@NoArgsConstructor
@Getter
@ToString
public class UpdateRndPlanBasicRequest {

    private Long rndPlanNo; // 연구개발계획서번호
    private Long subAnnNo; // 공모분야번호
    private Long memNo; // 등록자번호
    private String taskName; // 과제명
    private List<CreateRndFieldRequest> rndFields; // 연구분야

    public void assignRndPlanNo(Long rndPlanNo) {
        this.rndPlanNo = rndPlanNo;
    }

}
