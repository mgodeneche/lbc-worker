package com.mgodeneche.entity;

import java.time.LocalDateTime;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "research")
public class Research {

	@Id
	@GeneratedValue
	private Long id;
	private String region;
	private String departement;
	private String keywords;
	private Float minPrice;
	private Float maxPrice;
	private Integer maxResult;
	private LocalDateTime startDate;
	private Boolean valid;
	
	
	public Research(){
		super();
		
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDepartement() {
		return departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String item) {
		this.keywords = item;
	}
	public Float getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Float minPrice) {
		this.minPrice = minPrice;
	}
	public Float getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Float maxPrice) {
		this.maxPrice = maxPrice;
	}
	public Integer getMaxResult() {
		return maxResult;
	}
	public void setMaxResult(Integer maxResult) {
		this.maxResult = maxResult;
	}
	public LocalDateTime getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public Boolean getValid() {
		return valid;
	}

	public void setValid(Boolean valid) {
		this.valid = valid;
	}

	@Override
	public String toString() {
		return "Research on ["+keywords+"] in ["+region+"] + ["+departement+"] between ["+minPrice+"] and ["+maxPrice+"] started ["+startDate+"]";
	}

	

	
	
}
