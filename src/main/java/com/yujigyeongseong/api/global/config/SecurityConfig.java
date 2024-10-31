package com.yujigyeongseong.api.global.config;
import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    private static final String[] PERMIT_LIST = {
            "/anno/**",
            "/mail/**",
            "/member/**",
            "/",
    };

    private static final String[] USER_LIST = {
            "/research-number",
            "work-lounge/register-list/**",
    };

    private static final String[] EVAL_LIST = {
            "/work-lounge/evaluation-paper/**",
            "/work-lounge/evaluation-task-lists",
    };

    private static final String[] MANAGER_LIST = {
            "/work-lounge/selection-evaluation-detail/**",
            "/work-lounge/evaluation-tables",
            "/work-lounge/eval-list/**",
            "/work-lounge/eval-compose/**",
    };

    private static final String[] USER_RESE_DIRE = {
            "/rnd-plans/**",
            "/eval_committee",
    };

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers("/resources/**");
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http.csrf(csrf -> csrf.disable());

        http.authorizeHttpRequests(
                request -> request

                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .requestMatchers("/business-timeline").hasAnyRole("USER","RESE","DIRE","MGR","EVAL")
//                        .requestMatchers(PERMIT_LIST).permitAll()
//                        .requestMatchers(USER_LIST).hasRole("USER")
//                        .requestMatchers(EVAL_LIST).hasRole("EVAL")
//                        .requestMatchers(MANAGER_LIST).hasRole("MGR")
//                        .requestMatchers(USER_RESE_DIRE).hasAnyRole("USER","RESE","DIRE")
//                        .requestMatchers("/work-lounge/sharing-opinion/ResearchTask/**").hasAnyRole("DIRE","EVAL")
//                        .requestMatchers("/work-lounge/sharing-opinion/**").hasAnyRole("DIRE","EVAL")

                        .anyRequest().permitAll()
        );

        http.formLogin(formLogin -> formLogin
                .usernameParameter("username")
                .passwordParameter("password")

                .loginPage("/member/sign/in").permitAll()

                .loginProcessingUrl("/login")

                .defaultSuccessUrl("/")

                .failureUrl("/member/login/fail"));

        http.logout(logout -> logout
                .logoutUrl("/member/logout")
                .logoutSuccessUrl("/member/sign/in")
                .invalidateHttpSession(true));

        return http.build();
    }
}
