package com.spring.hubinoinstitution.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.hubinoinstitution.model.Training;
import com.spring.hubinoinstitution.model.Users;
import com.spring.hubinoinstitution.service.TrainingService;
import com.spring.hubinoinstitution.service.UserService;

@Controller
public class Institution {
	@Autowired
	private UserService userService;
	
	@Autowired
	private TrainingService trainingService;

	@GetMapping("/")
	public String registerUser() {
		return "register";
	}

	@GetMapping("/registerUser")
	public String registerUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, @RequestParam(name = "c_password") String c_password
			){
		Users users =new Users();
		users.setUserName(username);
		users.setPassword(password);
		String str=userService.registerUser(users);
		if(str=="success")
		return "login";
		else
		return "failure";
	}
	
	@GetMapping("/loginUser")
	public String loginUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password) {
		userService.loginUser(username, password);
		return "training";
	}

	@GetMapping("/training")
	public String training(@RequestParam(name = "course") String course, @RequestParam(name = "trainer") String trainer,
			@RequestParam(name = "start_date") String start_date, @RequestParam(name = "end_date") String end_date,
			@RequestParam(name = "desc") String desc) {
		Training training = new Training();
		training.setCourse(course);
		training.setTrainer_name(trainer);
		training.setStart_date(start_date);
		training.setEnd_date(end_date);
		training.setDescription(desc);
		trainingService.saveTrainingDetails(training);
		return "todo notification to send";
	}
}
