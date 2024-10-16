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
        System.out.println("서비스 구현체에서 가져온 값 : " + announcementMapper.selectAcceptionAnnouncementList());
        return announcementMapper.selectAcceptionAnnouncementList();
    }

    @Override
    public List<Announcement> getExpectedAnnouncementList() {
        System.out.println("접수예정 서비스에서 가져온 값 : " + announcementMapper.selectAcceptionAnnouncementList());
        return announcementMapper.selectExpectedAnnouncementList();
    }

    @Override
    public List<Announcement> getDeadlineAnnouncementList() {
        return announcementMapper.selectDeadLineAnnouncementList();
    }
}