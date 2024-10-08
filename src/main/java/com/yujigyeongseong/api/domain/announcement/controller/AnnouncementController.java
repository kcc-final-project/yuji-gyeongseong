package com.yujigyeongseong.api.domain.announcement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/anno")
@Controller
public class AnnouncementController {

    @GetMapping
    public String getAnnouncementList(){
        return "announcement/announcement-list";
    }
}