package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;

import java.util.List;

public interface SelectEvaluationService {
    public List<SelectEvaluationDTO> getSelectEvaluationList();
}
