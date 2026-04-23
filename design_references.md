<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>TKR Field Ops - User Profile</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-secondary-fixed": "#341100",
                        "on-background": "#131b2e",
                        "surface-container": "#eaedff",
                        "tertiary-container": "#2d3b4e",
                        "secondary-fixed-dim": "#ffb690",
                        "error": "#ba1a1a",
                        "tertiary-fixed": "#d5e3fc",
                        "outline": "#737780",
                        "inverse-surface": "#283044",
                        "tertiary-fixed-dim": "#b9c7df",
                        "on-error": "#ffffff",
                        "inverse-on-surface": "#eef0ff",
                        "surface": "#faf8ff",
                        "on-primary-fixed": "#001c38",
                        "on-primary-container": "#81a6d7",
                        "on-error-container": "#93000a",
                        "on-secondary": "#ffffff",
                        "outline-variant": "#c3c6d0",
                        "error-container": "#ffdad6",
                        "on-tertiary-fixed": "#0d1c2e",
                        "primary-fixed": "#d3e4ff",
                        "on-secondary-container": "#5c2400",
                        "on-tertiary-container": "#97a5bc",
                        "surface-dim": "#d2d9f4",
                        "secondary": "#9d4300",
                        "tertiary": "#172537",
                        "background": "#faf8ff",
                        "primary-fixed-dim": "#a4c9fc",
                        "surface-container-highest": "#dae2fd",
                        "surface-variant": "#dae2fd",
                        "secondary-container": "#fd761a",
                        "surface-container-high": "#e2e7ff",
                        "primary-container": "#0d3b66",
                        "on-primary-fixed-variant": "#204874",
                        "surface-container-lowest": "#ffffff",
                        "on-tertiary": "#ffffff",
                        "on-secondary-fixed-variant": "#783200",
                        "surface-container-low": "#f2f3ff",
                        "on-surface-variant": "#42474f",
                        "on-tertiary-fixed-variant": "#3a485b",
                        "secondary-fixed": "#ffdbca",
                        "on-surface": "#131b2e",
                        "inverse-primary": "#a4c9fc",
                        "surface-bright": "#faf8ff",
                        "on-primary": "#ffffff",
                        "primary": "#002546",
                        "surface-tint": "#3a608d"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "spacing": {
                        "touch-target-min": "48px",
                        "stack-lg": "24px",
                        "unit": "8px",
                        "edge-margin": "16px",
                        "stack-sm": "8px",
                        "stack-md": "16px",
                        "gutter": "12px"
                    },
                    "fontFamily": {
                        "label-lg": ["Inter"],
                        "headline-lg": ["Inter"],
                        "body-md": ["Inter"],
                        "body-lg": ["Inter"],
                        "label-sm": ["Inter"],
                        "headline-sm": ["Inter"],
                        "headline-md": ["Inter"]
                    },
                    "fontSize": {
                        "label-lg": ["14px", { "lineHeight": "20px", "letterSpacing": "0.05em", "fontWeight": "600" }],
                        "headline-lg": ["32px", { "lineHeight": "40px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
                        "body-md": ["16px", { "lineHeight": "24px", "fontWeight": "400" }],
                        "body-lg": ["18px", { "lineHeight": "28px", "fontWeight": "400" }],
                        "label-sm": ["12px", { "lineHeight": "16px", "letterSpacing": "0.08em", "fontWeight": "700" }],
                        "headline-sm": ["20px", { "lineHeight": "28px", "fontWeight": "600" }],
                        "headline-md": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.01em", "fontWeight": "700" }]
                    }
                }
            }
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        [data-weight="fill"] {
            font-variation-settings: 'FILL' 1;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background text-on-background min-h-screen flex flex-col font-body-md antialiased md:flex-row">
<!-- TopAppBar (Web & Mobile Header) -->
<header class="bg-slate-50 dark:bg-slate-900 border-b-2 border-slate-300 dark:border-slate-800 shadow-sm flex items-center justify-between px-4 h-14 w-full md:hidden shrink-0 z-10 sticky top-0">
<div class="flex items-center gap-4">
<button class="text-[#0D3B66] dark:text-blue-400 hover:bg-slate-100 dark:hover:bg-slate-800 active:translate-y-0.5 transition-transform p-2 rounded-full w-touch-target-min h-touch-target-min flex items-center justify-center">
<span class="material-symbols-outlined" data-icon="menu">menu</span>
</button>
<h1 class="font-sans font-bold tracking-tight text-lg text-[#0D3B66] dark:text-white">TKR Field Ops</h1>
</div>
<button class="text-[#0D3B66] dark:text-blue-400 hover:bg-slate-100 dark:hover:bg-slate-800 active:translate-y-0.5 transition-transform p-2 rounded-full w-touch-target-min h-touch-target-min flex items-center justify-center">
<span class="material-symbols-outlined" data-icon="cloud_sync">cloud_sync</span>
</button>
</header>
<!-- NavigationDrawer (Web Sidebar) -->
<aside class="hidden md:flex flex-col h-full overflow-y-auto p-4 gap-2 h-screen w-80 rounded-r-none border-r-2 divide-y divide-slate-200 dark:divide-slate-800 border-r-2 border-slate-300 dark:border-slate-800 shadow-2xl bg-slate-50 dark:bg-slate-900 shrink-0 sticky top-0">
<!-- Header Profile -->
<div class="pb-4 flex items-center gap-4">
<img alt="Field Officer Portrait" class="w-12 h-12 rounded-full border-2 border-primary object-cover" data-alt="Portrait of a serious male field officer wearing a hard hat and high visibility vest against an industrial background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD_cqVvH2dXefHvb5gaaBJ8h1nOyxqowHabZJR1MN5W1b22UDXdSBVA8garxR4Ew-4VebcKzSZ5BbqhQwn0278J0UehaZWdHZg1TuDXCOO13uJVLpZZ6GElls5z4aUJfp4Sb0xEgo2YC-8nq6DFUlGFvzro035mT7U7xGl4h9cdtzViMiZlZXwgqlwTPnWKjONfALBKbxf8H6NNYlQmNp1ToNL75LMb8SzU1PPmi4E4zzu52A3EsNVomS58OQt9bdNUkRHux8DoH6s"/>
<div>
<h2 class="font-sans text-sm font-semibold text-[#0D3B66] dark:text-blue-400">Officer Pratama</h2>
<p class="text-label-sm font-label-sm text-outline">ID: TKR-4029</p>
<p class="text-label-sm font-label-sm text-outline">Unit: West Region</p>
</div>
</div>
<!-- Navigation Links -->
<nav class="pt-4 flex flex-col gap-2">
<a class="text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors duration-200 flex items-center gap-3 p-3 rounded-DEFAULT min-h-touch-target-min font-sans text-sm font-semibold" href="#">
<span class="material-symbols-outlined" data-icon="engineering">engineering</span>
                Work Orders
            </a>
<a class="text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors duration-200 flex items-center gap-3 p-3 rounded-DEFAULT min-h-touch-target-min font-sans text-sm font-semibold" href="#">
<span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
                Asset Inventory
            </a>
<a class="text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors duration-200 flex items-center gap-3 p-3 rounded-DEFAULT min-h-touch-target-min font-sans text-sm font-semibold" href="#">
<span class="material-symbols-outlined" data-icon="sd_storage">sd_storage</span>
                Offline Data
            </a>
<a class="text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors duration-200 flex items-center gap-3 p-3 rounded-DEFAULT min-h-touch-target-min font-sans text-sm font-semibold" href="#">
<span class="material-symbols-outlined" data-icon="health_and_safety">health_and_safety</span>
                Safety Protocols
            </a>
<div class="mt-auto pt-4">
<a class="text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors duration-200 flex items-center gap-3 p-3 rounded-DEFAULT min-h-touch-target-min font-sans text-sm font-semibold" href="#">
<span class="material-symbols-outlined" data-icon="logout">logout</span>
                    Logout
                </a>
</div>
</nav>
</aside>
<!-- Main Content Canvas -->
<main class="flex-1 overflow-y-auto pb-24 md:pb-8">
<div class="max-w-4xl mx-auto px-edge-margin py-stack-lg md:px-8 md:py-12 flex flex-col gap-stack-lg">
<!-- Page Title -->
<div class="flex items-center gap-4 border-b border-outline-variant pb-4">
<h2 class="font-headline-lg text-headline-lg text-primary">Profile</h2>
</div>
<!-- Profile Header Card (Bento Style) -->
<section class="bg-surface-container-low rounded-xl border border-outline-variant shadow-[0_4px_6px_-1px_rgba(0,0,0,0.1),0_2px_4px_-1px_rgba(0,0,0,0.06)] overflow-hidden">
<div class="p-6 md:p-8 flex flex-col md:flex-row items-center md:items-start gap-6 relative">
<!-- Status Indicator -->
<div class="absolute top-4 right-4 flex items-center gap-2 bg-secondary-container text-on-secondary-container px-3 py-1 rounded-full border border-secondary">
<div class="w-2 h-2 rounded-full bg-on-secondary-container animate-pulse"></div>
<span class="font-label-sm text-label-sm uppercase">On Duty</span>
</div>
<div class="shrink-0 relative group">
<img alt="Field Officer Portrait" class="w-32 h-32 rounded-full border-4 border-surface shadow-md object-cover" data-alt="Close up portrait of a serious male field officer wearing a hard hat and high visibility vest against an industrial background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAdCnAIxHyPEjZMBvfgk735kMQ3b5gYzFZ4DjV-IMuaY7DiaUfypE3OZLX2L63-fBrtZCZN_tcZaZ7lQEN_qPrqeUjIxit6R5HwcGFznFh6fqC5CS8dQTlQGNvSOp-wRPvYKamrtZEXp3M0cBoW2hasvaHckta8N4NTu90JptF1sM6RE0rqmnHwYDaGkQiKtw5cf2iE1b43SBSnJLVtMVHH2PIpe6C_mRwYbdqkGQ1i_kCf0Kb53HV1BTXFm5bpNHhyFB5tjLcYbjo"/>
<button class="absolute bottom-0 right-0 bg-primary text-on-primary w-10 h-10 rounded-full flex items-center justify-center border-2 border-surface shadow-sm hover:bg-on-primary-fixed-variant transition-colors">
<span class="material-symbols-outlined text-[20px]" data-icon="photo_camera">photo_camera</span>
</button>
</div>
<div class="flex-1 text-center md:text-left pt-2">
<h3 class="font-headline-md text-headline-md text-on-surface">Officer Pratama</h3>
<p class="font-body-lg text-body-lg text-on-surface-variant mb-4">Senior Field Technician</p>
<div class="grid grid-cols-2 gap-4 max-w-md">
<div class="bg-surface border border-outline-variant rounded-DEFAULT p-3 flex items-center gap-3">
<span class="material-symbols-outlined text-outline" data-icon="badge">badge</span>
<div>
<p class="font-label-sm text-label-sm text-outline uppercase">ID Number</p>
<p class="font-label-lg text-label-lg text-on-surface">TKR-4029</p>
</div>
</div>
<div class="bg-surface border border-outline-variant rounded-DEFAULT p-3 flex items-center gap-3">
<span class="material-symbols-outlined text-outline" data-icon="location_on">location_on</span>
<div>
<p class="font-label-sm text-label-sm text-outline uppercase">Unit Region</p>
<p class="font-label-lg text-label-lg text-on-surface">West Region</p>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- Stats Grid -->
<section class="grid grid-cols-1 md:grid-cols-3 gap-4">
<div class="bg-surface rounded-lg border-l-4 border-primary p-5 shadow-sm flex flex-col gap-2">
<div class="flex justify-between items-center text-outline">
<span class="font-label-sm text-label-sm uppercase tracking-wider">Tasks Completed</span>
<span class="material-symbols-outlined" data-icon="check_circle">check_circle</span>
</div>
<div class="flex items-baseline gap-2">
<span class="font-headline-lg text-headline-lg text-on-surface">1,204</span>
<span class="font-body-md text-body-md text-secondary">+12 this week</span>
</div>
</div>
<div class="bg-surface rounded-lg border-l-4 border-tertiary-container p-5 shadow-sm flex flex-col gap-2">
<div class="flex justify-between items-center text-outline">
<span class="font-label-sm text-label-sm uppercase tracking-wider">Hours in Field</span>
<span class="material-symbols-outlined" data-icon="schedule">schedule</span>
</div>
<div class="flex items-baseline gap-2">
<span class="font-headline-lg text-headline-lg text-on-surface">840</span>
<span class="font-body-md text-body-md text-outline-variant">YTD</span>
</div>
</div>
<div class="bg-surface rounded-lg border-l-4 border-secondary p-5 shadow-sm flex flex-col gap-2">
<div class="flex justify-between items-center text-outline">
<span class="font-label-sm text-label-sm uppercase tracking-wider">Efficiency Score</span>
<span class="material-symbols-outlined" data-icon="trending_up">trending_up</span>
</div>
<div class="flex items-baseline gap-2">
<span class="font-headline-lg text-headline-lg text-on-surface">94%</span>
<span class="font-body-md text-body-md text-on-surface-variant">Top 10%</span>
</div>
</div>
</section>
<!-- Settings List -->
<section class="bg-surface-container-lowest rounded-lg border border-outline-variant shadow-sm overflow-hidden flex flex-col divide-y divide-outline-variant">
<h3 class="font-headline-sm text-headline-sm text-on-surface p-4 bg-surface-container-low border-b border-outline-variant">Preferences &amp; Configuration</h3>
<button class="flex items-center justify-between p-4 hover:bg-surface-container-low transition-colors w-full text-left min-h-touch-target-min group">
<div class="flex items-center gap-4">
<div class="bg-surface-container p-2 rounded-DEFAULT text-primary group-hover:bg-primary-container group-hover:text-on-primary-container transition-colors">
<span class="material-symbols-outlined" data-icon="manage_accounts">manage_accounts</span>
</div>
<div>
<p class="font-label-lg text-label-lg text-on-surface">Account Settings</p>
<p class="font-body-md text-body-md text-outline">Manage credentials and personal info</p>
</div>
</div>
<span class="material-symbols-outlined text-outline" data-icon="chevron_right">chevron_right</span>
</button>
<button class="flex items-center justify-between p-4 hover:bg-surface-container-low transition-colors w-full text-left min-h-touch-target-min group">
<div class="flex items-center gap-4">
<div class="bg-surface-container p-2 rounded-DEFAULT text-primary group-hover:bg-primary-container group-hover:text-on-primary-container transition-colors">
<span class="material-symbols-outlined" data-icon="notifications_active">notifications_active</span>
</div>
<div>
<p class="font-label-lg text-label-lg text-on-surface">Notification Preferences</p>
<p class="font-body-md text-body-md text-outline">Alerts, dispatch pings, and summaries</p>
</div>
</div>
<span class="material-symbols-outlined text-outline" data-icon="chevron_right">chevron_right</span>
</button>
<button class="flex items-center justify-between p-4 hover:bg-surface-container-low transition-colors w-full text-left min-h-touch-target-min group">
<div class="flex items-center gap-4">
<div class="bg-surface-container p-2 rounded-DEFAULT text-primary group-hover:bg-primary-container group-hover:text-on-primary-container transition-colors">
<span class="material-symbols-outlined" data-icon="download_for_offline">download_for_offline</span>
</div>
<div>
<p class="font-label-lg text-label-lg text-on-surface">Offline Data Settings</p>
<p class="font-body-md text-body-md text-outline">Sync frequency and storage management</p>
</div>
</div>
<span class="material-symbols-outlined text-outline" data-icon="chevron_right">chevron_right</span>
</button>
<button class="flex items-center justify-between p-4 hover:bg-surface-container-low transition-colors w-full text-left min-h-touch-target-min group">
<div class="flex items-center gap-4">
<div class="bg-surface-container p-2 rounded-DEFAULT text-primary group-hover:bg-primary-container group-hover:text-on-primary-container transition-colors">
<span class="material-symbols-outlined" data-icon="verified">verified</span>
</div>
<div>
<p class="font-label-lg text-label-lg text-on-surface">Safety Training Certifications</p>
<p class="font-body-md text-body-md text-outline">View valid permits and expirations</p>
</div>
</div>
<span class="material-symbols-outlined text-outline" data-icon="chevron_right">chevron_right</span>
</button>
<button class="flex items-center justify-between p-4 hover:bg-surface-container-low transition-colors w-full text-left min-h-touch-target-min group">
<div class="flex items-center gap-4">
<div class="bg-surface-container p-2 rounded-DEFAULT text-primary group-hover:bg-primary-container group-hover:text-on-primary-container transition-colors">
<span class="material-symbols-outlined" data-icon="language">language</span>
</div>
<div>
<p class="font-label-lg text-label-lg text-on-surface">App Language</p>
<p class="font-body-md text-body-md text-outline">English (US)</p>
</div>
</div>
<span class="material-symbols-outlined text-outline" data-icon="chevron_right">chevron_right</span>
</button>
</section>
<!-- Actions -->
<div class="mt-4 pt-4 border-t border-outline-variant flex flex-col sm:flex-row gap-4 justify-end">
<button class="w-full sm:w-auto h-touch-target-min px-6 border-2 border-outline text-on-surface font-label-lg text-label-lg rounded-DEFAULT shadow-[0_2px_4px_-1px_rgba(0,0,0,0.1)] active:shadow-inner active:bg-surface-variant transition-all flex items-center justify-center gap-2">
<span class="material-symbols-outlined" data-icon="support_agent">support_agent</span>
                    Contact Dispatch
                </button>
<button class="w-full sm:w-auto h-[56px] px-8 bg-error text-on-error font-label-lg text-label-lg rounded-DEFAULT shadow-[0_4px_6px_-1px_rgba(0,0,0,0.2)] active:shadow-inner active:translate-y-0.5 transition-all flex items-center justify-center gap-2">
<span class="material-symbols-outlined" data-icon="logout">logout</span>
                    Logout
                </button>
</div>
</div>
</main>
<!-- BottomNavBar (Mobile Only) -->
<nav class="md:hidden bg-white dark:bg-slate-950 border-t-2 border-slate-300 dark:border-slate-800 shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.1)] fixed bottom-0 left-0 w-full z-50 flex justify-around items-center h-20 px-2 pb-safe">
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 min-h-touch-target-min min-w-touch-target-min rounded-lg" href="#">
<span class="material-symbols-outlined" data-icon="assignment">assignment</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Tasks</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 min-h-touch-target-min min-w-touch-target-min rounded-lg" href="#">
<span class="material-symbols-outlined" data-icon="map">map</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Map</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 min-h-touch-target-min min-w-touch-target-min rounded-lg" href="#">
<span class="material-symbols-outlined" data-icon="sync_saved_locally">sync_saved_locally</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Sync</span>
</a>
<a class="flex flex-col items-center justify-center bg-[#0D3B66] text-white rounded-md px-3 py-1 active:scale-95 transition-all duration-150 min-h-touch-target-min min-w-[72px]" href="#">
<span class="material-symbols-outlined" data-icon="person" data-weight="fill">person</span>
<span class="text-[11px] font-bold uppercase tracking-wider mt-1">Profile</span>
</a>
</nav>
</body></html>
