import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/resources/app_button_styles.dart';
import 'package:flutter_winter_firebase/core/router/routes.dart';
import 'package:flutter_winter_firebase/core/utils/enums/snackbar_type.dart';
import 'package:flutter_winter_firebase/core/utils/extensions/context_extension.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_cubit.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_state.dart';

class UpdateFormButton extends StatelessWidget {
  const UpdateFormButton({
    super.key,
    required this.formKey,
    required this.displayNController,
    required this.phoneController,
    required this.cityController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController displayNController;
  final TextEditingController phoneController;
  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ProfileCubit>().updateProfile(
                displayNController.text,
                phoneController.text,
                cityController.text,
              );
            }
          },
          style: AppButtonStyles.primaryButtonStyle,
          child: Text('Update Profile'),
        );
      },
      listenWhen:
          (previous, current) =>
              current is UserLogoutState ||
              current is ProfileErrorState ||
              current is ProfileUpdatedState,
      listener: (context, state) {
        if (state is UserLogoutState) {
          context.navigateReplacement(Routes.login);
        } else if (state is ProfileErrorState) {
          context.showSnackBar(
            'Something went wrong',
            type: SnackBarType.error,
          );
        } else if (state is ProfileUpdatedState) {
          context.showSnackBar('Profile updated', type: SnackBarType.success);
        }
      },
    );
  }
}
