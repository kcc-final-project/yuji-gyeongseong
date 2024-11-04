package com.yujigyeongseong.api.domain.member.dto.auth;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberLogin {
    private Long memNo;
    private Long rsrchNo;
    private String name;
    private String username;
    private String password;
    private String email;
    private String birth;
    private String gender;
    private String tel;
    private String addr;
    private String affilType;
    private String affilDept;
    private String position;
    private String institutionName;

    private List<MemRole> roles;
}
