import '../../injection_container.dart';
import 'data/repositories/mock_damage_report_repository.dart';
import 'domain/repositories/damage_report_repository.dart';
import 'presentation/bloc/damage_report_cubit.dart';

void initDamageReport() {
  sl.registerLazySingleton<DamageReportRepository>(() => MockDamageReportRepository());
  sl.registerFactory<DamageReportCubit>(() => DamageReportCubit(sl()));
}
