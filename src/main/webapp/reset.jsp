<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

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
    justify-content:center;
    align-items:center;

    overflow:hidden;
    position:relative;
}

/* Animated Background */

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

/* Reset Form */

.reset-form{
    position:relative;
    z-index:2;

    width:420px;
    padding:20px;

    animation:slideRight 1s ease;
}

.logo{
    text-align:center;
    color:white;
    font-size:42px;
    font-weight:bold;
    margin-bottom:20px;
}

h1{
    color:white;
    text-align:center;
    margin-bottom:10px;
    font-size:42px;
}

.subtitle{
    color:#e5e7eb;
    text-align:center;
    line-height:1.8;
    margin-bottom:25px;
}

.message-box{
    text-align:center;
    color:#4ade80;
    font-weight:bold;
    margin-bottom:15px;
}

.input-group{
    margin-bottom:18px;
}

.input-group label{
    display:block;
    color:white;
    margin-bottom:8px;
}

.input-group input{

    width:100%;
    padding:16px;

    border:none;
    border-radius:30px;

    background:rgba(255,255,255,.92);

    font-size:15px;

    transition:.3s;
}

.input-group input:focus{

    outline:none;

    transform:translateY(-3px);

    box-shadow:
    0 0 25px rgba(255,255,255,.25);
}

button{

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

button:hover{

    transform:translateY(-4px);

    background:linear-gradient(
    45deg,
    #4b5563,
    #1f2937);

    box-shadow:
    0 0 20px rgba(255,255,255,.08);
}

.footer{
    text-align:center;
    margin-top:15px;
}

.footer a{
    color:#e5e7eb;
    text-decoration:none;
}

.footer a:hover{
    color:white;
}

/* Animations */

@keyframes slideRight{

    from{
        opacity:0;
        transform:translateX(100px);
    }

    to{
        opacity:1;
        transform:translateX(0);
    }
}

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

<div class="reset-form">

    

    <h1>Reset Password</h1>

    <p class="subtitle">
        Enter your credential updates to recover account authentication status.
    </p>

    <div class="message-box">${msg}</div>

    <form action="reset" method="get">

        <div class="input-group">
            <label>Email Address</label>
            <input type="email"
                   name="email"
                  
                   required
                   autocomplete="email">
        </div>

        <div class="input-group">
            <label>New Password</label>
            <input type="password"
                   name="password"
                  
                   required>
        </div>

        <button type="submit">
            Reset Password
        </button>

    </form>

    <div class="footer">
        Need a brand new account?
        <a href="register.jsp">Register</a>
    </div>

</div>

</body>
</html>