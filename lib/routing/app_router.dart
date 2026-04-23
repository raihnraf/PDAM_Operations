import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_shell.dart';
import '../../features/damage_report/presentation/pages/damage_report_page.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (_, __) => const HomeShell(),
    ),
    GoRoute(
      path: AppRoutes.damageReport,
      name: 'damageReport',
      builder: (_, state) {
        final taskId = state.uri.queryParameters['taskId'];
        return DamageReportPage(taskId: taskId);
      },
    ),
  ],
);
