$html = Get-Content -Path 'index.html' -Raw

# 1. Tech Stack Marquee
$marqueeHtml = @"
            <!-- TECH STACK MARQUEE -->
            <div class="tech-marquee-wrapper" style="margin-top: 5rem; overflow: hidden; background: var(--card-bg); padding: 2rem 0; border-top: 1px solid var(--border-color); border-bottom: 1px solid var(--border-color); position: relative;">
                <div class="marquee-track" style="display: flex; gap: 4rem; width: max-content; animation: scroll-marquee 20s linear infinite;">
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-html5" style="color: #E34F26;"></i> <span style="font-size: 1.5rem; font-weight: 600;">HTML5</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-css3-alt" style="color: #1572B6;"></i> <span style="font-size: 1.5rem; font-weight: 600;">CSS3</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-js" style="color: #F7DF1E;"></i> <span style="font-size: 1.5rem; font-weight: 600;">JavaScript</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-react" style="color: #61DAFB;"></i> <span style="font-size: 1.5rem; font-weight: 600;">React</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-python" style="color: #3776AB;"></i> <span style="font-size: 1.5rem; font-weight: 600;">Python</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-java" style="color: #007396;"></i> <span style="font-size: 1.5rem; font-weight: 600;">Java</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-php" style="color: #777BB4;"></i> <span style="font-size: 1.5rem; font-weight: 600;">PHP</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fas fa-database" style="color: #4479A1;"></i> <span style="font-size: 1.5rem; font-weight: 600;">MySQL</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="bx bxl-flutter" style="color: #02569B;"></i> <span style="font-size: 1.5rem; font-weight: 600;">Flutter</span></div>
                    
                    <!-- DUPLICATE FOR SEAMLESS LOOP -->
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-html5" style="color: #E34F26;"></i> <span style="font-size: 1.5rem; font-weight: 600;">HTML5</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-css3-alt" style="color: #1572B6;"></i> <span style="font-size: 1.5rem; font-weight: 600;">CSS3</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-js" style="color: #F7DF1E;"></i> <span style="font-size: 1.5rem; font-weight: 600;">JavaScript</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-react" style="color: #61DAFB;"></i> <span style="font-size: 1.5rem; font-weight: 600;">React</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-python" style="color: #3776AB;"></i> <span style="font-size: 1.5rem; font-weight: 600;">Python</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-java" style="color: #007396;"></i> <span style="font-size: 1.5rem; font-weight: 600;">Java</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fab fa-php" style="color: #777BB4;"></i> <span style="font-size: 1.5rem; font-weight: 600;">PHP</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="fas fa-database" style="color: #4479A1;"></i> <span style="font-size: 1.5rem; font-weight: 600;">MySQL</span></div>
                    <div class="marquee-item" style="font-size: 3rem; color: var(--text-color); display: flex; align-items: center; gap: 10px;"><i class="bx bxl-flutter" style="color: #02569B;"></i> <span style="font-size: 1.5rem; font-weight: 600;">Flutter</span></div>
                </div>
            </div>
            <!-- SERVICES SECTION -->
"@
$html = $html.Replace('            <!-- SERVICES SECTION -->', $marqueeHtml)

# 2. GitHub Activity Tracker
$githubSearch = @"
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- PROJECTS TAB -->
"@
$githubHtml = @"
                        </div>
                    </div>

                    <!-- GITHUB STATS SECTION -->
                    <div class="github-stats-section" style="margin-top: 4rem;">
                        <h3 class="heading" style="font-size: 2.5rem; margin-bottom: 2rem;">GitHub <span>Activity</span></h3>
                        <div class="github-card" style="background: var(--card-bg); padding: 2rem; border-radius: 15px; border: 1px solid var(--border-color); text-align: center;">
                            <img src="https://ghchart.rshah.org/219150/dullareymart19webde" alt="dullareymart19webde's Github chart" style="width: 100%; max-width: 800px; border-radius: 8px;" />
                            <div style="margin-top: 1.5rem; display: flex; justify-content: center; gap: 15px; flex-wrap: wrap;">
                                <img src="https://github-readme-stats.vercel.app/api?username=dullareymart19webde&show_icons=true&theme=transparent&hide_border=true&title_color=fff&text_color=ccc" alt="GitHub Stats" style="height: 150px; background: var(--bg-color); border-radius: 10px; padding: 10px; border: 1px solid var(--border-color);" />
                                <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=dullareymart19webde&layout=compact&theme=transparent&hide_border=true&title_color=fff&text_color=ccc" alt="Top Languages" style="height: 150px; background: var(--bg-color); border-radius: 10px; padding: 10px; border: 1px solid var(--border-color);" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- PROJECTS TAB -->
