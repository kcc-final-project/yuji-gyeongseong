package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectNotiDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.UpdatePlanStatusDto;

import java.util.List;
import java.util.Map;

public interface SelectEvaluationService {
    public List<SelectNotiDTO> getSelectEvaluationList(int memNo);

    public List<SelectEvaluationDTO> getselectEvaluation(Long subAnnNo);

    public List<SelectEvaluationDTO> getselectCommittee(String rndTaskNo);

    public int updatePlanStatus(int rndPlanNo, String planStatus);

    public int updateProgStatus(Long subAnnNo);



    //    public void updatePlanStatus(List<Integer> rndPlanNoList);
//    public void updatePlanStatusBatch(List<UpdatePlanStatusDto> requestDtos);
//    public void updatePlanStatus(Map<String, Object> params);
}
