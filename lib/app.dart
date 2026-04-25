import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/constants/constants.dart';
import 'core/theme/app_theme.dart';
import 'routing/app_router.dart';
import 'injection_container.dart';
import 'features/task_map/domain/repositories/task_repository.dart';
import 'features/damage_report/domain/repositories/damage_report_repository.dart';

/// Global error handler that catches all uncaught errors
void _handleError(Object error, StackTrace stackTrace, {String? source}) {
  final errorSource = source ?? 'unknown';

  // Log error details for debugging
  debugPrint('❌ ERROR [$errorSource]: $error');
  debugPrint('📍 Stack trace:\n$stackTrace');

  // In production, send to crash reporting service (Firebase Crashlytics, Sentry, etc.)
  if (kReleaseMode) {
    // TODO: Send to crash reporting service
    // Example: FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: source);
  }
}

/// Sets up global error handling for the Flutter app
void _setupErrorHandling() {
  // 1. Capture Flutter framework errors (widget build errors, layout errors, etc.)
  FlutterError.onError = (FlutterErrorDetails details) {
    // Present the error to the user (shows red screen in debug mode)
    FlutterError.presentError(details);

    _handleError(
      details.exception,
      details.stack ?? StackTrace.current,
      source: 'flutter_framework',
    );
  };

  // 2. Capture errors from the Zone (async errors, Futures, Streams)
  PlatformDispatcher.instance.onError = (error, stack) {
    _handleError(error, stack, source: 'platform_dispatcher');
    return true; // Error was handled
  };
}

void main() {
  // Set up error handling BEFORE any async operations
  _setupErrorHandling();

  // Run app in a guarded zone to catch async errors
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      await initializeDateFormatting('id_ID', null);
      await initDependencies();
      runApp(const PdamFieldsApp());
    },
    (error, stackTrace) {
      _handleError(error, stackTrace, source: 'async_zone');
    },
  );
}

class PdamFieldsApp extends StatelessWidget {
  const PdamFieldsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TaskRepository>(create: (_) => sl()),
        RepositoryProvider<DamageReportRepository>(create: (_) => sl()),
      ],
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
        child: MaterialApp.router(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
