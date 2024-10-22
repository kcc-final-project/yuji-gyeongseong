package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@ToString
public class CreateBasicInfoRequest {

    private Long rndPlanNo; // 연구개발계획서 번호

    private String rndTaskNo; // 연구개발 과제번호

    private Long subAnnNo; // 공모분야 번호

    private Long memNo; // 등록자 번호

    private String taskName; // 과제명

    private List<RndField> rndFields; // 연구분야 목록

    private String planStatus = "작성중"; // 계획서 상태

    private Integer currStep = 1; // 현재 작성 단계


    public void assignRndPlanNo(final Long rndPlanNo) {
        this.rndPlanNo = rndPlanNo;
    }

    public void assignRndTaskNo(final Long rndPlanSeq) {
        int currentYear = LocalDate.now().getYear();
        String rndTaskNo = String.format("RS-%d-%02d", currentYear, rndPlanSeq); // RS-2024-01
        this.rndTaskNo = rndTaskNo;
    }

}