"@
$html = $html.Replace($githubSearch, $githubHtml)

# 3. Insights Blog (Nav & Section)
$navSearch = @"
                </div>

                <button class="tab-link" data-target="contact" onclick="switchTab('contact', 'Contact')">Contact</button>
"@
$navHtml = @"
                </div>

                <button class="tab-link" data-target="insights" onclick="switchTab('insights', 'Insights')">Insights</button>
                <button class="tab-link" data-target="contact" onclick="switchTab('contact', 'Contact')">Contact</button>
"@
$html = $html.Replace($navSearch, $navHtml)

$insightsSectionHtml = @"
        <!-- INSIGHTS TAB -->
        <section id="insights" class="tab-content">
            <div class="section-header">
                <h2 class="heading">Tech <span>Insights</span></h2>
                <p>Thoughts, tutorials, and my journey in software development.</p>
            </div>
            
            <div class="blog-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-top: 3rem;">
                <div class="blog-card" style="background: var(--card-bg); border-radius: 15px; overflow: hidden; border: 1px solid var(--border-color); transition: transform 0.3s; cursor: pointer;">
                    <div style="height: 200px; background: url('img/profile.jpg') center/cover;"></div>
                    <div style="padding: 2rem;">
                        <span style="color: var(--main-color); font-size: 0.9rem; font-weight: 600;">WEB DEVELOPMENT</span>
                        <h3 style="margin: 1rem 0;">Why Next.js is the Future of React Applications</h3>
                        <p style="color: var(--text-color); opacity: 0.8; margin-bottom: 1.5rem;">Exploring the benefits of Server-Side Rendering and static site generation in modern web apps.</p>
                        <a href="javascript:void(0);" style="color: var(--main-color); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 5px;">Read More <i class='bx bx-right-arrow-alt'></i></a>
                    </div>
                </div>
                
                <div class="blog-card" style="background: var(--card-bg); border-radius: 15px; overflow: hidden; border: 1px solid var(--border-color); transition: transform 0.3s; cursor: pointer;">
                    <div style="height: 200px; background: linear-gradient(45deg, #1f4037, #99f2c8);"></div>
                    <div style="padding: 2rem;">
                        <span style="color: var(--main-color); font-size: 0.9rem; font-weight: 600;">AI & MACHINE LEARNING</span>
                        <h3 style="margin: 1rem 0;">Building an Offline AI Engine (VAI)</h3>
                        <p style="color: var(--text-color); opacity: 0.8; margin-bottom: 1.5rem;">The challenges and breakthroughs of creating a privacy-first AI agent running locally.</p>
                        <a href="javascript:void(0);" style="color: var(--main-color); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 5px;">Read More <i class='bx bx-right-arrow-alt'></i></a>
                    </div>
                </div>

                <div class="blog-card" style="background: var(--card-bg); border-radius: 15px; overflow: hidden; border: 1px solid var(--border-color); transition: transform 0.3s; cursor: pointer;">
                    <div style="height: 200px; background: linear-gradient(45deg, #2193b0, #6dd5ed);"></div>
                    <div style="padding: 2rem;">
                        <span style="color: var(--main-color); font-size: 0.9rem; font-weight: 600;">MOBILE DEV</span>
                        <h3 style="margin: 1rem 0;">Cross-Platform Mobile Apps with Flutter</h3>
                        <p style="color: var(--text-color); opacity: 0.8; margin-bottom: 1.5rem;">How I use Flutter to deliver seamless mobile experiences on both iOS and Android simultaneously.</p>
                        <a href="javascript:void(0);" style="color: var(--main-color); text-decoration: none; font-weight: 600; display: inline-flex; align-items: center; gap: 5px;">Read More <i class='bx bx-right-arrow-alt'></i></a>
                    </div>
                </div>
            </div>
        </section>

        <!-- CONTACT TAB -->
