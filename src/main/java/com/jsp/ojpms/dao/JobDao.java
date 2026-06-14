package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class JobDao {

	public static void saveJob(Job job) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(job);
		et.commit();
//		em.close();

	}

	public static List<Job> getAllJobs() {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job");
		List<Job> list = query.getResultList();

		return list;

	}

	public static List<Job> getAllJob(String search) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job WHERE title LIKE?1 OR location LIKE ?1");
		query.setParameter(1, search);
		List<Job> list = query.getResultList();

		return list;

	}

	public static long jobCount(User u) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("SELECT count(*) FROM Job Where recruiter=?1");
		query.setParameter(1, u);
		long result = (long) query.getSingleResult();
		return result;
	}
	
	public static List<Job> getRecruiterJobs(User user) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job WHERE recruiter =?1");
		query.setParameter(1, user);
		List<Job> list = query.getResultList();

		return list;

	}
	public static void deleteJob(User user, int id) {
	    EntityManager em = JPAUtil.getEm();
	    EntityTransaction et = em.getTransaction();
	    
	    et.begin();

	
	    Query query = em.createQuery("DELETE FROM Application a WHERE a.job.id = :jobId");
	    query.setParameter("jobId", id);
	    query.executeUpdate();

	 
	    Job job = em.find(Job.class, id);
	    if (job != null) {
	        em.remove(job);
	    }
	    et.commit();
	   
	}
	
	public static Job getJobById(int id) {
		EntityManager em = JPAUtil.getEm();
		Job job1 = em.find(Job.class, id);
		return job1;
	}
	
	public static void updateJobById(Job job) {
		EntityManager em = JPAUtil.getEm();
		Job job1 = em.find(Job.class, job.getId());
		job1.setTitle(job.getTitle());
		job1.setDescription(job.getDescription());
		job1.setLocation(job.getLocation());
		job1.setSalary(job.getSalary());
		
		System.out.println("Job1 : ======="+job1);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(job1);
		et.commit();
		
		
	}
}
