import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../task_map/domain/repositories/task_repository.dart';
import '../../../task_map/presentation/pages/task_map_page.dart';
import '../../../task_list/presentation/pages/task_list_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../sync/presentation/pages/sync_page.dart';
import '../bloc/home_cubit.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  // NOTE (S8.5): IndexedStack keeps ALL tab pages alive in memory.
  // This preserves scroll position, BLoC state, and map state across tabs.
  // For 4 tabs this is fine (~15-20MB overhead). When tabs exceed 6 or
  // memory pressure increases, consider:
  // 1. PageView with keepAlive for active tabs only
  // 2. AutomaticKeepAliveClientMixin selectively
  // 3. Lazy-loading with state serialization on tab switch
  static const _pages = [
    TaskListPage(),
    TaskMapPage(),
    SyncPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.sizeOf(context).width >= AppBreakpoints.phone;

    return BlocProvider(
      create: (_) => HomeCubit(),
      child: RepositoryProvider.value(
        value: context.read<TaskRepository>(),
        child: Scaffold(
          body: BlocBuilder<HomeCubit, int>(
            builder: (context, currentIndex) {
              final stack = IndexedStack(index: currentIndex, children: _pages);
              return isLargeScreen
                  ? Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: AppBreakpoints.maxContentWidth(context),
                        ),
                        child: stack,
                      ),
                    )
                  : stack;
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeCubit, int>(
            builder: (context, currentIndex) => AppBottomNav(
              currentIndex: currentIndex,
              onTap: (index) => context.read<HomeCubit>().setTab(index),
            ),
          ),
        ),
      ),
    );
  }
}
