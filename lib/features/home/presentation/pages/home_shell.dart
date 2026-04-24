import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../task_map/domain/repositories/task_repository.dart';
import '../../../task_map/presentation/pages/task_map_page.dart';
import '../../../task_list/presentation/pages/task_list_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../sync/presentation/pages/sync_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final _pages = const [
    TaskListPage(),
    TaskMapPage(),
    SyncPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: context.read<TaskRepository>(),
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: AppBottomNav(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
