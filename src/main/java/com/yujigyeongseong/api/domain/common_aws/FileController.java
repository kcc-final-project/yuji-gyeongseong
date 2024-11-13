package com.yujigyeongseong.api.domain.common_aws;

import com.amazonaws.services.s3.model.S3ObjectInputStream;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/files")
@RequiredArgsConstructor
public class FileController {

    private final AwsS3Utils awsS3Utils;

    @GetMapping("/download")
    public ResponseEntity<byte[]> downloadFile(@RequestParam String filePath) {
        try (S3ObjectInputStream inputStream = awsS3Utils.downloadFile(filePath)) {
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

    @PostMapping("/upload")
    public ResponseEntity<?> uploadFiles(@RequestParam("files") MultipartFile[] files) {
        if(files == null || files.length == 0){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("파일이 선택되지 않았습니다.");
        }
        List<String> uploadedFileUrls = new ArrayList<>();

        for(MultipartFile file : files){
            if(file.isEmpty()){
                continue; // 빈 파일은 건너뜀
            }
            // 파일명 생성 (UUID 사용)
            String fileName = UUID.randomUUID().toString();

            try {
                String fileUrl = awsS3Utils.saveFile(file, fileName);
                uploadedFileUrls.add(fileUrl);
            } catch (IOException e) {
                e.printStackTrace();
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("파일 업로드 중 오류가 발생했습니다.");
            }
        }
        return ResponseEntity.ok(uploadedFileUrls);
    }
}
