<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Dashboard</title>

<style>

/* RESET */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(
        -45deg,
        #0f172a,
        #1e293b,
        #0b1220,
        #111827
    );
    background-size:400% 400%;
    animation:gradientMove 15s ease infinite;
    color:white;
}

@keyframes gradientMove{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

/* SIDEBAR (same as user dashboard style) */
.sidebar{
    position:fixed;
    left:0;
    top:0;

    width:260px;
    height:100vh;

    background:linear-gradient(
    180deg,
    #9ca3af,
    #6b7280,
    #374151,
    #1f2937);

    border-right:1px solid rgba(255,255,255,.12);

    box-shadow:10px 0 40px rgba(0,0,0,.25);

    padding-top:30px;
    z-index:1000;
}
.sidebar h2{
    text-align:center;
    font-size:28px;
    margin-bottom:35px;
    color:#f59e0b;
}

.sidebar a{
    display:block;
    padding:16px 25px;
    color:#d1d5db;
    text-decoration:none;
    transition:.4s;
    border-left:4px solid transparent;
}

.sidebar a:hover{
    background:rgba(255,255,255,.08);
    border-left:4px solid #f59e0b;
    color:#fff;
    padding-left:35px;
}

/* MAIN SHIFT */
.main{
    margin-left:260px;
}

/* NAVBAR */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:25px 40px;
    background:rgba(255,255,255,.05);
    backdrop-filter:blur(18px);
    border-bottom:1px solid rgba(255,255,255,.08);
}

.logo{
    font-size:28px;
    font-weight:800;
    color:#f59e0b;
}

.user-name{
    color:#e2e8f0;
    font-weight:600;
}

/* HERO */
.hero{
    text-align:center;
    padding:70px 40px;
}

.hero h1{
    font-size:60px;
    background:linear-gradient(90deg,#fff,#cbd5e1,#fff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    margin-bottom:20px;
}

.hero p{
    color:#cbd5e1;
    max-width:800px;
    margin:auto;
    line-height:1.8;
}

/* BUTTONS (same orange theme) */
.buttons{
    margin-top:30px;
}

.btn{
    display:inline-block;
    text-decoration:none;
    padding:14px 28px;
    border-radius:30px;
    margin:10px;
    color:white;
    font-weight:600;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    transition:.3s;
}

.btn:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(245,158,11,.4);
}

.logout{
    background:linear-gradient(45deg,#ef4444,#dc2626);
}

/* STATS */
.stats{
    display:flex;
    justify-content:center;
    gap:25px;
    flex-wrap:wrap;
    padding:40px;
}

.stat-card{
    background:rgba(255,255,255,.06);
    backdrop-filter:blur(18px);
    padding:25px;
    border-radius:20px;
    min-width:220px;
    text-align:center;
    border:1px solid rgba(255,255,255,.08);
    transition:.4s;
}

.stat-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 35px rgba(0,0,0,.4);
}

.stat-card h2{
    color:#f59e0b;
    font-size:40px;
}

/* FEATURES */
.features{
    display:flex;
    justify-content:center;
    gap:25px;
    flex-wrap:wrap;
    padding:20px 40px 60px;
}

.feature{
    background:rgba(255,255,255,.06);
    backdrop-filter:blur(18px);
    padding:25px;
    border-radius:20px;
    width:280px;
    text-align:center;
    border:1px solid rgba(255,255,255,.08);
    transition:.4s;
}

.feature:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 35px rgba(0,0,0,.4);
}

.feature h3{
    color:#60a5fa;
    margin-bottom:10px;
}

</style>
</head>

<body>

<%
if(session.getAttribute("user")==null)
response.sendRedirect("login.jsp");
%>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>OJPMS</h2>

    <a href="home.jsp">🏠 Home</a>
    <a href="post-job.jsp">📝 Post Job</a>
    <a href="displayjob">📝 Available Job</a>
 	
    <a href="view-applications">📄 Applications</a>
    <a href="recruiterprofile?id=${user.id}">👤 Profile</a>
    <a href="logout">🚪 Logout</a>
</div>

<form action="displayjob">
	<input type="text" value="Available Jobs">
</form>

<!-- MAIN -->
<div class="main">

    <div class="navbar">
        <div class="logo">Recruiter</div>
        <div class="user-name">Welcome, ${user.name}</div>
    </div>
    
    <p style="color:#22c55e; text-align:center; margin-top:10px;">${msg}</p>

    <div class="hero">
        <h1>Find The Perfect Talent</h1>

        <p>
            Post jobs, manage applications and connect with talented candidates through OJPMS.
        </p>

        <div class="buttons">
            <a href="post-job.jsp" class="btn">📝 Post Job</a>
            <a href="recruiterprofile?id=${user.id}" class="btn">👤 Profile</a>
            <a href="logout" class="btn logout">🚪 Logout</a>
        </div>
    </div>

    <div class="stats">

        <div class="stat-card">
            <h2>500+</h2>
            <span>Applications</span>
        </div>

        <div class="stat-card">
            <h2>150+</h2>
            <span>Recruiters</span>
        </div>

        <div class="stat-card">
            <h2>${jobcount }</h2>
            <span>Active Jobs</span>
        </div>

    </div>

    <div class="features">

        <div class="feature">
            <h3>Post Jobs</h3>
            <p>Create job postings easily.</p>
        </div>

        <div class="feature">
            <h3>Hire Faster</h3>
            <p>Find candidates quickly.</p>
        </div>

        <div class="feature">
            <h3>Manage Hiring</h3>
            <p>Track applicants efficiently.</p>
        </div>

    </div>

</div>

</body>
</html>