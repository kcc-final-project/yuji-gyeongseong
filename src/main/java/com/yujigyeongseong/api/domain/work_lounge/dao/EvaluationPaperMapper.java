package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EvaluationPaperMapper {

    List<EvaluationPaperDTO> selectEvaluationPaperList(@Param("rndPlanNo") Integer rndPlanNo);

    List<EvaluationPaperQuestionDTO> selectContentList(@Param("formType") String formType, @Param("type") String type);

    public void insertScoreList(EvaluationScoreDTO evaluationScoreDTO);




    public Question selectQuestionById(Long questionNo);

    public void insertQuestion(Question question);

    public int deleteQuestion(Long questionNo);

    public int updateQuestion(Question question);
}
