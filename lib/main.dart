import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/constants/application_theme_manager.dart';
import 'package:todo_app/features/layout_view.dart';
import 'package:todo_app/features/settings_provider.dart';
import 'package:todo_app/features/splash/pages/splash_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: vm.currentTheme,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      locale: vm.changeLanguage(vm.currentLanguage),
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayoutView.routeName: (context) => const LayoutView(),
      },
    );
  }
}
