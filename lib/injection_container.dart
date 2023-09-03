import 'package:get_it/get_it.dart';
import 'package:quran_app/features/mushaf_page/domain/use_cases/change_mushaf_page_use_case.dart';
import 'package:quran_app/features/mushaf_page/domain/use_cases/mushaf_page_use_cases.dart';
import 'package:quran_app/features/mushaf_page/presentation/bloc/mushaf_page_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/mushaf_page/data/data_sources/mushaf_page_local_data_source.dart';
import 'features/mushaf_page/data/repositories/mushaf_page_repository_implement.dart';
import 'features/mushaf_page/domain/repositories/mushaf_page_repository.dart';
import 'features/mushaf_page/domain/use_cases/get_page_number_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
// bloc
  sl.registerFactory(() => MushafPageBloc(mushafPageUseCases: sl()));

// useCases
  sl.registerLazySingleton(() => ChangeMushafPageUseCase(mushafPageRepository: sl()));
  sl.registerLazySingleton(() => GetPageNumberUseCase(mushafPageRepository: sl()));
  sl.registerLazySingleton(() => MushafPageUseCases(changeMushafPageUseCase: sl(), getPageNumberUseCase: sl()));

// repository
  sl.registerLazySingleton<MushafPageRepository>(() => MushafPageRepositoryImplement(mushafPageLocalDataSource: sl()));

// dataSources
  sl.registerLazySingleton<MushafPageLocalDataSource>(
      () => MushafPageLocalDataSourceImplement(sharedPreferences: sl()));

// libraries
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
