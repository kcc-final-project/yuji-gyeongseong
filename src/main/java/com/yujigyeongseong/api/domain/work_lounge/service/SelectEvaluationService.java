package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectNotiDTO;

import java.util.List;

public interface SelectEvaluationService {
    public List<SelectNotiDTO> getSelectEvaluationList(int memNo);

    public List<SelectEvaluationDTO> getselectEvaluation(Long subAnnNo);

    public List<SelectEvaluationDTO> getselectCommittee(String rndTaskNo);
}
