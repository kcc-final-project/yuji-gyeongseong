package com.yujigyeongseong.api.domain.rnd_plan.dto.request;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPeriod;
import com.yujigyeongseong.api.domain.rnd_plan.dto.StageContent;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@NoArgsConstructor
@Getter
@ToString
public class CreateTaskSummaryRequest {

    private Long rndPlanNo;

    private String finalTgtContent;

    private String perfContent;

    private String rndContent;

    private List<RndPeriod> rndPeriods;

    private List<StageContent> stageContents;

}
