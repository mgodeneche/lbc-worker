package com.mgodeneche.repositories;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.mgodeneche.entity.Research;

public interface ResearchRepository extends MongoRepository<Research, String>{
	@Query("{id:'?0'}")
	public Research findById(Long id);
	public List<Research> findAll();
}
