import 'package:flutter/material.dart';
import 'package:todo_app/features/settings/pages/settings_view.dart';
import 'package:todo_app/features/tasks/pages/tasks_view.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = "en";
  int currentIndex = 0;
  List<Widget> screens = [
    const TasksView(),
    SettingsView(),
  ];

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;

    notifyListeners();
  }

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
