package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EvaluationPaperMapper {

    List<EvaluationPaperDTO> selectEvaluationPaperList(@Param("annNo") Integer annNo, @Param("subAnnNo") Integer subAnnNo, @Param("rndPlanNo") Integer rndPlanNo);

    List<EvaluationPaperQuestionDTO> selectContentList(@Param("formType") String formType, @Param("type") String type);

    public Question selectQuestionById(Long questionNo);

    public void insertQuestion(Question question);

    public int deleteQuestion(Long questionNo);

    public int updateQuestion(Question question);
}
