package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.EvaluationTableMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationTableListServiceImpl implements EvaluationTableListService {

    @Autowired
    private EvaluationTableMapper evaluationTableMapper;

    @Override
    public List<EvaluationTableDTO> getAnnounceList() {
        return evaluationTableMapper.announceList();
    }

    @Override
    public List<FormDTO> getSubannounceList(String subTitle) {
        return evaluationTableMapper.subannounceList(subTitle);
    }

    @Override
    public List<PaperDTO> getPaperList(String name, String formType) {
        System.out.println("name = " + name);
        System.out.println("formType = " + formType);
        System.out.println(evaluationTableMapper.paperList(name, formType));
        return evaluationTableMapper.paperList(name, formType);
    }

    @Override
    public  List<PaperDTO> getquestionList(String name) {
        return evaluationTableMapper.questionList(name);
    }

    //    질문지 저자용
    @Transactional
    public void createEvaluationForm(EvaluationTable evaluationTable, List<Question> questions) {
        // 1. EVALUATION_TABLE에 설문지 틀 추가
        evaluationTableMapper.insertEvaluationTable(evaluationTable);

        // 2. QUESTION 테이블에 질문 추가
        evaluationTableMapper.insertQuestions(questions);

        // 3. EVALUATION_QUESTION 테이블에 EVALUATION_TABLE과 QUESTION을 연결
        List<Long> questionNos = questions.stream()
                .map(Question::getQuestionNo)
                .collect(Collectors.toList());

        Map<String, Object> params = new HashMap<>();
        params.put("evaluationTableNo", evaluationTable.getEvaluationTableNo());
        params.put("questionNos", questionNos);

        evaluationTableMapper.insertEvaluationQuestions(params);
    }

}
