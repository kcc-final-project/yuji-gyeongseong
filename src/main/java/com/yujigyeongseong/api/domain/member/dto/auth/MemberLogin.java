package com.yujigyeongseong.api.domain.member.dto.auth;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberLogin {
    private  Long memNo;
    private String name;
    private  String username;
    private  String password;
    private  List<MemRole> roles;
}
