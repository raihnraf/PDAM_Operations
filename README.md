# PDAM Fields — TKR Field Ops

> ⚠️ **Frontend-Only (Mock Data)** — Aplikasi ini adalah implementasi frontend lengkap tanpa backend. Semua data disimulasikan menggunakan mock repository dengan `Future.delayed()` dan penyimpanan lokal via `SharedPreferences`.

---

## Tentang Aplikasi

**PDAM Fields** adalah aplikasi mobile internal untuk petugas lapangan PDAM. Aplikasi ini mendemonstrasikan implementasi arsitektur Flutter yang production-ready dengan fokus pada:

- **Pemetaan Spatial** — Peta interaktif dengan marker custom untuk lokasi pelanggan
- **Form Kompleks Multi-Step** — Stepper dengan validasi ketat untuk pelaporan kerusakan
- **Offline-First Architecture** — Data disimpan lokal dan menunggu sinkronisasi

---

## Fitur Utama

### 🗺️ Interactive Task Map
Peta interaktif menggunakan `flutter_map` + OpenStreetMap dengan:
- Custom marker berwarna berdasarkan tipe tugas (pembacaan meter, inspeksi pipa, perbaikan)
- Tap marker untuk melihat detail tugas
- Tombol navigasi ke lokasi pelanggan
- Kalkulasi jarak menggunakan Haversine formula

### 📋 Swipe-to-Action Task List
Daftar tugas harian yang interaktif:
- Swipe **kanan** → Tandai "Selesai" (hijau)
- Swipe **kiri** → Eskalasi tugas (oranye)
- Filter berdasarkan status: Semua, Menunggu, Dikerjakan, Selesai
- Haptic feedback pada setiap aksi

### 📝 Offline-First Damage Report
Multi-step form (4 langkah) untuk pelaporan kerusakan pipa:
1. **Lokasi** — Pilih koordinat pada peta
2. **Tipe Kerusakan** — Kebocoran, pipa pecah, korosi, penyumbatan
3. **Detail** — Deskripsi, tingkat keparahan, foto
4. **Review** — Konfirmasi sebelum submit

Data disimpan ke `SharedPreferences` dan menunggu sinkronisasi saat online.

### 🔄 Sinkronisasi Data
Halaman sinkronisasi dengan:
- Status koneksi dan mode offline
- Info terakhir sinkronisasi
- Daftar laporan yang menunggu upload
- Tombol sinkronisasi massal

### 👤 Profil Petugas
Dashboard personal dengan:
- Statistik kinerja (tugas selesai, jam lapangan, skor efisiensi)
- Riwayat aktivitas terbaru
- Pengaturan aplikasi

---

## Tech Stack

| Kategori | Teknologi |
|----------|-----------|
| **Framework** | Flutter (Dart 3.5+) |
| **State Management** | `flutter_bloc` (Cubit pattern) |
| **Navigation** | `go_router` (declarative routing) |
| **Dependency Injection** | `get_it` (service locator) |
| **Maps** | `flutter_map` + OpenStreetMap |
| **Local Storage** | `shared_preferences` |
| **Testing** | `bloc_test`, `mocktail` |

---

## Architecture

**Clean Architecture + Feature-First**

```
lib/
├── core/                    # Shared utilities, widgets, constants
├── features/
│   ├── home/               # Bottom navigation shell
│   ├── task_map/           # Interactive map with markers
│   ├── task_list/          # Swipeable task list
│   ├── damage_report/      # Multi-step offline form
│   ├── sync/               # Data synchronization
│   └── profile/            # Officer profile & stats
└── routing/                 # go_router configuration
```

Setiap feature memiliki struktur:
```
feature/
├── data/
│   ├── models/             # Data models & JSON serialization
│   └── repositories/       # Repository implementations (mock)
├── domain/
│   ├── entities/           # Business entities
│   └── repositories/       # Repository interfaces
└── presentation/
    ├── bloc/               # Cubit & State classes
    ├── pages/              # UI pages
    └── widgets/            # Reusable feature widgets
```

---

## Mock Data Strategy

Aplikasi ini **tidak memiliki backend**. Semua data disimulasikan:

- **Repository mock** — Data dummy realistis (nama Indonesia, alamat Surabaya)
- **`Future.delayed()`** — Simulasi network latency (300ms - 1s)
- **`SharedPreferences`** — Penyimpanan lokal untuk damage report
- **`Result<T>` pattern** — Explicit error handling dengan sealed class

---

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Analyze code
flutter analyze

# Run tests
flutter test

# Build APK
flutter build apk
```

---

## Screenshots

| Task Map | Task List | Damage Report |
|----------|-----------|---------------|
| Peta interaktif dengan marker | Swipe-to-action cards | Multi-step stepper form |

| Sync | Profile |
|------|---------|
| Sinkronisasi data offline | Dashboard petugas |

---

## License

Internal project — not for public distribution.
