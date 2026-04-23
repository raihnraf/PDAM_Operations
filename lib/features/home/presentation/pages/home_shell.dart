import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../task_map/domain/repositories/task_repository.dart';
import '../../../task_map/presentation/pages/task_map_page.dart';
import '../../../task_list/presentation/pages/task_list_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

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
    _SyncPage(),
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

class _SyncPage extends StatelessWidget {
  const _SyncPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sinkronisasi Data')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_done_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Semua data tersinkronisasi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Tidak ada data yang menunggu sinkronisasi',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Sinkronisasi Sekarang',
              onPressed: () {},
              icon: Icons.sync,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
