package com.project.codenra.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.codenra.model.Admin;
import com.project.codenra.model.Job;
import com.project.codenra.model.personal_details;
import com.project.codenra.repository.Admininfo;
import com.project.codenra.repository.Jobinfo;
import com.project.codenra.service.PersonalDetailsService;
import com.project.codenra.service.StudentCsvService;

@Controller
public class AdminController {

	@Autowired
	private Admininfo adminrepo;
	@Autowired
	private Jobinfo jobrepo;
	 @Autowired
	    private StudentCsvService studentCsvService;

	@Autowired
	private PersonalDetailsService personalDetailsService;

	@GetMapping("/log")
	public String home() {
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, RedirectAttributes redirectAttributes, Model model) {
	    Admin ad = adminrepo.findByEmail(email);

	    if (ad != null && ad.getEmail().equals(email) && ad.getPassowrd().equals(password)) {
	        return "redirect:/dashboard";
	    } else {
	        redirectAttributes.addFlashAttribute("error", "Invalid username or password");
	        return "redirect:/login";
	    }
	}
	@GetMapping("/login")
	public String showLoginPage(Model model) {
	    // Retrieve flash attribute
	    Object error = model.asMap().get("error");
	    
	    if (error != null) {
	        model.addAttribute("error", error); // Add it to the model for displaying in the view
	    }
	    
	    return "login";
	}


	@GetMapping("/dashboard")
    public String dashboard(Model model) {
        List<Job> allJobs = jobrepo.findAll();
        model.addAttribute("jobs", allJobs);
        return "dashboard";
    }

	@GetMapping("/addJob")
	public String addjobs() {
		return "addjobs";
	}

	@PostMapping("/addJob")
    public String add(@RequestParam MultiValueMap<String, String> formData) {
        List<String> jobPositions = formData.get("jobPosition");
        List<String> jobDescriptions = formData.get("jobDescription");
        List<String> jobLinks = formData.get("jobLink");

        int size = jobPositions.size();
        for (int i = 0; i < size; i++) {
            Job job = new Job();
            job.setJobPosition(jobPositions.get(i));
            job.setJobDescription(jobDescriptions.get(i));
            job.setJobLink(jobLinks.get(i));
            jobrepo.save(job);
        }

        return "redirect:/dashboard";
    }

	@GetMapping("/viewJobs")
	public String getalljobs(Model model) {
		List<Job> alljob = jobrepo.findAll();
		model.addAttribute("jobs", alljob);
		return "viewjobs";
	}

	@GetMapping("/editJob/{id}")
	public String editJob(@PathVariable int id, Model model) {
		Optional<Job> job = jobrepo.findById(id);
		if (job.isPresent()) {
			model.addAttribute("job", job.get());
			return "edit";
		} else {
			return "redirect:/dashboard";
		}
	}

	@PostMapping("/updateJob")
	public String updateJob(@ModelAttribute Job job) {
		jobrepo.save(job);
		return "redirect:/dashboard";
	}

	@GetMapping("/deleteJob/{id}")
	public String deleteJob(@PathVariable int id) {
		jobrepo.deleteById(id);
		return "redirect:/dashboard";
	}

	@GetMapping("/viewstudentinfo")
	public String displayAllData(Model model) {
		List<personal_details> allDetails = personalDetailsService.getAllPersonalDetails();
		model.addAttribute("details", allDetails);
		return "viewstudentinfo";
	}
	
	@GetMapping("/downloadCsv")
    public ResponseEntity<byte[]> downloadCsv(HttpServletResponse response) throws IOException {
        byte[] csvBytes = studentCsvService.generateCsvBytes();

        // Set response headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", "student_data.csv");

        // Return the CSV file as a ResponseEntity
        return new ResponseEntity<>(csvBytes, headers, HttpStatus.OK);
    }
	
	@GetMapping("/logout")
	public String logout()
	{
		return "redirect:/";
	}
}
