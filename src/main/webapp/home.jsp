<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OJPMS - Online Job Portal</title>
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html{ scroll-behavior:smooth; }

body{
    color:#fff;
    overflow-x:hidden;
    position:relative;
    min-height:100vh;
    transition:color .4s;
}

/* =====================
   SLIDESHOW
   ===================== */
.bg-slideshow{
    position:fixed;
    top:0; left:0;
    width:100%; height:100%;
    z-index:-2;
    overflow:hidden;
}

.bg-slide{
    position:absolute;
    top:0;
    width:100%; height:100%;
    background-size:cover;
    background-position:center;
    opacity:0;
    transform:translateX(100%);
    transition:transform 1.2s cubic-bezier(.77,0,.18,1),
               opacity 0.8s ease;
    will-change:transform,opacity;
}

.bg-slide.active{ opacity:1; transform:translateX(0%); }
.bg-slide.exit{   opacity:0; transform:translateX(-100%); }

/* DARK OVERLAY */
.bg-overlay{
    position:fixed;
    top:0; left:0;
    width:100%; height:100%;
    background:linear-gradient(
        135deg,
        rgba(2,6,23,0.78),
        rgba(15,23,42,0.65),
        rgba(17,24,39,0.72)
    );
    z-index:-1;
    transition:background .5s;
}

/* LIGHT OVERLAY — photos still show through */
body.light .bg-overlay{
    background:linear-gradient(
        135deg,
        rgba(240,244,248,0.70),
        rgba(232,237,245,0.62),
        rgba(245,247,250,0.70)
    );
}

