package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import interceptor.CheckAdminLoginInterceptor;
import interceptor.CheckBossLoginInterceptor;
import interceptor.CheckLoginInterceptor;
import interceptor.CheckRecoveryInterceptor;
import interceptor.CheckRegisterInterceptor;

// for Test By Mimicker0903
//import xun.AOP.LogAspect;

@Configuration
@EnableWebMvc
@EnableAspectJAutoProxy
/* 掃描的package */
@ComponentScan({
	"config", 
	"webUser",
	"xun",
	"model",
	"service",
	"dao",
	"controller",
	"board",
	"dashborad",
	"interceptor",
	"_Init"
	})

public class WebAppConfig implements WebMvcConfigurer {
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver  resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		return resolver;
	}
	
	// By Mimicker0903
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	
	/* for interceptor */
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new CheckLoginInterceptor());
		registry.addInterceptor(new CheckRegisterInterceptor());
		registry.addInterceptor(new CheckRecoveryInterceptor());
		registry.addInterceptor(new CheckBossLoginInterceptor());
		registry.addInterceptor(new CheckAdminLoginInterceptor());
    }
	
	// 為了處理靜態檔案必須加入下列敘述：只要是 /css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
	// 為了處理靜態檔案必須加入下列敘述：只要是 /js/開頭的任何請求，都轉到/WEB-INF/views/js/去尋找
	// 為了處理靜態檔案必須加入下列敘述：只要是 /image/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**")
				.addResourceLocations("/WEB-INF/views/css/");
		registry.addResourceHandler("/js/**")
				.addResourceLocations("/WEB-INF/views/js/");
		// By Mimicker0903
		registry.addResourceHandler("/images/**")
				.addResourceLocations("/WEB-INF/views/images/"); 
		registry.addResourceHandler("/Images/**")
				.addResourceLocations("/Images/");
		// By mp4056
		registry.addResourceHandler("/productInfo/images/**")
		.addResourceLocations("/WEB-INF/views/images/productInfo/images/");
		// By Brandon-Chen1122
		registry.addResourceHandler("/star/**")
		.addResourceLocations("/WEB-INF/views/orange/images/");
//		registry.addResourceHandler("/undefined")
//				.addResourceLocations("/Images/LOGO1-removebg-preview.png");
	}
	
	
}
