import 'package:flutter/material.dart';
import 'package:flutter_winter_dio/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}