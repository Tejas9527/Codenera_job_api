package com.project.codenra.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.codenra.model.Job;
import com.project.codenra.model.personal_details;
import com.project.codenra.repository.Jobinfo;
import com.project.codenra.service.PersonalDetailsService;

@Controller
public class clientController {

	@Autowired
	private Jobinfo jobrepo;
	
	@Autowired
	private PersonalDetailsService personalDetailsService;
	
	@GetMapping("/")
	public String welcome(Model model)
	{
		List<Job> alljob =	jobrepo.findAll();
		
		model.addAttribute("jobs",alljob);
		return "viewjobsclient";
	}
	
	@RequestMapping("/searchjob")
    public String jobsearch(@RequestParam String jobPosition, Model model) {
        List<Job> searchResults = jobrepo.findByJobPosition(jobPosition);
        model.addAttribute("jobs", searchResults);
        return "searchjob"; 
    }
	
	@GetMapping("/addstudent")
    public String addStudent(@RequestParam(value = "jobLink", required = false) String jobLink, Model model) {
        model.addAttribute("jobLink", jobLink);
        return "addstudent";
    }
	
	@PostMapping("/addstudentinfo")
	public String add(@RequestParam("fullname") String fullname, @RequestParam("email") String email,
			@RequestParam("phone") Long phone, @RequestParam("graduationdetails") String graduationDetails,
			@RequestParam("masterdetails") String masterDetails, @RequestParam("resume") MultipartFile resume,
			@RequestParam("jobLink") String link) {
		
		personal_details personalDetails = new personal_details();
		personalDetails.setFullname(fullname);
		personalDetails.setEmail(email);
		personalDetails.setPhone(phone);
		personalDetails.setGraduation_details(graduationDetails);
		personalDetails.setMaster_details(masterDetails);

		try {
			personalDetails.setResume(resume.getBytes());
			personalDetails.setResumename(resume.getOriginalFilename());
		} catch (Exception e) {
			e.printStackTrace(); 
		}

		personalDetailsService.savePersonalDetails(personalDetails);

		 return "redirect:" + link;
	}
	@GetMapping("/viewPdf/{id}")
	public void viewPdf(@PathVariable int id, HttpServletResponse response) {
	    personal_details personalDetails = personalDetailsService.getPersonalDetailsById(id);

	    if (personalDetails != null && personalDetails.getResume() != null) {
	        try {
	            response.setContentType("application/pdf");
	            response.setHeader("Content-Disposition", "inline; filename=" + personalDetails.getResumename());
	            response.getOutputStream().write(personalDetails.getResume());
	            response.getOutputStream().flush();
	            
	            // Open in a new tab using JavaScript
	            String script = "window.open('about:blank').document.body.innerHTML='<embed width=\"100%\" height=\"100%\" src=\"data:application/pdf;base64,"
	                            + java.util.Base64.getEncoder().encodeToString(personalDetails.getResume())
	                            + "\" type=\"application/pdf\">';";
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<html><head><script type=\"text/javascript\">" + script + "</script></head><body></body></html>");
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	}

}
