package com.yujigyeongseong.api.domain.announcement.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AnnocementFile {
    private Long uuid; // 파일번호
    private String uploadPath; // 경로
    private String fileName; // 원본 파일명
    private String hashFileName; // 파일명
    private String fileType; // 파일유형
    private String fileClass; // 구분
    private Long fileSize; // 크기
    private String mandatoryStatus; // 필수여부
    private String createdAt; // 생성일자
    private String source; // 출처
    private Long sourceNumber; // 출처번호
    private Long bucketNo; // 버킷번호
}
