package com.yujigyeongseong.api.domain.research_number.dto.response;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class NotiReponse {
    private String memName;
    private String content;
    private String notiType;
    private String dataCategory;
    private Long notiContentNo;
    private String createdAt;
}
