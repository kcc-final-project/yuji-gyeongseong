package com.yujigyeongseong.api.domain.member.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserSessionData {
    private String name;
    private String birth;
    private String tel;

}
