package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListsDTO;

import java.util.List;

public interface EvaluationTaskListService {
    public List<EvaluationTaskListDTO> getEvaluationCommitteeList(int memNo);

    public List<EvaluationTaskListsDTO> getEvaluationTaskList(String name, int memNo);
}
