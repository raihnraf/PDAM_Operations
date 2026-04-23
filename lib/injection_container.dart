import 'package:get_it/get_it.dart';
import 'features/task_map/task_map_injection.dart' as task_map;
import 'features/task_list/task_list_injection.dart' as task_list;
import 'features/damage_report/damage_report_injection.dart' as damage_report;

final sl = GetIt.instance;

Future<void> initDependencies() async {
  task_map.initTaskMap();
  task_list.initTaskList();
  damage_report.initDamageReport();
}
