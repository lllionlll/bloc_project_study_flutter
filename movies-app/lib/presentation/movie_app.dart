import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/common/constants/routes_list.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/app_localizations.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/theme_mode/theme_mode_bloc.dart';
import 'package:movies_app/presentation/fade_page_route_builder.dart';
import 'package:movies_app/presentation/journeys/loading/loading_circle_widget.dart';
import 'package:movies_app/presentation/journeys/loading/loading_screen.dart';
import 'package:movies_app/presentation/routes.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;
  late LoadingBloc _loadingBloc;
  late ThemeModeBloc _themeModeBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance();
    _languageBloc.add(GetPreferredLanguageEvent());
    _loadingBloc = getItInstance();
    _themeModeBloc = getItInstance();
    _themeModeBloc.add(GetThemeModeEvent());
  }

  @override
  void dispose() {
    _languageBloc.close();
    _loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
        BlocProvider<LoadingBloc>.value(value: _loadingBloc),
        BlocProvider<ThemeModeBloc>.value(value: _themeModeBloc),
      ],
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (context, themeModeState) {
          if (themeModeState is ThemeModeLoadedState) {
            //print(themeModeState.themeMode);
            return BlocBuilder<LanguageBloc, LanguageState>(
                bloc: _languageBloc,
                builder: (context, langStatestate) {
                  if (langStatestate is LanguageLoadingState) {
                    return const Center(
                        child: LoadingCircleWidget(
                      size: 200,
                    ));
                  } else if (langStatestate is LanguageLoadedState) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      themeMode: themeModeState.themeMode,
                      theme: ThemeData(
                        primaryColor: Colors.white,
                        colorScheme: const ColorScheme.light().copyWith(
                          primary: Colors.white,
                          secondary: Appcolors.vulcan,
                          brightness: Brightness.light,
                        ),
                        scaffoldBackgroundColor: Colors.white,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        textTheme: ThemeText.getLightTextTheme(),
                        appBarTheme: const AppBarTheme(
                          elevation: 0,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      darkTheme: ThemeData(
                        primaryColor: Appcolors.vulcan,
                        colorScheme: const ColorScheme.light().copyWith(
                          primary: Appcolors.vulcan,
                          secondary: Colors.white,
                          brightness: Brightness.dark,
                        ),
                        scaffoldBackgroundColor: Appcolors.vulcan,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        textTheme: ThemeText.getDarkTextTheme(),
                        appBarTheme: const AppBarTheme(
                          elevation: 0,
                          backgroundColor: Appcolors.vulcan,
                        ),
                      ),

                      locale: langStatestate.locale,
                      supportedLocales: Languages.languages
                          .map<Locale>(
                            (language) => Locale(language.code),
                          )
                          .toList(),
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      builder: (context, child) {
                        return LoadingScreen(child: child!);
                      },
                      home: const HomeScreen(),
                      // initialRoute: RoutesList.initial,
                      // onGenerateRoute: (RouteSettings settings) {
                      //   final routes = Routes.getRoutes(settings);
                      //   final WidgetBuilder widgetBuilder = routes[settings.name]!;
                      //   return FadePageRouteBuilder(
                      //       widgetBuilder: widgetBuilder, setting: settings);
                      //   //final WidgetBuilder builder = routes[settings.name]?? ;     //TODO: handle null returned case(404 not Found)
                      // },
                    );
                  }
                  return const SizedBox.shrink();
                });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
