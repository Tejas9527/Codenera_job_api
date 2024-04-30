package com.project.codenra.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.codenra.model.personal_details;
import com.project.codenra.repository.personal_detailsinfo;

@Service
public class PersonalDetailsService {

    @Autowired
    private personal_detailsinfo personalDetailsRepository;

    public void savePersonalDetails(personal_details personalDetails) {
    	personalDetailsRepository.save(personalDetails);
    }
    public List<personal_details> getAllPersonalDetails() {
        return personalDetailsRepository.findAll();
    }
    public personal_details getPersonalDetailsById(int id) {
        return personalDetailsRepository.findById(id).orElse(null);
    }
}
