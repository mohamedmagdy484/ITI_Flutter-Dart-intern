import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/common_widgets/app_text_field.dart';
import 'package:flutter_winter_firebase/core/resources/app_button_styles.dart';
import 'package:flutter_winter_firebase/core/resources/app_text_styles.dart';
import 'package:flutter_winter_firebase/core/router/routes.dart';
import 'package:flutter_winter_firebase/core/utils/enums/snackbar_type.dart';
import 'package:flutter_winter_firebase/core/utils/extensions/context_extension.dart';
import 'package:flutter_winter_firebase/core/utils/validation_util.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/cubit/auth_cubit.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/cubit/auth_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            validator: (value) => ValidationUtil.validateUsername(value!),
            hint: 'username',
            controller: _usernameController,
          ),
          SizedBox(height: 30),
          AppTextField(
            validator: (value) => ValidationUtil.validatePassword(value!),
            controller: _passwordController,
            hint: 'password',
            type: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(height: 30),
          AppTextField(
            validator:
                (value) => ValidationUtil.validateConfirmPassword(
                  value!,
                  _passwordController.text,
                ),
            controller: _confirmPasswordController,
            hint: 'confirm password',
            type: TextInputType.visiblePassword,
            isPassword: true,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.pinkF8Color12Regular,
            ),
          ),
          SizedBox(height: 50),
          BlocConsumer<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                style: AppButtonStyles.primaryButtonStyle,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().register(
                      _usernameController.text,
                      _passwordController.text,
                    );
                  }
                },
                child: Text('Login', style: AppTextStyles.whiteColor16SemiBold),
              );
            },
            listenWhen:
                (previous, current) =>
                    current is AuthFailureState || current is AuthSuccessState,
            listener: (context, state) async {
              if (state is AuthSuccessState) {
                context.showSnackBar(
                  'Account created Successfully',
                  type: SnackBarType.success,
                );
                await Future.delayed(Duration(seconds: 2));
                if (!context.mounted) return;
                context.navigateReplacement(Routes.home);
              } else if (state is AuthFailureState) {
                context.showSnackBar(state.error, type: SnackBarType.error);
              }
            },
          ),
        ],
      ),
    );
  }
}
