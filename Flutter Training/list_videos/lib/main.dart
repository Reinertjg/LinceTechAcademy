import 'package:flutter/material.dart';
import 'package:list_videos/pages/create_fevorite_page.dart';
import 'package:list_videos/pages/home_page.dart';
import 'package:list_videos/pages/settings_theme_page.dart';
import 'package:list_videos/services/create_favorite_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsThemeRepository()),
          ChangeNotifierProvider(create: (_) => CreateFavoriteRepository())
        ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsThemeRepository>(
      builder: (_, state, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (_) => Home(),
            '/settingsTheme': (_) => SettingsTheme(),
            '/create': (_) => CreateFavorite(),
          },
          theme: ThemeData(appBarTheme: AppBarTheme(color: state.getAppBar),
          scaffoldBackgroundColor: state.getBackground),
        );
      },
    );
  }
}

class SettingsThemeRepository with ChangeNotifier {
  SettingsThemeRepository() {
    _init();
  }

  Color? _colorAppBar;
  Color? _colorBackground;

  void incluirAppBar(Color cor) {
    _colorAppBar = cor;
    notifyListeners();
  }

  void incluirBackground(Color cor) {
    _colorBackground = cor;
    notifyListeners();
  }

  void _init() async {
    final prefs = await SharedPreferences.getInstance();
    final corAppBar = StringParaEnum(
      prefs.getString(Constants().appBarColorKey) ?? '',
    );
    final corBackgroud = StringParaEnum(
      prefs.getString(Constants().backgroundColorKey) ?? '',
    );
    _colorAppBar = EnumParaColor(corAppBar);
    _colorBackground = EnumParaColor(corBackgroud);
    notifyListeners();
  }

  get getAppBar => _colorAppBar;

  get getBackground => _colorBackground;
}
