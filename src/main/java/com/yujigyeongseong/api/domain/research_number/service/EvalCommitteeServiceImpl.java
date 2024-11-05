package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dao.EvalCommitteeMapper;
import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import com.yujigyeongseong.api.domain.research_number.dto.Noti;
import com.yujigyeongseong.api.domain.research_number.dto.request.AcadRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.CareerRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalNotiRequest;
import com.yujigyeongseong.api.domain.research_number.dto.response.NotiReponse;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class EvalCommitteeServiceImpl implements EvalCommitteeService {

    private final EvalCommitteeMapper evalCommitteeMapper;
    private final SimpMessagingTemplate messagingTemplate; // WebSocket 메시지 전송 템플릿

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

    @Override
    public List<Noti> getAllTechNotiByMemberId(Long id) {
        return evalCommitteeMapper.selectAllNotiByMemberId(id);
    }

    @Override
    public int setCareersByMemberId(Long id, List<CareerRequest> careers) {
        return evalCommitteeMapper.insertAllCareersByMemberId(id, careers);
    }

    @Override
    public int setAcadAbilitiesByMemberId(Long id, List<AcadRequest> acadAbilities) {
        return evalCommitteeMapper.insertAllAcadAbilitiesByMemberId(id, acadAbilities);

    }

    @Override
    public int setRsrcNoByMemberId(Long id) {
        return evalCommitteeMapper.insertRsrcNoByMemberId(id);
    }

    @Override
    public int setEvalNotiByMemberId(EvalNotiRequest evalNotiRequest) {

        int result = evalCommitteeMapper.insertEvalNotiByMemberId(evalNotiRequest);

        if(result > 0){
            NotiReponse noti = NotiReponse.builder()
                    .memNo(evalNotiRequest.getMemNo())
                    .content(evalNotiRequest.getContent())
                    .notiType(evalNotiRequest.getNotiType())
                    .dataCategory(evalNotiRequest.getDataCategory())
                    .notiContentNo(evalNotiRequest.getNotiContentNo())
                    .createdAt(LocalDateTime.now().toString()) // 필요 시 형식 변경
                    .build();


            // WebSocket을 통해 알림 전송
            sendNotification(noti);
        }

        return result;
    }

    // WebSocket을 통해 알림 전송하는 메서드
    private void sendNotification(NotiReponse noti) {
        messagingTemplate.convertAndSendToUser(
                "yun9869", // 사용자 식별자 (memNo를 문자열로 변환)
                "/topic/notifications",     // 구독 경로
                noti                        // 전송할 메시지
        );
    }
}
