package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.SplittableRandom;

public interface EvaluationPaperService {

    public List<EvaluationPaperDTO> getEvaluationPapers(int rndPlanNo);

    public List<EvaluationPaperQuestionDTO> getContentLists(String formType, String type);

    public void insertScoreList(EvaluationScoreDTO  evaluationScoreDTO);


    public void register(Question question);

    public boolean modify(Question question);

    public boolean remove(Long questionNo);

}
