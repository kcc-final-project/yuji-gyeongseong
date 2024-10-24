package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
@ToString
public class Noti {
    private final Long notificationNo;
    private final String content;
    private final Timestamp createdAt;
    private final Timestamp deletedAt;
    private final String notiContentNo;
    private final String notiType;
    private final String readState;
    private final String dataCategory;
    private final Long memNo;
}
