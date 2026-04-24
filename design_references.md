<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>TKR Field Ops - Map</title>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Theme Configuration -->
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
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        /* Hard Shadows for physical presence */
        .hard-shadow {
            box-shadow: 0 4px 0 0 rgba(0,0,0,0.2);
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background text-on-background h-screen w-full overflow-hidden flex flex-col md:flex-row antialiased">
<!-- TopAppBar (Mobile/Tablet Top) -->
<header class="md:hidden z-30 bg-slate-50 dark:bg-slate-900 border-b-2 border-slate-300 dark:border-slate-800 shadow-sm flex items-center justify-between px-4 h-14 w-full top-0 w-full relative">
<button class="flex items-center justify-center w-10 h-10 text-[#0D3B66] dark:text-blue-400 hover:bg-slate-100 dark:hover:bg-slate-800 rounded active:translate-y-0.5 transition-transform">
<span class="material-symbols-outlined">menu</span>
</button>
<h1 class="font-sans font-bold tracking-tight text-lg text-[#0D3B66] dark:text-white">
            TKR Field Ops
        </h1>
<button class="flex items-center justify-center w-10 h-10 text-[#0D3B66] dark:text-blue-400 hover:bg-slate-100 dark:hover:bg-slate-800 rounded active:translate-y-0.5 transition-transform">
<span class="material-symbols-outlined">cloud_sync</span>
</button>
</header>
<!-- NavigationDrawer (Web Side) -->
<aside class="hidden md:flex flex-col h-full overflow-y-auto p-4 gap-2 w-80 rounded-r-none border-r-2 divide-y divide-slate-200 dark:divide-slate-800 border-slate-300 dark:border-slate-800 bg-slate-50 dark:bg-slate-900 shadow-2xl z-30 relative">
<div class="flex items-center gap-4 py-4">
<img alt="Field Officer Portrait" class="w-12 h-12 rounded-full border-2 border-primary object-cover" data-alt="Close up portrait of a serious field officer wearing a uniform shirt in daylight" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDUA4eEo746aM1DmbAFc_EiULLXffPcTPSZ2y3NodFzhZQWSna9E-hECfoPRFqoauRwx3U-Gf1ZUZrY9J8z4ZMr1h1xmXvNd9uAE6uDZ3aZ5IlKRQMPQXI_87hbw-UEHX2sNYpZcjbH9un_44XCRUHJ05TPRo0R5sQ129dhOYigsDMJlFbDlSI3nKWCxHPZ-fITpQWc46dldcTHDzJpc9jANKrZzcg8h__3wd5Dc3RcrE-XT7DaMF9sPEc-Nk3Je2zLH4E1Vj4gyOs"/>
<div>
<h2 class="font-sans text-sm font-semibold text-[#0D3B66] dark:text-white">Officer Pratama</h2>
<p class="font-sans text-xs text-slate-600 dark:text-slate-400">ID: TKR-4029</p>
<p class="font-sans text-xs text-slate-500">Unit: West Region</p>
</div>
</div>
<nav class="flex-1 py-4 flex flex-col gap-2">
<!-- Active state logic: Map is active based on intent, but Map isn't in side drawer JSON. Let's just render them as inactive or assume one is closely related. We will render them strictly as JSON provided. -->
<a class="flex items-center gap-3 px-3 py-2 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 rounded font-sans text-sm font-semibold transition-colors duration-200" href="#">
<span class="material-symbols-outlined">engineering</span>
                Work Orders
            </a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 rounded font-sans text-sm font-semibold transition-colors duration-200" href="#">
<span class="material-symbols-outlined">inventory_2</span>
                Asset Inventory
            </a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 rounded font-sans text-sm font-semibold transition-colors duration-200" href="#">
<span class="material-symbols-outlined">sd_storage</span>
                Offline Data
            </a>
<a class="flex items-center gap-3 px-3 py-2 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 rounded font-sans text-sm font-semibold transition-colors duration-200" href="#">
<span class="material-symbols-outlined">health_and_safety</span>
                Safety Protocols
            </a>
<div class="mt-auto border-t border-slate-200 pt-4">
<a class="flex items-center gap-3 px-3 py-2 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-800 rounded font-sans text-sm font-semibold transition-colors duration-200" href="#">
<span class="material-symbols-outlined">logout</span>
                    Logout
                </a>
</div>
</nav>
</aside>
<!-- Main Content Canvas (Map) -->
<main class="flex-1 relative h-full w-full bg-surface-container-low">
<!-- Map Background -->
<div class="absolute inset-0 bg-cover bg-center" data-alt="Top down satellite map view of city streets and infrastructure blocks with subtle digital overlay" data-location="Jakarta" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuAObzO_rUJBokZm455J0UoD_Zdr6MoKqiL9VkW9sH97YafKkZ4MZboTu2JJZXrODJnJlCg0rO6UkNyG2_R1YuCjJw7h_RHkrQzyhWHHLgI5_eTCm1yUiDaUn6rcHM4G24GFMpMsdiNSnZhsyrpQlG27EULZABEgZN9SBbzV-spk5lb2smOSdwPD_jDLvwp9AJ2VdajRM11IUZmq_ePm1KwzIhqRUdBxyjkgJXhnRRixRovy9hjOlOPbv7dNtz-0ovO3GxioA3VFhcI');"></div>
<!-- Map Overlay Gradient for Readability -->
<div class="absolute inset-0 bg-gradient-to-t from-surface/80 via-transparent to-transparent pointer-events-none"></div>
<!-- Custom Markers -->
<!-- Marker: Meter Reading (Blue) -->
<button class="absolute top-[30%] left-[40%] flex flex-col items-center group touch-target-min pointer-events-auto">
<div class="bg-primary-container text-on-primary-container border-2 border-primary-fixed shadow-md rounded-full p-2 flex items-center justify-center transform group-active:scale-95 transition-transform">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">water_drop</span>
</div>
<div class="w-1 h-3 bg-primary-container"></div>
<div class="w-2 h-1 bg-black/30 rounded-full blur-[1px]"></div>
</button>
<!-- Marker: Pipe Leak (Red Caution) -->
<button class="absolute top-[50%] left-[65%] flex flex-col items-center group touch-target-min pointer-events-auto">
<div class="bg-error text-on-error border-2 border-error-container shadow-md rounded-full p-2 flex items-center justify-center transform group-active:scale-95 transition-transform animate-pulse">
<span class="material-symbols-outlined text-[20px]" style="font-variation-settings: 'FILL' 1;">warning</span>
</div>
<div class="w-1 h-3 bg-error"></div>
<div class="w-2 h-1 bg-black/30 rounded-full blur-[1px]"></div>
</button>
<!-- Thumb Zone UI Elements -->
<div class="absolute bottom-24 left-0 w-full px-edge-margin md:bottom-8 md:px-8 flex flex-col-reverse md:flex-row items-end md:items-end justify-between gap-4 pointer-events-none z-20">
<!-- Priority Task Overlay Card -->
<div class="w-full md:w-[400px] bg-surface border-2 border-outline-variant rounded-xl p-4 hard-shadow pointer-events-auto flex flex-col gap-stack-sm relative overflow-hidden">
<!-- Status Strip -->
<div class="absolute top-0 left-0 w-full h-1 bg-error"></div>
<div class="flex items-start justify-between mb-1 mt-1">
<span class="bg-error/10 text-error font-label-sm px-2 py-1 rounded border border-error/20 flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">priority_high</span>
                        URGENT
                    </span>
<span class="font-label-sm text-outline">ID: LK-9921</span>
</div>
<h3 class="font-headline-sm text-on-surface">Main Line Pressure Drop</h3>
<div class="flex items-center gap-2 text-on-surface-variant font-body-md mt-1">
<span class="material-symbols-outlined text-outline">location_on</span>
<span class="truncate">Jl. Sudirman Block 4A, Valve Sec</span>
</div>
<div class="mt-stack-md">
<!-- High-Vis Button -->
<button class="w-full h-[56px] bg-primary text-on-primary font-label-lg uppercase tracking-wider rounded border-b-4 border-primary-fixed-dim hover:bg-primary-fixed hover:text-on-primary-fixed active:border-b-0 active:translate-y-1 transition-all flex items-center justify-center gap-2">
<span class="material-symbols-outlined">route</span>
                        Navigate to Site
                    </button>
</div>
</div>
<!-- Locate Me FAB -->
<button class="w-14 h-14 bg-surface border-2 border-outline-variant text-primary rounded-full hard-shadow flex items-center justify-center pointer-events-auto hover:bg-surface-container active:translate-y-1 active:shadow-none transition-all ml-auto md:ml-0 mb-4 md:mb-0">
<span class="material-symbols-outlined">my_location</span>
</button>
</div>
</main>
<!-- BottomNavBar (Mobile Bottom) -->
<nav class="md:hidden fixed bottom-0 left-0 w-full z-50 flex justify-around items-center h-20 px-2 pb-safe bg-white dark:bg-slate-950 border-t-2 border-slate-300 dark:border-slate-800 shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.1)]">
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 w-full h-full" href="#">
<span class="material-symbols-outlined mb-1">assignment</span>
<span class="text-[11px] font-bold uppercase tracking-wider text-center">Tasks</span>
</a>
<!-- Active Tab: Map -->
<a class="flex flex-col items-center justify-center bg-[#0D3B66] text-white rounded-md px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 h-[80%] mx-1" href="#">
<span class="material-symbols-outlined mb-1" style="font-variation-settings: 'FILL' 1;">map</span>
<span class="text-[11px] font-bold uppercase tracking-wider text-center">Map</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 w-full h-full" href="#">
<span class="material-symbols-outlined mb-1">sync_saved_locally</span>
<span class="text-[11px] font-bold uppercase tracking-wider text-center">Sync</span>
</a>
<a class="flex flex-col items-center justify-center text-slate-500 dark:text-slate-400 px-3 py-1 hover:bg-slate-50 dark:hover:bg-slate-800 active:scale-95 transition-all duration-150 w-full h-full" href="#">
<span class="material-symbols-outlined mb-1">person</span>
<span class="text-[11px] font-bold uppercase tracking-wider text-center">Profile</span>
</a>
</nav>
</body></html>
