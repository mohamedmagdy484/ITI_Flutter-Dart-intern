import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/common_widgets/app_text_field.dart';
import 'package:flutter_winter_firebase/core/utils/validation_util.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_cubit.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_state.dart';
import 'package:flutter_winter_firebase/features/home/presentation/widgets/update_form_button.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayNController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  bool isFilled = false;

  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  void dispose() {
    _displayNController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocListener<ProfileCubit, ProfileState>(
        listenWhen:
            (previous, current) => current is ProfileLoadedState && !isFilled,
        listener: (context, state) {
          if (state is ProfileLoadedState) {
            _displayNController.text = state.appUserEntity.displayName;
            _phoneController.text = state.appUserEntity.phone;
            _cityController.text = state.appUserEntity.city;
            isFilled = true;
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                hint: 'Display Name',
                controller: _displayNController,
                validator: (value) => ValidationUtil.validateUsername(value!),
              ),
              SizedBox(height: 10),
              AppTextField(
                hint: 'Phone',
                controller: _phoneController,
                validator: (value) => ValidationUtil.validateUsername(value!),
              ),
              SizedBox(height: 10),
              AppTextField(
                hint: 'City',
                controller: _cityController,
                validator: (value) => ValidationUtil.validateUsername(value!),
              ),
              SizedBox(height: 30),
              UpdateFormButton(
                formKey: _formKey,
                displayNController: _displayNController,
                cityController: _cityController,
                phoneController: _phoneController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
