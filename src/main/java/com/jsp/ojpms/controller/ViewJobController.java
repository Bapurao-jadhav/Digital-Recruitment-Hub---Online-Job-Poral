package com.jsp.ojpms.controller;

import java.io.IOException;
import java.net.http.HttpClient;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.service.spi.ServiceException;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet(value="/viewjob")
public class ViewJobController extends HttpServlet {
	
	@Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		
		List<Job> list;
     
		if(search!=null) {
			list=JobDao.getAllJob(search);
			req.setAttribute("jobs", list);
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
			
			
		}else {
			list=JobDao.getAllJobs();
			req.setAttribute("jobs", list);
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
		}

		
	
		
		
		}
	
	

}
