part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  handle({required Function(ThemeState) emit});

  @override
  List<Object> get props => [];
}

class GetCurrentThemeEvent extends ThemeEvent {
  @override
  handle({required Function(ThemeState) emit}) async {
    final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
    final theme = AppTheme.values.firstWhere((appTheme) => appTheme.index == themeIndex);
    emit(LoadedThemeState(themeData: appThemeData[theme]!));
  }
}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;

  const ThemeChangedEvent({required this.theme});

  @override
  List<Object> get props => [theme];

  @override
  handle({required Function(ThemeState) emit}) async {
    final themeIndex = theme.index;
    await ThemeCacheHelper().cacheThemeIndex(themeIndex);
    emit(LoadedThemeState(themeData: appThemeData[theme]!));
  }
}
