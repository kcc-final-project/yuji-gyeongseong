package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dao.EvalComposeMapper;
import com.yujigyeongseong.api.domain.research_number.dto.*;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalMemberRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalPercentRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberDetails;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EvalComposeServiceImpl implements EvalComposeService {

    private final SqlSessionFactory sqlSessionFactory;
    private final EvalComposeMapper evalComposeMapper;

    @Override
    public SubAnnounce getSubAnnounceById(Long id) {
        return evalComposeMapper.selectSubAnnounceById(id);
    }

    @Override
    public EvalCommittee getOneEvalCommitteeById(Long id) {
        return evalComposeMapper.selectOneEvalCommitteeById(id);
    }

    @Override
    public List<EvalCommittee> getAllEvalCommitteeById(Long id) {
        return evalComposeMapper.selectAllEvalCommitteeById(id);
    }


    @Override
    public int getRndPlanCntById(Long id) {
        return evalComposeMapper.selectRndPlanCntById(id);
    }

    @Override
    public List<EvaluationMember> getEvaluationMembersByCommittee(Long id) {
        return evalComposeMapper.selectEvaluationMembersById(id);
    }

    @Override
    public Member getOneMemberById(Long id) {
        return evalComposeMapper.selectOneMemberById(id);
    }

    @Override
    public MemberDetails getOneMemberDetailWithInstitution(Long id) {
        return evalComposeMapper.selectOneMemberDetailWithInstitution(id);
    }

    @Override
    public int setEvaluationMemberByNotiContentNo(Long memberId, Long notiContentNo, EvalMemberRequest evalMemberRequest) {
        return evalComposeMapper.udpateEvaluationMemberByNotiContentNo(memberId, notiContentNo, evalMemberRequest);
    }

    @Override
    public int setNotiByNotificationNo(Long notificationNo) {
        return evalComposeMapper.updateNotiByNotificationNo(notificationNo);
    }

    @Override
    public int setEvalCommitteesBySubAnnNo(Long subAnnNo, int rndPlanCnt, EvalPercentRequest request) {
        SqlSession session = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
        try {
//            for (int i = 0; i < rndPlanCnt; i++) {
//                String committeeName = String.format("평가위원회-%02d", i); // "평가위원회-00" 형식으로 이름 생성
//                evalComposeMapper.insertEvalCommitteesBySubAnnNo(subAnnNo, committeeName);
//            }

            evalComposeMapper.insertEvalCommitteesBySubAnnNo(
                    subAnnNo,
                    rndPlanCnt,
                    request.getResearchInstituteRate(),
                    request.getEducationInstituteRate(),
                    request.getProfessionalInstituteRate()
            );

            session.flushStatements();  // 쌓인 배치 실행
            session.commit();  // 성공시 커밋
            return rndPlanCnt;  // 성공적으로 처리된 개수 반환
        } catch (Exception e) {
            session.rollback();  // 실패시 롤백
            throw e;  // 예외를 다시 던짐
        } finally {
            session.close();  // 세션을 반드시 닫음
        }
    }

    @Override
    public int getEvalCommitteeCntById(Long subAnnNo) {
        return evalComposeMapper.selectEvalCommitteeCntById(subAnnNo);
    }

}
