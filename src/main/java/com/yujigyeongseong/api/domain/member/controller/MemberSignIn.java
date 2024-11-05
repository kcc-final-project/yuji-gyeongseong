package com.yujigyeongseong.api.domain.member.controller;


import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @GetMapping("/login/fail")
    public String loginFail() {
        return "sign-in-sign-up/sign-in";
    }

    @GetMapping("/edit-personal-info")
    public String editPersonalInfo(@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {

        model.addAttribute("principal",principalDetail);

        return "sign-in-sign-up/edit-personal-info";
    }

    @GetMapping("/delete")
    public String delete(@AuthenticationPrincipal PrincipalDetail principalDetail, Model model) {
        model.addAttribute("principal",principalDetail);
        return "sign-in-sign-up/member-delete";
    }
}
