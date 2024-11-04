package com.yujigyeongseong.api.domain.member.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SignUpMember {
    private Long memNo;
    private String username;
    private String password;
    private String name;
    private String email;
    private String birth;
    private String gender;
    private String tel;
    private String addr;
    private String affilType;
    private String affilDept;
    private String position;
    private Long institutionNo;
}
