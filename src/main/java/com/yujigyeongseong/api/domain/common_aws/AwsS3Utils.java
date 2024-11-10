package com.yujigyeongseong.api.domain.common_aws;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Component
@RequiredArgsConstructor
public class AwsS3Utils {
    private final AmazonS3 amazonS3;
    private final com.yujigyeongseong.api.domain.common_aws.EnvVariableProperties properties;

    public String saveFile(MultipartFile multipartFile, String fileName) throws IOException {
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(multipartFile.getSize());
        metadata.setContentType(multipartFile.getContentType());
        String ext = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".") + 1);

        amazonS3.putObject(properties.getS3().getBucket() + "/kcc_pms", fileName + "." + ext, multipartFile.getInputStream(), metadata);
        return properties.getS3().getFakeUrl()  + fileName + "." + ext;
    }

    public void deleteImage(String filePath) {
        DeleteObjectRequest deleteObjectRequest;
        deleteObjectRequest = new DeleteObjectRequest(properties.getS3().getBucket(), filePath);
        amazonS3.deleteObject(deleteObjectRequest);
    }

    public void deleteImages(List<String> files){
        if (files != null) {
            for (String file : files) {
                deleteImage(file);
            }
        }
    }

    public S3ObjectInputStream downloadFile(String filePath) {
        String bucketName = properties.getS3().getBucket();
        String objectKey = filePath.substring(filePath.indexOf("/", 8) + 1);

        if (objectKey.startsWith("1/")) {
            objectKey = "kcc_pms/" + objectKey;
        }
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucketName, objectKey);
        S3Object s3Object = amazonS3.getObject(getObjectRequest);

        return s3Object.getObjectContent();
    }
}
