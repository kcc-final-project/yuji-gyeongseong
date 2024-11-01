package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.SelectEvaluationMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectNotiDTO;
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
    public List<SelectNotiDTO> getSelectEvaluationList() {
        return selectEvaluationMapper.selectEvaluationList();
    }

    @Override
    public List<SelectEvaluationDTO> getselectEvaluation(Long subAnnNo) {
        System.out.println(subAnnNo);
        System.out.println(selectEvaluationMapper.selectEvaluation(subAnnNo));
        return selectEvaluationMapper.selectEvaluation(subAnnNo);
    }

    @Override
    public List<SelectEvaluationDTO> getselectCommittee(String rndTaskNo) {
        System.out.println(rndTaskNo);
        return selectEvaluationMapper.selectCommittee(rndTaskNo);
    }

}
