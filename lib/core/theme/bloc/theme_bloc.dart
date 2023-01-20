import '../../core_importer.dart';
import '../app_theme.dart';
import '../theme_cache_helper.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
        final theme = AppTheme.values.firstWhere((appTheme) => appTheme.index == themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[theme]!));
      } else if (event is ThemeChangedEvent) {
        final themeIndex = event.theme.index;
        await ThemeCacheHelper().cacheThemeIndex(themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[event.theme]!));
      }
    });
  }
}
