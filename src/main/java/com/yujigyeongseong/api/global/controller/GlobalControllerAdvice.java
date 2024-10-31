package com.yujigyeongseong.api.global.controller;

import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdvice {
    @ModelAttribute
    public void addAttributes(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
        if(principal != null) {
            model.addAttribute("userId", principal.getId());
            model.addAttribute("userName", principal.getName());
            model.addAttribute("userPwd", principal.getPassword());
            model.addAttribute("userRole", principal.getAuthorities());
            model.addAttribute("userLoginId", principal.getUsername());
        }
    }
}
