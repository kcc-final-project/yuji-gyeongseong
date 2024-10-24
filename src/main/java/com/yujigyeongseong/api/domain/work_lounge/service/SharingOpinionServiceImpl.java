package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.SharingOpinionMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SharingOpinionDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class SharingOpinionServiceImpl implements SharingOpinionService {

    @Autowired
    private SharingOpinionMapper sharingOpinionMapper;

    @Override
    public List<SharingOpinionDTO> getSelectSharingOpinionList(String taskName) {
        return sharingOpinionMapper.selectSharingOpinionList(taskName);
    }

    @Override
    public List<SharingOpinionDTO> getSelectCommitteePersonList(String taskName) {
        return sharingOpinionMapper.selectCommitteePersonList(taskName);
    }

}
