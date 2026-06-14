<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Jobs – OJPMS</title>
<style>

/* RESET */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

/* BACKGROUND */
body{
    min-height:100vh;
    background:linear-gradient(
        135deg,
        #1f2937,
        #111827,
        #0f172a,
        #020617);
    background-size:400% 400%;
    animation:bgMove 15s ease infinite;
    overflow-x:hidden;
}

@keyframes bgMove{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

/* GLOW EFFECTS */
body::before{
    content:"";
    position:fixed;
    width:900px;
    height:900px;
    background:radial-gradient(circle, rgba(255,255,255,.08), transparent 70%);
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    animation:pulseGlow 10s infinite alternate;
    z-index:-1;
}

body::after{
    content:"";
    position:fixed;
    width:600px;
    height:600px;
    background:radial-gradient(circle, rgba(255,255,255,.05), transparent 70%);
    bottom:-200px;
    right:-200px;
    animation:floatGlow 12s infinite alternate;
    z-index:-1;
}

@keyframes pulseGlow{
    from{transform:translate(-50%,-50%) scale(1);}
    to{transform:translate(-50%,-50%) scale(1.3);}
}

@keyframes floatGlow{
    from{transform:translate(0,0);}
    to{transform:translate(-120px,-120px);}
}

/* SIDEBAR */
.sidebar{
    position:fixed;
    left:0;
    top:0;
    width:260px;
    height:100vh;
    background:linear-gradient(
        180deg,
        #6b7280,
        #374151,
        #111827);
    padding-top:30px;
    border-right:1px solid rgba(255,255,255,.1);
    z-index:1000;
}

.sidebar h2{
    text-align:center;
    color:white;
    margin-bottom:30px;
    font-size:28px;
}

.sidebar a{
    display:block;
    padding:15px 25px;
    color:white;
    text-decoration:none;
    transition:.3s;
    border-left:4px solid transparent;
}

.sidebar a:hover{
    background:rgba(255,255,255,.08);
    border-left:4px solid #f59e0b;
    padding-left:35px;
}

/* MAIN CONTENT */
.main-content{
    margin-left:260px;
    padding:30px;
}

/* PAGE TITLE */
.page-title{
    text-align:center;
    font-size:52px;
    font-weight:700;
    margin-bottom:35px;
    background:linear-gradient(to right,#fff,#d1d5db,#fff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* REFRESH */
.refresh{
    text-align:center;
    margin-bottom:30px;
}

.refresh button{
    padding:14px 30px;
    border:none;
    border-radius:30px;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.refresh button:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 25px rgba(245,158,11,.40);
}

/* JOB CARD */
.job-card{
    max-width:900px;
    margin:25px auto;
    padding:30px;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(25px);
    border-radius:25px;
    border:1px solid rgba(255,255,255,.1);
    transition:.3s;
}

.job-card:hover{
    transform:translateY(-8px);
}

.job-title{
    color:white;
    font-size:30px;
    margin-bottom:15px;
}

.job-detail{
    color:#d1d5db;
    margin-bottom:10px;
    line-height:1.8;
}

.job-detail strong{
    color:white;
}

/* ACTION BUTTONS ROW */
.action-row{
    display:flex;
    gap:15px;
    margin-top:20px;
    flex-wrap:wrap;
}

/* EDIT BUTTON — amber (same as your apply-btn) */
.edit-btn{
    padding:14px 30px;
    border:none;
    border-radius:30px;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.edit-btn:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 25px rgba(245,158,11,.40);
}

/* DELETE BUTTON — red to distinguish destructive action */
.delete-btn{
    padding:14px 30px;
    border:none;
    border-radius:30px;
    background:linear-gradient(45deg,#ef4444,#b91c1c);
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.delete-btn:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 25px rgba(239,68,68,.40);
}

/* NO JOB */
.no-job{
    text-align:center;
    color:#f87171;
    font-size:20px;
    margin-top:60px;
}

</style>
</head>
<body>

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

<!-- MAIN CONTENT -->
<div class="main-content">

    <h1 class="page-title">Manage Jobs</h1>

    <div class="refresh">
        <a href="displayjob">
            <button type="button">Refresh Jobs</button>
        </a>
    </div>

    <c:if test="${empty jobs}">
        <p class="no-job">No Jobs Found</p>
    </c:if>

    <c:forEach var="job" items="${jobs}">
        <div class="job-card">

            <h2 class="job-title">${job.title}</h2>
            <p class="job-detail"><strong>Description:</strong> ${job.description}</p>
            <p class="job-detail"><strong>Location:</strong> ${job.location}</p>
            <p class="job-detail"><strong>Salary:</strong> ₹${job.salary}</p>

            <div class="action-row">

                <form action="editjob">
                    <input type="hidden" name="jobId" value="${job.id}">
                    <input type="submit" value="✏️ Edit Job" class="edit-btn">
                </form>

                <form action="deletejob">
                    <input type="hidden" name="jobId" value="${job.id}">
                    <input type="submit" value="🗑️ Delete Job" class="delete-btn">
                </form>

            </div>

        </div>
    </c:forEach>

</div>
</body>
</html>