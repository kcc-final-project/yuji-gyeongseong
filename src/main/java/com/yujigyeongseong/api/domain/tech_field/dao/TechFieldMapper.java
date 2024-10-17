package com.yujigyeongseong.api.domain.tech_field.dao;

import com.yujigyeongseong.api.domain.tech_field.dto.TechFieldForRndPlanBasic;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TechFieldMapper {

    List<TechFieldForRndPlanBasic> selectTechFieldsForRndPlanBasic();

}
