package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import lombok.*;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@ToString
public class SaveRndPlanBasicRequest {

    private Long rndPlanNo; // 연구개발계획서번호
    private String rndTaskNo; // 연구개발과제번호
    private Long subAnnNo; // 공모분야번호
    private Long memNo; // 등록자번호
    private String taskName; // 과제명
    private List<SaveRndFieldRequest> rndFields; // 연구분야
    private String planStatus = "작성중"; // 계획서 상태
    private Integer currStep = 1; // 현재 작성 단계

    public void assignRndPlanNo(Long rndPlanNo) {
        this.rndPlanNo = rndPlanNo;
    }

    public void assignRndTaskNo(Long rndPlanSeq) {
        int currentYear = LocalDate.now().getYear();
        String rndTaskNo = String.format("RS-%d-%02d", currentYear, rndPlanSeq); // RS-2024-01
        this.rndTaskNo = rndTaskNo;
    }

}
