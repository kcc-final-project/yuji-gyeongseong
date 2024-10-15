package com.yujigyeongseong.api.domain.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberSignIn {
    @GetMapping("/sign/in")
    public String signIn() {
        return "sign-in-sign-up/sign-in";
    }

    @GetMapping("/sign/up1")
    public String signUp1() {
        return "sign-in-sign-up/sign-up-1";
    }

    @GetMapping("/sign/up2")
    public String signUp2() {
        return "sign-in-sign-up/sign-up-2";
    }

    @GetMapping("/sign/up3")
    public String signUp3() {
        return "sign-in-sign-up/sign-up-3";
    }

    @GetMapping("/sign/up4")
    public String signUp4() {
        return "sign-in-sign-up/sign-up-4";
    }

}
