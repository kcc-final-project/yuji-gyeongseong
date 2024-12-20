package com.yujigyeongseong.api.domain.announcement.service;

import com.yujigyeongseong.api.domain.announcement.dto.AnnocementFile;
import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.AnnouncementFilterRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementDetailRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnnouncementListService {
    List<Announcement> getAcceptingAnnouncementList(int page, int size);

    List<Announcement> getExpectedAnnouncementList(int page, int size);

    List<Announcement> getDeadlineAnnouncementList(int page, int size);

    SubAnnouncementRequest getAnnouncementByTotalAnnNo(int AnnNo);

    SubAnnouncementDetailRequest postDetailAnnouncement(Long subAnnoNo);

    SubAnnouncementApply getApplyNotice(String annNo);

    List<Announcement> searchAnnouncement(AnnouncementFilterRequest announcementFilterRequest);

    List<Announcement> selectAcceptionAnnouncementList1();

}
