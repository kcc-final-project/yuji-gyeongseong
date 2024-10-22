package com.yujigyeongseong.api.domain.tech_field.service;

import com.yujigyeongseong.api.domain.tech_field.dto.TechFieldForRndPlanBasic;
import org.apache.ibatis.javassist.NotFoundException;

import java.util.List;

public interface TechFieldService {

    // 연구개발계획서(기본정보) 기술분야 전체 조회
    List<TechFieldForRndPlanBasic> getTechFieldsForRndPlanBasic() throws NotFoundException;

}
