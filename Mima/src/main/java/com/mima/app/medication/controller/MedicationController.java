package com.mima.app.medication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/medication/*")
public class MedicationController {

	
	@GetMapping("/pillSearch")
	public void pillSearch() {
		
	}
	
	
	    
	
}
