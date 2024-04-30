package com.project.codenra.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.codenra.model.Admin;

public interface Admininfo extends JpaRepository<Admin, Integer> {
	 public Admin findByEmail(String email);
}
