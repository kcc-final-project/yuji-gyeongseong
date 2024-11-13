package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.SelectEvaluationMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectNotiDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.UpdatePlanStatusDto;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class SelectEvaluationServiceImpl implements SelectEvaluationService {

    @Autowired
    private SelectEvaluationMapper selectEvaluationMapper;

    @Override
    public List<SelectNotiDTO> getSelectEvaluationList(int memNo) {
        return selectEvaluationMapper.selectEvaluationList(memNo);
    }

    @Override
    public List<SelectEvaluationDTO> getselectEvaluation(Long subAnnNo) {
        return selectEvaluationMapper.selectEvaluation(subAnnNo);
    }

    @Override
    public List<SelectEvaluationDTO> getselectCommittee(String rndTaskNo) {
        return selectEvaluationMapper.selectCommittee(rndTaskNo);
    }

    @Override
    public int updatePlanStatus(int rndPlanNo, String planStatus) {
        return selectEvaluationMapper.updatePlanStatus(rndPlanNo, planStatus);
    }

    @Override
    public int updateProgStatus(Long subAnnNo) {
        return selectEvaluationMapper.updateProgStatus(subAnnNo);
    }



//    @Override
//    public void updatePlanStatus(List<Integer> rndPlanNoList) {
//        selectEvaluationMapper.updatePlanStatus(rndPlanNoList);
//    }

//    public void updatePlanStatusBatch(List<UpdatePlanStatusDto> requestDtos) {
//        selectEvaluationMapper.updatePlanStatusBatch(requestDtos);
//    }

//    public void updatePlanStatus(Map<String, Object> params) {
//        selectEvaluationMapper.updatePlanStatus(params);
//    }


}
