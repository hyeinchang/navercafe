package com.itbank.navercafe.comon.file.configure;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class FileConfigure {
	@Configuration
	public class FileConfig {
		@Bean
		public CommonsMultipartResolver multipartResolver() {
			CommonsMultipartResolver mr = new CommonsMultipartResolver();
			// 1KB(1024BYTE) -> 1MB(1024KB)
			mr.setMaxUploadSize(52428800);	// 50MB
			mr.setDefaultEncoding("utf-8");
			return mr;
		}
	}
}
