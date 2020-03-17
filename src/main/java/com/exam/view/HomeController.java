package com.exam.view;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exam.view.domain.ExamRIO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class); 
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Welcome home!");
		
		//모델에 하나의 데이터를 보낼 때 
		model.addAttribute("name","woopi"); //name이란 이름에 "woopi"라는 값을 넣음		
		model.addAttribute("addr","수원");	//addr이란 이름에 "수원"라는 값을 넣음
		
		//모델에 클래스 형태로 보낼 때
		ExamRIO exam = new ExamRIO("학생0",209901,91,100,95);	//클래스 객체 생성(examRIO형의 객체에 값을 담았다.)
		model.addAttribute("exam", exam );	//생성한 클래스 객체를 model에 담음
	
		//모델에 클래스 구조의 리스트로 보낼 때
		List<ExamRIO> exams = new ArrayList<ExamRIO>();		//list선언
		//examRIO형태의 객체를 만들면서 동시에 list에 넣는다. 
		//examRIO형태의 데이터를 list에 넣음
		exams.add(new ExamRIO("학생1",209901,95,100,95));
		exams.add(new ExamRIO("학생2",209902,90,90,100));
		exams.add(new ExamRIO("학생3",209903,85,80,95));
		exams.add(new ExamRIO("학생4",209904,75,100,85));
		exams.add(new ExamRIO("학생5",209905,85,70,75));
		exams.add(new ExamRIO("학생6",209906,95,80,95));
		exams.add(new ExamRIO("학생7",209907,85,100,85));
		exams.add(new ExamRIO("학생8",209908,75,90,65));
		exams.add(new ExamRIO("학생9",209909,85,80,95));
		model.addAttribute("exams", exams );	//생성한 클래스 객체를 model에 담음
		
		//모델을 담은 후 home.jsp로 이동한다.
		return "home";
	}
	
}
