package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EvaluationTableMapper {
    public List<EvaluationTableDTO> announceList();

    public List<FormDTO> subannounceList(String subTitle);

    public List<PaperDTO> paperList(String name, String formType);

    public List<PaperDTO> questionList(String name);


    //    질문지 저장
    // EVALUATION_TABLE에 데이터 삽입
    void insertEvaluationTable(EvaluationTable evaluationTable);

    // QUESTION 테이블에 여러 질문 삽입
    void insertQuestions(List<Question> questions);

    // EVALUATION_QUESTION 테이블에 EVALUATION_TABLE과 QUESTION 연결
    void insertEvaluationQuestions(Map<String, Object> params);

}
