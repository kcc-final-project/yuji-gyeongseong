package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dao.EvalCommitteeMapper;
import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EvalCommitteeServiceImpl implements EvalCommitteeService {

    private final EvalCommitteeMapper evalCommitteeMapper;

    @Override
    public List<Career> getAllCareersByMemberId(Long id) {
        return evalCommitteeMapper.selectAllCareersByMemberId(id);
    }

    @Override
    public List<AcadAbility> getAllAcadAbilitiesByMemberId(Long id) {
        return evalCommitteeMapper.selectAllAcadAbilitiesByMemberId(id);
    }

    @Override
    public List<String> getAllTechFieldNameByMemberId(Long id) {
        return evalCommitteeMapper.selectAllTechFieldNameByMemberId(id);
    }
}
