package edu.sm.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Slf4j
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${app.dir.imgdir}")
    String imgdir;

    @Value("${app.dir.logdir}")
    String logdir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Favicon 요청을 처리하도록 추가
        registry.addResourceHandler("/favicon.ico").addResourceLocations("classpath:/static/");

        // 기존 이미지와 로그 디렉토리에 대한 리소스 핸들러
        registry.addResourceHandler("/imgs/**").addResourceLocations(imgdir);
        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);
    }
}
