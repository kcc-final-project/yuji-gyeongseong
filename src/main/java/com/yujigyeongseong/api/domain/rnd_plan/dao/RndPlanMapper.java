package com.yujigyeongseong.api.domain.rnd_plan.dao;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndFieldRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndPlanBasicRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface RndPlanMapper {

    // TODO: 테스트 용 기능이니 나중에 지우기
    Optional<RndPlan> selectRndPlanById(Long id);

    Optional<RndPlanBasic> selectRndPlanBasicBySubAnnNo(Long subAnnNo);

    Long selectRndPlanSequence();

    int insertRndPlanBasic(CreateRndPlanBasicRequest request);

    int insertRndFields(@Param("rndFields") List<CreateRndFieldRequest> rndFields);

    String selectTaskNameByRndPlanNo(Long rndPlanNo);

    List<RndField> selectRndFieldsByRndPlanNo(Long rndPlanNo);

    int deleteRndFieldsByRndPlanNo(Long rndPlanNo);

    int updateTaskNameByRndPlanNo(@Param("rndPlanNo") Long rndPlanNo, @Param("taskName") String taskName);

}