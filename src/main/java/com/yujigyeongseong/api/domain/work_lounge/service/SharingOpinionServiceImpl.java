package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.SharingOpinionMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
public class SharingOpinionServiceImpl implements SharingOpinionService {

    @Autowired
    private SharingOpinionMapper sharingOpinionMapper;

    @Override
    public List<SharingOpinionDTO> getSelectSharingOpinionList(int rndPlanNo) {
        return sharingOpinionMapper.selectSharingOpinionList(rndPlanNo);
    }

    @Override
    public List<SharingOpinionDTO> evalPeople(int rndPlanNo) {
        return sharingOpinionMapper.evalPeople(rndPlanNo);
    }

    @Override
    public List<SharingOpinionDTO> getSelectCommitteePersonList(String taskName) {
        return sharingOpinionMapper.selectCommitteePersonList(taskName);
    }



    @Override
    public List<Opinion> getselectOpinionList() {
        return sharingOpinionMapper.selectOpinionList();
    }

    @Override
    public Opinion summaryId(int opinionNo) {
        return sharingOpinionMapper.summaryId(opinionNo);
    }

    @Override
    public int insertOpinionReplyList(Opinion opinion) {
        opinion.setEvalCommitteeNo(1);
        opinion.setRndPlanNo(1);
        opinion.setBucketNo(1);
        return sharingOpinionMapper.insertOpinionReplyList(opinion);
    }


}
