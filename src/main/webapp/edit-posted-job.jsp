<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Job – OJPMS</title>
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
    display:flex;
    align-items:center;
    justify-content:center;
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

/* FORM CARD */
.form-card{
    width:100%;
    max-width:600px;
    padding:45px 40px;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(25px);
    border-radius:25px;
    border:1px solid rgba(255,255,255,.1);
    margin:40px auto;
}

/* TITLE */
.form-title{
    text-align:center;
    font-size:36px;
    font-weight:700;
    margin-bottom:35px;
    background:linear-gradient(to right,#fff,#d1d5db,#fff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* FIELD GROUP */
.field-group{
    display:flex;
    flex-direction:column;
    gap:8px;
    margin-bottom:22px;
}

.field-group label{
    color:#d1d5db;
    font-size:14px;
    font-weight:600;
    letter-spacing:.5px;
    text-transform:uppercase;
}

/* INPUTS */
.field-group input[type="text"],
.field-group input[type="number"],
.field-group textarea{
    width:100%;
    padding:14px 18px;
    border:none;
    border-radius:15px;
    background:rgba(255,255,255,.92);
    font-size:15px;
    color:#111827;
    outline:none;
    transition:.3s;
    resize:vertical;
}

.field-group input[type="text"]:focus,
.field-group input[type="number"]:focus,
.field-group textarea:focus{
    transform:translateY(-2px);
    box-shadow:0 0 20px rgba(255,255,255,.15);
}

/* READONLY FIELD */
.field-group input[readonly]{
    background:rgba(255,255,255,.92);
    color: #111827;
    cursor:not-allowed;
    
}

/* TEXTAREA */
.field-group textarea{
    min-height:120px;
    font-family:'Segoe UI',sans-serif;
}

/* SUBMIT BUTTON */
.save-btn{
    width:100%;
    padding:16px;
    border:none;
    border-radius:30px;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    color:white;
    font-size:16px;
    font-weight:700;
    cursor:pointer;
    transition:.3s;
    margin-top:10px;
    letter-spacing:.5px;
}

.save-btn:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 25px rgba(245,158,11,.40);
}

</style>
</head>
<body>
	
	<div class="sidebar">
    <h2>Digital Recruitment Hub</h2>

    <a href="home.jsp">🏠 Home</a>
    <a href="post-job.jsp">📝 Post Job</a>
    <a href="displayjob">📝 Available Job</a>
 	
    <a href="view-applications">📄 Applications</a>
    <a href="recruiterprofile?id=${user.id}">👤 Profile</a>
    <a href="logout">🚪 Logout</a>
</div>
	
    <div class="form-card">

        <h1 class="form-title">✏️ Edit Job</h1>

        <form action="saveEditedJob" method="post">

            <div class="field-group">
                <label>Job ID</label>
                <input type="number" value="${job.getId()}" name="jobId" readonly="readonly">
            </div>

            <div class="field-group">
                <label>Title</label>
                <input type="text" name="title" value="${job.getTitle()}">
            </div>

            <div class="field-group">
                <label>Description</label>
                <textarea name="description">${job.getDescription()}</textarea>
            </div>

            <div class="field-group">
                <label>Location</label>
                <input type="text" name="location" value="${job.getLocation()}">
            </div>

            <div class="field-group">
                <label>Salary (₹)</label>
                <input type="number" name="salary" value="${job.getSalary()}">
            </div>

            <input type="submit" value="Save Changes" class="save-btn">

        </form>

    </div>

</body>
</html>