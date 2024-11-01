package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.EvaluationPaperMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationPaperServiceImpl implements EvaluationPaperService {

    @Autowired
    private EvaluationPaperMapper evaluationPaperMapper;

    @Override
    public List<EvaluationPaperDTO> getEvaluationPapers(int rndPlanNo) {
        return evaluationPaperMapper.selectEvaluationPaperList(rndPlanNo);
    }

    @Override
    public List<EvaluationPaperQuestionDTO> getContentLists(String formType, String type) {
        return evaluationPaperMapper.selectContentList(formType, type);
    }

    /*점수 저장 */
    @Override
    public void insertScoreList(EvaluationScoreDTO evaluationScoreDTO) {
        evaluationScoreDTO.setEvalCommitteeNo(1);
        evaluationScoreDTO.setRndPlanNo(3);
        evaluationScoreDTO.setMemNo(1);
        evaluationScoreDTO.setEvaluationTableNo(1);
        evaluationPaperMapper.insertScoreList(evaluationScoreDTO);
    }






    @Override
    public void register(Question question) {
        evaluationPaperMapper.insertQuestion(question);
    }

    @Override
    public boolean modify(Question question) {
        return evaluationPaperMapper.updateQuestion(question) == 1;
    }

    @Override
    public boolean remove(Long questionNo) {
        return evaluationPaperMapper.deleteQuestion(questionNo) == 1;
    }
}
