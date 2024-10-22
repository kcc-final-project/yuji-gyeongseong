package com.yujigyeongseong.api.global.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
public class MyBatisConfig {

    private static final String ALIASES_PACKAGE_LIST = "com.yujigyeongseong.api";

    @Bean
    @Profile("local")
    public SqlSessionFactory localSqlSessionSessionFactory(final DataSource dataSource) throws Exception {

        final SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
        factory.setDataSource(dataSource); // h2

        factory.setMapperLocations(
                new PathMatchingResourcePatternResolver().getResources("classpath:api/mapper/h2/*.xml"));
        factory.setTypeAliasesPackage(ALIASES_PACKAGE_LIST);

        return factory.getObject();
    }

    @Bean
    @Profile("dev")
    public SqlSessionFactory devSqlSessionSessionFactory(final DataSource dataSource) throws Exception {

        final SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
        factory.setDataSource(dataSource); // Oracle

        factory.setMapperLocations(
                new PathMatchingResourcePatternResolver().getResources("classpath:api/mapper/*.xml"));
        factory.setTypeAliasesPackage(ALIASES_PACKAGE_LIST);

        return factory.getObject();
    }

}
