package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SelectEvaluationMapper {
    public List<SelectEvaluationDTO> selectEvaluationList();
}
