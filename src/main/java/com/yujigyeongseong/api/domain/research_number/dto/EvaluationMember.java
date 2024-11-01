package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
@ToString
public class EvaluationMember {
    private final Long evalCommitteeNo;
    private final Long memNo;
    private final Timestamp recvStartAt;
    private final Timestamp recvCloseAt;
    private final String recvStatus;
    private final String recvStatusEng;
}
