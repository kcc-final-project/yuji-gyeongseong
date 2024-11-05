package com.yujigyeongseong.api.domain.announcement.service;

import com.yujigyeongseong.api.domain.announcement.dao.AnnouncementMapper;
import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.AnnouncementFilterRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementDetailRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementListImpl implements AnnouncementListService {

    private final AnnouncementMapper announcementMapper;
    @Autowired
    public AnnouncementListImpl(AnnouncementMapper announcementMapper){
        this.announcementMapper = announcementMapper;
    }

    @Override
    public List<Announcement> getAcceptingAnnouncementList(int page, int size ) {
        int offset = page * size;
        return announcementMapper.selectAcceptionAnnouncementList(offset,size);
    }

    @Override
    public List<Announcement> getExpectedAnnouncementList(int page, int size) {
        int offset = page * size;
        return announcementMapper.selectExpectedAnnouncementList(offset,size);
    }

    @Override
    public List<Announcement> getDeadlineAnnouncementList(int page, int size) {
        int offer = page * size;
        return announcementMapper.selectDeadLineAnnouncementList(offer,size);
    }

    @Override
    public SubAnnouncementRequest getAnnouncementByTotalAnnNo(int AnnNo) {
        return announcementMapper.selectAnnouncementByTotalAnnNo(AnnNo);
    }

    @Override
    public SubAnnouncementDetailRequest postDetailAnnouncement(Long subAnnoNo) {
        return announcementMapper.selectSubAnnouncementBySubAnnNo(subAnnoNo);
    }

    @Override
    public SubAnnouncementApply getApplyNotice(String annNo) {
        return announcementMapper.selectSubAnnouncementByAnnNo(annNo);
    }

    @Override
    public List<Announcement> searchAnnouncement(AnnouncementFilterRequest announcementFilterRequest) {
        return announcementMapper.searchAnnouncement(announcementFilterRequest);
    }

    @Override
    public List<Announcement> selectAcceptionAnnouncementList1() {
        return announcementMapper.selectAcceptionAnnouncementList1();
    }


}
