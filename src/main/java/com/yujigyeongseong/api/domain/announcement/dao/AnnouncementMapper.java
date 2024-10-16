package com.yujigyeongseong.api.domain.announcement.dao;

import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AnnouncementMapper {

    List<Announcement> selectAcceptionAnnouncementList();

    List<Announcement> selectExpectedAnnouncementList();

    List<Announcement> selectDeadLineAnnouncementList();
}
