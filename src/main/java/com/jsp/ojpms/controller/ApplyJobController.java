package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.EmailUtil;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;
@WebServlet(value="/applyjob")
public class ApplyJobController extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String stringId = req.getParameter("jobId");
		
		int id=Integer.parseInt(stringId);
		
		
		HttpSession session = req.getSession();//jo user current login hai uska id leke ayega
		User user = (User)session.getAttribute("user");
		
		
		EntityManager em = JPAUtil.getEm();
		Job job=em.find(Job.class, id);
		
		
		Application application = new Application();
		application.setJob(job);
		application.setUser(user);
		
		//System.out.println("Request reached to applyjob controller");
		
		if(ApplicationDao.isAlreadyApplied(user.getId(), job.getId())) {
			System.out.println("Already Applied");
			
			req.setAttribute("appliedId", id);
			req.setAttribute("error", "Already Aplied");
			
			List<Job> list = JobDao.getAllJobs();
			req.setAttribute("jobs", list);
			
			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
		}
		else {
			ApplicationDao.saveApplication(application);
			String subject="Application for"+job.getTitle();
			String message="Hello"+user.getName()+",\n \n "+"you have successfully"
			       +"applied for the job:"+job.getTitle()+"Location:"+job.getLocation()+
			       "\n \n "+"We will notify you soon"+"\n \n"
			       +"Based Regards \n Job Portal Team";
			
			EmailUtil.sendEmail(user.getEmail(), subject,message);
			
			
			
			//Recruiter Mail
			User recruiter=job.getRecruiter();
			String recruiterSubject="New Application for"+job.getTitle();
			String recruiterMessage="Hello, \n \n A new candidate has applied..\n \n "+
			                      "Name: "+user.getName()+"\n"+
					              "Email:"+user.getEmail()+"\n"+
			                      "Please login to review..."
			                      +"Based Regards \n Job Portal Team";
			
			EmailUtil.sendEmail(recruiter.getEmail(), recruiterSubject, recruiterMessage);
			
			
		}
		resp.sendRedirect("viewjob");//sending request to the controller
	 
	
		
		
		
		
	}
	

}
