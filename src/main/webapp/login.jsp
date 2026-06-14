<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login – OJPMS</title>
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
    background:radial-gradient(circle, rgba(255,255,255,.10), rgba(150,150,150,.05), transparent 70%);
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
    background:radial-gradient(circle, rgba(255,255,255,.08), transparent 70%);
    bottom:-150px;
    right:-150px;
    animation:floatGlow 10s infinite alternate;
    z-index:0;
}

/* FLOATING IMAGES STRIP */
.floating-strip{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    pointer-events:none;
    z-index:1;
    overflow:hidden;
}

.float-img{
    position:absolute;
    border-radius:16px;
    opacity:0.13;
    filter:blur(1px) grayscale(20%);
    animation:floatLeft linear infinite;
    object-fit:cover;
}

/* Each image: different top, size, speed, delay */
.float-img:nth-child(1){
    width:180px; height:120px;
    top:6%;
    animation-duration:22s;
    animation-delay:0s;
}
.float-img:nth-child(2){
    width:140px; height:140px;
    top:22%;
    animation-duration:28s;
    animation-delay:-6s;
}
.float-img:nth-child(3){
    width:160px; height:110px;
    top:40%;
    animation-duration:20s;
    animation-delay:-3s;
}
.float-img:nth-child(4){
    width:150px; height:130px;
    top:58%;
    animation-duration:25s;
    animation-delay:-10s;
}
.float-img:nth-child(5){
    width:170px; height:115px;
    top:74%;
    animation-duration:18s;
    animation-delay:-8s;
}
.float-img:nth-child(6){
    width:130px; height:130px;
    top:14%;
    animation-duration:30s;
    animation-delay:-15s;
}
.float-img:nth-child(7){
    width:155px; height:120px;
    top:50%;
    animation-duration:23s;
    animation-delay:-18s;
}
.float-img:nth-child(8){
    width:145px; height:125px;
    top:85%;
    animation-duration:26s;
    animation-delay:-4s;
}

@keyframes floatLeft{
    0%  { transform: translateX(110vw) rotate(-2deg); }
    100%{ transform: translateX(-220px) rotate(2deg); }
}

/* LEFT CONTENT */
.left-content{
    position:relative;
    z-index:2;
    width:45%;
    color:white;
    margin-top:-100px;
}

.left-content h1{
    font-size:70px;
    margin-bottom:20px;
    text-shadow:0 0 8px rgba(255,255,255,.15);
    animation:slideLeft 1s ease;
}

.left-content p{
    font-size:20px;
    line-height:1.8;
    color:#e5e7eb;
}

/* LOGIN FORM */
.login-form{
    position:relative;
    z-index:2;
    width:420px;
    padding:20px;
    margin-top:-100px;
    animation:slideRight 1s ease;
}

.login-form h2{
    color:white;
    text-align:center;
    margin-bottom:30px;
    font-size:42px;
    text-shadow:0 0 8px rgba(255,255,255,.12);
}

.login-form input[type="email"],
.login-form input[type="password"]{
    width:100%;
    padding:16px;
    margin-bottom:18px;
    border:none;
    border-radius:30px;
    background:rgba(255,255,255,.92);
    font-size:15px;
    transition:.3s;
}

.login-form input:focus{
    outline:none;
    transform:translateY(-3px);
    box-shadow:0 0 25px rgba(255,255,255,.25);
}

.login-form input[type="email"]:hover,
.login-form input[type="password"]:hover{
    background:white;
    transform:translateY(-3px);
    box-shadow:0 0 20px rgba(255,255,255,.20);
}

