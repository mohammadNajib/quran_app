import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/app_localizations.dart';
import 'core/localization/cubit/locale_cubit.dart';
import 'core/theme/bloc/theme_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()..getSavedLanguage()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                return MaterialApp(
                  locale: state.locale,
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  debugShowCheckedModeBanner: false,
                  home: Container(),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
