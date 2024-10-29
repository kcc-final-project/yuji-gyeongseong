package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RegisterListMapper {

    List<RegisterListDTO> selectRegisterList(@Param("memNo") Integer memNo);

    List<RegisterListDTO> selectCompleteList(int memNo);

    public int delete(int rndPlanNo);
}
