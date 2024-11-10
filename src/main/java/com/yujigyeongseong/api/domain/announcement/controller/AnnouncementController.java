package com.yujigyeongseong.api.domain.announcement.controller;

import com.yujigyeongseong.api.domain.announcement.dao.AnnouncementMapper;
import com.yujigyeongseong.api.domain.announcement.dto.AnnocementFile;
import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementRequest;
import com.yujigyeongseong.api.domain.announcement.service.AnnouncementListService;
import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/anno")
@Controller
public class AnnouncementController {

    private final AnnouncementListService announcementListService;
    private final AnnouncementMapper announcementMapper;

    @Autowired
    public AnnouncementController(AnnouncementListService announcementListService, AnnouncementMapper announcementMapper) {
        this.announcementListService = announcementListService;
        this.announcementMapper = announcementMapper;
    }

    @GetMapping
    public String getAnnouncementList() {

        return "announcement/announcement-list";
    }

    @GetMapping("/detail/{AnnNo}")
    public String getDetailedNotice(@PathVariable int AnnNo, Model model) {
        SubAnnouncementRequest announcement = announcementListService.getAnnouncementByTotalAnnNo(AnnNo);
        model.addAttribute("announcement", announcement);

        List<AnnocementFile> annocementFile = announcementMapper.selectAnnoFile(AnnNo);
        model.addAttribute("annocementFile", annocementFile);
        return "announcement/detailed-notice";
    }

    @GetMapping("/apply/{annNo}")
    public String getApplyNotice(@PathVariable String annNo, Model model, @AuthenticationPrincipal PrincipalDetail principalDetail, HttpSession httpSession) {
        SubAnnouncementApply applyAnnouncement = announcementListService.getApplyNotice(annNo);
        model.addAttribute("applyAnnouncement", applyAnnouncement);

        if (principalDetail != null) {
            httpSession.setAttribute("principalDetailId", principalDetail.getId());
        }

        String techName = announcementMapper.selectTechName(annNo);
        if (techName != null) {
            List<Announcement> anno = announcementMapper.selectTechAnno(techName);
            if(anno!=null) {
                model.addAttribute("announcement", anno);
            }
        }
        return "announcement/apply-for-notice";
    }
}
