package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.EvaluationTableMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTableDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.FormDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.PaperDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
