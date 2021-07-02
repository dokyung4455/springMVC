package com.dokyung.weather.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	private String us_name;
	private String us_id;
	private String us_pw;
	private String us_sex;
	private String us_city;
	private String us_dist;
	
}
