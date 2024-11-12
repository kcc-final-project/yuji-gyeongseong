package com.yujigyeongseong.api.domain.common_aws;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "cloud.aws")
@Getter
@Setter
public class EnvVariableProperties {
    @Value("${credentials.access-key")
    private String accessKey;
    @Value("${credentials.secret-key")
    private String secretKey;
    @Value("${region.static")
    private String region;
    private S3 s3;

    private final String KCC_BUCKET = "https://kcc-bucket.";

    @Setter @Getter
    public static class S3 {
        private String bucket;
        private String fakeUrl;
        private String url;
    }
}
