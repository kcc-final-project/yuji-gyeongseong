package com.yujigyeongseong.api.domain.research_number.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class EvalMemberRequest {
    private String recvStatus;
    private String recvStatusEng;
}
