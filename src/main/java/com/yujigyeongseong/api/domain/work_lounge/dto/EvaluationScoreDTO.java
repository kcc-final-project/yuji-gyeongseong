package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EvaluationScoreDTO {
    private int evalScoreNo;
    private int score;
    private int evalCommitteeNo;
    private int rndPlanNo;
    private int memNo;
    private int evaluationTableNo;
}
