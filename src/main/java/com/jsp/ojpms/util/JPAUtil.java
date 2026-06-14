package com.jsp.ojpms.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

//We are using singltone design pattern to create object of EntityManager
public class JPAUtil {
	
	private static EntityManager em=null;
	
	public JPAUtil() {

	}
	
	public static EntityManager getEm() {
		
		
		if(em==null) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("jsp");
			 em = emf.createEntityManager();
			return em;
		}else {
			
			return em;
		}
	}
	
//	public static EntityManager getEms() {
//		
//		
//		return Persistence.createEntityManagerFactory("jsp").createEntityManager();
//	}

}
