package com.yujigyeongseong.api.domain.announcement.controller;

import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementRequest;
import com.yujigyeongseong.api.domain.announcement.service.AnnouncementListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/anno")
@Controller
public class AnnouncementController {

    private final AnnouncementListService announcementListService;

    @Autowired
    public AnnouncementController(AnnouncementListService announcementListService) {
        this.announcementListService = announcementListService;
    }

    @GetMapping
    public String getAnnouncementList() {
        return "announcement/announcement-list";
    }

    @GetMapping("/detail/{totalAnnNo}")
    public String getDetailedNotice(@PathVariable String totalAnnNo, Model model) {
        SubAnnouncementRequest announcement = announcementListService.getAnnouncementByTotalAnnNo(totalAnnNo);
        model.addAttribute("announcement", announcement);

        return "announcement/detailed-notice";
    }

    @GetMapping("/apply/{annNo}")
    public String getApplyNotice(@PathVariable String annNo, Model model) {
        SubAnnouncementApply applyAnnouncement = announcementListService.getApplyNotice(annNo);
        model.addAttribute("applyAnnouncement", applyAnnouncement);

        return "announcement/apply-for-notice";
    }
}
