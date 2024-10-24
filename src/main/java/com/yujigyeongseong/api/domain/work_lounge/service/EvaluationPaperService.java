package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.Question;

import java.util.List;
import java.util.Map;
import java.util.SplittableRandom;

public interface EvaluationPaperService {

    public List<EvaluationPaperDTO> getEvaluationPapers(Integer rndPlanNo, Integer memNo);

    public List<EvaluationPaperQuestionDTO> getContentLists(String formType, String type);

    public void register(Question question);

    public boolean modify(Question question);

    public boolean remove(Long questionNo);

}
