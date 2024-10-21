package com.yujigyeongseong.api.domain.rnd_plan.dao;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.RndField;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.SaveRndPlanBasicRequest;
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

    int insertRndPlanBasic(SaveRndPlanBasicRequest request);

    int insertRndFields(@Param("rndFields") List<RndField> rndFields);

}