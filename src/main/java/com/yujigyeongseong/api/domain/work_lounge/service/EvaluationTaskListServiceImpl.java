package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.EvaluationTaskListMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListsDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class EvaluationTaskListServiceImpl implements EvaluationTaskListService {

    @Autowired
    private EvaluationTaskListMapper evaluationTaskListMapper;

    @Override
    public List<EvaluationTaskListDTO> getEvaluationCommitteeList(int memNo) {
        return evaluationTaskListMapper.selectEvaluationCommitteeList(memNo);
    }

    @Override
    public List<EvaluationTaskListsDTO> getEvaluationTaskList(String name, int memNo) {
        return evaluationTaskListMapper.selectEvaluationTaskList(name, memNo);
    }
}
