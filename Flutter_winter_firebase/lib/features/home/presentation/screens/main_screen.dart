import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/core/constants/app_ui_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          AppUiConstants.bottomNavItems[_selectedIndex].route ??
          const SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap:
            (value) => setState(() {
              _selectedIndex = value;
            }),
        currentIndex: _selectedIndex,
        items:
            AppUiConstants.bottomNavItems
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label,
                  ),
                )
                .toList(),
      ),
    );
  }
}
