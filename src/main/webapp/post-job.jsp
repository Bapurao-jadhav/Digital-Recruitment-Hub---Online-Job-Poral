<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Job</title>

<style>

/* RESET */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* BACKGROUND */
body{
    min-height:100vh;
    background:linear-gradient(
        135deg,
        #0f172a,
        #1e293b,
        #0b1220,
        #111827
    );

    color:#fff;
    overflow-x:hidden;
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
        #9ca3af,
        #6b7280,
        #374151,
        #1f2937
    );

    padding-top:30px;
    border-right:1px solid rgba(255,255,255,.12);
}

.sidebar h2{
    text-align:center;
    color:#fff;
    font-size:28px;
    margin-bottom:35px;
}

.sidebar a{
    display:block;
    padding:16px 25px;
    color:#d1d5db;
    text-decoration:none;
    transition:.3s;
    border-left:4px solid transparent;
}

.sidebar a:hover{
    background:rgba(255,255,255,.08);
    border-left:4px solid #f59e0b;
    color:#fff;
    padding-left:35px;
}

/* MAIN CONTENT */
.main{
    margin-left:260px;
    padding:50px;
}

/* TITLE */
.main h1{
    font-size:40px;
    margin-bottom:30px;
    color:#fff;
}

/* FORM BOX */
form{
    max-width:500px;
    background:rgba(255,255,255,.05);
    padding:30px;
    border-radius:20px;
    backdrop-filter:blur(20px);
    border:1px solid rgba(255,255,255,.1);
}

/* INPUTS */
input, textarea{
    width:100%;
    margin-top:10px;
    margin-bottom:20px;
    padding:12px;
    border:none;
    border-radius:10px;
    outline:none;
}

/* BUTTON */
input[type="submit"]{
    background:linear-gradient(45deg,#f59e0b,#d97706);
    color:#fff;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

input[type="submit"]:hover{
    transform:translateY(-3px);
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
    <a href="view-applications">📄 Applications</a>
    <a href="recruiterprofile?id=${user.id}">👤 Profile</a>
    <a href="logout">🚪 Logout</a>
</div>

<!-- MAIN -->
<div class="main">

    <h1>Post a New Job</h1>

    <form action="postjob" method="post">

        
        <input type="text" name="title" placeholder="Enter Title">

        
        <textarea name="description" placeholder="Enter Description"></textarea>

        
        <input type="text" name="location" placeholder="Enter Location">

        
        <input type="number" name="salary" placeholder="Enter Salary">

        <input type="submit" value="POST JOB">

    </form>

</div>

</body>
</html>