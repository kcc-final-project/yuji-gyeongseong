package com.yujigyeongseong.api.domain.common_aws;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling
@EnableConfigurationProperties(EnvVariableProperties.class)
public class ProperTiesConfig {}
