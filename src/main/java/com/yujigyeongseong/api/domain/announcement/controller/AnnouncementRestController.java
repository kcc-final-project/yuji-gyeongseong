package com.yujigyeongseong.api.domain.announcement.controller;

import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncement;
import com.yujigyeongseong.api.domain.announcement.dto.request.AnnouncementFilterRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementDetailRequest;
import com.yujigyeongseong.api.domain.announcement.service.AnnouncementListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/anno")
public class AnnouncementRestController {
    private final AnnouncementListService announcementListService;

    @Autowired
    public AnnouncementRestController(AnnouncementListService announcementListService) {
        this.announcementListService = announcementListService;
    }

    @GetMapping("/accepting")
    public List<Announcement> getAcceptingAnnouncementList() {
        List<Announcement> anno;
        anno = announcementListService.getAcceptingAnnouncementList();
        return anno;
    }

    @GetMapping("/expected")
    public List<Announcement> getExpectedAnnouncementList() {
        List<Announcement> anno;
        anno = announcementListService.getExpectedAnnouncementList();
        return anno;
    }

    @GetMapping("/deadline")
    public List<Announcement> getDeadlineAnnouncementList() {
        List<Announcement> anno;
        anno = announcementListService.getDeadlineAnnouncementList();
        return anno;
    }

    @GetMapping("/detail/zoom-in/{subAnnNo}")
    public SubAnnouncementDetailRequest postDetailAnnouncement(@PathVariable("subAnnNo") Long subAnnNo) {
        SubAnnouncementDetailRequest sub = announcementListService.postDetailAnnouncement(subAnnNo);
        return sub;
    }

    @GetMapping("/search")
    public List<Announcement> searchAnnouncement(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String date,
            @RequestParam(required = false) String activeText,
            @RequestParam(required = false) String latest,
            @RequestParam(required = false) List<String> checkedSogan,
            @RequestParam(required = false) List<String> checkedJunmun,
            @RequestParam(required = false) List<String> checkedGisul
    ) {
        AnnouncementFilterRequest announcementFilterRequest = new AnnouncementFilterRequest();
        announcementFilterRequest.setKeyword(keyword);
        announcementFilterRequest.setDate(date);
        announcementFilterRequest.setActiveText(activeText);
        announcementFilterRequest.setLatest(latest);
        announcementFilterRequest.setCheckedSogan(checkedSogan);
        announcementFilterRequest.setCheckedJunmun(checkedJunmun);
        announcementFilterRequest.setCheckedGisul(checkedGisul);
        List<Announcement> anno;
        anno = announcementListService.searchAnnouncement(announcementFilterRequest);
        return anno;
    }
}
