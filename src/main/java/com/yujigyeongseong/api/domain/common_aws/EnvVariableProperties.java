package com.yujigyeongseong.api.domain.common_aws;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "cloud.aws")
@Getter
@Setter
public class EnvVariableProperties {
    private String accessKey = "sdf";
    private String secretKey = "sdf";
    private String region = "sdf";
    private S3 s3;

    private final String KCC_BUCKET = "https://kcc-bucket.";

    @Setter @Getter
    public static class S3 {
        private String bucket;
        private String fakeUrl;
        private String url;
    }
}
