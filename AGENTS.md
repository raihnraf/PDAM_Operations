# AGENTS.md — TKR Field Ops (PDAM Fields)

> Dokumen ini berisi konteks penting untuk AI agent yang bekerja pada project ini.
> Baca file ini sebelum mulai coding untuk memahami arsitektur dan konvensi project.

---

## 1. Project Overview

| Item | Value |
|------|-------|
| **Nama** | TKR Field Ops (PDAM Fields) |
| **Tipe** | Flutter Mobile App (Android & iOS) |
| **Fokus** | Aplikasi internal untuk petugas lapangan PDAM — pemetaan spatial, manajemen tugas, dan pelaporan kerusakan |
| **Data** | MOCK ONLY (simulasi dengan Future.delayed + SharedPreferences untuk offline storage) |
| **Target Platform** | Mobile (Android primary) |

### Fitur Utama
1. **Interactive Task Map** — Peta interaktif dengan custom marker untuk lokasi pelanggan (meter reading, inspeksi pipa, perbaikan)
2. **Swipe-to-Action Task List** — Daftar tugas harian dengan swipe kiri untuk "Eskalasi" dan swipe kanan untuk "Selesai"
3. **Offline-First Damage Report** — Multi-step form (Stepper) untuk pelaporan kerusakan pipa dengan validasi ketat dan penyimpanan lokal via SharedPreferences
4. **Profile & Sync** — Profil petugas dengan statistik kinerja, pengaturan, dan halaman sinkronisasi data offline
5. **Bottom Navigation Shell** — Navigasi utama 4 tab (Tugas, Peta, Sinkronisasi, Profil) dengan IndexedStack untuk state preservation

---

## 2. Architecture & Stack

### Pattern
- **Clean Architecture + Feature-First**
- Setiap feature punya folder sendiri: `data/`, `domain/`, `presentation/`

### State Management
- **`flutter_bloc` (Cubit)** — dipakai di semua feature.
- Bloc/Cubit file ada di `features/<name>/presentation/bloc/`
- **Naming Convention**:
  - Cubit: `<Feature>Cubit` (e.g., `TaskMapCubit`)
  - State: `<Feature>State` (e.g., `TaskMapState`)
  - State class: `sealed class <Feature>State` dengan `initial`, `loading`, `loaded`, `error`

### Dependency Injection
- **`get_it`** (service locator pattern)
- Register di `lib/features/<feature>/<feature>_injection.dart`
- Global setup di `lib/injection_container.dart`
- **Urutan Init**: Core → Features (per feature injection) → Routing

### Routing
- **`go_router`** (declarative routing)
- Definisi route di `lib/routing/app_routes.dart`
- Router config di `lib/routing/app_router.dart`
- **Naming Convention**: Route name: `/<feature>` (e.g., `/task-map`, `/damage-report`)

### Result Pattern
- Pakai sealed class `Result<T>` (`Success`, `FailureResult`) di `lib/core/utils/result.dart`
- `Failure` class ada di `lib/core/errors/failures.dart`
- Repository selalu return `Future<Result<T>>`

---

## 3. Directory Structure

```
lib/
├── main.dart
├── app.dart
├── injection_container.dart
├── core/
│   ├── constants/              # AppColors, AppTextStyles, AppAssets, AppStrings
│   ├── theme/                  # AppTheme (light & dark)
│   ├── utils/                  # Result<T>, HapticHelper
│   ├── widgets/                # AppButton, LoadingIndicator, AppBottomSheet
│   └── errors/                 # Failure, ServerFailure, CacheFailure, etc.
├── routing/
│   ├── app_router.dart
│   └── app_routes.dart
└── features/
    ├── home/                   # Bottom navigation shell
    ├── task_map/               # Interactive map with markers
    ├── task_list/              # Swipeable task list
    ├── damage_report/          # Multi-step offline form
    └── profile/                # Officer profile & stats
        ├── data/
        │   ├── models/
        │   └── repositories/
        ├── domain/
        │   ├── entities/
        │   └── repositories/
        ├── presentation/
        │   ├── bloc/
        │   ├── pages/
        │   └── widgets/
        └── <feature>_injection.dart
```

### Aturan Import
- **`core/` boleh di-import dari mana saja.**
- **Feature tidak boleh import feature lain!** Kalau butuh shared logic, pindahkan ke `core/`.
- **Pengecualian**: `task_list` re-use entity & repository dari `task_map` karena domain yang sama.
- **Pengecualian**: `home` shell import semua feature pages untuk IndexedStack navigation.

---

## 4. Key Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.6
  go_router: ^14.3.0
  get_it: ^7.7.0
  equatable: ^2.0.5
  intl: ^0.19.0
  flutter_map: ^7.0.2
  latlong2: ^0.9.1
  shared_preferences: ^2.3.3
  uuid: ^4.5.1

dev_dependencies:
  bloc_test: ^9.1.7
  mocktail: ^1.0.4
