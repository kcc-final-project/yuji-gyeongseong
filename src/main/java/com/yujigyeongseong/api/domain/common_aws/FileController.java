package com.yujigyeongseong.api.domain.common_aws;

import com.amazonaws.services.s3.model.S3ObjectInputStream;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

@RestController
@RequestMapping("/files")
@RequiredArgsConstructor
public class FileController {

    private final AwsS3Utils awsS3Utils;

    @GetMapping("/download")
    public ResponseEntity<byte[]> downloadFile(@RequestParam String filePath) {
        try (S3ObjectInputStream inputStream = awsS3Utils.downloadFile(filePath)) {
            // 파일의 바이너리 데이터를 읽어들입니다.
            byte[] bytes = inputStream.readAllBytes();

            // 파일 이름을 추출 (예: kcc_pms/filename.ext -> filename.ext)
            String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

            // ContentDisposition을 올바르게 설정하여 한글 파일명을 지원
            ContentDisposition contentDisposition = ContentDisposition.builder("attachment")
                    .filename(fileName, StandardCharsets.UTF_8)
                    .build();
            headers.setContentDisposition(contentDisposition);

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(bytes);
        } catch (IOException e) {
            // 예외 처리 (예: 파일을 찾을 수 없을 때)
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }
}
