package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@NoArgsConstructor
@Getter
@ToString
public class UpdateBasicInfoRequest {

    private Long rndPlanNo; // 연구개발계획서 번호

    private Long subAnnNo; // 공모분야 번호

    private Long memNo; // 등록자 번호

    private String taskName; // 과제명

    private List<RndField> rndFields; // 연구분야 목록


    public void assignRndPlanNo(Long rndPlanNo) {
        this.rndPlanNo = rndPlanNo;
    }

}
