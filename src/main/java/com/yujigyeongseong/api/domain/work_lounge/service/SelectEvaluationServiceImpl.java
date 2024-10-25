package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.SelectEvaluationMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class SelectEvaluationServiceImpl implements SelectEvaluationService {

    @Autowired
    private SelectEvaluationMapper selectEvaluationMapper;

    @Override
    public List<SelectEvaluationDTO> getSelectEvaluationList() {
        return selectEvaluationMapper.selectEvaluationList();
    }
}
