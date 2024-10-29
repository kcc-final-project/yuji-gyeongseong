package com.yujigyeongseong.api.web.pages;

import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String getHomePage(@AuthenticationPrincipal PrincipalDetail principal, HttpSession session) {
        if (principal != null) {
            session.setAttribute("username", principal.getName());
        }
        return "main/index";
    }
}