```

---

## 5. Design System

### Colors
- `primary`: PDAM Blue `#1565C0`
- `secondary`: Water Teal `#00897B`
- `accent`: Alert Orange `#FF6F00`
- Status: success (green), warning (yellow), error (red), info (blue)

### Typography
- Font: Poppins
- Styles: headlineLarge, headlineMedium, titleLarge, titleMedium, bodyLarge, bodyMedium, labelLarge, button

### Reusable Widgets
- **`AppButton`** — Filled/Outlined button dengan loading state & icon support
- **`AppBottomSheet`** — Bottom sheet dengan drag handle & safe area
- **`LoadingIndicator`** — Centered CircularProgressIndicator dengan optional message

### Spacing
- Konstanta: `4`, `8`, `12`, `16`, `24`, `32`, `48`

---

## 6. Feature Details

### Task Map (`features/task_map/`)
- **Entity**: `Task` (id, customerId, customerName, address, lat, lng, type, status, scheduledDate, notes)
- **Enums**: `TaskType` (meterReading, pipeInspection, repair), `TaskStatus` (pending, inProgress, completed, escalated)
- **Repo**: `MockTaskRepository` — mock data 5 tugas di Surabaya, Haversine distance calculation
- **Cubit**: `TaskMapCubit` — loadTasks, selectTask, updateTaskStatus
- **Map**: flutter_map + OpenStreetMap tiles, color-coded markers per task type

### Task List (`features/task_list/`)
- **Re-uses**: Task entity & repository dari task_map
- **Cubit**: `TaskListCubit` — loadTasks, completeTask, escalateTask
- **UI**: Dismissible cards dengan swipe left (escalate/orange) dan swipe right (complete/green)

### Damage Report (`features/damage_report/`)
- **Entity**: `DamageReport` (id, taskId, reporterName, damageType, severity, lat, lng, description, reportedAt, photoPaths, isSynced)
- **Enums**: `DamageType` (leak, burst, corrosion, blockage, other), `DamageSeverity` (low, medium, high, critical)
- **Repo**: `MockDamageReportRepository` — save ke SharedPreferences, JSON serialization
- **Cubit**: `DamageReportCubit` — setDamageType, setSeverity, setDescription, setLocation, submitReport, validate
- **UI**: 4-step Stepper (Location → Damage Type → Details → Review)

### Profile (`features/profile/`)
- **Entity**: `OfficerProfile` (id, name, role, unit, tasksCompleted, tasksThisWeek, hoursInField, efficiencyScore, isOnDuty)
- **Cubit**: `ProfileCubit` — loadProfile, toggleDutyStatus
- **UI**: Profile header card, stats grid (3 cards), settings list, action buttons

### Home Shell (`features/home/`)
- **Pattern**: IndexedStack dengan BottomNavigationBar untuk state preservation
- **Tabs**: Tugas (TaskList), Peta (TaskMap), Sinkronisasi, Profil

---

## 7. Mock Data Strategy

- Semua repository adalah **mock** — tidak ada network call
- `Future.delayed()` untuk simulasi latency (300ms - 1s)
- Data dummy realistis: nama Indonesia, alamat Surabaya, format tanggal lokal
- Offline storage via `SharedPreferences` dengan JSON serialization

---

## 8. Haptic Feedback

- **Confirm/Submit**: `HapticFeedback.mediumImpact()`
- **Success**: `HapticFeedback.lightImpact()`
- **Error**: `HapticFeedback.heavyImpact()`
- **Navigation/Selection**: `HapticFeedback.selectionClick()`

---

## 9. Dark Mode

- `AppTheme.lightTheme` dan `AppTheme.darkTheme` sudah ada
- Aktif via `ThemeMode.system` (auto follow system)
- Gunakan `Theme.of(context)` — jangan hardcode warna

---

## 10. Build Commands

```bash
flutter pub get
flutter analyze       # Zero errors target
flutter test
flutter run
flutter build apk
```

---

## 11. Naming Conventions

| Tipe | Format | Contoh |
|------|--------|--------|
| File | `snake_case.dart` | `task_map_cubit.dart` |
| Class | `PascalCase` | `TaskMapCubit` |
| Variable | `camelCase` | `taskList` |
| Constant | `camelCase` | `primaryColor` |
| Enum | `PascalCase` / `camelCase` values | `TaskType.meterReading` |
| Route | `/kebab-case` | `/task-map` |

---

## 12. Decision Log

| Keputusan | Alasan |
|-----------|--------|
| `flutter_bloc` over `provider` | Lebih structured, scalable |
| `get_it` for DI | Service locator lebih simple |
| `go_router` | API lebih clean, declarative |
| `Result<T>` pattern | Explicit error handling, type safe |
| `flutter_map` + OSM | Free, no API key needed — dipilih daripada google_maps_flutter agar bisa dipakai tanpa setup API key |
| `SharedPreferences` for offline | Simple, no native setup required |
| `FailureResult` instead of `Error` | Avoid naming conflict with Dart core `Error` class |
