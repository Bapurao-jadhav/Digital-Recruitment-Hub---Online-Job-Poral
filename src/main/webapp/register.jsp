<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    height:100vh;

    background:linear-gradient(
    135deg,
    #1f2937,
    #111827,
    #0f172a,
    #020617);

    background-size:400% 400%;
    animation:bgMove 15s ease infinite;

    display:flex;
    justify-content:space-around;
    align-items:center;

    padding:0 50px;

    overflow:hidden;
    position:relative;
}

body::before{
    content:"";
    position:absolute;

    width:1000px;
    height:1000px;

    background:radial-gradient(
    circle,
    rgba(255,255,255,.10),
    rgba(150,150,150,.05),
    transparent 70%);

    top:50%;
    left:50%;

    transform:translate(-50%,-50%);

    animation:pulseGlow 10s infinite alternate;

    z-index:0;
}

body::after{
    content:"";
    position:absolute;

    width:600px;
    height:600px;

    background:radial-gradient(
    circle,
    rgba(255,255,255,.08),
    transparent 70%);

    bottom:-150px;
    right:-150px;

    animation:floatGlow 10s infinite alternate;

    z-index:0;
}

/* Left Section */

.left-content{
    position:relative;
    z-index:2;
    width:45%;
    color:white;
    margin-top:0px;
}



.left-content h1{
    font-size:70px;
    margin-bottom:20px;
    text-shadow:0 0 8px rgba(255,255,255,.15);
}

.left-content h1 span{
    color:#d1d5db;
}

.left-content p{
    font-size:20px;
    line-height:1.8;
    color:#e5e7eb;
    margin-bottom:25px;
}

.feature{
    margin-bottom:15px;
    font-size:18px;
    color:#d1d5db;
}

/* Register Form */
.register-form{
    position:relative;
    z-index:2;
    width:420px;
    padding:20px;
    margin-top:0px;
}


.register-form h2{
    color:white;
    text-align:center;
    margin-bottom:25px;
    font-size:40px;
}

.input-group{
    margin-bottom:15px;
}

.input-group label{
    display:block;
    color:white;
    margin-bottom:6px;
}

.input-group input,
.input-group select{

    width:100%;
    padding:15px;
    border:none;
    border-radius:30px;
    background:rgba(255,255,255,.92);
    font-size:15px;

    transition:.3s;
}

.input-group input:focus,
.input-group select:focus{

    outline:none;

    transform:translateY(-3px);

    box-shadow:
    0 0 25px rgba(255,255,255,.25);
}

.input-group input:hover,
.input-group select:hover{

    background:white;

    transform:translateY(-3px);

    box-shadow:
    0 0 20px rgba(255,255,255,.20);
}

.register-btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:30px;

    background:linear-gradient(
    45deg,
    #374151,
    #111827);

    color:white;

    font-size:17px;
    font-weight:bold;

    cursor:pointer;

    transition:.4s;
}

.register-btn:hover{

    transform:translateY(-4px);

    background:linear-gradient(
    45deg,
    #4b5563,
    #1f2937);

    box-shadow:
    0 0 20px rgba(255,255,255,.08);
}

.login-link{
    text-align:center;
    margin-top:15px;
    color:white;
}

.login-link a{
    color:#d1d5db;
    text-decoration:none;
    font-weight:600;
}

.login-link a:hover{
    color:white;
}

/* Animations */

@keyframes bgMove{

    0%{
        background-position:0% 50%;
    }

    50%{
        background-position:100% 50%;
    }

    100%{
        background-position:0% 50%;
    }
}

@keyframes pulseGlow{

    from{
        transform:translate(-50%,-50%) scale(1);
    }

    to{
        transform:translate(-50%,-50%) scale(1.3);
    }
}

@keyframes floatGlow{

    from{
        transform:translate(0,0);
    }

    to{
        transform:translate(-120px,-120px);
    }
}

</style>

</head>
<body>

<div class="left-content">

    <h1>Join <span>OJPMS</span></h1>

    <p>
        Start your career journey today. Connect with recruiters,
        discover exciting opportunities and build your future.
    </p>

    <div class="feature">🚀 Apply for jobs instantly</div>
    <div class="feature">💼 Connect with recruiters</div>
    <div class="feature">📈 Track your applications</div>

</div>

<form action="register" method="post" class="register-form">

    <h2>Create Account</h2>

    <div class="input-group">
       
        <input type="text" name="name" placeholder="Enter Name">
    </div>

    <div class="input-group">
       
        <input type="email" name="email" placeholder="Enter Email">
    </div>

    <div class="input-group">
        
        <input type="password" name="password" placeholder="Enter Password">
    </div>

    <div class="input-group">
        
        <select name="role" placeholder="Seclect Role">
            <option value="JOB_SEEKER">Job Seeker</option>
            <option value="RECRUITER">Recruiter</option>
        </select>
    </div>

    <input type="submit"
           value="Create Account"
           class="register-btn">

    <div class="login-link">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>

</form>

</body>
</html>