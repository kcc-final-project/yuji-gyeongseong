package com.yujigyeongseong.api.domain.announcement.dao;

import com.yujigyeongseong.api.domain.announcement.dto.AnnocementFile;
import com.yujigyeongseong.api.domain.announcement.dto.Announcement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncement;
import com.yujigyeongseong.api.domain.announcement.dto.SubAnnouncementApply;
import com.yujigyeongseong.api.domain.announcement.dto.request.AnnouncementFilterRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementDetailRequest;
import com.yujigyeongseong.api.domain.announcement.dto.request.SubAnnouncementRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AnnouncementMapper {

    List<Announcement> selectAcceptionAnnouncementList(@Param("offset") int offset,@Param("size") int size);

    List<Announcement> selectExpectedAnnouncementList(@Param("offset") int offset,@Param("size") int size);

    List<Announcement> selectDeadLineAnnouncementList(@Param("offset") int offset,@Param("size") int size);

    List<Announcement> selectAcceptionAnnouncementList1();

    SubAnnouncementRequest selectAnnouncementByTotalAnnNo(int AnnNo);

    SubAnnouncementDetailRequest selectSubAnnouncementBySubAnnNo(Long subAnnoNo);

    SubAnnouncementApply selectSubAnnouncementByAnnNo(String annNo);

    List<Announcement> searchAnnouncement(AnnouncementFilterRequest announcementFilterRequest);

    String selectTechName(String annNo);

    List<Announcement> selectTechAnno(String techName);

    List<AnnocementFile> selectAnnoFile(int annNo);

    List<AnnocementFile> selectFileDetailSubAnno(Long subAnnNo);


}
