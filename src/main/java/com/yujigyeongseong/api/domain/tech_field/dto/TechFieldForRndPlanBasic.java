package com.yujigyeongseong.api.domain.tech_field.dto;

import lombok.*;

@RequiredArgsConstructor
@Getter
@ToString
public class TechFieldForRndPlanBasic {

    private final Integer id;

    private final String text;

    private final String type;

    private final String parent;

}
