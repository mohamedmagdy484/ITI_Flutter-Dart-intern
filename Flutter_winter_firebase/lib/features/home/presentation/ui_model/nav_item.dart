import 'package:flutter/material.dart';

class NavItem {
  final String? label;
  final IconData icon;
  final Widget? route;

  NavItem({required this.route, this.label, required this.icon});
}
