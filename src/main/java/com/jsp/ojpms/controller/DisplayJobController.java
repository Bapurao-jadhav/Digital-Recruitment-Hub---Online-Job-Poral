package com.jsp.ojpms.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;

@WebServlet("/displayjob")
public class DisplayJobController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		List<Job> list = JobDao.getRecruiterJobs(user);
		
		for (Job job : list) {
			System.out.println(job);
		}
		
		req.setAttribute("jobs", list);
		
		req.getRequestDispatcher("display-job.jsp").forward(req, resp);
		
	}
}
