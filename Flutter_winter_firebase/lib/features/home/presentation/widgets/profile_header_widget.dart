import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/resources/app_text_styles.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_cubit.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, backgroundImage: NetworkImage('')),
          SizedBox(height: 10),
          Text('data'),
          SizedBox(height: 10),
          Text('data'),
          SizedBox(height: 20),
          TextButton(
            child: Text('Sign Out', style: AppTextStyles.pinkF8Color12Regular),
            onPressed: () => context.read<ProfileCubit>().signOut(),
          ),
        ],
      ),
    );
  }
}
