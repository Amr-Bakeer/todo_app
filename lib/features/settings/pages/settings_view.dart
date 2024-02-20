import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings_provider.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final List<String> languagesList = [
    "English",
    "Arabic",
  ];

  final List<String> themeMode = [
    "Dark",
    "Light",
  ];

  @override
  Widget build(BuildContext context) {
    // var lang = AppLocalizations.of(context)!;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: mediaQuery.width,
          height: mediaQuery.height * 0.22,
          color: theme.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 80,
          ),
          child: Text(
            "Settings",
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Language",
                style: TextStyle(
                  color: vm.isDark() ? Colors.white : Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdown<String>(
                items: languagesList,
                initialItem: "English",
                onChanged: (value) {
                  if (value == "English") {
                    vm.changeLanguage("en");
                  } else if (value == "Arabic") {
                    vm.changeLanguage("ar");
                  }
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Theme",
                style: TextStyle(
                  color: vm.isDark() ? Colors.white : Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropdown<String>(
                items: themeMode,
                initialItem: vm.isDark() ? "Dark" : "Light",
                onChanged: (value) {
                  if (value == "Dark") {
                    vm.changeTheme(ThemeMode.dark);
                  } else if (value == "Light") {
                    vm.changeTheme(ThemeMode.light);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
