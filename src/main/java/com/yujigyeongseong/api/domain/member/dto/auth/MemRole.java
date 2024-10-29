package com.yujigyeongseong.api.domain.member.dto.auth;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemRole {
    private Long roleNo;
    private  String roleName;
}