body.light{ color:#111827; }

/* DOTS */
.slide-dots{
    position:fixed;
    bottom:30px;
    left:50%;
    transform:translateX(-50%);
    display:flex;
    gap:10px;
    z-index:100;
}

.dot{
    width:10px; height:10px;
    border-radius:50%;
    background:rgba(255,255,255,.40);
    border:none;
    cursor:pointer;
    transition:.3s;
    padding:0;
}

.dot.active{ background:white; transform:scale(1.3); }

body.light .dot{ background:rgba(0,0,0,.25); }
body.light .dot.active{ background:#1e293b; }

/* =====================
   THEME TOGGLE
   ===================== */
#themeToggle{
    position:fixed;
    top:20px;
    right:24px;
    z-index:2000;
    padding:10px 20px;
    border:1px solid rgba(255,255,255,.25);
    border-radius:30px;
    background:rgba(255,255,255,.15);
    backdrop-filter:blur(10px);
    color:white;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

#themeToggle:hover{ transform:scale(1.06); }

body.light #themeToggle{
    background:rgba(0,0,0,.10);
    color:#111827;
    border:1px solid rgba(0,0,0,.18);
}

/* =====================
   SIDEBAR
   ===================== */
.sidebar{
    position:fixed;
    left:0; top:0;
    width:260px;
    height:100vh;
    background:linear-gradient(
        180deg,
        rgba(156,163,175,.18),
        rgba(55,65,81,.25),
        rgba(17,24,39,.55)
    );
    backdrop-filter:blur(18px);
    border-right:1px solid rgba(255,255,255,.10);
    padding-top:30px;
    z-index:1000;
    transition:background .4s, border-color .4s;
}

body.light .sidebar{
    background:linear-gradient(
        180deg,
        rgba(226,232,240,.90),
        rgba(203,213,225,.92),
        rgba(148,163,184,.95)
    );
    border-right:1px solid rgba(0,0,0,.10);
}

.sidebar h2{
    text-align:center;
    color:#fff;
    font-size:28px;
    margin-bottom:35px;
    text-shadow:0 0 15px rgba(255,255,255,.3);
    transition:color .4s;
}

body.light .sidebar h2{
    color:#1e293b;
    text-shadow:none;
}

.sidebar a{
    display:block;
    padding:16px 25px;
    color:#d1d5db;
    text-decoration:none;
    transition:.4s;
    border-left:4px solid transparent;
}

body.light .sidebar a{ color:#374151; }

.sidebar a:hover{
    background:rgba(255,255,255,.08);
    border-left:4px solid #f59e0b;
    color:#fff;
    padding-left:35px;
}

body.light .sidebar a:hover{
    background:rgba(0,0,0,.06);
    border-left:4px solid #d97706;
    color:#111827;
}

/* =====================
   MAIN CONTENT
   ===================== */
.main-content{
    margin-left:260px;
    min-height:100vh;
}

/* =====================
   HERO
   ===================== */
.hero{
    min-height:100vh;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:40px 60px;
    gap:60px;
    flex-wrap:wrap;
}

.hero-left{ flex:1; }

.dashboard-label{
    display:inline-block;
    background:rgba(255,255,255,.10);
    border:1px solid rgba(255,255,255,.20);
    padding:8px 20px;
    border-radius:30px;
    font-size:13px;
    letter-spacing:2px;
    text-transform:uppercase;
    color:#d1d5db;
    margin-bottom:25px;
    transition:.4s;
}

body.light .dashboard-label{
    background:rgba(245,158,11,.12);
    border:1px solid rgba(245,158,11,.40);
    color:#92400e;
}

.hero-left h1{
    font-size:68px;
    line-height:1.1;
    background:linear-gradient(90deg,#ffffff,#d4d4d8,#ffffff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    margin-bottom:10px;
}

body.light .hero-left h1{
    background:linear-gradient(90deg,#1e293b,#374151,#1e293b);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.typing{
    color:#e5e7eb;
    font-size:22px;
    font-weight:600;
    margin-bottom:20px;
    min-height:32px;
    transition:color .4s;
}

body.light .typing{ color:#1e293b; }

.hero-left p{
    color:#cbd5e1;
    line-height:1.8;
    max-width:540px;
    transition:color .4s;
}

body.light .hero-left p{ color:#334155; }

/* SEARCH BOX */
.search-box{
    display:flex;
    margin-top:30px;
    max-width:520px;
}

.search-box input{
    flex:1;
    padding:16px 22px;
    border:none;
    outline:none;
    border-radius:40px 0 0 40px;
    background:rgba(255,255,255,.92);
    font-size:15px;
    color:#111;
    transition:.3s;
}

body.light .search-box input{
    background:#fff;
    border:1px solid #cbd5e1;
    border-right:none;
    box-shadow:0 2px 10px rgba(0,0,0,.08);
}

.search-box button{
    padding:16px 28px;
    border:none;
    color:white;
    cursor:pointer;
    font-size:15px;
    font-weight:600;
    background:linear-gradient(45deg,#f59e0b,#d97706);
    border-radius:0 40px 40px 0;
    transition:.3s;
}

.search-box button:hover{
    transform:scale(1.05);
    box-shadow:0 6px 20px rgba(245,158,11,.40);
}

/* BUTTONS */
.hero-btns{
    margin-top:28px;
    display:flex;
    gap:15px;
    flex-wrap:wrap;
}

.btn{
    display:inline-block;
    text-decoration:none;
    padding:15px 32px;
    border-radius:40px;
    font-size:15px;
    font-weight:600;
    transition:.4s;
    cursor:pointer;
    border:none;
}

.primary-btn{
    background:linear-gradient(45deg,#f59e0b,#d97706);
    color:white;
}

.secondary-btn{
    border:2px solid rgba(255,255,255,.50);
    color:white;
    background:rgba(255,255,255,.08);
}

body.light .secondary-btn{
    border:2px solid #94a3b8;
    color:#1e293b;
    background:rgba(255,255,255,.60);
}

.btn:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 28px rgba(0,0,0,.20);
}

/* MINI STATS */
.mini-stats{
    display:flex;
    gap:20px;
    margin-top:35px;
    flex-wrap:wrap;
}

.mini-box{
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    padding:20px 28px;
    border-radius:18px;
    border:1px solid rgba(255,255,255,.12);
    transition:.4s;
    text-align:center;
}

body.light .mini-box{
    background:rgba(255,255,255,.75);
    border:1px solid rgba(0,0,0,.08);
    box-shadow:0 4px 15px rgba(0,0,0,.07);
}

.mini-box:hover{ transform:translateY(-8px); }

.mini-box h3{ color:#f59e0b; font-size:26px; }

.mini-box span{ color:#d1d5db; font-size:13px; }
body.light .mini-box span{ color:#475569; }

/* JOB CARDS */
.hero-right{
    flex:1;
    display:flex;
    flex-direction:column;
    gap:18px;
    max-width:380px;
}

.job-card{
    background:rgba(255,255,255,.07);
    backdrop-filter:blur(20px);
    border:1px solid rgba(255,255,255,.10);
    padding:22px 25px;
    border-radius:20px;
    transition:.4s;
    cursor:pointer;
}

body.light .job-card{
    background:rgba(255,255,255,.75);
    border:1px solid rgba(0,0,0,.08);
    box-shadow:0 4px 15px rgba(0,0,0,.07);
}

.job-card:hover{
    transform:translateY(-8px) translateX(-4px);
    background:rgba(255,255,255,.13);
    box-shadow:0 12px 30px rgba(0,0,0,.25);
}

body.light .job-card:hover{
    background:rgba(255,255,255,.90);
    box-shadow:0 12px 30px rgba(0,0,0,.12);
}

.job-card h3{ color:#fff; font-size:17px; margin-bottom:6px; }
body.light .job-card h3{ color:#1e293b; }

.job-card p{ color:#9ca3af; font-size:13px; }
body.light .job-card p{ color:#475569; }

.job-tag{
    display:inline-block;
    margin-top:10px;
    padding:4px 14px;
    background:rgba(245,158,11,.15);
    border:1px solid rgba(245,158,11,.30);
    border-radius:20px;
    font-size:12px;
    color:#f59e0b;
}

body.light .job-tag{
    background:rgba(245,158,11,.12);
    color:#b45309;
    border-color:rgba(180,83,9,.25);
}

/* =====================
   COMPANIES
   ===================== */
.companies{
    padding:80px 60px;
    text-align:center;
}

.companies h2{ font-size:38px; margin-bottom:10px; }
body.light .companies h2{ color:#1e293b; }

.companies .sub{ color:#9ca3af; margin-bottom:40px; }
body.light .companies .sub{ color:#475569; }

.company-row{
    display:flex;
    justify-content:center;
    gap:18px;
    flex-wrap:wrap;
}

.company-pill{
    background:rgba(255,255,255,.06);
    border:1px solid rgba(255,255,255,.10);
    padding:16px 28px;
    border-radius:15px;
    font-size:15px;
    font-weight:600;
    transition:.4s;
    color:#e5e7eb;
}

body.light .company-pill{
    background:rgba(255,255,255,.75);
    border:1px solid rgba(0,0,0,.08);
    color:#1e293b;
    box-shadow:0 2px 10px rgba(0,0,0,.06);
}

.company-pill:hover{
    transform:translateY(-6px);
    background:rgba(255,255,255,.12);
}

body.light .company-pill:hover{
    background:rgba(255,255,255,.92);
    box-shadow:0 8px 20px rgba(0,0,0,.10);
}

/* =====================
   CTA
   ===================== */
.cta{
    text-align:center;
    padding:80px 60px;
}

.cta h2{ font-size:40px; margin-bottom:15px; }
body.light .cta h2{ color:#1e293b; }

.cta p{ color:#cbd5e1; margin-bottom:30px; font-size:17px; }
body.light .cta p{ color:#334155; }

/* =====================
   FOOTER
   ===================== */
footer{
    padding:30px 40px;
    text-align:center;
    background:rgba(0,0,0,.25);
    color:#6b7280;
    font-size:14px;
    transition:background .4s;
}

body.light footer{
    background:rgba(0,0,0,.08);
    color:#475569;
}

/* =====================
   FLOATING ICONS
   ===================== */
.floating-icon{
    position:fixed;
    opacity:.04;
    font-size:110px;
    pointer-events:none;
    animation:floatBob 12s infinite ease-in-out;
    z-index:0;
}

body.light .floating-icon{ opacity:.07; }

.icon1{top:18%; left:32%;}
.icon2{top:72%; right:10%;}
.icon3{top:38%; right:22%;}
.icon4{top:82%; left:38%;}

@keyframes floatBob{
    0%,100%{ transform:translateY(0); }
    50%{ transform:translateY(-25px); }
}

.cursor{
    display:inline-block;
    width:3px;
    background:#f59e0b;
    animation:blink .7s infinite;
    margin-left:2px;
    vertical-align:middle;
}

@keyframes blink{
    0%,100%{ opacity:1; }
    50%{ opacity:0; }
}

</style>
</head>
<body>

<!-- SLIDESHOW — always visible in both modes -->
<div class="bg-slideshow">
    <div class="bg-slide" style="background-image:url('https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=1600&q=80')"></div>
    <div class="bg-slide" style="background-image:url('https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=1600&q=80')"></div>
    <div class="bg-slide" style="background-image:url('https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=1600&q=80')"></div>
    <div class="bg-slide" style="background-image:url('https://images.unsplash.com/photo-1573496799652-408c2ac9fe98?w=1600&q=80')"></div>
    <div class="bg-slide" style="background-image:url('https://images.unsplash.com/photo-1664575602554-2087b04935a5?w=1600&q=80')"></div>
    <div class="bg-slide" style="background-image:url('https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=1600&q=80')"></div>
</div>

<div class="bg-overlay"></div>
<div class="slide-dots" id="dots"></div>

<!-- THEME TOGGLE -->
<button id="themeToggle">☀️ Light Mode</button>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>OJPMS</h2>
    <a href="home.jsp">🏠 Home</a>
    <a href="login.jsp">💼 Jobs</a>
    <a href="login.jsp">👨‍💼 Applicants</a>
    <a href="login.jsp">🏢 Recruiters</a>
    <a href="register.jsp">📝 Register</a>
    <a href="login.jsp">🔑 Login</a>
</div>

<!-- MAIN CONTENT -->
<div class="main-content">

    <section class="hero">
        <div class="hero-left">

            <div class="dashboard-label">🚀 India's Job Portal</div>
            <h1>Your Dream<br>Job Awaits</h1>

            <div class="typing">
                <span id="typed-text"></span><span class="cursor"></span>
            </div>

            <p>Connect with top recruiters, explore thousands of opportunities,
               and take the next step towards a successful career journey with OJPMS.</p>

            <div class="search-box">
                <input type="text" placeholder="Search jobs, skills, companies...">
                <button onclick="window.location='login.jsp'">Search</button>
            </div>

            <div class="hero-btns">
                <a href="register.jsp" class="btn primary-btn">Get Started →</a>
                <a href="login.jsp"    class="btn secondary-btn">Login</a>
            </div>

            <div class="mini-stats">
                <div class="mini-box"><h3>500+</h3><span>Live Jobs</span></div>
                <div class="mini-box"><h3>1000+</h3><span>Applicants</span></div>
                <div class="mini-box"><h3>150+</h3><span>Recruiters</span></div>
            </div>

        </div>

        <div class="hero-right">
            <div class="job-card">
                <h3>☕ Java Developer</h3>
                <p>Pune • TCS • Full Time</p>
                <span class="job-tag">₹6–10 LPA</span>
            </div>
            <div class="job-card">
                <h3>🎨 Frontend Developer</h3>
                <p>Mumbai • Infosys • Remote</p>
                <span class="job-tag">₹5–8 LPA</span>
            </div>
            <div class="job-card">
                <h3>📊 Data Analyst</h3>
                <p>Bangalore • Google • Hybrid</p>
                <span class="job-tag">₹8–14 LPA</span>
            </div>
            <div class="job-card">
                <h3>⚙️ Software Engineer</h3>
                <p>Hyderabad • Microsoft • Full Time</p>
                <span class="job-tag">₹12–18 LPA</span>
            </div>
        </div>
    </section>

    <section class="companies">
        <h2>Trusted By Top Companies</h2>
        <p class="sub">Join the platform that the best companies rely on to find talent</p>
        <div class="company-row">
            <div class="company-pill">🔵 Google</div>
            <div class="company-pill">🟣 Infosys</div>
            <div class="company-pill">🔷 TCS</div>
            <div class="company-pill">🟦 Wipro</div>
            <div class="company-pill">🟩 Microsoft</div>
            <div class="company-pill">🔶 Accenture</div>
        </div>
    </section>

    <section class="cta">
        <h2>Ready To Start Your Career Journey?</h2>
        <p>Join thousands of job seekers and recruiters on OJPMS today.</p>
        <a href="register.jsp" class="btn primary-btn">Join Now — It's Free</a>
    </section>

    <footer>© 2025 OJPMS — Online Job Portal Management System. All rights reserved.</footer>

</div>

<div class="floating-icon icon1">💼</div>
<div class="floating-icon icon2">🚀</div>
<div class="floating-icon icon3">📈</div>
<div class="floating-icon icon4">🎯</div>

<script>

// ── THEME TOGGLE ──
const toggleBtn = document.getElementById('themeToggle');

if(localStorage.getItem('ojpms-theme') === 'light'){
    document.body.classList.add('light');
    toggleBtn.textContent = '🌙 Dark Mode';
}

toggleBtn.addEventListener('click', () => {
    document.body.classList.toggle('light');
    const isLight = document.body.classList.contains('light');
    toggleBtn.textContent = isLight ? '🌙 Dark Mode' : '☀️ Light Mode';
    localStorage.setItem('ojpms-theme', isLight ? 'light' : 'dark');
});

// ── SLIDESHOW ──
const slides = document.querySelectorAll('.bg-slide');
const dotsEl = document.getElementById('dots');
let current = 0;

slides.forEach((_,i) => {
    const d = document.createElement('button');
    d.className = 'dot' + (i===0 ? ' active' : '');
    d.onclick = () => goTo(i);
    dotsEl.appendChild(d);
});

function goTo(n){
    slides[current].classList.remove('active');
    slides[current].classList.add('exit');
    setTimeout(() => slides[current].classList.remove('exit'), 1300);
    dotsEl.children[current].classList.remove('active');
    current = n;
    slides[current].classList.add('active');
    dotsEl.children[current].classList.add('active');
}

slides[0].classList.add('active');
setInterval(() => goTo((current + 1) % slides.length), 4500);

// ── TYPING EFFECT ──
const phrases = [
    'Find Jobs • Hire Talent • Grow Faster',
    'Your Career Starts Here',
    'Thousands of Opportunities Await',
    'Connect with Top Recruiters'
];

let pi = 0, ci = 0, deleting = false;
const typedEl = document.getElementById('typed-text');

function type(){
    const phrase = phrases[pi];
    if(!deleting){
        typedEl.textContent = phrase.slice(0, ++ci);
        if(ci === phrase.length){ deleting = true; setTimeout(type, 1800); return; }
    } else {
        typedEl.textContent = phrase.slice(0, --ci);
        if(ci === 0){ deleting = false; pi = (pi+1) % phrases.length; }
    }
    setTimeout(type, deleting ? 45 : 75);
}

type();

</script>
</body>
</html>