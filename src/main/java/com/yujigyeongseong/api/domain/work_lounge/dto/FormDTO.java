package com.yujigyeongseong.api.domain.work_lounge.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class FormDTO {
    private String subTitle;
    private String taskType;
    private String techFieldName;
    private List<FormTypeDTO> formTypes;

    public FormDTO(String taskType, String techFieldName, String subTitle) {
        this.taskType = taskType;
        this.techFieldName = techFieldName;
        this.subTitle = subTitle;
    }
}
