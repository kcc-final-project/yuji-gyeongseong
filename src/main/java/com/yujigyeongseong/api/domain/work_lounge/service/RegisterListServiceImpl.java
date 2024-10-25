package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dao.RegisterListMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterList;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class RegisterListServiceImpl implements RegisterListService {

    @Autowired
    private RegisterListMapper registerListMapper;

    @Override
    public List<RegisterListDTO> getRegisterList(Integer memNo) {
        return registerListMapper.selectRegisterList(memNo);
    }

    @Override
    public List<RegisterListDTO> getCompleteList(int memNo) {
        return registerListMapper.selectCompleteList(memNo);
    }
}
