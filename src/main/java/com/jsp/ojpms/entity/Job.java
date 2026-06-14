package com.jsp.ojpms.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="jobs")
public class Job {
	@Id
	@GeneratedValue(strategy =GenerationType.AUTO)
	private int id;
	private String title;
	private String description;
	private String location;
	private double salary;
	@ManyToOne
	private User recruiter;
	
	public Job() {

	}

	public Job(String title, String description, String location, double salary, User recruiter) {
		
		this.title = title;
		this.description = description;
		this.location = location;
		this.salary = salary;
		this.recruiter = recruiter;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public User getRecruiter() {
		return recruiter;
	}

	public void setRecruiter(User recruiter) {
		this.recruiter = recruiter;
	}

	@Override
	public String toString() {
		return "Job [id=" + id + ", title=" + title + ", description=" + description + ", location=" + location
				+ ", salary=" + salary + ", recruiter=" + recruiter + "]";
	}
	
	

}
