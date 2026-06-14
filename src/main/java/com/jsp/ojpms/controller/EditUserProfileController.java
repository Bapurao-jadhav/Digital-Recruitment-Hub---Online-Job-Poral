package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value="/edituserprofiles")
public class EditUserProfileController extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String stringId = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		
		int id=Integer.parseInt(stringId);
		
		System.out.println(stringId);
		System.out.println(name);
		System.out.println(email);
		System.out.println(password);
		
		User user = new User();
		user.setId(id);
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		
		UserDao.updateProfile(user);
		
		req.setAttribute("msg","Profile Updated Successfully");
		req.getRequestDispatcher("user-dashboard.jsp").forward(req, resp);
		
		
	}

}
