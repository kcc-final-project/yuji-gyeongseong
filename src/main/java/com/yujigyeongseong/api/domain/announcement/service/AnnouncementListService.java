package com.yujigyeongseong.api.domain.announcement.service;

import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnnouncementListService {
    List<Announcement> getAcceptingAnnouncementList();

    List<Announcement> getExpectedAnnouncementList();

    List<Announcement> getDeadlineAnnouncementList();
}