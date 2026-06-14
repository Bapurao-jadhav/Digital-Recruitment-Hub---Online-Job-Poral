<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

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
    animation:move 15s ease infinite;
    color:white;
}

@keyframes move{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
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
    #1f2937);

    border-right:1px solid rgba(255,255,255,.12);

    box-shadow:10px 0 40px rgba(0,0,0,.25);

    padding-top:30px;
    z-index:1000;
}


.sidebar h2{
    text-align:center;
    color:#f59e0b;
    margin-bottom:35px;
    font-size:28px;
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
    color:white;
    padding-left:35px;
}

/* MAIN */
.main{
    margin-left:260px;
    padding:40px;
}

/* PROFILE CARD */
.card{
    max-width:500px;
    margin:auto;
    background:rgba(255,255,255,.06);
    backdrop-filter:blur(18px);
    border:1px solid rgba(255,255,255,.08);
    border-radius:20px;
    padding:30px;
    text-align:center;
    transition:.4s;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 15px 35px rgba(0,0,0,.4);
}

.card h2{
    margin-bottom:20px;
    color:#f59e0b;
}

/* INFO TEXT */
.info{
    text-align:left;
    margin-top:10px;
    line-height:2;
    color:#e2e8f0;
}

.info strong{
    color:#fff;
}

/* BUTTON */
.btn{
    display:inline-block;
    margin-top:20px;
    padding:14px 28px;
    border-radius:30px;
    text-decoration:none;
    color:white;
    font-weight:600;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    transition:.3s;
}

.btn:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(245,158,11,.4);
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
    <a href="viewjob">💼 Jobs</a>
    <a href="myapplications">📄 Applications</a>
    <a href="profile?id=${user.id}">👤 Profile</a>
    <a href="logout">🚪 Logout</a>
</div>

<!-- MAIN CONTENT -->
<div class="main">

    <div class="card">

        <h2>User Profile</h2>

        <div class="info">
            <p><strong>Id:</strong> ${user.id}</p>
            <p><strong>Name:</strong> ${user.name}</p>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Role:</strong> ${user.role}</p>
        </div>

        <form action="editrecruiterprofile">
            <input type="hidden" name="userId" value="${user.id}">
            <button class="btn" type="submit">Edit Profile</button>
        </form>

    </div>

</div>

</body>
</html>