.login-form input[type="submit"]{
    width:100%;
    padding:15px;
    border:none;
    border-radius:30px;
    background:linear-gradient(45deg,#374151,#111827);
    color:white;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
    transition:.4s;
}

.login-form input[type="submit"]:hover{
    transform:translateY(-4px);
    background:linear-gradient(45deg,#4b5563,#1f2937);
    box-shadow:0 0 20px rgba(255,255,255,.08);
}

.login-form a{
    display:block;
    text-align:center;
    margin-top:15px;
    text-decoration:none;
    color:#e5e7eb;
    transition:.3s;
}

.login-form a:hover{ color:white; }

.error{
    text-align:center;
    color:#ff6b6b;
    margin-top:10px;
    font-weight:bold;
}

.success{
    text-align:center;
    color:#4ade80;
    margin-top:10px;
    font-weight:bold;
}

/* THEME TOGGLE */
#themeToggle{
    position:absolute;
    top:30px;
    right:40px;
    padding:10px 18px;
    border:none;
    border-radius:30px;
    background:white;
    color:black;
    cursor:pointer;
    font-size:18px;
    z-index:10;
    transition:.3s;
}

#themeToggle:hover{ transform:scale(1.08); }

/* ANIMATIONS */
@keyframes slideLeft{
    from{ opacity:0; transform:translateX(-100px); }
    to{   opacity:1; transform:translateX(0); }
}

@keyframes slideRight{
    from{ opacity:0; transform:translateX(100px); }
    to{   opacity:1; transform:translateX(0); }
}

@keyframes bgMove{
    0%  { background-position:0% 50%; }
    50% { background-position:100% 50%; }
    100%{ background-position:0% 50%; }
}

@keyframes pulseGlow{
    from{ transform:translate(-50%,-50%) scale(1); }
    to{   transform:translate(-50%,-50%) scale(1.3); }
}

@keyframes floatGlow{
    from{ transform:translate(0,0); }
    to{   transform:translate(-120px,-120px); }
}

/* LIGHT MODE */
body.light{
    background:linear-gradient(135deg,#f5f7fa,#ffffff,#f0f4f8);
    color:#111;
}
body.light .left-content{ color:#111; }
body.light .left-content p{ color:#444; }
body.light .login-form h2{ color:#111; }
body.light input[type=email],
body.light input[type=password]{
    background:white;
    border:1px solid #ddd;
    color:black;
}
body.light input[type=submit]{
    background:linear-gradient(45deg,#2563eb,#3b82f6);
    color:white;
}
body.light input[type=submit]:hover{
    background:linear-gradient(45deg,#1d4ed8,#2563eb);
}
body.light a{ color:#2563eb; }
body.light #themeToggle{ background:#111; color:white; }

</style>
</head>
<body>

<!-- FLOATING JOB IMAGES -->
<div class="floating-strip">
    <img class="float-img" src="https://images.unsplash.com/photo-1586281380349-632531db7ed4?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1664575602554-2087b04935a5?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1573496799652-408c2ac9fe98?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?w=300&q=60" alt="">
    <img class="float-img" src="https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=300&q=60" alt="">
</div>

<button id="themeToggle">🌙</button>

<div class="left-content">
    <h1>Digital Recruitment Hub</h1>
    <p>Connecting talented professionals with leading companies.
       Login to explore opportunities and manage your career journey.</p>
</div>

<form action="login" method="post" class="login-form">
    <h2>Welcome Back</h2>
    <input type="email"    name="email"    placeholder="Enter Email">
    <input type="password" name="password" placeholder="Enter Password">
    <input type="submit"   value="Login">
    <a href="reset.jsp">Forgot Password?</a>
    <a href="register.jsp">Don't have an account? Create Account</a>
    <p class="error">${error}</p>
    <p class="success">${msg}</p>
</form>

<script>
const btn = document.getElementById("themeToggle");
if(localStorage.getItem("theme") == "light"){
    document.body.classList.add("light");
    btn.innerHTML = "Dark";
}
btn.addEventListener("click", () => {
    document.body.classList.toggle("light");
    let isLight = document.body.classList.contains("light");
    btn.innerHTML = isLight ? "Light" : "Dark";
    localStorage.setItem("theme", isLight ? "light" : "dark");
});
</script>

</body>
</html>