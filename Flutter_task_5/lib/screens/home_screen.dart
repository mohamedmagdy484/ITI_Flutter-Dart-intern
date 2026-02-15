import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_field.dart';
import '../widgets/action_buttons.dart';
import '../widgets/category_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [

              const CustomAppBar(),
              const SizedBox(height: 20),


              const SearchField(),
              const SizedBox(height: 20),


              const SectionHeaderWithActions(),
              const SizedBox(height: 20),


              const CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}