# 💼 Digital Recruitment Hub — An Online Job Portal

A full-stack web application that connects **Job Seekers** and **Recruiters** on a single platform. Built using Core Java, Servlets, JSP, JPA (Hibernate), and PostgreSQL — deployed as a WAR on Apache Tomcat.

---

## 📌 Features

### 👤 Job Seeker
- Register & Login with role-based session management
- Browse and view available job listings
- Apply for jobs with one click
- View and edit personal profile
- Forgot password via email OTP

### 🏢 Recruiter
- Register & Login as a Recruiter
- Post new job openings (title, description, location, salary)
- View, edit, and delete posted jobs
- View job application count on dashboard
- Manage recruiter profile

### 🔐 Common
- Role-based routing — `JOB_SEEKER` and `RECRUITER` land on separate dashboards
- Session-based authentication
- Password utility (encode/decode support)
- Email notification via JavaMail API

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Frontend | JSP, JSTL, HTML, CSS |
| Backend | Java Servlets (Java EE) |
| ORM | Hibernate 5.6 / JPA 2.1 |
| Database | PostgreSQL |
| Build Tool | Maven |
| Server | Apache Tomcat |
| Email | JavaMail (javax.mail 1.6.2) |

---

## 📁 Project Structure

```
ojpms/
├── src/
│   └── main/
│       ├── java/com/jsp/ojpms/
│       │   ├── controller/        # Servlet controllers (Login, Register, PostJob, etc.)
│       │   ├── dao/               # Data Access Layer (UserDao, JobDao, ApplicationDao)
│       │   ├── entity/            # JPA Entities (User, Job, Application, EmailUtil)
│       │   └── util/              # JPAUtil (Singleton EntityManager), PasswordUtil
│       ├── resources/
│       │   └── META-INF/
│       │       └── persistence.xml   # JPA / Hibernate config
│       └── webapp/
│           ├── *.jsp              # All JSP pages (login, register, dashboards, etc.)
│           └── WEB-INF/
│               └── web.xml
└── pom.xml
```

---

## 🗄️ Database Setup

1. Install PostgreSQL and create a database:

```sql
CREATE DATABASE ojpms;
```

2. Update `persistence.xml` with your credentials:

```xml
<property name="javax.persistence.jdbc.url"      value="jdbc:postgresql://localhost:5432/ojpms" />
<property name="javax.persistence.jdbc.user"     value="your_username" />
<property name="javax.persistence.jdbc.password" value="your_password" />
```

> Hibernate is set to `hbm2ddl.auto = update` — tables are auto-created on first run.

---

## ▶️ How to Run

### Prerequisites
- Java 8+
- Maven
- PostgreSQL
- Apache Tomcat 9+

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/your-username/ojpms.git
cd ojpms

# 2. Update persistence.xml with your DB credentials

# 3. Build the WAR file
mvn clean package

# 4. Deploy ojpms.war to Tomcat webapps/ folder

# 5. Start Tomcat and open
http://localhost:8080/ojpms/
```

---

## 📄 Key Entities

### `User`
| Field | Type | Notes |
|---|---|---|
| id | int | Auto-generated PK |
| name | String | Full name |
| email | String | Unique |
| password | String | Stored/encoded |
| role | String | `JOB_SEEKER` or `RECRUITER` |

### `Job`
| Field | Type | Notes |
|---|---|---|
| id | int | Auto-generated PK |
| title | String | Job title |
| description | String | Job details |
| location | String | City/Remote |
| salary | double | CTC |
| recruiter | User | ManyToOne → User |

### `Application`
| Field | Type | Notes |
|---|---|---|
| id | int | Auto-generated PK |
| user | User | ManyToOne → User |
| job | Job | ManyToOne → Job |
| status | String | Default: `APPLIED` |

---

## 🔗 Servlet URL Mapping

| URL | Controller | Action |
|---|---|---|
| `/login` | LoginController | Authenticate user |
| `/register` | RegisterController | Register new user |
| `/postjob` | PostJobController | Recruiter posts a job |
| `/displayjob` | DisplayJobController | List all jobs |
| `/viewjob` | ViewJobController | View job details |
| `/applyjob` | ApplyJobController | Job seeker applies |
| `/deletejob` | DeleteJobController | Recruiter deletes job |
| `/editjob` | EditPostedController | Recruiter edits job |
| `/profile` | ProfileController | View user profile |
| `/editprofile` | EditProfileController | Edit user profile |
| `/logout` | LogoutController | Invalidate session |
| `/forgetpassword` | ForgetPasswordController | Email-based password reset |

---

## 👨‍💻 Author

**Bapurao Jadhav**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](www.linkedin.com/in/bapurao-jadhav-311373235)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/Bapurao-jadhav)

---

## 📃 License

This project is built for learning and portfolio purposes.
Feel free to fork and build on top of it!
