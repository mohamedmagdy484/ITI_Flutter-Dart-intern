import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_cubit.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_state.dart';
import 'package:flutter_winter_firebase/features/home/presentation/widgets/profile_form.dart';
import 'package:flutter_winter_firebase/features/home/presentation/widgets/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [ProfileHeaderWidget(), ProfileForm()]),
      ),
    );
  }
}
