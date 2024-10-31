package com.yujigyeongseong.api.domain.announcement.dao;

import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.AnnouncementFilterRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementDetailRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AnnouncementMapper {

    List<Announcement> selectAcceptionAnnouncementList();

    List<Announcement> selectExpectedAnnouncementList();

    List<Announcement> selectDeadLineAnnouncementList();

    SubAnnouncementRequest selectAnnouncementByTotalAnnNo(int AnnNo);

    SubAnnouncementDetailRequest selectSubAnnouncementBySubAnnNo(Long subAnnoNo);

    SubAnnouncementApply selectSubAnnouncementByAnnNo(String annNo);

    List<Announcement> searchAnnouncement(AnnouncementFilterRequest announcementFilterRequest);
}
