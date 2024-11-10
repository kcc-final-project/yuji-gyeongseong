package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectNotiDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.UpdatePlanStatusDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SelectEvaluationMapper {
    public List<SelectNotiDTO> selectEvaluationList(int memNo);

    public List<SelectEvaluationDTO> selectEvaluation(Long subAnnNo);

    public List<SelectEvaluationDTO> selectCommittee(String rndTaskNo);

    int updatePlanStatus(@Param("rndPlanNo") int rndPlanNo, @Param("planStatus") String planStatus);

    public int updateProgStatus(Long subAnnNo);



    // 여러개선정용
//    int updatePlanStatus(List<Integer> rndPlanNoList);
//    void updatePlanStatusBatch(List<UpdatePlanStatusDto> requestDtos);
//    void updatePlanStatus(Map<String, Object> params);


}
