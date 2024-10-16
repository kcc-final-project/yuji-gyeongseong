package com.yujigyeongseong.api.domain.announcement.controller;

import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.service.AnnouncementListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/anno")
public class AnnouncementRestController {
    @Autowired
    AnnouncementListService announcementListService;

    @GetMapping("/accepting")
    public List<Announcement> getAcceptingAnnouncementList(){
        System.out.println("컨트롤러 호출");
        List<Announcement> anno;
        anno = announcementListService.getAcceptingAnnouncementList();
        return anno;
    }

    @GetMapping("/expected")
    public List<Announcement> getExpectedAnnouncementList(){
        List<Announcement> anno;
        anno = announcementListService.getExpectedAnnouncementList();
        return anno;
    }

    @GetMapping("/deadline")
    public List<Announcement> getDeadlineAnnouncementList(){
        List<Announcement> anno;
        anno = announcementListService.getDeadlineAnnouncementList();
        return anno;
    }
}
