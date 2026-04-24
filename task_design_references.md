<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Report Pipe Damage</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
          darkMode: "class",
          theme: {
            extend: {
              "colors": {
                      "on-tertiary-fixed-variant": "#3a485b",
                      "on-surface": "#131b2e",
                      "on-surface-variant": "#42474f",
                      "inverse-surface": "#283044",
                      "on-tertiary-container": "#97a5bc",
                      "on-secondary-fixed": "#341100",
                      "surface-bright": "#faf8ff",
                      "inverse-on-surface": "#eef0ff",
                      "surface-container-lowest": "#ffffff",
                      "secondary-fixed-dim": "#ffb690",
                      "on-error": "#ffffff",
                      "surface-container-low": "#f2f3ff",
                      "primary-container": "#0d3b66",
                      "inverse-primary": "#a4c9fc",
                      "primary-fixed-dim": "#a4c9fc",
                      "error-container": "#ffdad6",
                      "on-primary-fixed-variant": "#204874",
                      "on-secondary-container": "#5c2400",
                      "surface-dim": "#d2d9f4",
                      "surface-container-highest": "#dae2fd",
                      "surface-variant": "#dae2fd",
                      "background": "#faf8ff",
                      "on-tertiary": "#ffffff",
                      "secondary-fixed": "#ffdbca",
                      "on-secondary": "#ffffff",
                      "tertiary-fixed-dim": "#b9c7df",
                      "tertiary-fixed": "#d5e3fc",
                      "on-primary-container": "#81a6d7",
                      "on-secondary-fixed-variant": "#783200",
                      "primary": "#002546",
                      "on-tertiary-fixed": "#0d1c2e",
                      "surface": "#faf8ff",
                      "surface-tint": "#3a608d",
                      "outline-variant": "#c3c6d0",
                      "primary-fixed": "#d3e4ff",
                      "on-background": "#131b2e",
                      "tertiary-container": "#2d3b4e",
                      "on-primary-fixed": "#001c38",
                      "on-primary": "#ffffff",
                      "surface-container-high": "#e2e7ff",
                      "tertiary": "#172537",
                      "error": "#ba1a1a",
                      "outline": "#737780",
                      "on-error-container": "#93000a",
                      "secondary-container": "#fd761a",
                      "secondary": "#9d4300",
                      "surface-container": "#eaedff"
              },
              "borderRadius": {
                      "DEFAULT": "0.125rem",
                      "lg": "0.25rem",
                      "xl": "0.5rem",
                      "full": "0.75rem"
              },
              "spacing": {
                      "stack-md": "16px",
                      "gutter": "12px",
                      "touch-target-min": "48px",
                      "stack-lg": "24px",
                      "unit": "8px",
                      "edge-margin": "16px",
                      "stack-sm": "8px"
              },
              "fontFamily": {
                      "body-md": [
                              "Inter"
                      ],
                      "label-lg": [
                              "Inter"
                      ],
                      "label-sm": [
                              "Inter"
                      ],
                      "headline-sm": [
                              "Inter"
                      ],
                      "body-lg": [
                              "Inter"
                      ],
                      "headline-lg": [
                              "Inter"
                      ],
                      "headline-md": [
                              "Inter"
                      ]
              },
              "fontSize": {
                      "body-md": [
                              "16px",
                              {
                                      "lineHeight": "24px",
                                      "fontWeight": "400"
                              }
                      ],
                      "label-lg": [
                              "14px",
                              {
                                      "lineHeight": "20px",
                                      "letterSpacing": "0.05em",
                                      "fontWeight": "600"
                              }
                      ],
                      "label-sm": [
                              "12px",
                              {
                                      "lineHeight": "16px",
                                      "letterSpacing": "0.08em",
                                      "fontWeight": "700"
                              }
                      ],
                      "headline-sm": [
                              "20px",
                              {
                                      "lineHeight": "28px",
                                      "fontWeight": "600"
                              }
                      ],
                      "body-lg": [
                              "18px",
                              {
                                      "lineHeight": "28px",
                                      "fontWeight": "400"
                              }
                      ],
                      "headline-lg": [
                              "32px",
                              {
                                      "lineHeight": "40px",
                                      "letterSpacing": "-0.02em",
                                      "fontWeight": "700"
                              }
                      ],
                      "headline-md": [
                              "24px",
                              {
                                      "lineHeight": "32px",
                                      "letterSpacing": "-0.01em",
                                      "fontWeight": "700"
                              }
                      ]
              }
      },
          },
        }
      </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .pb-safe {
            padding-bottom: env(safe-area-inset-bottom);
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background text-on-background antialiased min-h-screen flex flex-col">
<!-- TopAppBar -->
<header class="bg-slate-50 dark:bg-slate-900 text-[#0D3B66] dark:text-blue-400 font-sans font-bold tracking-tight text-lg shadow-sm border-b-2 border-slate-300 dark:border-slate-800 flex items-center justify-between px-4 h-14 w-full sticky top-0 z-50">
<button aria-label="Menu" class="flex items-center justify-center p-2 hover:bg-slate-100 dark:hover:bg-slate-800 rounded-full active:translate-y-0.5 transition-transform">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="menu">menu</span>
</button>
<span class="text-xl font-black text-[#0D3B66] dark:text-white">TKR Field Ops</span>
<button aria-label="Sync" class="flex items-center justify-center p-2 hover:bg-slate-100 dark:hover:bg-slate-800 rounded-full active:translate-y-0.5 transition-transform">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="cloud_sync">cloud_sync</span>
</button>
</header>
<!-- Main Content -->
<main class="flex-grow p-edge-margin md:max-w-3xl md:mx-auto w-full mb-20 md:mb-0">
<!-- Stepper Indicator -->
<div class="mb-stack-lg">
<h1 class="font-headline-md text-headline-md text-on-surface mb-unit">Report Pipe Damage</h1>
<div class="flex items-center justify-between relative">
<!-- Progress Line -->
<div class="absolute left-0 top-1/2 transform -translate-y-1/2 w-full h-1 bg-surface-variant z-0 rounded-full"></div>
<div class="absolute left-0 top-1/2 transform -translate-y-1/2 w-1/3 h-1 bg-primary z-0 rounded-full"></div>
<!-- Step 1 (Active) -->
<div class="relative z-10 flex flex-col items-center">
<div class="w-8 h-8 rounded-full bg-primary text-on-primary flex items-center justify-center font-label-lg text-label-lg shadow-md border-2 border-primary">
                        1
                    </div>
<span class="mt-2 font-label-sm text-label-sm text-on-surface">Location</span>
</div>
<!-- Step 2 (Inactive) -->
<div class="relative z-10 flex flex-col items-center">
<div class="w-8 h-8 rounded-full bg-surface-container-highest text-on-surface-variant flex items-center justify-center font-label-lg text-label-lg shadow-sm border-2 border-surface-variant">
                        2
                    </div>
<span class="mt-2 font-label-sm text-label-sm text-on-surface-variant">Details</span>
</div>
<!-- Step 3 (Inactive) -->
<div class="relative z-10 flex flex-col items-center">
<div class="w-8 h-8 rounded-full bg-surface-container-highest text-on-surface-variant flex items-center justify-center font-label-lg text-label-lg shadow-sm border-2 border-surface-variant">
                        3
                    </div>
<span class="mt-2 font-label-sm text-label-sm text-on-surface-variant">Action</span>
</div>
</div>
</div>
<!-- Form Canvas (Step 1) -->
<div class="bg-surface-container-lowest rounded-xl shadow-[0_4px_6px_-1px_rgba(0,0,0,0.1),0_2px_4px_-1px_rgba(0,0,0,0.06)] border border-outline-variant p-stack-md flex flex-col gap-stack-lg">
<!-- Map Location Section -->
<section class="flex flex-col gap-stack-sm">
<div class="flex justify-between items-end">
<label class="font-label-lg text-label-lg text-on-surface">GPS Location</label>
<button class="text-primary font-label-sm text-label-sm flex items-center gap-1 active:opacity-70" type="button">
<span aria-hidden="true" class="material-symbols-outlined text-[16px]" data-icon="my_location">my_location</span>
                        Update
                    </button>
</div>
<div class="relative w-full h-48 rounded-lg overflow-hidden border-2 border-outline-variant shadow-inner">
<!-- Placeholder Map Image -->
<img alt="Map View" class="w-full h-full object-cover" data-alt="satellite view map showing urban grid streets and buildings with a central red marker pin" data-location="Chicago" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCRu_c1mDk5sCjim1OcKypaQg0JCKX0SbvDRi4lmGrJKfaxElgUZvqiJn_goGhx9uUGiN20bBUmXl6YnFWubD4PVNhcw-O02PhkKcfkTSkZy0jQ9K2d2XV9xQUN0JTTzKbj-zC5BEMhpdsYbWr-TnViPvmdg_MQIJ8nkxDLlIpBsrKamzHCcBocdQcgHRSZn-Zc7Rl50jHSyMAupje7i7Eb2gPFP3-a22iVL7MXy3FyUqDv72wee-3foy52rUVSqdJQhFRQRzqQSw4"/>
<!-- Fake Pin -->
<div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-full text-error drop-shadow-md">
<span aria-hidden="true" class="material-symbols-outlined text-4xl" data-icon="location_on" data-weight="fill" style="font-variation-settings: 'FILL' 1;">location_on</span>
</div>
</div>
<p class="font-body-md text-body-md text-on-surface-variant">Lat: 41.8781° N, Lon: 87.6298° W</p>
</section>
<!-- Photo Upload Section -->
<section class="flex flex-col gap-stack-sm">
<label class="font-label-lg text-label-lg text-on-surface">Evidence Photo</label>
<div class="w-full h-touch-target-min border-2 border-dashed border-primary bg-primary-fixed rounded-lg flex items-center justify-center cursor-pointer active:bg-primary-fixed-dim transition-colors shadow-sm">
<div class="flex items-center gap-2 text-primary font-label-lg text-label-lg">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="add_a_photo">add_a_photo</span>
                        Capture Image
                    </div>
</div>
<!-- Validation/Help Text -->
<p class="font-body-md text-body-md text-on-surface-variant text-sm flex items-center gap-1">
<span aria-hidden="true" class="material-symbols-outlined text-[16px] text-outline" data-icon="info">info</span>
                    Ensure damage is clearly visible. Max 5MB.
                </p>
</section>
<!-- Actions -->
<div class="flex gap-gutter mt-stack-md">
<button class="flex-1 h-touch-target-min rounded-lg border-2 border-outline-variant bg-surface text-on-surface font-label-lg text-label-lg active:bg-surface-variant shadow-sm transition-colors" type="button">
                    Cancel
                </button>
<button class="flex-1 h-touch-target-min rounded-lg bg-primary text-on-primary font-label-lg text-label-lg shadow-md active:bg-on-primary-fixed-variant transition-colors flex items-center justify-center gap-2" type="button">
                    Next Step
                    <span aria-hidden="true" class="material-symbols-outlined text-[20px]" data-icon="arrow_forward">arrow_forward</span>
</button>
</div>
<!-- Offline Indicator -->
<div class="mt-stack-sm p-3 bg-surface-container border-l-4 border-secondary-container rounded-r-lg flex items-start gap-3 shadow-sm">
<span aria-hidden="true" class="material-symbols-outlined text-secondary-container" data-icon="wifi_off">wifi_off</span>
<div>
<h4 class="font-label-lg text-label-lg text-on-surface">Offline Mode</h4>
<p class="font-body-md text-body-md text-on-surface-variant text-sm mt-1">Report will be saved locally and synced automatically upon reconnection.</p>
</div>
</div>
</div>
</main>
<!-- BottomNavBar (Mobile Only) -->
<nav class="md:hidden bg-white dark:bg-slate-950 shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.1)] border-t-2 border-slate-300 dark:border-slate-800 fixed bottom-0 left-0 w-full z-50 flex justify-around items-center h-20 px-2 pb-safe">
<a class="flex flex-col items-center justify-center bg-[#0D3B66] text-white rounded-md px-3 py-1 active:scale-95 transition-all duration-150" href="#">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="assignment" data-weight="fill" style="font-variation-settings: 'FILL' 1;">assignment</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Tasks</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150" href="#">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="map">map</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Map</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150" href="#">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="sync_saved_locally">sync_saved_locally</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Sync</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150" href="#">
<span aria-hidden="true" class="material-symbols-outlined" data-icon="person">person</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Profile</span>
</a>
</nav>
</body></html>


<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>TKR Field Ops - Tasks</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
          darkMode: "class",
          theme: {
            extend: {
              "colors": {
                      "on-tertiary-fixed-variant": "#3a485b",
                      "on-surface": "#131b2e",
                      "on-surface-variant": "#42474f",
                      "inverse-surface": "#283044",
                      "on-tertiary-container": "#97a5bc",
                      "on-secondary-fixed": "#341100",
                      "surface-bright": "#faf8ff",
                      "inverse-on-surface": "#eef0ff",
                      "surface-container-lowest": "#ffffff",
                      "secondary-fixed-dim": "#ffb690",
                      "on-error": "#ffffff",
                      "surface-container-low": "#f2f3ff",
                      "primary-container": "#0d3b66",
                      "inverse-primary": "#a4c9fc",
                      "primary-fixed-dim": "#a4c9fc",
                      "error-container": "#ffdad6",
                      "on-primary-fixed-variant": "#204874",
                      "on-secondary-container": "#5c2400",
                      "surface-dim": "#d2d9f4",
                      "surface-container-highest": "#dae2fd",
                      "surface-variant": "#dae2fd",
                      "background": "#faf8ff",
                      "on-tertiary": "#ffffff",
                      "secondary-fixed": "#ffdbca",
                      "on-secondary": "#ffffff",
                      "tertiary-fixed-dim": "#b9c7df",
                      "tertiary-fixed": "#d5e3fc",
                      "on-primary-container": "#81a6d7",
                      "on-secondary-fixed-variant": "#783200",
                      "primary": "#002546",
                      "on-tertiary-fixed": "#0d1c2e",
                      "surface": "#faf8ff",
                      "surface-tint": "#3a608d",
                      "outline-variant": "#c3c6d0",
                      "primary-fixed": "#d3e4ff",
                      "on-background": "#131b2e",
                      "tertiary-container": "#2d3b4e",
                      "on-primary-fixed": "#001c38",
                      "on-primary": "#ffffff",
                      "surface-container-high": "#e2e7ff",
                      "tertiary": "#172537",
                      "error": "#ba1a1a",
                      "outline": "#737780",
                      "on-error-container": "#93000a",
                      "secondary-container": "#fd761a",
                      "secondary": "#9d4300",
                      "surface-container": "#eaedff"
              },
              "borderRadius": {
                      "DEFAULT": "0.125rem",
                      "lg": "0.25rem",
                      "xl": "0.5rem",
                      "full": "0.75rem"
              },
              "spacing": {
                      "stack-md": "16px",
                      "gutter": "12px",
                      "touch-target-min": "48px",
                      "stack-lg": "24px",
                      "unit": "8px",
                      "edge-margin": "16px",
                      "stack-sm": "8px"
              },
              "fontFamily": {
                      "body-md": ["Inter"],
                      "label-lg": ["Inter"],
                      "label-sm": ["Inter"],
                      "headline-sm": ["Inter"],
                      "body-lg": ["Inter"],
                      "headline-lg": ["Inter"],
                      "headline-md": ["Inter"]
              },
              "fontSize": {
                      "body-md": ["16px", {"lineHeight": "24px", "fontWeight": "400"}],
                      "label-lg": ["14px", {"lineHeight": "20px", "letterSpacing": "0.05em", "fontWeight": "600"}],
                      "label-sm": ["12px", {"lineHeight": "16px", "letterSpacing": "0.08em", "fontWeight": "700"}],
                      "headline-sm": ["20px", {"lineHeight": "28px", "fontWeight": "600"}],
                      "body-lg": ["18px", {"lineHeight": "28px", "fontWeight": "400"}],
                      "headline-lg": ["32px", {"lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700"}],
                      "headline-md": ["24px", {"lineHeight": "32px", "letterSpacing": "-0.01em", "fontWeight": "700"}]
              }
            }
          }
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .icon-fill {
            font-variation-settings: 'FILL' 1;
        }
        
        /* Simulating the swipe layers behind the cards */
        .swipe-container {
            position: relative;
            overflow: hidden;
            background: linear-gradient(to right, #fd761a 50%, #15803d 50%); /* Orange left (escalate), Green right (complete) */
        }
        .swipe-card {
            position: relative;
            z-index: 10;
            transition: transform 0.2s ease;
        }
        /* Demo state for middle card */
        .swiped-right .swipe-card {
            transform: translateX(48px);
        }
        .swiped-left .swipe-card {
            transform: translateX(-48px);
        }
        .swipe-action-left {
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            z-index: 1;
        }
        .swipe-action-right {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            width: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            z-index: 1;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background text-on-background font-body-md text-body-md antialiased min-h-screen flex flex-col pt-14 pb-20">
<!-- TopAppBar -->
<header class="fixed top-0 left-0 right-0 z-40 bg-slate-50 dark:bg-slate-900 border-b-2 border-slate-300 dark:border-slate-800 shadow-sm flex items-center justify-between px-4 h-14 w-full">
<button class="flex items-center justify-center min-h-[48px] min-w-[48px] text-[#0D3B66] dark:text-blue-400 hover:bg-slate-100 dark:hover:bg-slate-800 active:translate-y-0.5 transition-transform rounded">
<span class="material-symbols-outlined">menu</span>
</button>
<h1 class="text-xl font-black text-[#0D3B66] dark:text-white font-sans tracking-tight">TKR Field Ops</h1>
<button class="flex items-center justify-center min-h-[48px] min-w-[48px] text-[#0D3B66] dark:text-blue-400 hover:bg-slate-100 dark:hover:bg-slate-800 active:translate-y-0.5 transition-transform rounded">
<span class="material-symbols-outlined">cloud_sync</span>
</button>
</header>
<!-- Main Canvas -->
<main class="flex-grow flex flex-col p-edge-margin gap-stack-lg max-w-3xl mx-auto w-full">
<!-- Filter Toggle -->
<div class="flex p-1 bg-surface-container-high rounded-DEFAULT border-2 border-outline-variant shadow-[inset_0_2px_4px_rgba(0,0,0,0.1)]">
<button class="flex-1 py-3 text-center bg-primary text-on-primary font-label-lg text-label-lg rounded-sm shadow-sm transition-colors">
                Pending
            </button>
<button class="flex-1 py-3 text-center text-on-surface-variant font-label-lg text-label-lg rounded-sm hover:bg-surface-variant transition-colors">
                Completed
            </button>
</div>
<!-- Task List -->
<div class="flex flex-col gap-stack-md">
<!-- Standard Card -->
<div class="swipe-container rounded-DEFAULT border border-outline-variant shadow-md">
<div class="swipe-action-left bg-secondary-container">
<span class="material-symbols-outlined">warning</span>
</div>
<div class="swipe-action-right bg-green-700">
<span class="material-symbols-outlined">check</span>
</div>
<div class="swipe-card bg-surface-container-lowest p-4 flex flex-col gap-unit border-l-4 border-l-primary cursor-pointer active:scale-[0.99] transition-transform">
<div class="flex justify-between items-start mb-1">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase">ID: INSP-8492</span>
<span class="bg-error-container text-on-error-container px-2 py-1 rounded-sm font-label-sm text-label-sm uppercase tracking-wider border border-error">High Priority</span>
</div>
<h2 class="font-headline-sm text-headline-sm text-on-surface">Substation Alpha - Transformer Check</h2>
<div class="flex items-center gap-2 text-on-surface-variant mt-2">
<span class="material-symbols-outlined text-lg">location_on</span>
<span class="font-body-md text-body-md text-sm">492 Industrial Pkwy, Sector 4</span>
</div>
</div>
</div>
<!-- Card showing partial right swipe (Complete) -->
<div class="swipe-container rounded-DEFAULT border border-outline-variant shadow-md swiped-right">
<div class="swipe-action-left bg-secondary-container">
<span class="material-symbols-outlined">warning</span>
</div>
<div class="swipe-action-right bg-green-700">
<span class="material-symbols-outlined">check</span>
</div>
<div class="swipe-card bg-surface-container-lowest p-4 flex flex-col gap-unit border-l-4 border-l-outline-variant cursor-pointer">
<div class="flex justify-between items-start mb-1">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase">ID: REP-3301</span>
<span class="bg-surface-variant text-on-surface-variant px-2 py-1 rounded-sm font-label-sm text-label-sm uppercase border border-outline-variant">Routine</span>
</div>
<h2 class="font-headline-sm text-headline-sm text-on-surface">Valve Replacement - Main Line</h2>
<div class="flex items-center gap-2 text-on-surface-variant mt-2">
<span class="material-symbols-outlined text-lg">location_on</span>
<span class="font-body-md text-body-md text-sm">Pump Station B, Riverside</span>
</div>
</div>
</div>
<!-- Standard Card -->
<div class="swipe-container rounded-DEFAULT border border-outline-variant shadow-md">
<div class="swipe-action-left bg-secondary-container">
<span class="material-symbols-outlined">warning</span>
</div>
<div class="swipe-action-right bg-green-700">
<span class="material-symbols-outlined">check</span>
</div>
<div class="swipe-card bg-surface-container-lowest p-4 flex flex-col gap-unit border-l-4 border-l-secondary-container cursor-pointer active:scale-[0.99] transition-transform">
<div class="flex justify-between items-start mb-1">
<span class="font-label-sm text-label-sm text-on-surface-variant uppercase">ID: INSP-8504</span>
<span class="bg-secondary-fixed text-on-secondary-fixed-variant px-2 py-1 rounded-sm font-label-sm text-label-sm uppercase border border-secondary">Elevated</span>
</div>
<h2 class="font-headline-sm text-headline-sm text-on-surface">Structural Integrity Scan</h2>
<div class="flex items-center gap-2 text-on-surface-variant mt-2">
<span class="material-symbols-outlined text-lg">location_on</span>
<span class="font-body-md text-body-md text-sm">Bridge Pier 7, East Span</span>
</div>
</div>
</div>
</div>
</main>
<!-- BottomNavBar -->
<nav class="fixed bottom-0 left-0 w-full z-50 flex justify-around items-center h-20 px-2 pb-safe bg-white dark:bg-slate-950 border-t-2 border-slate-300 dark:border-slate-800 shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.1)] md:hidden">
<!-- Active: Tasks -->
<button class="flex flex-col items-center justify-center bg-[#0D3B66] text-white rounded-md px-3 py-1 active:scale-95 transition-all duration-150 min-h-[48px]">
<span class="material-symbols-outlined icon-fill">assignment</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Tasks</span>
</button>
<!-- Inactive: Map -->
<button class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 min-h-[48px]">
<span class="material-symbols-outlined">map</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Map</span>
</button>
<!-- Inactive: Sync -->
<button class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 min-h-[48px]">
<span class="material-symbols-outlined">sync_saved_locally</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Sync</span>
</button>
<!-- Inactive: Profile -->
<button class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 min-h-[48px]">
<span class="material-symbols-outlined">person</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Profile</span>
</button>
</nav>
</body></html>
