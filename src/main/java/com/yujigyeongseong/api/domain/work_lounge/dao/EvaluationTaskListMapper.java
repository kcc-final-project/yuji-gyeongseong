package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListsDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EvaluationTaskListMapper {
    public List<EvaluationTaskListDTO> selectEvaluationCommitteeList();

    public List<EvaluationTaskListsDTO> selectEvaluationTaskList(String name);

}
