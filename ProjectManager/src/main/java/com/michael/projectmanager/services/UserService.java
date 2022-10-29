package com.michael.projectmanager.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.michael.projectmanager.models.LoginUser;
import com.michael.projectmanager.models.User;
import com.michael.projectmanager.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
//      Logic
//    	Reject if email is taken (present in database)
//    	1. Find user in DB by email
    	Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
    	
//    	2.if email is present, reject 
    	if(optionalUser.isPresent()){
    		result.rejectValue("email", "Unique", "This email is already registered!");
    	}
//    	"Unique" can be anything- its just a category that we can match - dont really use this
//    	3.reject if password does'nt match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Matches", "The password and confirm password don't match!");
    	}
//    	4.return null if result has errors
    	if(result.hasErrors()) {
    		return null;
    	}
//    	5.hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);
    }
	
	
//  LOGIN
  public User login(LoginUser newLogin, BindingResult result) {
   
//   	1. Find user in DB by email
  	Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());

  	
  	
//  	2.if email is NOT present, reject 
  	if(!optionalUser.isPresent()) {
  		result.rejectValue("email", "Unique", "This email is not registered!");
  		return null;
  	}
//  	3.1 grab the user from potential user
  	User user = optionalUser.get();
  	
//  	3.2 if Bcrypt password match fails
  	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
  	    result.rejectValue("password", "Matches", "Invalid Password!");
  	}
  	
//  	4.if result has errors, return
  	if(result.hasErrors())
  		return null;
//  	5.otherwise return the user object
      return user;
  
  }
    
}
