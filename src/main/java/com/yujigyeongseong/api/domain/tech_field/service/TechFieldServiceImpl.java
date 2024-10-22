package com.yujigyeongseong.api.domain.tech_field.service;

import com.yujigyeongseong.api.domain.tech_field.dao.TechFieldMapper;
import com.yujigyeongseong.api.domain.tech_field.dto.TechFieldForRndPlanBasic;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class TechFieldServiceImpl implements TechFieldService {

    private final TechFieldMapper techFieldMapper;

    @Override
    public List<TechFieldForRndPlanBasic> getTechFieldsForRndPlanBasic() throws NotFoundException {
        List<TechFieldForRndPlanBasic> techFields = techFieldMapper.selectTechFieldsForRndPlanBasic();
        return techFields;
    }

}
