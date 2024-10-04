package com.yujigyeongseong.api.domain.rnd_plan.dao;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface RndPlanMapper {

    Optional<RndPlan> selectRndPlanById(Long id);

}
