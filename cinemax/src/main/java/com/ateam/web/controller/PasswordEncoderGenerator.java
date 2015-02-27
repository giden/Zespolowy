package com.ateam.web.controller;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 
public class PasswordEncoderGenerator {
 
  public static void main(String[] args) {
 
	int i = 0;
	while (i < 1) {
		String password = "123";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
 
		System.out.println(hashedPassword);
		i++;
	}
 
  }
}