import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/settings_provider.dart';

class LayoutView extends StatelessWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return Scaffold(
      extendBody: true,
      body: vm.screens[vm.currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 34,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: vm.currentIndex,
          onTap: vm.changeIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: "Settings"),
          ],
        ),
      ),
    );
  }
}
