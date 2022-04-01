package com.ffaikrw.instagram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ffaikrw.instagram.common.FileManagerService;
import com.ffaikrw.instagram.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	
	// 파일 경로 접근
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
		
	}
	
	
	// 인터셉터
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") 
		.excludePathPatterns("/static/**", "/images/**", "/user/sign_out", "/post/timeline"); 
		
	}
	
}
