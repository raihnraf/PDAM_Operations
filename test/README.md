# Test Suite for PDAM Fields

This directory contains comprehensive tests for the PDAM Fields Flutter application.

## Test Structure

```
test/
├── core/
│   ├── errors/
│   │   └── failures_test.dart
│   ├── utils/
│   │   └── result_test.dart
│   └── widgets/
│       ├── app_button_test.dart
│       └── loading_indicator_test.dart
└── features/
    ├── damage_report/
    │   ├── domain/
    │   │   └── entities/
    │   │       └── damage_report_test.dart
    │   └── presentation/
    │       └── bloc/
    │           └── damage_report_cubit_test.dart
    └── task_list/
        └── presentation/
            └── bloc/
                └── task_list_cubit_test.dart
```

## Running Tests

Run all tests:
```bash
flutter test
```

Run tests with coverage:
```bash
flutter test --coverage
```

Run specific test file:
```bash
flutter test test/core/utils/result_test.dart
```

## Test Categories

### Unit Tests
- Entity tests (DamageReport, Task)
- Result/Failure tests
- Cubit/Bloc state tests

### Widget Tests
- AppButton widget
- LoadingIndicator widget

### Cubit Tests
- DamageReportCubit
- TaskListCubit

## Coverage Areas

| Feature | Coverage |
|---------|----------|
| Damage Report | Cubit, Entity |
| Task List | Cubit |
| Core Utils | Result, Failures |
| Core Widgets | AppButton, LoadingIndicator |
