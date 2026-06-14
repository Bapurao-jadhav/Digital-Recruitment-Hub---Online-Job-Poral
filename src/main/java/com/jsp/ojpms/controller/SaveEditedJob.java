package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;


@WebServlet("/saveEditedJob")
public class SaveEditedJob extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String location = req.getParameter("location");
		String salary = req.getParameter("salary");
		int id = Integer.parseInt(req.getParameter("id"));

//		
		System.out.println("title:"+title);
		System.out.println("description:"+description);
		System.out.println("location:"+location);
		System.out.println("salary:"+salary);
		
		
		
		Job job = new Job();
		job.setId(id);
		job.setTitle(title);
		job.setDescription(description);
		job.setLocation(location);
		job.setSalary(Double.parseDouble(salary));
		
		HttpSession session = req.getSession();
		User recruiter = (User)session.getAttribute("user");
		job.setRecruiter(recruiter);
		
		System.out.println(job);
		JobDao.updateJobById(job);
		
		resp.sendRedirect("display-job.jsp");
	}
}
