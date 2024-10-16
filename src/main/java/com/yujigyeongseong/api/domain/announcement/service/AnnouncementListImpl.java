package com.yujigyeongseong.api.domain.announcement.service;

import com.yujigyeongseong.api.domain.announcement.dao.AnnouncementMapper;
import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementListImpl implements AnnouncementListService {
    @Autowired
    AnnouncementMapper announcementMapper;

    @Override
    public List<Announcement> getAcceptingAnnouncementList() {
        return announcementMapper.selectAcceptionAnnouncementList();
    }

    @Override
    public List<Announcement> getExpectedAnnouncementList() {
        return announcementMapper.selectExpectedAnnouncementList();
    }

    @Override
    public List<Announcement> getDeadlineAnnouncementList() {
        return announcementMapper.selectDeadLineAnnouncementList();
    }
}
