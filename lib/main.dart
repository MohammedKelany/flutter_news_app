import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/api/dio_helper.dart';
import 'package:newsapp/shared/cache_shared.dart';
import 'package:newsapp/view/news_layout.dart';
import 'package:newsapp/view/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedData.init();
  runApp(MyApp(
    isDark: SharedData.getIsDark(key: "isDark"),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required isDark}) : super(key: key);
  bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: (SharedData.getIsDark(key: "isDark") == null ||
              SharedData.getIsDark(key: "isDark") == false)
          ? ThemeMode.light
          : ThemeMode.dark,
      home: const NewsLayout(),
    );
  }
}
