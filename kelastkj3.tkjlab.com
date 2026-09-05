<!DOCTYPE html>
<html lang="id" class="scroll-smooth">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">

    <!-- Primary Meta Tags -->
    <title>XI-TKJ3 | Website Resmi Kelas Teknik Komputer &amp; Jaringan</title>
    <meta name="title" content="XI-TKJ3 | Website Resmi Kelas Teknik Komputer & Jaringan">
    <meta name="description"
        content="Website resmi kelas XI-TKJ3 — Ruang arsip perjalanan, kegiatan belajar, struktur organisasi, dan momen kebersamaan siswa Teknik Komputer dan Jaringan.">
    <meta name="keywords"
        content="TKJ, XI-TKJ3, Teknik Komputer dan Jaringan, Website Kelas, Siswa TKJ, Jaringan Komputer, SMK">
    <meta name="author" content="Ricardo Anggoro Barkah">
    <meta name="theme-color" content="#070d18">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:title" content="XI-TKJ3 | Website Resmi Kelas Teknik Komputer & Jaringan">
    <meta property="og:description"
        content="Koleksi cerita, program keahlian, dan struktur organisasi kelas XI-TKJ3. We learn together, grow together, and make memories together. ✨">

    <!-- Favicon SVG -->
    <link rel="icon" type="image/svg+xml"
        href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><rect width='32' height='32' rx='8' fill='%230b1526'/><path d='M8 11h16M8 16h11M8 21h14' stroke='%2338bdf8' stroke-width='2.5' stroke-linecap='round'/><circle cx='24' cy='21' r='2' fill='%2300f2fe'/></svg>">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap"
        rel="stylesheet">

    <style>
        /* -------------------------------------------------------------
           LOADING SCREEN
        ------------------------------------------------------------- */
        #loadingScreen {
            position: fixed;
            inset: 0;
            z-index: 2000;
            background: #060b14;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 18px;
            transition: opacity 0.5s ease, visibility 0.5s ease;
        }

        #loadingScreen.hidden {
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
        }

        .loader-logo {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            background: linear-gradient(135deg, #0284c7, #00f2fe);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #050b14;
            box-shadow: 0 0 30px rgba(0, 242, 254, 0.4);
            animation: loader-pulse 1.3s ease-in-out infinite;
        }

        .loader-logo svg {
            width: 34px;
            height: 34px;
        }

        @keyframes loader-pulse {

            0%,
            100% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.1);
            }
        }

        .loader-text {
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.85rem;
            color: #38bdf8;
            letter-spacing: 0.08em;
        }

        .loader-bar-track {
            width: 160px;
            height: 4px;
            background: rgba(56, 189, 248, 0.15);
            border-radius: 999px;
            overflow: hidden;
        }

        .loader-bar-fill {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #00f2fe, #38bdf8);
            border-radius: 999px;
            transition: width 0.3s ease;
        }

        /* -------------------------------------------------------------
           DESIGN TOKENS & CSS VARIABLES
        ------------------------------------------------------------- */
        :root {
            --bg-base: #060b14;
            --bg-surface: #0b1322;
            --bg-card: rgba(15, 25, 45, 0.7);
            --bg-card-hover: rgba(22, 37, 65, 0.85);
            --bg-glass: rgba(11, 19, 34, 0.75);
            --border-glass: rgba(56, 189, 248, 0.15);
            --border-hover: rgba(56, 189, 248, 0.45);

            --primary: #00f2fe;
            --primary-glow: rgba(0, 242, 254, 0.35);
            --cyan-accent: #38bdf8;
            --blue-deep: #0284c7;
            --indigo-accent: #6366f1;

            --text-main: #f1f5f9;
            --text-muted: #94a3b8;
            --text-dim: #64748b;

            --badge-bg: rgba(56, 189, 248, 0.12);
            --badge-border: rgba(56, 189, 248, 0.3);

            --font-sans: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            --font-mono: 'JetBrains Mono', monospace;

            --nav-height: 72px;
            --container-max: 1200px;
            --radius-sm: 10px;
            --radius-md: 16px;
            --radius-lg: 24px;
            --radius-full: 9999px;

            --shadow-glow: 0 0 35px -5px rgba(0, 242, 254, 0.2);
            --shadow-card: 0 20px 40px -15px rgba(0, 0, 0, 0.6);
        }

        /* Light Theme Override */
        html[data-theme="light"] {
            --bg-base: #eef4fb;
            --bg-surface: #ffffff;
            --bg-card: rgba(255, 255, 255, 0.85);
            --bg-card-hover: rgba(255, 255, 255, 0.98);
            --bg-glass: rgba(255, 255, 255, 0.82);
            --border-glass: rgba(2, 132, 199, 0.18);
            --border-hover: rgba(2, 132, 199, 0.5);

            --text-main: #0f172a;
            --text-muted: #475569;
            --text-dim: #64748b;

            --badge-bg: rgba(2, 132, 199, 0.1);
            --badge-border: rgba(2, 132, 199, 0.28);
        }

        html[data-theme="light"] body::before {
            background-image:
                radial-gradient(circle at 15% 20%, rgba(2, 132, 199, 0.10) 0%, transparent 40%),
                radial-gradient(circle at 85% 65%, rgba(99, 102, 241, 0.08) 0%, transparent 45%),
                radial-gradient(circle at 50% 90%, rgba(0, 242, 254, 0.08) 0%, transparent 50%),
                linear-gradient(to right, rgba(2, 132, 199, 0.05) 1px, transparent 1px),
                linear-gradient(to bottom, rgba(2, 132, 199, 0.05) 1px, transparent 1px);
        }

        html[data-theme="light"] .hero-title,
        html[data-theme="light"] .section-title,
        html[data-theme="light"] .program-title,
        html[data-theme="light"] .gallery-title,
        html[data-theme="light"] .org-name,
        html[data-theme="light"] .footer-brand,
        html[data-theme="light"] .nav-brand,
        html[data-theme="light"] .ig-handle-text,
        html[data-theme="light"] .stat-number,
        html[data-theme="light"] .val-title,
        html[data-theme="light"] .drawer-link,
        html[data-theme="light"] .terminal-val {
            color: #0f172a;
        }

        html[data-theme="light"] .section-title .text-gradient {
            background: linear-gradient(135deg, #0f172a 30%, #0284c7 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        html[data-theme="light"] .btn-secondary,
        html[data-theme="light"] .drawer-link,
        html[data-theme="light"] .nav-link {
            color: #334155;
        }

        html[data-theme="light"] .toast {
            background: rgba(255, 255, 255, 0.95);
            color: #0f172a;
        }

        html[data-theme="light"] .mobile-drawer {
            background: rgba(255, 255, 255, 0.98);
        }

        .theme-toggle-btn {
            width: 44px;
            height: 44px;
            border-radius: var(--radius-sm);
            background: rgba(56, 189, 248, 0.08);
            border: 1px solid var(--border-glass);
            color: var(--primary);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.25s ease;
            flex-shrink: 0;
        }

        .theme-toggle-btn:hover {
            border-color: var(--primary);
            background: rgba(56, 189, 248, 0.18);
            transform: translateY(-1px);
        }

        .theme-toggle-btn svg {
            width: 19px;
            height: 19px;
        }

        .theme-toggle-btn .icon-moon {
            display: inline-flex;
        }

        .theme-toggle-btn .icon-sun {
            display: none;
        }

        html[data-theme="light"] .theme-toggle-btn .icon-moon {
            display: none;
        }

        html[data-theme="light"] .theme-toggle-btn .icon-sun {
            display: inline-flex;
        }

        /* Terminal card keeps its dark "code" aesthetic in both themes for readability */
        html[data-theme="light"] .hero-card-terminal {
            background: rgba(15, 25, 45, 0.96);
            border-color: rgba(56, 189, 248, 0.25);
        }

        html[data-theme="light"] .terminal-title {
            color: #64748b;
        }

        html[data-theme="light"] .terminal-key {
            color: #94a3b8;
        }

        html[data-theme="light"] .terminal-row {
            border-color: rgba(56, 189, 248, 0.1);
        }

        html[data-theme="light"] .tech-pill {
            color: #e2e8f0;
            background: rgba(56, 189, 248, 0.12);
            border-color: rgba(56, 189, 248, 0.25);
        }

        /* -------------------------------------------------------------
           RESET & GLOBAL STYLES
        ------------------------------------------------------------- */
        *,
        *::before,
        *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html {
            scroll-behavior: smooth;
            scroll-padding-top: calc(var(--nav-height) + 20px);
        }

        body {
            font-family: var(--font-sans);
            background-color: var(--bg-base);
            color: var(--text-main);
            line-height: 1.7;
            overflow-x: hidden;
            position: relative;
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* Ambient Glow & Grid Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-image:
                radial-gradient(circle at 15% 20%, rgba(14, 116, 144, 0.18) 0%, transparent 40%),
                radial-gradient(circle at 85% 65%, rgba(99, 102, 241, 0.14) 0%, transparent 45%),
                radial-gradient(circle at 50% 90%, rgba(0, 242, 254, 0.12) 0%, transparent 50%),
                linear-gradient(to right, rgba(56, 189, 248, 0.03) 1px, transparent 1px),
                linear-gradient(to bottom, rgba(56, 189, 248, 0.03) 1px, transparent 1px);
            background-size: 100% 100%, 100% 100%, 100% 100%, 48px 48px, 48px 48px;
            pointer-events: none;
            z-index: -1;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        button {
            font-family: inherit;
            cursor: pointer;
            border: none;
            background: none;
        }

        .container {
            max-width: var(--container-max);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* -------------------------------------------------------------
           CUSTOM NETWORK-PING CURSOR (desktop only)
        ------------------------------------------------------------- */
        html.custom-cursor-active,
        html.custom-cursor-active body,
        html.custom-cursor-active a,
        html.custom-cursor-active button {
            cursor: none !important;
        }

        .net-cursor-dot,
        .net-cursor-ring {
            position: fixed;
            top: 0;
            left: 0;
            pointer-events: none;
            z-index: 3000;
            transform: translate(-50%, -50%);
            will-change: transform;
        }

        .net-cursor-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--primary);
            box-shadow: 0 0 10px 2px var(--primary-glow);
        }

        .net-cursor-ring {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            border: 1.5px solid rgba(56, 189, 248, 0.55);
            transition: width 0.2s ease, height 0.2s ease, border-color 0.2s ease, opacity 0.2s ease;
        }

        .net-cursor-ring.is-active {
            width: 48px;
            height: 48px;
            border-color: var(--primary);
            background: rgba(0, 242, 254, 0.06);
        }

        #netCursorTrailCanvas {
            position: fixed;
            inset: 0;
            z-index: 2999;
            pointer-events: none;
        }

        /* -------------------------------------------------------------
           SCROLL PROGRESS BAR
        ------------------------------------------------------------- */
        .progress-bar-wrap {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            z-index: 1001;
            background: transparent;
        }

        .progress-bar-fill {
            height: 100%;
            width: 0%;
            background: linear-gradient(90deg, #00f2fe, #38bdf8, #818cf8);
            box-shadow: 0 0 10px #00f2fe;
            transition: width 0.15s ease-out;
        }

        /* -------------------------------------------------------------
           NAVBAR (DESKTOP & MOBILE WRAPPER)
        ------------------------------------------------------------- */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: var(--nav-height);
            background: var(--bg-glass);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-bottom: 1px solid var(--border-glass);
            z-index: 999;
            transition: all 0.3s ease;
        }

        .navbar.scrolled {
            background: rgba(6, 11, 20, 0.92);
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.7);
            border-bottom-color: rgba(56, 189, 248, 0.25);
        }

        .nav-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 100%;
        }

        .nav-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 800;
            font-size: 1.25rem;
            letter-spacing: -0.02em;
            color: #fff;
        }

        .brand-logo-badge {
            width: 38px;
            height: 38px;
            border-radius: var(--radius-sm);
            background: linear-gradient(135deg, #0284c7, #00f2fe);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #050b14;
            box-shadow: 0 0 15px rgba(0, 242, 254, 0.4);
        }

        .brand-logo-badge svg {
            width: 22px;
            height: 22px;
        }

        .brand-status-dot {
            width: 8px;
            height: 8px;
            background-color: #10b981;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 0 8px #10b981;
            animation: pulse-dot 2s infinite;
        }

        @keyframes pulse-dot {

            0%,
            100% {
                transform: scale(1);
                opacity: 1;
            }

            50% {
                transform: scale(1.3);
                opacity: 0.7;
            }
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 8px;
            list-style: none;
        }

        .nav-link {
            padding: 8px 16px;
            font-size: 0.92rem;
            font-weight: 500;
            color: var(--text-muted);
            border-radius: var(--radius-sm);
            transition: all 0.25s ease;
            position: relative;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #fff;
            background: rgba(56, 189, 248, 0.08);
        }

        .nav-link.active {
            color: var(--primary);
            font-weight: 600;
        }

        .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 16px;
            right: 16px;
            height: 2px;
            background: var(--primary);
            box-shadow: 0 0 8px var(--primary);
            border-radius: 2px;
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-cta-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 18px;
            background: linear-gradient(135deg, rgba(56, 189, 248, 0.15), rgba(0, 242, 254, 0.25));
            border: 1px solid var(--border-hover);
            border-radius: var(--radius-full);
            color: var(--primary);
            font-size: 0.88rem;
            font-weight: 600;
            transition: all 0.25s ease;
        }

        .nav-cta-btn:hover {
            background: linear-gradient(135deg, #00f2fe, #38bdf8);
            color: #040913;
            box-shadow: var(--shadow-glow);
            transform: translateY(-1px);
        }

        .nav-cta-btn.tiktok-btn {
            background: linear-gradient(135deg, rgba(254, 44, 85, 0.15), rgba(37, 244, 238, 0.2));
            border-color: rgba(37, 244, 238, 0.4);
            color: #f1f5f9;
        }

        html[data-theme="light"] .nav-cta-btn.tiktok-btn {
            background: linear-gradient(135deg, rgba(254, 44, 85, 0.12), rgba(2, 132, 199, 0.12));
            border-color: rgba(254, 44, 85, 0.35);
            color: #9d174d;
        }

        .nav-cta-btn.tiktok-btn:hover {
            background: linear-gradient(135deg, #fe2c55, #25f4ee);
            color: #040913;
            box-shadow: 0 0 25px rgba(254, 44, 85, 0.35);
        }

        .mobile-menu-btn {
            display: none;
            width: 44px;
            height: 44px;
            border-radius: var(--radius-sm);
            background: rgba(56, 189, 248, 0.08);
            border: 1px solid var(--border-glass);
            color: #fff;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

        .mobile-menu-btn:hover {
            border-color: var(--primary);
            background: rgba(56, 189, 248, 0.18);
        }

        /* -------------------------------------------------------------
           MOBILE OFFCANVAS DRAWER
        ------------------------------------------------------------- */
        .mobile-drawer {
            position: fixed;
            top: 0;
            right: -100%;
            width: 82%;
            max-width: 340px;
            height: 100vh;
            background: rgba(10, 18, 32, 0.97);
            backdrop-filter: blur(25px);
            -webkit-backdrop-filter: blur(25px);
            border-left: 1px solid var(--border-glass);
            z-index: 1000;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: right 0.35s cubic-bezier(0.16, 1, 0.3, 1);
            box-shadow: -15px 0 35px rgba(0, 0, 0, 0.7);
        }

        .mobile-drawer.open {
            right: 0;
        }

        .drawer-overlay {
            position: fixed;
            inset: 0;
            background: rgba(3, 7, 14, 0.75);
            backdrop-filter: blur(4px);
            z-index: 999;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s ease;
        }

        .drawer-overlay.active {
            opacity: 1;
            pointer-events: auto;
        }

        .drawer-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-glass);
        }

        .drawer-close-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-glass);
            color: var(--text-muted);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
        }

        .drawer-close-btn:hover {
            color: #fff;
            background: rgba(239, 68, 68, 0.2);
            border-color: rgba(239, 68, 68, 0.4);
        }

        .drawer-links {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-top: 24px;
        }

        .drawer-link {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 14px 16px;
            border-radius: var(--radius-md);
            color: var(--text-muted);
            font-size: 1.05rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .drawer-link svg {
            width: 20px;
            height: 20px;
            color: var(--primary);
        }

        .drawer-link:hover,
        .drawer-link.active {
            background: rgba(56, 189, 248, 0.12);
            color: #fff;
            border-left: 3px solid var(--primary);
        }

        .drawer-footer {
            padding-top: 20px;
            border-top: 1px solid var(--border-glass);
            text-align: center;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn-secondary-tiktok {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            width: 100%;
            padding: 14px 28px;
            border-radius: var(--radius-md);
            font-weight: 700;
            font-size: 0.98rem;
            background: rgba(15, 25, 45, 0.7);
            border: 1px solid rgba(37, 244, 238, 0.35);
            color: #fff;
            transition: all 0.3s ease;
        }

        .btn-secondary-tiktok:hover {
            border-color: #fe2c55;
            background: rgba(254, 44, 85, 0.12);
            color: #fe2c55;
        }

        /* -------------------------------------------------------------
           SECTIONS GENERAL
        ------------------------------------------------------------- */
        section {
            padding: 90px 0;
            position: relative;
        }

        .section-header {
            text-align: center;
            max-width: 680px;
            margin: 0 auto 54px;
        }

        .section-tag {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--primary);
            background: var(--badge-bg);
            border: 1px solid var(--badge-border);
            border-radius: var(--radius-full);
            padding: 6px 16px;
            margin-bottom: 14px;
        }

        .section-title {
            font-size: clamp(1.85rem, 3.5vw, 2.6rem);
            font-weight: 800;
            color: #fff;
            letter-spacing: -0.02em;
            line-height: 1.25;
            margin-bottom: 14px;
        }

        .section-title .text-gradient {
            background: linear-gradient(135deg, #fff 30%, #38bdf8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .section-subtitle {
            font-size: 1.05rem;
            color: var(--text-muted);
            line-height: 1.6;
        }

        /* -------------------------------------------------------------
           HERO SECTION (DESKTOP GRID & MOBILE STACK)
        ------------------------------------------------------------- */
        .hero-section {
            padding-top: calc(var(--nav-height) + 50px);
            padding-bottom: 80px;
            min-height: calc(100vh - var(--nav-height));
            display: flex;
            align-items: center;
        }

        .hero-grid {
            display: grid;
            grid-template-columns: 1.15fr 0.85fr;
            gap: 48px;
            align-items: center;
        }

        .hero-content {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .hero-badge-wrap {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: rgba(15, 23, 42, 0.8);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-full);
            padding: 6px 16px 6px 8px;
            width: fit-content;
        }

        .hero-badge-pill {
            background: linear-gradient(135deg, #0284c7, #00f2fe);
            color: #040913;
            font-size: 0.75rem;
            font-weight: 800;
            padding: 3px 10px;
            border-radius: var(--radius-full);
            letter-spacing: 0.05em;
        }

        .hero-badge-text {
            font-size: 0.85rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        .hero-title {
            font-size: clamp(2.4rem, 4.5vw, 3.6rem);
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -0.03em;
            color: #ffffff;
        }

        .hero-title span.glow-text {
            background: linear-gradient(135deg, #00f2fe 0%, #38bdf8 50%, #818cf8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 30px rgba(0, 242, 254, 0.3);
        }

        .hero-tagline {
            font-family: var(--font-mono);
            font-size: 1.05rem;
            color: var(--cyan-accent);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .hero-tagline .cursor {
            display: inline-block;
            width: 8px;
            height: 18px;
            background: var(--primary);
            animation: blink 1s step-end infinite;
        }

        @keyframes blink {

            0%,
            100% {
                opacity: 1;
            }

            50% {
                opacity: 0;
            }
        }

        .hero-desc {
            font-size: 1.05rem;
            color: var(--text-muted);
            line-height: 1.75;
            max-width: 580px;
        }

        .hero-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            margin-top: 8px;
        }

        .btn-primary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: linear-gradient(135deg, #00f2fe, #0284c7);
            color: #030812;
            padding: 14px 28px;
            border-radius: var(--radius-md);
            font-weight: 700;
            font-size: 0.98rem;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            box-shadow: 0 4px 20px rgba(0, 242, 254, 0.35);
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 8px 30px rgba(0, 242, 254, 0.5);
            background: linear-gradient(135deg, #58dbe6, #0284c7);
        }

        .btn-secondary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: rgba(15, 25, 45, 0.7);
            border: 1px solid var(--border-glass);
            color: #fff;
            padding: 14px 26px;
            border-radius: var(--radius-md);
            font-weight: 600;
            font-size: 0.98rem;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            border-color: var(--primary);
            background: rgba(56, 189, 248, 0.12);
            color: var(--primary);
            transform: translateY(-3px);
        }

        /* Hero Interactive TKJ Terminal / Card */
        .hero-card-terminal {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 24px;
            box-shadow: var(--shadow-card);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .hero-card-terminal:hover {
            border-color: var(--border-hover);
            box-shadow: var(--shadow-glow), var(--shadow-card);
        }

        .terminal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 16px;
            margin-bottom: 16px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }

        .terminal-dots {
            display: flex;
            gap: 7px;
        }

        .terminal-dots span {
            width: 11px;
            height: 11px;
            border-radius: 50%;
        }

        .terminal-dots span:nth-child(1) {
            background-color: #ef4444;
        }

        .terminal-dots span:nth-child(2) {
            background-color: #f59e0b;
        }

        .terminal-dots span:nth-child(3) {
            background-color: #10b981;
        }

        .terminal-title {
            font-family: var(--font-mono);
            font-size: 0.8rem;
            color: var(--text-dim);
            letter-spacing: 0.04em;
        }

        .terminal-body {
            font-family: var(--font-mono);
            font-size: 0.88rem;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .terminal-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 14px;
            background: rgba(6, 11, 20, 0.6);
            border: 1px solid rgba(56, 189, 248, 0.1);
            border-radius: var(--radius-sm);
        }

        .terminal-key {
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .terminal-val {
            color: var(--primary);
            font-weight: 700;
        }

        .terminal-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 14px;
        }

        .tech-pill {
            font-family: var(--font-mono);
            font-size: 0.75rem;
            color: #e2e8f0;
            background: rgba(56, 189, 248, 0.08);
            border: 1px solid rgba(56, 189, 248, 0.2);
            padding: 5px 12px;
            border-radius: var(--radius-full);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s;
        }

        .tech-pill:hover {
            border-color: var(--primary);
            color: var(--primary);
            background: rgba(0, 242, 254, 0.15);
        }

        /* -------------------------------------------------------------
           STATISTICS SECTION (QUICK BAR)
        ------------------------------------------------------------- */
        .stats-banner {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-top: -30px;
            margin-bottom: 30px;
            z-index: 10;
            position: relative;
        }

        .stat-box {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-md);
            padding: 22px 20px;
            text-align: center;
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            box-shadow: 0 10px 25px -10px rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 6px;
        }

        .stat-box:hover {
            transform: translateY(-6px);
            border-color: var(--border-hover);
            box-shadow: var(--shadow-glow);
            background: var(--bg-card-hover);
        }

        .stat-icon {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: rgba(56, 189, 248, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 4px;
        }

        .stat-icon svg {
            width: 22px;
            height: 22px;
        }

        .stat-number {
            font-size: 2.1rem;
            font-weight: 800;
            color: #fff;
            line-height: 1.1;
            font-family: var(--font-mono);
        }

        .stat-label {
            font-size: 0.88rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        /* -------------------------------------------------------------
           TENTANG KAMI (ABOUT SECTION)
        ------------------------------------------------------------- */
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 36px;
            align-items: stretch;
        }

        .about-card-main {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 36px;
            backdrop-filter: blur(16px);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            gap: 24px;
            box-shadow: var(--shadow-card);
        }

        .about-motto-box {
            background: linear-gradient(135deg, rgba(2, 132, 199, 0.15), rgba(99, 102, 241, 0.15));
            border-left: 4px solid var(--primary);
            border-radius: 0 var(--radius-md) var(--radius-md) 0;
            padding: 20px 24px;
            margin-top: 10px;
        }

        .about-motto-box p {
            color: #e0f2fe;
            font-size: 1.02rem;
            font-style: italic;
            line-height: 1.6;
        }

        .about-side-cards {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .gender-stat-card {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-md);
            padding: 24px;
            backdrop-filter: blur(16px);
        }

        .gender-progress-wrap {
            margin-top: 16px;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .gender-item-header {
            display: flex;
            justify-content: space-between;
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--text-muted);
            margin-bottom: 6px;
        }

        .gender-item-header span.count {
            color: #fff;
            font-family: var(--font-mono);
        }

        .progress-bar-bg {
            width: 100%;
            height: 10px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: var(--radius-full);
            overflow: hidden;
        }

        .progress-bar-fill-female {
            height: 100%;
            width: 53%;
            /* 19 / 36 */
            background: linear-gradient(90deg, #ec4899, #f43f5e);
            border-radius: var(--radius-full);
            box-shadow: 0 0 10px rgba(236, 72, 153, 0.5);
        }

        .progress-bar-fill-male {
            height: 100%;
            width: 47%;
            /* 17 / 36 */
            background: linear-gradient(90deg, #0284c7, #00f2fe);
            border-radius: var(--radius-full);
            box-shadow: 0 0 10px rgba(0, 242, 254, 0.5);
        }

        .values-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
        }

        .value-card {
            background: rgba(15, 25, 45, 0.6);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-md);
            padding: 18px 14px;
            text-align: center;
            transition: all 0.25s ease;
        }

        .value-card:hover {
            border-color: var(--border-hover);
            transform: translateY(-3px);
            background: var(--bg-card-hover);
        }

        .value-card .val-emoji {
            font-size: 1.6rem;
            margin-bottom: 8px;
            display: block;
        }

        .value-card .val-title {
            font-size: 0.88rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 4px;
        }

        .value-card .val-desc {
            font-size: 0.75rem;
            color: var(--text-dim);
            line-height: 1.4;
        }

        /* -------------------------------------------------------------
           PROGRAM KEJURUAN TKJ (CURRICULUM & SKILLS)
        ------------------------------------------------------------- */
        .program-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .program-card {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 28px;
            backdrop-filter: blur(16px);
            transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .program-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--primary), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .program-card:hover {
            transform: translateY(-8px);
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            box-shadow: var(--shadow-glow), var(--shadow-card);
        }

        .program-card:hover::before {
            opacity: 1;
        }

        .program-icon-box {
            width: 52px;
            height: 52px;
            border-radius: var(--radius-md);
            background: rgba(56, 189, 248, 0.12);
            border: 1px solid rgba(56, 189, 248, 0.25);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .program-card:hover .program-icon-box {
            background: linear-gradient(135deg, #00f2fe, #0284c7);
            color: #030812;
            transform: scale(1.08);
            box-shadow: 0 0 20px rgba(0, 242, 254, 0.4);
        }

        .program-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 10px;
        }

        .program-desc {
            font-size: 0.92rem;
            color: var(--text-muted);
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .program-tags-list {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            margin-top: auto;
            padding-top: 14px;
            border-top: 1px solid rgba(255, 255, 255, 0.06);
        }

        .program-tag-item {
            font-family: var(--font-mono);
            font-size: 0.72rem;
            color: var(--cyan-accent);
            background: rgba(56, 189, 248, 0.08);
            padding: 3px 9px;
            border-radius: var(--radius-full);
        }

        /* -------------------------------------------------------------
           STRUKTUR KELAS (ORGANIZATIONAL STRUCTURE)
        ------------------------------------------------------------- */
        .org-container {
            display: flex;
            flex-direction: column;
            gap: 32px;
            align-items: center;
        }

        /* Wali Kelas VIP Highlight */
        .org-vip-card {
            max-width: 480px;
            width: 100%;
            background: linear-gradient(135deg, rgba(15, 25, 45, 0.95), rgba(30, 41, 59, 0.8));
            border: 1.5px solid rgba(245, 158, 11, 0.4);
            border-radius: var(--radius-lg);
            padding: 28px;
            text-align: center;
            box-shadow: 0 15px 35px -10px rgba(245, 158, 11, 0.25);
            backdrop-filter: blur(16px);
            position: relative;
            transition: all 0.3s ease;
        }

        .org-vip-card:hover {
            transform: translateY(-6px);
            border-color: #f59e0b;
            box-shadow: 0 20px 45px -10px rgba(245, 158, 11, 0.4);
        }

        .vip-crown-badge {
            position: absolute;
            top: -14px;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(135deg, #f59e0b, #d97706);
            color: #000;
            font-size: 0.72rem;
            font-weight: 800;
            padding: 4px 14px;
            border-radius: var(--radius-full);
            letter-spacing: 0.08em;
            text-transform: uppercase;
            box-shadow: 0 4px 10px rgba(245, 158, 11, 0.4);
        }

        .org-vip-avatar {
            width: 76px;
            height: 76px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f59e0b, #b45309);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            font-weight: 800;
            margin: 8px auto 14px;
            box-shadow: 0 0 25px rgba(245, 158, 11, 0.35);
        }

        /* Standard Structure Grid */
        .org-leaders-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
            max-width: 720px;
            width: 100%;
        }

        .org-staff-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            width: 100%;
        }

        .org-card {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 24px 20px;
            text-align: center;
            backdrop-filter: blur(16px);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .org-card:hover {
            transform: translateY(-6px);
            border-color: var(--border-hover);
            background: var(--bg-card-hover);
            box-shadow: var(--shadow-glow);
        }

        .org-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0284c7, #00f2fe);
            color: #030812;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.35rem;
            font-weight: 800;
            margin-bottom: 14px;
            box-shadow: 0 0 15px rgba(0, 242, 254, 0.3);
            transition: transform 0.3s ease;
        }

        .org-card:hover .org-avatar {
            transform: scale(1.1);
        }

        .org-role-badge {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: var(--primary);
            background: rgba(56, 189, 248, 0.1);
            border: 1px solid rgba(56, 189, 248, 0.25);
            border-radius: var(--radius-full);
            padding: 3px 12px;
            margin-bottom: 8px;
        }

        .org-name {
            font-size: 1.05rem;
            font-weight: 700;
            color: #fff;
        }

        /* -------------------------------------------------------------
           GALLERY / LAB ACTIVITIES & MOMENTS
        ------------------------------------------------------------- */
        .gallery-filter {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 36px;
        }

        .filter-btn {
            padding: 8px 20px;
            border-radius: var(--radius-full);
            font-size: 0.88rem;
            font-weight: 600;
            color: var(--text-muted);
            background: rgba(15, 25, 45, 0.6);
            border: 1px solid var(--border-glass);
            transition: all 0.25s ease;
        }

        .filter-btn:hover,
        .filter-btn.active {
            color: #030812;
            background: var(--primary);
            border-color: var(--primary);
            box-shadow: 0 0 15px rgba(0, 242, 254, 0.35);
        }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .gallery-item {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            overflow: hidden;
            backdrop-filter: blur(16px);
            transition: all 0.35s ease;
            display: flex;
            flex-direction: column;
        }

        .gallery-item:hover {
            transform: translateY(-6px);
            border-color: var(--border-hover);
            box-shadow: var(--shadow-glow);
        }

        .gallery-visual {
            height: 180px;
            background: linear-gradient(135deg, #0b172a, #1e293b);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .gallery-visual svg {
            width: 64px;
            height: 64px;
            color: var(--cyan-accent);
            opacity: 0.75;
            transition: all 0.3s ease;
        }

        .gallery-item:hover .gallery-visual svg {
            transform: scale(1.15);
            opacity: 1;
            color: var(--primary);
        }

        .gallery-visual-badge {
            position: absolute;
            top: 14px;
            left: 14px;
            font-size: 0.72rem;
            font-weight: 700;
            background: rgba(6, 11, 20, 0.85);
            color: var(--primary);
            border: 1px solid var(--border-glass);
            padding: 3px 10px;
            border-radius: var(--radius-full);
            backdrop-filter: blur(8px);
        }

        .gallery-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .gallery-title {
            font-size: 1.1rem;
            font-weight: 700;
            color: #fff;
        }

        .gallery-desc {
            font-size: 0.88rem;
            color: var(--text-muted);
            line-height: 1.5;
        }

        /* -------------------------------------------------------------
           SPIN WHEEL / RANDOM STUDENT PICKER
        ------------------------------------------------------------- */
        .spin-layout {
            display: grid;
            grid-template-columns: 0.85fr 1.15fr;
            gap: 40px;
            align-items: center;
        }

        .spin-wheel-stage {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 22px;
        }

        .spin-wheel-wrap {
            position: relative;
            width: min(380px, 82vw);
            height: min(380px, 82vw);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .spin-wheel-pointer {
            position: absolute;
            top: -6px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 0;
            border-left: 14px solid transparent;
            border-right: 14px solid transparent;
            border-top: 26px solid var(--primary);
            filter: drop-shadow(0 0 8px var(--primary-glow));
            z-index: 5;
        }

        .spin-wheel-outer {
            position: relative;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            padding: 10px;
            background: conic-gradient(from 0deg,
                    rgba(0, 242, 254, 0.5),
                    rgba(99, 102, 241, 0.5),
                    rgba(0, 242, 254, 0.5));
            box-shadow: 0 0 45px -5px rgba(0, 242, 254, 0.35), var(--shadow-card);
            animation: wheel-outer-spin 12s linear infinite;
        }

        @keyframes wheel-outer-spin {
            to {
                transform: rotate(360deg);
            }
        }

        #spinWheelSvg {
            display: block;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: var(--bg-surface);
            transition: transform 5.5s cubic-bezier(0.12, 0.68, 0.15, 1);
            transform: rotate(0deg);
        }

        .spin-wheel-hub {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 64px;
            height: 64px;
            border-radius: 50%;
            background: linear-gradient(135deg, #00f2fe, #0284c7);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 20px rgba(0, 242, 254, 0.5), 0 0 0 6px var(--bg-base);
            z-index: 4;
        }

        .spin-wheel-hub svg {
            width: 26px;
            height: 26px;
            color: #030812;
        }

        .spin-result-box {
            width: 100%;
            max-width: 380px;
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 20px 24px;
            text-align: center;
            backdrop-filter: blur(16px);
            min-height: 74px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 4px;
        }

        .spin-result-label {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--text-dim);
        }

        .spin-result-name {
            font-size: 1.35rem;
            font-weight: 800;
            color: var(--primary);
            font-family: var(--font-mono);
        }

        .spin-btn-primary {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: linear-gradient(135deg, #00f2fe, #0284c7);
            color: #030812;
            padding: 14px 32px;
            border-radius: var(--radius-md);
            font-weight: 700;
            font-size: 1rem;
            box-shadow: 0 4px 20px rgba(0, 242, 254, 0.35);
            transition: all 0.25s ease;
            width: 100%;
            max-width: 380px;
        }

        .spin-btn-primary:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 8px 26px rgba(0, 242, 254, 0.5);
        }

        .spin-btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .spin-panel {
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 30px;
            backdrop-filter: blur(16px);
            box-shadow: var(--shadow-card);
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .spin-panel-label {
            font-size: 0.85rem;
            font-weight: 700;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .spin-panel-label span.count-badge {
            font-family: var(--font-mono);
            font-size: 0.75rem;
            color: var(--primary);
            background: rgba(56, 189, 248, 0.1);
            border: 1px solid rgba(56, 189, 248, 0.25);
            padding: 2px 10px;
            border-radius: var(--radius-full);
        }

        #spinNamesInput {
            width: 100%;
            min-height: 190px;
            resize: vertical;
            background: rgba(6, 11, 20, 0.55);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-md);
            padding: 14px 16px;
            color: var(--text-main);
            font-family: var(--font-mono);
            font-size: 0.88rem;
            line-height: 1.7;
            transition: border-color 0.25s ease;
        }

        #spinNamesInput:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(0, 242, 254, 0.12);
        }

        .spin-panel-hint {
            font-size: 0.8rem;
            color: var(--text-dim);
            line-height: 1.6;
        }

        .spin-panel-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .spin-mini-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 9px 16px;
            font-size: 0.82rem;
            font-weight: 600;
            border-radius: var(--radius-md);
            background: rgba(15, 25, 45, 0.7);
            border: 1px solid var(--border-glass);
            color: var(--text-muted);
            transition: all 0.2s ease;
        }

        .spin-mini-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            background: rgba(56, 189, 248, 0.1);
        }

        .spin-history-wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            min-height: 30px;
        }

        .spin-history-chip {
            font-size: 0.76rem;
            font-family: var(--font-mono);
            color: var(--text-muted);
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid var(--border-glass);
            padding: 4px 10px;
            border-radius: var(--radius-full);
        }

        @media (max-width: 900px) {
            .spin-layout {
                grid-template-columns: 1fr;
            }
        }

        /* -------------------------------------------------------------
           KONTAK & SOCIAL HUB
        ------------------------------------------------------------- */
        .contact-card-wrap {
            max-width: 820px;
            margin: 0 auto;
            background: var(--bg-card);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-lg);
            padding: 44px;
            backdrop-filter: blur(20px);
            box-shadow: var(--shadow-card);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .contact-card-wrap::after {
            content: '';
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, rgba(0, 242, 254, 0.15) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }

        .contact-ig-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(6, 11, 20, 0.7);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-md);
            padding: 20px 24px;
            margin: 28px 0;
            gap: 16px;
            flex-wrap: nowrap;
        }

        .contact-ig-box.tiktok-variant {
            margin-top: 0;
        }

        .contact-ig-left {
            display: flex;
            align-items: center;
            gap: 16px;
            text-align: left;
            min-width: 0;
            flex: 1 1 auto;
        }

        .ig-handle-text,
        .ig-sub-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .ig-icon-badge {
            width: 50px;
            height: 50px;
            border-radius: var(--radius-md);
            background: linear-gradient(45deg, #f09433, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            box-shadow: 0 4px 15px rgba(220, 39, 67, 0.35);
        }

        .ig-icon-badge svg {
            width: 28px;
            height: 28px;
        }

        .tiktok-icon-badge {
            width: 50px;
            height: 50px;
            border-radius: var(--radius-md);
            background: linear-gradient(135deg, #010101, #25f4ee 50%, #fe2c55);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            box-shadow: 0 4px 15px rgba(254, 44, 85, 0.35);
        }

        .tiktok-icon-badge svg {
            width: 26px;
            height: 26px;
        }

        .ig-handle-text {
            font-size: 1.15rem;
            font-weight: 700;
            color: #fff;
        }

        .ig-sub-text {
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .contact-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-shrink: 0;
        }

        .btn-ig-visit {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 22px;
            background: linear-gradient(135deg, #00f2fe, #0284c7);
            color: #030812;
            border-radius: var(--radius-full);
            font-weight: 700;
            font-size: 0.9rem;
            transition: all 0.25s ease;
        }

        .btn-ig-visit:hover {
            transform: scale(1.05);
            box-shadow: var(--shadow-glow);
        }

        .btn-tiktok-visit {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 22px;
            background: linear-gradient(135deg, #fe2c55, #25f4ee);
            color: #030812;
            border-radius: var(--radius-full);
            font-weight: 700;
            font-size: 0.9rem;
            transition: all 0.25s ease;
        }

        .btn-tiktok-visit:hover {
            transform: scale(1.05);
            box-shadow: 0 0 25px rgba(254, 44, 85, 0.4);
        }

        .btn-copy-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid var(--border-glass);
            color: #fff;
            transition: all 0.2s ease;
        }

        .btn-copy-link:hover {
            border-color: var(--primary);
            background: rgba(56, 189, 248, 0.15);
            color: var(--primary);
        }

        /* -------------------------------------------------------------
           QR CODE QUICK-SCAN SECTION
        ------------------------------------------------------------- */
        .qr-section {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            margin: 28px 0;
        }

        .qr-card {
            background: rgba(6, 11, 20, 0.7);
            border: 1px solid var(--border-glass);
            border-radius: var(--radius-md);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            transition: all 0.25s ease;
        }

        .qr-card:hover {
            border-color: var(--border-hover);
            transform: translateY(-4px);
            box-shadow: var(--shadow-glow);
        }

        .qr-card img {
            width: 140px;
            height: auto;
            border-radius: 12px;
            background: #fff;
            padding: 6px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.25);
        }

        .qr-card-label {
            font-size: 0.85rem;
            font-weight: 700;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .qr-card-sub {
            font-size: 0.72rem;
            color: var(--text-dim);
            text-align: center;
        }

        html[data-theme="light"] .qr-card-label {
            color: #0f172a;
        }

        @media (max-width: 480px) {
            .qr-section {
                grid-template-columns: 1fr;
            }
        }

        /* -------------------------------------------------------------
           FOOTER
        ------------------------------------------------------------- */
        .site-footer {
            border-top: 1px solid var(--border-glass);
            background: rgba(4, 8, 15, 0.9);
            padding: 40px 0 30px;
            margin-top: 40px;
            font-size: 0.9rem;
            color: var(--text-dim);
        }

        .footer-inner {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 16px;
            text-align: center;
        }

        .footer-brand {
            font-weight: 800;
            color: #fff;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .footer-credits {
            color: var(--text-muted);
        }

        .footer-credits strong {
            color: var(--primary);
        }

        /* -------------------------------------------------------------
           FLOATING ACTION BUTTONS (BACK TO TOP & IG QUICK)
        ------------------------------------------------------------- */
        .floating-tools {
            position: fixed;
            bottom: 28px;
            right: 28px;
            display: flex;
            flex-direction: column;
            gap: 12px;
            z-index: 990;
        }

        .fab-btn {
            width: 46px;
            height: 46px;
            border-radius: 50%;
            background: rgba(11, 19, 34, 0.85);
            border: 1px solid var(--border-glass);
            color: #fff;
            backdrop-filter: blur(12px);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            opacity: 0;
            pointer-events: none;
            transform: translateY(15px);
        }

        .fab-btn.visible {
            opacity: 1;
            pointer-events: auto;
            transform: translateY(0);
        }

        .fab-btn:hover {
            border-color: var(--primary);
            background: var(--primary);
            color: #030812;
            transform: translateY(-3px) scale(1.08);
            box-shadow: var(--shadow-glow);
        }

        /* -------------------------------------------------------------
           TOAST NOTIFICATION
        ------------------------------------------------------------- */
        .toast {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%) translateY(100px);
            background: rgba(11, 19, 34, 0.95);
            border: 1px solid var(--primary);
            color: #fff;
            padding: 12px 24px;
            border-radius: var(--radius-full);
            font-size: 0.9rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 10px 30px rgba(0, 242, 254, 0.3);
            z-index: 1002;
            opacity: 0;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .toast.show {
            transform: translateX(-50%) translateY(0);
            opacity: 1;
        }

        /* -------------------------------------------------------------
           RESPONSIVE BREAKPOINTS (OPTIMIZED FOR ANDROID & DESKTOP)
        ------------------------------------------------------------- */
        @media (max-width: 1024px) {
            .program-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .org-staff-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .gallery-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .stats-banner {
                grid-template-columns: repeat(2, 1fr);
            }

            .about-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 860px) {

            .nav-links,
            .nav-actions {
                display: none;
            }

            .mobile-menu-btn {
                display: inline-flex;
            }

            .hero-grid {
                grid-template-columns: 1fr;
                gap: 36px;
            }

            .hero-content {
                text-align: center;
                align-items: center;
            }

            .hero-actions {
                justify-content: center;
            }

            .hero-tagline {
                justify-content: center;
            }
        }

        @media (max-width: 640px) {
            :root {
                --nav-height: 64px;
            }

            .container {
                padding: 0 18px;
            }

            section {
                padding: 60px 0;
            }

            .hero-section {
                padding-top: calc(var(--nav-height) + 30px);
            }

            .hero-title {
                font-size: 2.1rem;
            }

            .stats-banner {
                grid-template-columns: 1fr 1fr;
                gap: 12px;
                margin-top: 10px;
            }

            .stat-box {
                padding: 16px 12px;
            }

            .stat-number {
                font-size: 1.75rem;
            }

            .program-grid {
                grid-template-columns: 1fr;
            }

            .org-leaders-grid {
                grid-template-columns: 1fr;
            }

            .org-staff-grid {
                grid-template-columns: 1fr 1fr;
                gap: 12px;
            }

            .gallery-grid {
                grid-template-columns: 1fr;
            }

            .values-grid {
                grid-template-columns: 1fr;
            }

            .about-card-main {
                padding: 24px 20px;
            }

            .contact-card-wrap {
                padding: 28px 18px;
            }

            .contact-ig-box {
                flex-direction: column;
                align-items: flex-start;
            }

            .contact-actions {
                width: 100%;
                justify-content: space-between;
            }

            .btn-ig-visit,
            .btn-tiktok-visit {
                flex: 1;
                justify-content: center;
            }

            .floating-tools {
                bottom: 18px;
                right: 18px;
            }
        }

        /* Safe area support for notch / home indicator on Android */
        @supports (padding-bottom: env(safe-area-inset-bottom)) {
            .site-footer {
                padding-bottom: calc(30px + env(safe-area-inset-bottom));
            }

            .mobile-drawer {
                padding-bottom: calc(24px + env(safe-area-inset-bottom));
            }
        }
    </style>
</head>

<body>

    <!-- Loading Screen -->
    <div id="loadingScreen">
        <div class="loader-logo">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                stroke-linejoin="round">
                <rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect>
                <rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect>
                <line x1="6" y1="6" x2="6.01" y2="6"></line>
                <line x1="6" y1="18" x2="6.01" y2="18"></line>
            </svg>
        </div>
        <div class="loader-text">MEMUAT XI-TKJ3...</div>
        <div class="loader-bar-track">
            <div class="loader-bar-fill" id="loaderBarFill"></div>
        </div>
    </div>

    <!-- Custom Network-Ping Cursor (injected/controlled via JS, desktop only) -->
    <canvas id="netCursorTrailCanvas"></canvas>
    <div class="net-cursor-ring" id="netCursorRing"></div>
    <div class="net-cursor-dot" id="netCursorDot"></div>

    <!-- Progress Indicator Bar -->
    <div class="progress-bar-wrap" aria-hidden="true">
        <div class="progress-bar-fill" id="progressBar"></div>
    </div>

    <!-- Top Navigation Bar -->
    <header class="navbar" id="navbar">
        <div class="container nav-inner">
            <a href="#beranda" class="nav-brand" aria-label="Beranda XI-TKJ3">
                <div class="brand-logo-badge">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                        stroke-linejoin="round">
                        <rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect>
                        <rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect>
                        <line x1="6" y1="6" x2="6.01" y2="6"></line>
                        <line x1="6" y1="18" x2="6.01" y2="18"></line>
                    </svg>
                </div>
                <span>XI-TKJ<span style="color: var(--primary);">3</span></span>
                <span class="brand-status-dot" title="Sistem Aktif"></span>
            </a>

            <!-- Desktop Nav Links -->
            <nav>
                <ul class="nav-links">
                    <li><a href="#beranda" class="nav-link active">Beranda</a></li>
                    <li><a href="#tentang" class="nav-link">Tentang</a></li>
                    <li><a href="#program" class="nav-link">Program</a></li>
                    <li><a href="#struktur" class="nav-link">Struktur</a></li>
                    <li><a href="#galeri" class="nav-link">Aktivitas</a></li>
                    <li><a href="#spin" class="nav-link">Spin Wheel</a></li>
                    <li><a href="#kontak" class="nav-link">Kontak</a></li>
                </ul>
            </nav>

            <!-- Action Buttons (Social) -->
            <div class="nav-actions">
                <a href="https://www.instagram.com/ofc_tkjtigaa" target="_blank" rel="noopener noreferrer"
                    class="nav-cta-btn">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                        <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                        <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                    </svg>
                    <span>Instagram</span>
                </a>
                <a href="https://www.tiktok.com/@xi.tkj3_?_r=1&_t=ZS-99PdWSRMP6z" target="_blank"
                    rel="noopener noreferrer" class="nav-cta-btn tiktok-btn">
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="currentColor">
                        <path
                            d="M16.6 5.82s.51.5 0 0A4.278 4.278 0 0 1 15.54 3h-3.09v12.4a2.592 2.592 0 0 1-2.59 2.5c-1.42 0-2.6-1.16-2.6-2.6c0-1.72 1.66-3.01 3.37-2.48V9.66c-3.45-.46-6.47 2.22-6.47 5.64c0 3.33 2.76 5.7 5.69 5.7c3.14 0 5.69-2.55 5.69-5.7V9.01a7.35 7.35 0 0 0 4.3 1.38V7.3s-1.88.09-3.24-1.48z">
                        </path>
                    </svg>
                    <span>TikTok</span>
                </a>
                <button class="theme-toggle-btn" id="themeToggleBtn" aria-label="Ganti Tema Terang/Gelap">
                    <span class="icon-moon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round">
                            <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                        </svg>
                    </span>
                    <span class="icon-sun">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                            stroke-linecap="round">
                            <circle cx="12" cy="12" r="5"></circle>
                            <line x1="12" y1="1" x2="12" y2="3"></line>
                            <line x1="12" y1="21" x2="12" y2="23"></line>
                            <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
                            <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
                            <line x1="1" y1="12" x2="3" y2="12"></line>
                            <line x1="21" y1="12" x2="23" y2="12"></line>
                            <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
                            <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
                        </svg>
                    </span>
                </button>
            </div>

            <!-- Mobile Hamburger Toggle -->
            <button class="mobile-menu-btn" id="drawerOpenBtn" aria-label="Buka Menu Navigasi">
                <svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </button>
        </div>
    </header>

    <!-- Mobile Drawer & Overlay -->
    <div class="drawer-overlay" id="drawerOverlay"></div>
    <aside class="mobile-drawer" id="mobileDrawer" aria-label="Menu Mobile">
        <div>
            <div class="drawer-header">
                <div class="nav-brand">
                    <div class="brand-logo-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                            <rect x="2" y="2" width="20" height="8" rx="2"></rect>
                            <rect x="2" y="14" width="20" height="8" rx="2"></rect>
                        </svg>
                    </div>
                    <span>XI-TKJ3</span>
                </div>
                <button class="drawer-close-btn" id="drawerCloseBtn" aria-label="Tutup Menu">
                    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                        stroke-linecap="round">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
            </div>

            <ul class="drawer-links">
                <li>
                    <a href="#beranda" class="drawer-link active">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        </svg>
                        Beranda
                    </a>
                </li>
                <li>
                    <a href="#tentang" class="drawer-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M12 16v-4M12 8h.01"></path>
                        </svg>
                        Tentang Kami
                    </a>
                </li>
                <li>
                    <a href="#program" class="drawer-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
                            <polyline points="2 17 12 22 22 17"></polyline>
                            <polyline points="2 12 12 17 22 12"></polyline>
                        </svg>
                        Program Keahlian
                    </a>
                </li>
                <li>
                    <a href="#struktur" class="drawer-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                        Struktur Organisasi
                    </a>
                </li>
                <li>
                    <a href="#galeri" class="drawer-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                            <circle cx="8.5" cy="8.5" r="1.5"></circle>
                            <polyline points="21 15 16 10 5 21"></polyline>
                        </svg>
                        Aktivitas &amp; Momen
                    </a>
                </li>
                <li>
                    <a href="#spin" class="drawer-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="9"></circle>
                            <path d="M12 3v9l6 3"></path>
                        </svg>
                        Spin Wheel
                    </a>
                </li>
                <li>
                    <a href="#kontak" class="drawer-link">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path
                                d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z">
                            </path>
                        </svg>
                        Kontak Kelas
                    </a>
                </li>
            </ul>
        </div>

        <div class="drawer-footer">
            <a href="https://www.instagram.com/ofc_tkjtigaa" target="_blank" rel="noopener noreferrer"
                class="btn-primary" style="width: 100%;">
                Buka Instagram Resmi
            </a>
            <a href="https://www.tiktok.com/@xi.tkj3_?_r=1&_t=ZS-99PdWSRMP6z" target="_blank" rel="noopener noreferrer"
                class="btn-secondary-tiktok">
                Buka TikTok Resmi
            </a>
            <button class="btn-secondary-tiktok" id="themeToggleBtnMobile" style="border-color: var(--border-glass);">
                <span id="themeToggleMobileLabel">🌙 Mode Gelap Aktif</span>
            </button>
        </div>
    </aside>

    <main>
        <!-- =========================================================
             HERO SECTION
        ========================================================= -->
        <section id="beranda" class="hero-section">
            <div class="container">
                <div class="hero-grid">
                    <div class="hero-content">
                        <div class="hero-badge-wrap">
                            <span class="hero-badge-pill">XI · TKJ3</span>
                            <span class="hero-badge-text">Teknik Komputer dan Jaringan</span>
                        </div>

                        <h1 class="hero-title">
                            Ruang Eksplorasi &amp; Karya <br>
                            <span class="glow-text">Kelas XI-TKJ3</span>
                        </h1>

                        <div class="hero-tagline">
                            <span>$&gt;</span>
                            <span id="typingEffect">Connect, Configure, Create ✨</span>
                            <span class="cursor"></span>
                        </div>

                        <p class="hero-desc">
                            Selamat datang di website resmi kelas XI-TKJ3! Tempat menyimpan cerita, momen berharga,
                            karya praktikum, dan perjalanan kita bersama di dunia jaringan komputer.
                        </p>

                        <div class="hero-actions">
                            <a href="#program" class="btn-primary">
                                <span>Jelajahi Program</span>
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"
                                    stroke-width="2.5">
                                    <path d="M5 12h14M12 5l7 7-7 7" />
                                </svg>
                            </a>
                            <a href="#struktur" class="btn-secondary">
                                <span>Struktur Kelas</span>
                            </a>
                        </div>
                    </div>

                    <!-- Interactive Command Center Card -->
                    <div class="hero-card-terminal">
                        <div class="terminal-header">
                            <div class="terminal-dots">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                            <div class="terminal-title">tkj3@sys-node:~# status</div>
                        </div>

                        <div class="terminal-body">
                            <div class="terminal-row">
                                <span class="terminal-key">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 14 14"></polyline>
                                    </svg>
                                    Kelas ID
                                </span>
                                <span class="terminal-val">SMK / XI-TKJ3</span>
                            </div>

                            <div class="terminal-row">
                                <span class="terminal-key">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="9" cy="7" r="4"></circle>
                                    </svg>
                                    Total Siswa
                                </span>
                                <span class="terminal-val">36 Anggota</span>
                            </div>

                            <div class="terminal-row">
                                <span class="terminal-key">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <rect x="2" y="2" width="20" height="8" rx="2"></rect>
                                        <rect x="2" y="14" width="20" height="8" rx="2"></rect>
                                    </svg>
                                    Lab Praktikum
                                </span>
                                <span class="terminal-val" style="color: #10b981;">Online &amp; Aktif</span>
                            </div>

                            <div class="terminal-row">
                                <span class="terminal-key">
                                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                        stroke-width="2">
                                        <path d="M12 2L2 7l10 5 10-5-10-5z"></path>
                                        <path d="M2 17l10 5 10-5"></path>
                                        <path d="M2 12l10 5 10-5"></path>
                                    </svg>
                                    Core Protocol
                                </span>
                                <span class="terminal-val">Solidaritas 100%</span>
                            </div>

                            <div class="terminal-tags">
                                <span class="tech-pill">🌐 MikroTik</span>
                                <span class="tech-pill">🖥️ Cisco Packet Tracer</span>
                                <span class="tech-pill">🐧 Linux Debian</span>
                                <span class="tech-pill">🔒 Firewall &amp; NAT</span>
                                <span class="tech-pill">⚡ Fiber Optic</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- =========================================================
             STATISTICS BANNER
        ========================================================= -->
        <div class="container">
            <div class="stats-banner">
                <div class="stat-box">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                    </div>
                    <span class="stat-number">36</span>
                    <span class="stat-label">Total Siswa</span>
                </div>

                <div class="stat-box">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="8" r="5" />
                            <path d="M12 13v8M9 18h6" />
                        </svg>
                    </div>
                    <span class="stat-number">19</span>
                    <span class="stat-label">Siswa Perempuan</span>
                </div>

                <div class="stat-box">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="10" cy="14" r="5" />
                            <path d="M13.5 10.5L20 4M15 4h5v5" />
                        </svg>
                    </div>
                    <span class="stat-number">17</span>
                    <span class="stat-label">Siswa Laki-laki</span>
                </div>

                <div class="stat-box">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polygon
                                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2">
                            </polygon>
                        </svg>
                    </div>
                    <span class="stat-number">100%</span>
                    <span class="stat-label">Kekompakan</span>
                </div>
            </div>
        </div>

        <!-- =========================================================
             ABOUT SECTION
        ========================================================= -->
        <section id="tentang">
            <div class="container">
                <div class="section-header">
                    <span class="section-tag">Mengenal Lebih Dekat</span>
                    <h2 class="section-title">Tentang <span class="text-gradient">Kelas XI-TKJ3</span></h2>
                    <p class="section-subtitle">Keluarga besar yang berkomitmen mengasah keahlian teknologi informasi,
                        mempererat persahabatan, dan menyongsong masa depan industri digital.</p>
                </div>

                <div class="about-grid">
                    <div class="about-card-main">
                        <div>
                            <h3 style="font-size: 1.4rem; font-weight: 700; color: #fff; margin-bottom: 12px;">Profil
                                &amp; Filosofi Kelas</h3>
                            <p style="color: var(--text-muted); line-height: 1.75; margin-bottom: 16px;">
                                Kelas XI-TKJ3 adalah wadah belajar kolaboratif yang menggabungkan rasa ingin tahu,
                                semangat belajar teknologi jaringan, dan solidaritas tinggi antar sesama anggota.
                            </p>
                            <p style="color: var(--text-muted); line-height: 1.75;">
                                Website ini dirancang sebagai wadah informasi terbuka, arsip prestasi, jadwal praktikum
                                lab, serta galeri momen suka cita yang menyatukan 36 karakter unik menjadi satu kesatuan
                                yang tangguh.
                            </p>
                        </div>

                        <div class="about-motto-box">
                            <p>“We learn together, grow together, and make unforgettable memories together.” ✨</p>
                        </div>
                    </div>

                    <div class="about-side-cards">
                        <!-- Demographics Progress Card -->
                        <div class="gender-stat-card">
                            <h4 style="font-size: 1.1rem; font-weight: 700; color: #fff; margin-bottom: 4px;">Distribusi
                                Anggota Kelas</h4>
                            <p style="font-size: 0.85rem; color: var(--text-muted);">Komposisi 36 siswa aktif XI-TKJ3
                            </p>

                            <div class="gender-progress-wrap">
                                <div>
                                    <div class="gender-item-header">
                                        <span>Perempuan (52.8%)</span>
                                        <span class="count">19 Siswa</span>
                                    </div>
                                    <div class="progress-bar-bg">
                                        <div class="progress-bar-fill-female"></div>
                                    </div>
                                </div>

                                <div>
                                    <div class="gender-item-header">
                                        <span>Laki-laki (47.2%)</span>
                                        <span class="count">17 Siswa</span>
                                    </div>
                                    <div class="progress-bar-bg">
                                        <div class="progress-bar-fill-male"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Core Values Grid -->
                        <div class="values-grid">
                            <div class="value-card">
                                <span class="val-emoji">🤝</span>
                                <div class="val-title">Solidaritas</div>
                                <div class="val-desc">Saling dukung &amp; berbagi ilmu di setiap situasi.</div>
                            </div>
                            <div class="value-card">
                                <span class="val-emoji">⚡</span>
                                <div class="val-title">Inovatif</div>
                                <div class="val-desc">Aktif eksplorasi tren IT &amp; jaringan modern.</div>
                            </div>
                            <div class="value-card">
                                <span class="val-emoji">🎯</span>
                                <div class="val-title">Kompeten</div>
                                <div class="val-desc">Fokus pada penguasaan skill praktis industri.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- =========================================================
             PROGRAM KEAHLIAN TKJ (SKILLS & CURRICULUM)
        ========================================================= -->
        <section id="program" style="background: rgba(8, 14, 26, 0.5);">
            <div class="container">
                <div class="section-header">
                    <span class="section-tag">Kompetensi &amp; Fokus Belajar</span>
                    <h2 class="section-title">Program <span class="text-gradient">Keahlian TKJ</span></h2>
                    <p class="section-subtitle">Bidang utama dan kurikulum teknis yang dipelajari serta dipraktikkan
                        oleh siswa XI-TKJ3 sehari-hari di laboratorium komputer.</p>
                </div>

                <div class="program-grid">
                    <!-- Program 1 -->
                    <div class="program-card">
                        <div>
                            <div class="program-icon-box">
                                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <circle cx="12" cy="12" r="10" />
                                    <line x1="2" y1="12" x2="22" y2="12" />
                                    <path
                                        d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
                                </svg>
                            </div>
                            <h3 class="program-title">Jaringan Komputer</h3>
                            <p class="program-desc">Perancangan arsitektur LAN, WAN, konfigurasi IP addressing,
                                subnetting, VLAN, routing statis &amp; dinamis serta switching terkelola.</p>
                        </div>
                        <div class="program-tags-list">
                            <span class="program-tag-item">Cisco IOS</span>
                            <span class="program-tag-item">MikroTik RouterOS</span>
                            <span class="program-tag-item">VLAN / OSPF</span>
                        </div>
                    </div>

                    <!-- Program 2 -->
                    <div class="program-card">
                        <div>
                            <div class="program-icon-box">
                                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <rect x="2" y="2" width="20" height="8" rx="2" />
                                    <rect x="2" y="14" width="20" height="8" rx="2" />
                                    <line x1="6" y1="6" x2="6.01" y2="6" />
                                    <line x1="6" y1="18" x2="6.01" y2="18" />
                                </svg>
                            </div>
                            <h3 class="program-title">Administrasi Server</h3>
                            <p class="program-desc">Instalasi, konfigurasi, dan maintenance server berbasis
                                Linux/Windows untuk layanan DHCP, DNS, Web Server, FTP, dan Database.</p>
                        </div>
                        <div class="program-tags-list">
                            <span class="program-tag-item">Debian Server</span>
                            <span class="program-tag-item">Apache / Nginx</span>
                            <span class="program-tag-item">BIND9 &amp; SSH</span>
                        </div>
                    </div>

                    <!-- Program 3 -->
                    <div class="program-card">
                        <div>
                            <div class="program-icon-box">
                                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
                                </svg>
                            </div>
                            <h3 class="program-title">Keamanan Jaringan</h3>
                            <p class="program-desc">Implementasi proteksi sistem, firewall filtering, NAT, monitoring
                                traffic data menggunakan Wireshark, dan deteksi ancaman siber.</p>
                        </div>
                        <div class="program-tags-list">
                            <span class="program-tag-item">Firewall Filter</span>
                            <span class="program-tag-item">Wireshark</span>
                            <span class="program-tag-item">VPN / IPSec</span>
                        </div>
                    </div>

                    <!-- Program 4 -->
                    <div class="program-card">
                        <div>
                            <div class="program-icon-box">
                                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <path
                                        d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
                                </svg>
                            </div>
                            <h3 class="program-title">Hardware &amp; Troubleshooting</h3>
                            <p class="program-desc">Perakitan PC, diagnosa kerusakan komponen keras, perbaikan sistem
                                operasi, dan instalasi infrastruktur kabel UTP/STP serta Fiber Optic.</p>
                        </div>
                        <div class="program-tags-list">
                            <span class="program-tag-item">Crimping RJ-45</span>
                            <span class="program-tag-item">Fiber Splicing</span>
                            <span class="program-tag-item">PC Assembly</span>
                        </div>
                    </div>

                    <!-- Program 5 -->
                    <div class="program-card">
                        <div>
                            <div class="program-icon-box">
                                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <polyline points="16 18 22 12 16 6" />
                                    <polyline points="8 6 2 12 8 18" />
                                </svg>
                            </div>
                            <h3 class="program-title">Pemrograman &amp; Otomasi</h3>
                            <p class="program-desc">Dasar-dasar coding, scripting shell bash untuk otomatisasi
                                administrasi server, pembuatan website kelas, dan pengenalan Python jaringan.</p>
                        </div>
                        <div class="program-tags-list">
                            <span class="program-tag-item">Bash Script</span>
                            <span class="program-tag-item">HTML/CSS/JS</span>
                            <span class="program-tag-item">Python NetDev</span>
                        </div>
                    </div>

                    <!-- Program 6 -->
                    <div class="program-card">
                        <div>
                            <div class="program-icon-box">
                                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <path d="M18 10h-1.26A8 8 0 1 0 9 20h9a5 5 0 0 0 0-10z" />
                                </svg>
                            </div>
                            <h3 class="program-title">Cloud &amp; Virtualisasi</h3>
                            <p class="program-desc">Konfigurasi Virtual Machine (VMware/VirtualBox), arsitektur Proxmox
                                VE, dan dasar komputasi awan untuk skalabilitas infrastruktur modern.</p>
                        </div>
                        <div class="program-tags-list">
                            <span class="program-tag-item">VirtualBox / VMware</span>
                            <span class="program-tag-item">Proxmox VE</span>
                            <span class="program-tag-item">Cloud Basics</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- =========================================================
             STRUKTUR ORGANISASI KELAS
        ========================================================= -->
        <section id="struktur">
            <div class="container">
                <div class="section-header">
                    <span class="section-tag">Kepengurusan Kelas</span>
                    <h2 class="section-title">Struktur <span class="text-gradient">Organisasi XI-TKJ3</span></h2>
                    <p class="section-subtitle">Pengurus yang berdedikasi menjaga kekompakan, kedisiplinan, serta
                        kelancaran kegiatan belajar mengajar di kelas dan laboratorium.</p>
                </div>

                <div class="org-container">
                    <!-- Wali Kelas VIP Card -->
                    <div class="org-vip-card">
                        <span class="vip-crown-badge">Pembina &amp; Wali Kelas</span>
                        <div class="org-vip-avatar">W</div>
                        <div class="org-role-badge"
                            style="color: #f59e0b; border-color: rgba(245, 158, 11, 0.3); background: rgba(245, 158, 11, 0.1);">
                            Wali Kelas</div>
                        <h3 class="org-name" style="font-size: 1.25rem;">Damai Yulistiawan, S.Pd.</h3>
                        <p style="font-size: 0.82rem; color: #cbd5e1; margin-top: 4px;">Membimbing, mengarahkan, dan
                            menginspirasi perjalanan siswa XI-TKJ3.</p>
                    </div>

                    <!-- Ketua & Wakil Ketua Kelas -->
                    <div class="org-leaders-grid">
                        <div class="org-card">
                            <div class="org-avatar">K</div>
                            <span class="org-role-badge">Ketua Kelas</span>
                            <h4 class="org-name">Sandi Arya</h4>
                        </div>

                        <div class="org-card">
                            <div class="org-avatar">W</div>
                            <span class="org-role-badge">Wakil Ketua</span>
                            <h4 class="org-name">Prido Hariansyah A.</h4>
                        </div>
                    </div>

                    <!-- Sekretaris & Bendahara Grid -->
                    <div class="org-staff-grid">
                        <div class="org-card">
                            <div class="org-avatar">S1</div>
                            <span class="org-role-badge">Sekretaris 1</span>
                            <h4 class="org-name">Syifa Aurelya P.</h4>
                        </div>

                        <div class="org-card">
                            <div class="org-avatar">S2</div>
                            <span class="org-role-badge">Sekretaris 2</span>
                            <h4 class="org-name">Rizky Raditya F.</h4>
                        </div>

                        <div class="org-card">
                            <div class="org-avatar">B1</div>
                            <span class="org-role-badge">Bendahara 1</span>
                            <h4 class="org-name">Nur Wanudya P.</h4>
                        </div>

                        <div class="org-card">
                            <div class="org-avatar">B2</div>
                            <span class="org-role-badge">Bendahara 2</span>
                            <h4 class="org-name">Ni'Matus Syarifa</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- =========================================================
             AKTIVITAS & MOMEN (GALLERY SHOWCASE)
        ========================================================= -->
        <section id="galeri" style="background: rgba(8, 14, 26, 0.5);">
            <div class="container">
                <div class="section-header">
                    <span class="section-tag">Dokumentasi &amp; Galeri</span>
                    <h2 class="section-title">Aktivitas &amp; <span class="text-gradient">Momen Kebersamaan</span></h2>
                    <p class="section-subtitle">Potret keseruan saat praktikum laboratorium komputer jaringan, proyek
                        tugas, hingga momen kebersamaan tak terlupakan.</p>
                </div>

                <div class="gallery-grid">
                    <!-- Item 1 -->
                    <div class="gallery-item">
                        <div class="gallery-visual">
                            <span class="gallery-visual-badge">Praktikum Lab</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                <circle cx="12" cy="12" r="10" />
                                <line x1="2" y1="12" x2="22" y2="12" />
                                <path
                                    d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
                            </svg>
                        </div>
                        <div class="gallery-body">
                            <h3 class="gallery-title">Konfigurasi Routing MikroTik</h3>
                            <p class="gallery-desc">Praktik langsung manajemen bandwidth, hotspot server, dan firewall
                                rule di lab jaringan.</p>
                        </div>
                    </div>

                    <!-- Item 2 -->
                    <div class="gallery-item">
                        <div class="gallery-visual">
                            <span class="gallery-visual-badge">Hardware &amp; Kabel</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                <path
                                    d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
                            </svg>
                        </div>
                        <div class="gallery-body">
                            <h3 class="gallery-title">Crimping &amp; Pengujian Kabel UTP</h3>
                            <p class="gallery-desc">Uji coba pembuatan kabel Straight &amp; Cross menggunakan LAN Tester
                                standar industri.</p>
                        </div>
                    </div>

                    <!-- Item 3 -->
                    <div class="gallery-item">
                        <div class="gallery-visual">
                            <span class="gallery-visual-badge">Server Lab</span>
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                                <rect x="2" y="2" width="20" height="8" rx="2" />
                                <rect x="2" y="14" width="20" height="8" rx="2" />
                            </svg>
                        </div>
                        <div class="gallery-body">
                            <h3 class="gallery-title">Setup Linux Debian Server</h3>
                            <p class="gallery-desc">Membangun server lokal untuk kebutuhan hosting materi dan tugas
                                kelas secara mandiri.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- =========================================================
             SPIN WHEEL / RANDOM STUDENT PICKER
        ========================================================= -->
        <section id="spin">
            <div class="container">
                <div class="section-header">
                    <span class="section-tag">Fitur Interaktif Kelas</span>
                    <h2 class="section-title">Spin Wheel <span class="text-gradient">Pemilih Acak Siswa</span></h2>
                    <p class="section-subtitle">Bingung nunjuk siapa yang piket atau presentasi duluan? Putar roda ini
                        dan biarkan sistem yang memilih secara acak &amp; adil.</p>
                </div>

                <div class="spin-layout">
                    <!-- Wheel Stage -->
                    <div class="spin-wheel-stage">
                        <div class="spin-wheel-wrap">
                            <div class="spin-wheel-pointer" aria-hidden="true"></div>
                            <div class="spin-wheel-outer">
                                <svg id="spinWheelSvg" viewBox="0 0 300 300" aria-label="Roda pemilih acak siswa"></svg>
                            </div>
                            <div class="spin-wheel-hub">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="3"></circle>
                                    <path
                                        d="M12 2v4M12 18v4M4.93 4.93l2.83 2.83M16.24 16.24l2.83 2.83M2 12h4M18 12h4M4.93 19.07l2.83-2.83M16.24 7.76l2.83-2.83" />
                                </svg>
                            </div>
                        </div>

                        <div class="spin-result-box">
                            <span class="spin-result-label">Hasil Terpilih</span>
                            <span class="spin-result-name" id="spinResultName">— Siap diputar —</span>
                        </div>

                        <button class="spin-btn-primary" id="spinBtn" type="button">
                            <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor"
                                stroke-width="2.5">
                                <polygon points="5 3 19 12 5 21 5 3"></polygon>
                            </svg>
                            <span id="spinBtnLabel">Putar Roda!</span>
                        </button>
                    </div>

                    <!-- Control Panel -->
                    <div class="spin-panel">
                        <div class="spin-panel-label">
                            <span>Daftar Nama Peserta</span>
                            <span class="count-badge" id="spinCountBadge">0 nama</span>
                        </div>
                        <textarea id="spinNamesInput" spellcheck="false"
                            placeholder="Tulis satu nama per baris, lalu klik &quot;Terapkan Daftar&quot;..."></textarea>
                        <p class="spin-panel-hint">
                            Satu baris = satu nama. Bisa diedit bebas sesuai daftar hadir hari itu — cocok untuk pilih
                            piket, giliran presentasi, atau kuis dadakan. Nama yang sudah keluar otomatis dicatat di
                            riwayat supaya adil.
                        </p>
                        <div class="spin-panel-actions">
                            <button class="spin-mini-btn" id="spinApplyBtn" type="button">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                                Terapkan Daftar
                            </button>
                            <button class="spin-mini-btn" id="spinResetDefaultBtn" type="button">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <polyline points="1 4 1 10 7 10"></polyline>
                                    <path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10" />
                                </svg>
                                Reset ke Daftar Kelas
                            </button>
                            <button class="spin-mini-btn" id="spinClearHistoryBtn" type="button">
                                <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <polyline points="3 6 5 6 21 6"></polyline>
                                    <path d="M19 6l-1 14H6L5 6M10 11v6M14 11v6M8 6V4h8v2" />
                                </svg>
                                Bersihkan Riwayat
                            </button>
                        </div>

                        <div>
                            <div class="spin-panel-label" style="margin-bottom: 10px;">
                                <span>Riwayat Terpilih</span>
                            </div>
                            <div class="spin-history-wrap" id="spinHistoryWrap">
                                <span class="spin-history-chip">Belum ada riwayat</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- =========================================================
             KONTAK & SOCIAL HUB
        ========================================================= -->
        <section id="kontak">
            <div class="container">
                <div class="section-header">
                    <span class="section-tag">Terhubung Bersama Kami</span>
                    <h2 class="section-title">Hubungi <span class="text-gradient">XI-TKJ3</span></h2>
                    <p class="section-subtitle">Ikuti perkembangan terbaru kegiatan, dokumentasi foto, dan pengumuman
                        kelas melalui akun sosial media resmi kami.</p>
                </div>

                <div class="contact-card-wrap">
                    <h3 style="font-size: 1.5rem; font-weight: 800; color: #fff; margin-bottom: 8px;">Sosial Media
                        Resmi Kelas</h3>
                    <p style="color: var(--text-muted); max-width: 520px; margin: 0 auto;">
                        Tempat arsip foto, video reels/TikTok keseruan di kelas, dan info kegiatan terupdate. Silakan
                        follow dan sapa kami!
                    </p>

                    <div class="contact-ig-box">
                        <div class="contact-ig-left">
                            <div class="ig-icon-badge">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="2" y="2" width="20" height="20" rx="5" />
                                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
                                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5" />
                                </svg>
                            </div>
                            <div>
                                <div class="ig-handle-text">@ofc_tkjtigaa</div>
                                <div class="ig-sub-text">Official Account of XI-TKJ3</div>
                            </div>
                        </div>

                        <div class="contact-actions">
                            <a href="https://www.instagram.com/ofc_tkjtigaa" target="_blank" rel="noopener noreferrer"
                                class="btn-ig-visit">
                                <span>Kunjungi Profil</span>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                    stroke-width="2.5">
                                    <path
                                        d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3" />
                                </svg>
                            </a>
                            <button class="btn-copy-link" id="copyIgBtn" title="Salin Username Instagram"
                                aria-label="Salin Username Instagram">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2" />
                                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1" />
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="contact-ig-box tiktok-variant">
                        <div class="contact-ig-left">
                            <div class="tiktok-icon-badge">
                                <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                                    <path
                                        d="M16.6 5.82s.51.5 0 0A4.278 4.278 0 0 1 15.54 3h-3.09v12.4a2.592 2.592 0 0 1-2.59 2.5c-1.42 0-2.6-1.16-2.6-2.6c0-1.72 1.66-3.01 3.37-2.48V9.66c-3.45-.46-6.47 2.22-6.47 5.64c0 3.33 2.76 5.7 5.69 5.7c3.14 0 5.69-2.55 5.69-5.7V9.01a7.35 7.35 0 0 0 4.3 1.38V7.3s-1.88.09-3.24-1.48z" />
                                </svg>
                            </div>
                            <div>
                                <div class="ig-handle-text">@xi.tkj3_</div>
                                <div class="ig-sub-text">Official TikTok of XI-TKJ3</div>
                            </div>
                        </div>

                        <div class="contact-actions">
                            <a href="https://www.tiktok.com/@xi.tkj3_?_r=1&_t=ZS-99PdWSRMP6z" target="_blank"
                                rel="noopener noreferrer" class="btn-tiktok-visit">
                                <span>Kunjungi Profil</span>
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor"
                                    stroke-width="2.5">
                                    <path
                                        d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3" />
                                </svg>
                            </a>
                            <button class="btn-copy-link" id="copyTiktokBtn" title="Salin Username TikTok"
                                aria-label="Salin Username TikTok">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor"
                                    stroke-width="2">
                                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2" />
                                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1" />
                                </svg>
                            </button>
                        </div>
                    </div>

                    <h4 style="font-size: 0.95rem; font-weight: 700; color: #fff; margin-bottom: 4px;">Scan Cepat via
                        QR Code</h4>
                    <p style="font-size: 0.8rem; color: var(--text-dim); margin-bottom: 4px;">Lagi kumpul bareng?
                        Tinggal scan, langsung nyambung.</p>

                    <div class="qr-section">
                        <div class="qr-card">
                            <img src="data:image/png;base64,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"
                                alt="QR Code Instagram XI-TKJ3" loading="lazy">
                            <span class="qr-card-label">📷 Instagram</span>
                            <span class="qr-card-sub">@ofc_tkjtigaa</span>
                        </div>
                        <div class="qr-card">
                            <img src="data:image/png;base64,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"
                                alt="QR Code TikTok XI-TKJ3" loading="lazy">
                            <span class="qr-card-label">🎵 TikTok</span>
                            <span class="qr-card-sub">@xi.tkj3_</span>
                        </div>
                    </div>

                    <p style="font-size: 0.85rem; color: var(--text-dim);">
                        Website ini di-deploy dan dapat diakses bebas secara global melalui <strong>GitHub
                            Pages</strong>.
                    </p>
                </div>
            </div>
        </section>
    </main>

    <!-- Floating Tools (Back to Top & Quick IG) -->
    <div class="floating-tools">
        <button class="fab-btn" id="backToTopBtn" aria-label="Kembali ke atas">
            <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.5">
                <polyline points="18 15 12 9 6 15"></polyline>
            </svg>
        </button>
    </div>

    <!-- Toast Notification -->
    <div class="toast" id="toastMessage" role="alert" aria-live="polite">
        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#00f2fe" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="toastText">Username disalin ke papan klip!</span>
    </div>

    <!-- Footer -->
    <footer class="site-footer">
        <div class="container footer-inner">
            <div class="footer-brand">
                <span>XI-TKJ3</span>
                <span style="color: var(--primary);">•</span>
                <span style="font-weight: 500; font-size: 0.95rem; color: var(--text-muted);">Teknik Komputer &amp;
                    Jaringan</span>
            </div>
            <p class="footer-credits">
                Dibuat dengan ❤️ dan dedikasi oleh <strong>Ricardo Anggoro Barkah</strong>
            </p>
            <p style="font-size: 0.8rem; color: var(--text-dim);">
                &copy; <span id="currentYear">2026</span> Kelas XI-TKJ3. Akses Bebas &amp; Terbuka. Hosted on GitHub
                Pages.
            </p>
        </div>
    </footer>

    <!-- =========================================================
         INTERACTIVE JAVASCRIPT
    ========================================================= -->
    <script>
        // Set dynamic current year
        document.getElementById('currentYear').textContent = new Date().getFullYear();

        // ---------------------------------------------------------------
        // LOADING SCREEN
        // ---------------------------------------------------------------
        (function initLoadingScreen() {
            const loadingScreen = document.getElementById('loadingScreen');
            const loaderBarFill = document.getElementById('loaderBarFill');
            let progress = 0;

            const progressInterval = setInterval(() => {
                progress += Math.random() * 25;
                if (progress > 92) progress = 92;
                loaderBarFill.style.width = progress + '%';
            }, 120);

            window.addEventListener('load', () => {
                clearInterval(progressInterval);
                loaderBarFill.style.width = '100%';
                setTimeout(() => {
                    loadingScreen.classList.add('hidden');
                }, 350);
            });

            // Fallback in case 'load' takes too long
            setTimeout(() => {
                clearInterval(progressInterval);
                loaderBarFill.style.width = '100%';
                loadingScreen.classList.add('hidden');
            }, 3500);
        })();

        // ---------------------------------------------------------------
        // CUSTOM NETWORK-PING CURSOR (desktop / fine-pointer devices only)
        // ---------------------------------------------------------------
        (function initNetworkCursor() {
            const supportsFinePointer = window.matchMedia('(pointer: fine)').matches;
            const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
            if (!supportsFinePointer || prefersReducedMotion) return;

            document.documentElement.classList.add('custom-cursor-active');

            const dot = document.getElementById('netCursorDot');
            const ring = document.getElementById('netCursorRing');
            const canvas = document.getElementById('netCursorTrailCanvas');
            const ctx = canvas.getContext('2d');

            let dpr = Math.min(window.devicePixelRatio || 1, 2);
            function resizeCanvas() {
                dpr = Math.min(window.devicePixelRatio || 1, 2);
                canvas.width = window.innerWidth * dpr;
                canvas.height = window.innerHeight * dpr;
                canvas.style.width = window.innerWidth + 'px';
                canvas.style.height = window.innerHeight + 'px';
                ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
            }
            resizeCanvas();
            window.addEventListener('resize', resizeCanvas);

            // "Ping" node trail: each node fades out and shrinks over time,
            // connected by faint lines to nearby nodes -- like a network graph.
            const MAX_NODES = 22;
            const nodes = [];
            let mouseX = window.innerWidth / 2;
            let mouseY = window.innerHeight / 2;
            let ringX = mouseX;
            let ringY = mouseY;
            let lastSpawn = 0;
            let isPointerActive = false;

            function spawnNode(x, y) {
                nodes.push({ x, y, life: 1, size: 3 + Math.random() * 2.5 });
                if (nodes.length > MAX_NODES) nodes.shift();
            }

            window.addEventListener('mousemove', (e) => {
                mouseX = e.clientX;
                mouseY = e.clientY;
                dot.style.transform = `translate(${mouseX}px, ${mouseY}px) translate(-50%, -50%)`;

                const now = performance.now();
                if (now - lastSpawn > 45) {
                    spawnNode(mouseX, mouseY);
                    lastSpawn = now;
                }
            }, { passive: true });

            document.addEventListener('mousedown', () => {
                ring.classList.add('is-active');
                spawnNode(mouseX, mouseY);
            });
            document.addEventListener('mouseup', () => ring.classList.remove('is-active'));

            // Hide native replacement cursor visuals when leaving the viewport
            document.addEventListener('mouseleave', () => {
                dot.style.opacity = '0';
                ring.style.opacity = '0';
            });
            document.addEventListener('mouseenter', () => {
                dot.style.opacity = '1';
                ring.style.opacity = '1';
                isPointerActive = true;
            });

            // Highlight ring on interactive elements ("ping" a node when hovering links/buttons)
            const interactiveSelector = 'a, button, .filter-btn, .fab-btn, input, textarea, .spin-wheel-wrap, .qr-card, .gallery-item, .program-card, .org-card';
            document.addEventListener('mouseover', (e) => {
                if (e.target.closest && e.target.closest(interactiveSelector)) {
                    ring.classList.add('is-active');
                } else {
                    ring.classList.remove('is-active');
                }
            });

            function animate() {
                // Smooth-follow ring (slight lag gives a "signal" feel)
                ringX += (mouseX - ringX) * 0.18;
                ringY += (mouseY - ringY) * 0.18;
                ring.style.transform = `translate(${ringX}px, ${ringY}px) translate(-50%, -50%)`;

                ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);

                // Draw connective lines between nearby nodes (network-graph vibe)
                for (let i = 0; i < nodes.length; i++) {
                    for (let j = i + 1; j < nodes.length; j++) {
                        const a = nodes[i];
                        const b = nodes[j];
                        const dx = a.x - b.x;
                        const dy = a.y - b.y;
                        const dist = Math.sqrt(dx * dx + dy * dy);
                        if (dist < 90) {
                            const alpha = (1 - dist / 90) * Math.min(a.life, b.life) * 0.35;
                            if (alpha > 0.01) {
                                ctx.strokeStyle = `rgba(56, 189, 248, ${alpha})`;
                                ctx.lineWidth = 1;
                                ctx.beginPath();
                                ctx.moveTo(a.x, a.y);
                                ctx.lineTo(b.x, b.y);
                                ctx.stroke();
                            }
                        }
                    }
                }

                // Draw ping nodes (fading dots), like packets pulsing along the trail
                for (let i = nodes.length - 1; i >= 0; i--) {
                    const n = nodes[i];
                    n.life -= 0.028;
                    if (n.life <= 0) {
                        nodes.splice(i, 1);
                        continue;
                    }
                    const r = n.size * n.life;
                    ctx.beginPath();
                    ctx.arc(n.x, n.y, Math.max(r, 0.4), 0, Math.PI * 2);
                    ctx.fillStyle = `rgba(0, 242, 254, ${n.life * 0.85})`;
                    ctx.fill();
                }

                requestAnimationFrame(animate);
            }
            requestAnimationFrame(animate);
        })();

        // ---------------------------------------------------------------
        // DARK / LIGHT MODE TOGGLE
        // ---------------------------------------------------------------
        (function initThemeToggle() {
            const htmlEl = document.documentElement;
            const themeToggleBtn = document.getElementById('themeToggleBtn');
            const themeToggleBtnMobile = document.getElementById('themeToggleBtnMobile');
            const themeToggleMobileLabel = document.getElementById('themeToggleMobileLabel');

            function applyTheme(theme) {
                htmlEl.setAttribute('data-theme', theme);
                if (themeToggleMobileLabel) {
                    themeToggleMobileLabel.textContent = theme === 'light' ? '☀️ Mode Terang Aktif' : '🌙 Mode Gelap Aktif';
                }
            }

            function toggleTheme() {
                const current = htmlEl.getAttribute('data-theme') === 'light' ? 'light' : 'dark';
                const next = current === 'light' ? 'dark' : 'light';
                applyTheme(next);
            }

            applyTheme('dark');

            themeToggleBtn?.addEventListener('click', toggleTheme);
            themeToggleBtnMobile?.addEventListener('click', toggleTheme);
        })();

        // ---------------------------------------------------------------
        // ANIMATED STAT COUNTERS
        // ---------------------------------------------------------------
        (function initAnimatedCounters() {
            const counterEls = document.querySelectorAll('.stat-number');

            function animateCounter(el) {
                const rawText = el.textContent.trim();
                const suffix = rawText.replace(/[\d.]/g, '');
                const targetValue = parseFloat(rawText.replace(/[^\d.]/g, ''));
                if (isNaN(targetValue)) return;

                const duration = 1200;
                const startTime = performance.now();

                function step(now) {
                    const elapsed = now - startTime;
                    const progress = Math.min(elapsed / duration, 1);
                    const eased = 1 - Math.pow(1 - progress, 3);
                    const currentValue = Math.floor(eased * targetValue);
                    el.textContent = currentValue + suffix;

                    if (progress < 1) {
                        requestAnimationFrame(step);
                    } else {
                        el.textContent = targetValue + suffix;
                    }
                }
                requestAnimationFrame(step);
            }

            const counterObserver = new IntersectionObserver((entries, obs) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        animateCounter(entry.target);
                        obs.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.5 });

            counterEls.forEach(el => counterObserver.observe(el));
        })();

        // Elements
        const navbar = document.getElementById('navbar');
        const progressBar = document.getElementById('progressBar');
        const backToTopBtn = document.getElementById('backToTopBtn');
        const drawerOpenBtn = document.getElementById('drawerOpenBtn');
        const drawerCloseBtn = document.getElementById('drawerCloseBtn');
        const mobileDrawer = document.getElementById('mobileDrawer');
        const drawerOverlay = document.getElementById('drawerOverlay');
        const drawerLinks = document.querySelectorAll('.drawer-link');
        const navLinks = document.querySelectorAll('.nav-link');
        const copyIgBtn = document.getElementById('copyIgBtn');
        const copyTiktokBtn = document.getElementById('copyTiktokBtn');
        const toast = document.getElementById('toastMessage');
        const toastText = document.getElementById('toastText');

        // Scroll Progress & Navbar Scrolled State & Back to Top
        window.addEventListener('scroll', () => {
            const scrollTop = window.scrollY || document.documentElement.scrollTop;
            const docHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrollPercent = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;

            progressBar.style.width = scrollPercent + '%';

            if (scrollTop > 40) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }

            if (scrollTop > 350) {
                backToTopBtn.classList.add('visible');
            } else {
                backToTopBtn.classList.remove('visible');
            }
        });

        // Back to top click
        backToTopBtn.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });

        // Mobile Drawer Toggle
        function openDrawer() {
            mobileDrawer.classList.add('open');
            drawerOverlay.classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeDrawer() {
            mobileDrawer.classList.remove('open');
            drawerOverlay.classList.remove('active');
            document.body.style.overflow = '';
        }

        drawerOpenBtn.addEventListener('click', openDrawer);
        drawerCloseBtn.addEventListener('click', closeDrawer);
        drawerOverlay.addEventListener('click', closeDrawer);

        drawerLinks.forEach(link => {
            link.addEventListener('click', () => {
                closeDrawer();
            });
        });

        // Dynamic Typing Effect for Tagline
        const typingTexts = [
            "Connect, Configure, Create ✨",
            "Routing, Switching, & Security 🔒",
            "36 Siswa, 1 Komitmen Solidaritas 🤝",
            "Belajar Bersama, Sukses Bersama 🚀"
        ];
        let textIndex = 0;
        let charIndex = 0;
        let isDeleting = false;
        const typingElement = document.getElementById('typingEffect');

        function typeLoop() {
            const currentString = typingTexts[textIndex];

            if (isDeleting) {
                typingElement.textContent = currentString.substring(0, charIndex - 1);
                charIndex--;
            } else {
                typingElement.textContent = currentString.substring(0, charIndex + 1);
                charIndex++;
            }

            let typeSpeed = isDeleting ? 35 : 75;

            if (!isDeleting && charIndex === currentString.length) {
                typeSpeed = 2200; // Pause at end of sentence
                isDeleting = true;
            } else if (isDeleting && charIndex === 0) {
                isDeleting = false;
                textIndex = (textIndex + 1) % typingTexts.length;
                typeSpeed = 500;
            }

            setTimeout(typeLoop, typeSpeed);
        }
        typeLoop();

        // Active Section Highlight on Scroll (Intersection Observer)
        const sections = document.querySelectorAll('section[id]');
        const observerOptions = {
            root: null,
            rootMargin: '-20% 0px -70% 0px',
            threshold: 0
        };

        const sectionObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const id = '#' + entry.target.id;

                    navLinks.forEach(link => {
                        link.classList.toggle('active', link.getAttribute('href') === id);
                    });

                    drawerLinks.forEach(link => {
                        link.classList.toggle('active', link.getAttribute('href') === id);
                    });
                }
            });
        }, observerOptions);

        sections.forEach(section => sectionObserver.observe(section));

        // Toast function
        function showToast(message) {
            toastText.textContent = message;
            toast.classList.add('show');
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Copy Instagram Username
        copyIgBtn.addEventListener('click', () => {
            navigator.clipboard.writeText('@ofc_tkjtigaa').then(() => {
                showToast("Username @ofc_tkjtigaa disalin!");
            }).catch(() => {
                showToast("Berhasil: @ofc_tkjtigaa");
            });
        });

        // Copy TikTok Username
        copyTiktokBtn.addEventListener('click', () => {
            navigator.clipboard.writeText('@xi.tkj3_').then(() => {
                showToast("Username @xi.tkj3_ disalin!");
            }).catch(() => {
                showToast("Berhasil: @xi.tkj3_");
            });
        });

        // ---------------------------------------------------------------
        // SPIN WHEEL / RANDOM STUDENT PICKER
        // ---------------------------------------------------------------
        (function initSpinWheel() {
            const defaultNames = [
                "Damai Yulistiawan, S.Pd. (Wali Kelas)",
                "1.Muhammad Ferry F.", "2.Nafila Dwi Nur A.", "3.Natalia Putri K.",
                "4.Nazilatun Ilmiya", "5.Ni'Matus Syarifa", "6.Nur Prihatin Yana S.",
                "7.Nur Wanudya P.", "8.Octavian Arif S.P.", "9.Pandu Pranata", "10.Prido Hariansya A.",
                "11.Raka Akbar A.A.", "12.Raka Zidan F.", "13.Regina Putri S.",
                "14.Reissa Arumia P.L.", "15.Rezky Aditya Baim P.", "16.Ricardo Anggoro B.",
                "17.Riki Vebrianto", "18.Risda Wulan Sari", "19.Risma Mega Agustin",
                "20.Rizki Ardiansyah P.R.", "21.Rizky Aditya A.", "22.Rizky Raditya F.", "23.Roni Agus Setiawan",
                "24.Ryu Raion Rabani", "25.Sandi Arya", "26.Sifani Aulia", "27.Silvi Eka Putri L.",
                "28.Silvia Dwi Anjani", "29.Siti Afifah Dina R.", "30.Syafira Bilqis Nur R.",
                "31.Syifa Aurelya Putri", "32.Tiara Wulandari", "33.Vanessa Putri Aulia N.R.",
                "34.Wahyu Dwi Nur C.", "35.Wisnu Mohammad A.", "36.Zafira Melati Zainia R."
            ];

            const svgNS = "http://www.w3.org/2000/svg";
            const wheelSvg = document.getElementById('spinWheelSvg');
            const namesInput = document.getElementById('spinNamesInput');
            const spinBtn = document.getElementById('spinBtn');
            const spinBtnLabel = document.getElementById('spinBtnLabel');
            const resultName = document.getElementById('spinResultName');
            const countBadge = document.getElementById('spinCountBadge');
            const applyBtn = document.getElementById('spinApplyBtn');
            const resetDefaultBtn = document.getElementById('spinResetDefaultBtn');
            const clearHistoryBtn = document.getElementById('spinClearHistoryBtn');
            const historyWrap = document.getElementById('spinHistoryWrap');

            if (!wheelSvg || !namesInput) return; // guard, in case section removed

            const wheelColors = ['#00f2fe', '#0284c7', '#6366f1', '#38bdf8', '#0ea5e9', '#818cf8'];
            let currentNames = [];
            let currentRotation = 0;
            let isSpinning = false;
            let history = [];

            function setNamesFromText(text) {
                const list = text
                    .split('\n')
                    .map(s => s.trim())
                    .filter(s => s.length > 0);
                currentNames = list.length > 0 ? list : ['Belum ada nama'];
                countBadge.textContent = list.length + ' nama';
                drawWheel();
            }

            function loadDefault() {
                namesInput.value = defaultNames.join('\n');
                setNamesFromText(namesInput.value);
            }

            function drawWheel() {
                wheelSvg.innerHTML = '';
                const cx = 150, cy = 150, r = 148;
                const total = currentNames.length;
                const anglePer = 360 / total;

                for (let i = 0; i < total; i++) {
                    const startAngle = i * anglePer;
                    const endAngle = startAngle + anglePer;
                    const startRad = (Math.PI / 180) * startAngle;
                    const endRad = (Math.PI / 180) * endAngle;

                    const x1 = cx + r * Math.cos(startRad - Math.PI / 2);
                    const y1 = cy + r * Math.sin(startRad - Math.PI / 2);
                    const x2 = cx + r * Math.cos(endRad - Math.PI / 2);
                    const y2 = cy + r * Math.sin(endRad - Math.PI / 2);
                    const largeArc = anglePer > 180 ? 1 : 0;

                    const path = document.createElementNS(svgNS, 'path');
                    const d = `M${cx},${cy} L${x1.toFixed(2)},${y1.toFixed(2)} A${r},${r} 0 ${largeArc} 1 ${x2.toFixed(2)},${y2.toFixed(2)} Z`;
                    path.setAttribute('d', d);
                    path.setAttribute('fill', wheelColors[i % wheelColors.length]);
                    path.setAttribute('fill-opacity', (i % 2 === 0) ? '0.92' : '0.72');
                    path.setAttribute('stroke', 'rgba(6,11,20,0.6)');
                    path.setAttribute('stroke-width', '1');
                    wheelSvg.appendChild(path);

                    // Label text along the slice, only if slice is wide enough to read
                    if (total <= 24) {
                        const midAngle = startAngle + anglePer / 2;
                        const midRad = (Math.PI / 180) * midAngle;
                        const labelR = r * 0.62;
                        const lx = cx + labelR * Math.cos(midRad - Math.PI / 2);
                        const ly = cy + labelR * Math.sin(midRad - Math.PI / 2);

                        const text = document.createElementNS(svgNS, 'text');
                        text.setAttribute('x', lx.toFixed(2));
                        text.setAttribute('y', ly.toFixed(2));
                        text.setAttribute('fill', '#04101c');
                        text.setAttribute('font-size', total > 14 ? '6.5' : '8.5');
                        text.setAttribute('font-weight', '700');
                        text.setAttribute('text-anchor', 'middle');
                        text.setAttribute('dominant-baseline', 'middle');
                        text.setAttribute('transform', `rotate(${midAngle}, ${lx.toFixed(2)}, ${ly.toFixed(2)})`);
                        const shortLabel = currentNames[i].length > 14 ? currentNames[i].slice(0, 13) + '…' : currentNames[i];
                        text.textContent = shortLabel;
                        wheelSvg.appendChild(text);
                    }
                }
            }

            function addHistory(name) {
                history.unshift(name);
                if (history.length > 12) history.pop();
                renderHistory();
            }

            function renderHistory() {
                historyWrap.innerHTML = '';
                if (history.length === 0) {
                    const empty = document.createElement('span');
                    empty.className = 'spin-history-chip';
                    empty.textContent = 'Belum ada riwayat';
                    historyWrap.appendChild(empty);
                    return;
                }
                history.forEach((name, idx) => {
                    const chip = document.createElement('span');
                    chip.className = 'spin-history-chip';
                    chip.textContent = (idx === 0 ? '🏆 ' : '') + name;
                    historyWrap.appendChild(chip);
                });
            }

            function spin() {
                if (isSpinning || currentNames.length === 0 || currentNames[0] === 'Belum ada nama') {
                    showToast('Isi dulu daftar namanya, lalu klik "Terapkan Daftar" ya!');
                    return;
                }
                isSpinning = true;
                spinBtn.disabled = true;
                spinBtnLabel.textContent = 'Memutar...';
                resultName.textContent = '— Menghitung... —';

                const total = currentNames.length;
                const anglePer = 360 / total;
                const winnerIndex = Math.floor(Math.random() * total);

                // Pointer is fixed at top (0deg). We rotate the wheel so the
                // winner slice center lands under the pointer.
                const winnerCenterAngle = winnerIndex * anglePer + anglePer / 2;
                const fullSpins = 6 + Math.floor(Math.random() * 3); // 6-8 full turns
                const targetRotation = currentRotation + (fullSpins * 360) + (360 - winnerCenterAngle) - (currentRotation % 360);

                currentRotation = targetRotation;
                wheelSvg.style.transform = `rotate(${currentRotation}deg)`;

                setTimeout(() => {
                    const winnerName = currentNames[winnerIndex];
                    resultName.textContent = winnerName;
                    addHistory(winnerName);
                    showToast('Terpilih: ' + winnerName);
                    isSpinning = false;
                    spinBtn.disabled = false;
                    spinBtnLabel.textContent = 'Putar Roda!';
                }, 5600);
            }

            spinBtn.addEventListener('click', spin);

            applyBtn.addEventListener('click', () => {
                setNamesFromText(namesInput.value);
                resultName.textContent = '— Siap diputar —';
                showToast('Daftar nama diperbarui, ' + currentNames.length + ' peserta siap diundi.');
            });

            resetDefaultBtn.addEventListener('click', () => {
                loadDefault();
                resultName.textContent = '— Siap diputar —';
                showToast('Daftar dikembalikan ke daftar kelas.');
            });

            clearHistoryBtn.addEventListener('click', () => {
                history = [];
                renderHistory();
                showToast('Riwayat undian dibersihkan.');
            });

            // Init
            loadDefault();
            renderHistory();
        })();
    </script>
</body>

</html>
