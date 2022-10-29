package com.michael.dojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.michael.dojo.models.Dojo;
import com.michael.dojo.models.Ninja;
import com.michael.dojo.repositories.DojoRepository;
import com.michael.dojo.repositories.NinjaRepository;

@Service
public class MainService {

	
	@Autowired
	private DojoRepository dojoRepo;
	
	@Autowired
	private NinjaRepository ninjaRepo;
	
//	find all Ninjas
	public List<Ninja> allNinjas(){
		return ninjaRepo.findAll();
	}
//	find all Dojos
	public List<Dojo> allDojos(){
		return dojoRepo.findAll();
	}
	
//	create Ninjas
	public Ninja createNinja(Ninja ninja) {
		return ninjaRepo.save(ninja);
	}
//	create Dojos
	public Dojo createDojo(Dojo dojo) {
		return dojoRepo.save(dojo);
	}
	
//	find one dojo
	public Dojo oneDojo(Long dojoId) {
		Optional<Dojo> optionalDojo = dojoRepo.findById(dojoId);
		if(optionalDojo.isPresent()) {
			return optionalDojo.get();
		}else {
			return null;
		}
	}
}
