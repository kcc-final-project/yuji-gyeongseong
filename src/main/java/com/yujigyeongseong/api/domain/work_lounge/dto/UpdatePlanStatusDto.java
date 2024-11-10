package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdatePlanStatusDto {
    private Long subAnnNo;
    private int rndPlanNo;
    private String planStatus;
}
