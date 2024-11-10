package com.yujigyeongseong.api.domain.announcement.controller;

import com.yujigyeongseong.api.domain.announcement.dao.AnnouncementMapper;
import com.yujigyeongseong.api.domain.announcement.dto.AnnocementFile;
import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.AnnouncementFilterRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementDetailRequest;
import com.yujigyeongseong.api.domain.announcement.service.AnnouncementListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/anno")
public class AnnouncementRestController {
    private static final Logger log = LoggerFactory.getLogger(AnnouncementRestController.class);
    private final AnnouncementListService announcementListService;
    private final AnnouncementMapper announcementMapper;

    @Autowired
    public AnnouncementRestController(AnnouncementListService announcementListService, AnnouncementMapper announcementMapper) {
        this.announcementListService = announcementListService;
        this.announcementMapper = announcementMapper;
    }

    @GetMapping("/accepting")
    public List<Announcement> getAcceptingAnnouncementList(@RequestParam int page, @RequestParam int size) {
        List<Announcement> anno;
        anno = announcementListService.getAcceptingAnnouncementList(page,size);

        return anno;
    }

    @GetMapping("/topAcception")
    public List<Announcement> selectAcceptionAnnouncementList1(){
        List<Announcement> anno;
        anno = announcementListService.selectAcceptionAnnouncementList1();

        return anno;
    }

    @GetMapping("/expected")
    public List<Announcement> getExpectedAnnouncementList(@RequestParam int page, @RequestParam int size) {
        List<Announcement> anno;
        anno = announcementListService.getExpectedAnnouncementList(page,size);
        return anno;
    }

    @GetMapping("/deadline")
    public List<Announcement> getDeadlineAnnouncementList(@RequestParam int page, @RequestParam int size) {
        List<Announcement> anno;
        anno = announcementListService.getDeadlineAnnouncementList(page,size);
        return anno;
    }

    @GetMapping("/detail/zoom-in/{subAnnNo}")
    public SubAnnouncementDetailRequest postDetailAnnouncement(@PathVariable("subAnnNo") Long subAnnNo) {
        SubAnnouncementDetailRequest sub = announcementListService.postDetailAnnouncement(subAnnNo);

        return sub;
    }

    @GetMapping("/detail/file/{subAnnNo}")
    public List<AnnocementFile> postDetailAnnouncementFile(@PathVariable("subAnnNo") Long subAnnNo) {
        List<AnnocementFile> files = announcementMapper.selectFileDetailSubAnno(subAnnNo);
        return files;
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

    @GetMapping("/tech")
    public SubAnnouncementApply gettechAnno(@RequestParam String annNo){
        SubAnnouncementApply subAnno = announcementMapper.selectSubAnnouncementByAnnNo(annNo);
        return subAnno;
    }
}
