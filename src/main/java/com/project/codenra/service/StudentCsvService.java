package com.project.codenra.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.codenra.model.personal_details;
import com.project.codenra.repository.personal_detailsinfo;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

@Service
public class StudentCsvService {

    @Autowired
    private personal_detailsinfo personalDetailsRepository;

    public byte[] generateCsvBytes() throws IOException {
        List<personal_details> students = personalDetailsRepository.findAll();

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        OutputStreamWriter writer = new OutputStreamWriter(outputStream);

        // Write CSV header
        writer.write("Full Name, Email, Phone, Graduation Details, Master Details, Resume Name\n");

        // Write student data to CSV
        for (personal_details student : students) {
            writer.write(String.format("%s, %s, %s, %s, %s, %s\n",
                    student.getFullname(),
                    student.getEmail(),
                    student.getPhone(),
                    student.getGraduation_details(),
                    student.getMaster_details(),
                    student.getResumename()));
        }

        writer.flush();
        writer.close();

        return outputStream.toByteArray();
    }
}

