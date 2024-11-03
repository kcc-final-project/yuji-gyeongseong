package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectNotiDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SelectEvaluationMapper {
    public List<SelectNotiDTO> selectEvaluationList(int memNo);

    public List<SelectEvaluationDTO> selectEvaluation(Long subAnnNo);

    public List<SelectEvaluationDTO> selectCommittee(String rndTaskNo);
}
