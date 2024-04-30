package com.project.codenra.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String jobPosition;
    private String jobDescription;
    private String jobLink;
    private LocalDate dateAdded;

    public Job() {
        this.dateAdded = LocalDate.now(); // Set dateAdded to current date
    }

    public Job(String jobPosition, String jobDescription, String jobLink) {
        this.jobPosition = jobPosition;
        this.jobDescription = jobDescription;
        this.jobLink = jobLink;
        this.dateAdded = LocalDate.now(); // Set dateAdded to current date
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getJobLink() {
        return jobLink;
    }

    public void setJobLink(String jobLink) {
        this.jobLink = jobLink;
    }

    public LocalDate getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(LocalDate dateAdded) {
        this.dateAdded = dateAdded;
    }

}
