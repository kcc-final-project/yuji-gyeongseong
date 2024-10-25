package com.yujigyeongseong.api.domain.research_number.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.sql.Timestamp;

@RequiredArgsConstructor
@Getter
public class Member {
    private final Long memNo;
    private final Long rsrchNo;
    private final String username;
    private final String password;
    private final String name;
    private final String email;
    private final Timestamp birth;
    private final Character gender;
    private final String tel;
    private final String addr;
    private final String affilType;
    private final String affilDept;
    private final String position;
    private final String status;
    private final Timestamp createdAt;
    private final Timestamp updatedAt;
    private final Timestamp deletedAt;
    private final Long institutionNo;
}
