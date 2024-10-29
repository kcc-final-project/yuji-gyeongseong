package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListsDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SharingOpinionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SharingOpinionMapper {

    public List<SharingOpinionDTO> selectSharingOpinionList(String taskName);

    public List<SharingOpinionDTO> selectCommitteePersonList(String taskName);



}
