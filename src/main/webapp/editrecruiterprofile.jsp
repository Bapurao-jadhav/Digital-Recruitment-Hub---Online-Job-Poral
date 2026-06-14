<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
}

@keyframes move{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

/* FORM CONTAINER */
.form-box{
    width:420px;
    background:rgba(255,255,255,.06);
    backdrop-filter:blur(18px);
    border:1px solid rgba(255,255,255,.08);
    border-radius:20px;
    padding:30px;
    box-shadow:0 20px 50px rgba(0,0,0,.4);
}

.form-box h2{
    text-align:center;
    margin-bottom:25px;
    color:#f59e0b;
}

/* INPUTS */
input{
    width:100%;
    padding:14px;
    margin-top:10px;
    margin-bottom:18px;
    border:none;
    border-radius:12px;
    outline:none;
    background:rgba(255,255,255,.1);
    color:white;
    transition:.3s;
}

input:focus{
    background:rgba(255,255,255,.15);
}

/* LABEL STYLE */
label{
    font-size:14px;
    color:#cbd5e1;
}

/* BUTTON */
.btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:30px;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.btn:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 25px rgba(245,158,11,.4);
}

/* READONLY ID */
input[readonly]{
    opacity:.6;
    cursor:not-allowed;
}

</style>
</head>

<body>

<form action="editrecruiterprofiles" method="post" class="form-box">

    <h2>Edit Profile</h2>

    <label>ID</label>
    <input type="number" name="id" value="${user.id}" readonly>

    <label>Name</label>
    <input type="text" name="name" value="${user.name}" required>

    <label>Email</label>
    <input type="email" name="email" value="${user.email}" required>

    <label>Password</label>
    <input type="password" name="password" value="${user.password}" required>

    <button type="submit" class="btn">Update Profile</button>

</form>

</body>
</html>