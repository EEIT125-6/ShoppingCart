package SpringBootActivation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication // 代表這是啟動SpringBoot的類別
						// 包含了三個標籤 @EnableAutoConfiguration @ComponentScan @Configuration
public class SpringBootActivationSequence {
	public static void main(String[] args) {
		SpringApplication.run(SpringBootActivationSequence.class, args);
		// 此方法中的SpringApplication會進行啟動的動作
	}

}
