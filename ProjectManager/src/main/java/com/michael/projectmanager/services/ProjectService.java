package com.michael.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.michael.projectmanager.models.Project;
import com.michael.projectmanager.repositories.ProjectRepository;

@Service
public class ProjectService {
	@Autowired
	private ProjectRepository projectRepo;
	
//	FULL CRUD
//	CREATE
	public Project createProject(Project project) {
		return projectRepo.save(project);
	}
	
//	FIND ALL
	public List<Project> allProjects(){
		return projectRepo.findAll();
	}
//	FIND ONE
	public Project oneProject(Long id) {
		Optional<Project> optionalProject = projectRepo.findById(id);
				if(optionalProject.isPresent()) {
					return optionalProject.get();
				}else {
					return null;
				}
	}
	
//	EDIT
	public Project editProject(Project project) {
		return projectRepo.save(project);
	}
	
	
//	DELETE
	public void deleteProject(Long id) {
		projectRepo.deleteById(id);
	}
}
