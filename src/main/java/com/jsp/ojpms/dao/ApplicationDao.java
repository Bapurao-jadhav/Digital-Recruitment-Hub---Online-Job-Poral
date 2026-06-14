package com.jsp.ojpms.dao;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicationDao {
	
	
	public static void saveApplication(Application application) {
		
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.persist(application);
		et.commit();
	}
	
	public static boolean isAlreadyApplied(int uId,int jobId)
	{
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2");//here user.id and job.id are variable name which is provided in entity class
		query.setParameter(1, uId);
		query.setParameter(2, jobId);
		List list = query.getResultList();
		
		boolean empty = list.isEmpty();
		
		System.out.println("empty:"+empty);
		
		return !empty;
		
		
		
		
	}

}
