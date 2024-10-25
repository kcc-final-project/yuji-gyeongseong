package com.yujigyeongseong.api.domain.rnd_plan.dto.response;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPeriod;
import com.yujigyeongseong.api.domain.rnd_plan.dto.StageContent;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.List;

@RequiredArgsConstructor
@Getter
@ToString
public class TaskSummaryResponse {

    private final String finalTgtContent; // 최종목표내용

    private final String rndContent; // 연구개발내용

    private final String perfContent; // 연구개발성과

    private List<RndPeriod> rndPeriods; // 연구개발단계

    private List<StageContent> stageContents; // 단계별 내용


    public void assignRndPeriods(List<RndPeriod> rndPeriods) {
        this.rndPeriods = rndPeriods;
    }

    public void assignStageContents(List<StageContent> stageContents) {
        this.stageContents = stageContents;
    }

}
