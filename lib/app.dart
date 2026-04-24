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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDateFormatting('id_ID', null);
  await initDependencies();
  runApp(const PdamFieldsApp());
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
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}
