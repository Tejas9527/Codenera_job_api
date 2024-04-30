package com.project.codenra.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.codenra.model.Job;

public interface Jobinfo extends JpaRepository<Job, Integer> {
	public List<Job> findByJobPosition(String jobPosition);
}
