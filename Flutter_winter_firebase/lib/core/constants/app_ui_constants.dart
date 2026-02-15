import 'package:flutter/material.dart';
import 'package:flutter_winter_firebase/features/chat/presentation/screens/chat_screen.dart';
import 'package:flutter_winter_firebase/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_winter_firebase/features/home/presentation/screens/notifications_screen.dart';
import 'package:flutter_winter_firebase/features/home/presentation/screens/profile_screen.dart';
import 'package:flutter_winter_firebase/features/home/presentation/ui_model/nav_item.dart';

class AppUiConstants {
  AppUiConstants._();

  static final List<NavItem> bottomNavItems = [
    NavItem(icon: Icons.home, label: 'Home', route: HomeScreen()),
    NavItem(icon: Icons.chat, label: 'Chat', route: ChatScreen()),
    NavItem(
      icon: Icons.notifications,
      label: 'Notifications',
      route: NotificationsScreen(),
    ),
    NavItem(icon: Icons.person, label: 'Profile', route: ProfileScreen()),
  ];
}
