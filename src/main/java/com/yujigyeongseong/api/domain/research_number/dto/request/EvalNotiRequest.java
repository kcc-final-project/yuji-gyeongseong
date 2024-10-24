package com.yujigyeongseong.api.domain.research_number.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
public class EvalNotiRequest {
    private String content;
    private String notiType;
    private String dataCategory;
    private String notiContentNo;
    private Long memNo;
}
