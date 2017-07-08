package com.mgodeneche.controllers;

import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mgodeneche.entity.Research;
import com.mgodeneche.repositories.ResearchRepository;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	Boolean debug = true;
	
	@Autowired
	ResearchRepository repository;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "searchForm";
	}
	
	@RequestMapping(value="/newSearch")
	public String createNewResearch(HttpServletRequest  req, ModelMap model){
		Research r = instanciateResearch(req);
		repository.save(r);
		
		return getResearchList(req, model);
	}
	@RequestMapping(value="/researchList")
	public String getResearchList(HttpServletRequest  req, ModelMap model){
		List<Research> researchlist = repository.findAll();
		model.addAttribute("researchList", researchlist);
		if(debug){
			for(Research r : researchlist){
				System.out.println(r.toString());
			}
		}
		return "list";
	}
	private Research instanciateResearch(HttpServletRequest  req){
		Research research = new Research();
		research.setRegion((String) req.getAttribute("region"));
		research.setDepartement((String) req.getAttribute("dept"));
		research.setKeywords((String) req.getAttribute("keywords"));
		research.setMinPrice((Float) req.getAttribute("minPrice"));
		research.setMaxPrice((Float) req.getAttribute("maxPrice"));
		research.setStartDate(LocalDateTime.now());
		research.setValid(true);
		
		return research;
	}
}
