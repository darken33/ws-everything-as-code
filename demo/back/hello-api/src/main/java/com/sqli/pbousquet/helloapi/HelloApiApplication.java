package com.sqli.pbousquet.helloapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class })
public class HelloApiApplication {

	public static void main(String[] args) {
        SpringApplication.run(HelloApiApplication.class, args);
	}

}