"@
$html = $html.Replace('        <!-- CONTACT TAB -->', $insightsSectionHtml)


# 5. Brief Video Intro
$videoSearch = @"
                    <p>Beyond the code, I am a problem solver at heart. Whether it's debugging a complex algorithm or refining a pixel-perfect user interface, I enjoy the process of continuous improvement.</p>
                    
                    <button class="btn-primary" onclick="openModal('gallery-modal')" style="margin-bottom: 2rem;">
"@
$videoHtml = @"
                    <p>Beyond the code, I am a problem solver at heart. Whether it's debugging a complex algorithm or refining a pixel-perfect user interface, I enjoy the process of continuous improvement.</p>
                    
                    <!-- NEW VIDEO SECTION -->
                    <div class="video-intro" style="margin: 2rem 0; border-radius: 12px; overflow: hidden; box-shadow: 0 10px 20px rgba(0,0,0,0.15); border: 2px solid var(--border-color);">
                        <video width="100%" controls poster="img/profile.jpg">
                            <!-- Placeholder for actual video. Place 'my-intro-video.mp4' in root folder -->
                            <source src="my-intro-video.mp4" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    </div>

                    <button class="btn-primary" onclick="openModal('gallery-modal')" style="margin-bottom: 2rem;">
"@
$html = $html.Replace($videoSearch, $videoHtml)

# 6. Fun Easter Egg script (Konami Code)
$konamiSearch = @"
    </script>
</body>
"@
$konamiScript = @"

        // --- KONAMI CODE EASTER EGG ---
        const konamiCode = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
        let konamiIndex = 0;
        
        document.addEventListener('keydown', (e) => {
            if (e.key === konamiCode[konamiIndex]) {
                konamiIndex++;
                if (konamiIndex === konamiCode.length) {
                    activateEasterEgg();
                    konamiIndex = 0;
                }
            } else {
                konamiIndex = 0;
            }
        });

        function activateEasterEgg() {
            alert("🎮 YOU FOUND THE DEVELOPER EASTER EGG! 🎮\n\nLeveling up your digital experience...");
            document.body.style.animation = "spin 1s linear";
            setTimeout(() => { document.body.style.animation = ""; }, 1000);
            
            // Add some confetti elements
            for(let i=0; i<50; i++) {
                const confetti = document.createElement('div');
                confetti.style.position = 'fixed';
                confetti.style.width = '10px';
                confetti.style.height = '10px';
                confetti.style.backgroundColor = ['#E34F26', '#1572B6', '#F7DF1E', '#61DAFB'][Math.floor(Math.random()*4)];
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.top = '-10px';
                confetti.style.zIndex = '9999';
                confetti.style.borderRadius = '50%';
                confetti.style.transition = 'transform 3s cubic-bezier(0.1, 0.8, 0.3, 1), top 3s linear';
                document.body.appendChild(confetti);
                
                setTimeout(() => {
                    confetti.style.top = '100vh';
                    confetti.style.transform = `rotate(` + (Math.random() * 720) + `deg)`;
                }, 10);
                setTimeout(() => { confetti.remove(); }, 3000);
            }
        }
    </script>
</body>
"@
$html = $html.Replace($konamiSearch, $konamiScript)

$html | Set-Content -Path 'index.html'

# Add scroll-marquee keyframe to CSS
$css = Get-Content -Path 'style.css' -Raw
if ($css -notmatch '@keyframes scroll-marquee') {
    $css += "`n`n@keyframes scroll-marquee {`n    0% { transform: translateX(0); }`n    100% { transform: translateX(-50%); }`n}`n"
    $css += "`n@keyframes spin {`n    from { transform: rotate(0deg); }`n    to { transform: rotate(360deg); }`n}`n"
    
    # Also add some hover effects for blog cards
    $css += "`n.blog-card:hover {`n    transform: translateY(-5px);`n    box-shadow: 0 10px 30px rgba(0,0,0,0.3);`n}`n"

    $css | Set-Content -Path 'style.css'
}

