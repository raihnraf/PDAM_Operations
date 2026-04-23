import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/task_map/presentation/pages/task_map_page.dart';
import '../features/task_list/presentation/pages/task_list_page.dart';
import '../features/damage_report/presentation/pages/damage_report_page.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.taskMap,
  routes: [
    GoRoute(
      path: AppRoutes.taskMap,
      name: 'taskMap',
      builder: (_, __) => const TaskMapPage(),
    ),
    GoRoute(
      path: AppRoutes.taskList,
      name: 'taskList',
      builder: (_, __) => const TaskListPage(),
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
