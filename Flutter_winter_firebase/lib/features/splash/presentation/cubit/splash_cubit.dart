import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_winter_firebase/core/common_state/screen_state.dart';
import 'package:flutter_winter_firebase/core/common_use_cases/get_current_user_use_case.dart';

class SplashCubit extends Cubit<ScreenState> {
  SplashCubit(this._currentUserUseCase) : super(ScreenState.splash);
  final GetCurrentUserUseCase _currentUserUseCase;

  Future<void> navigateToPage() async {
    await Future.delayed(Duration(seconds: 2));
    User? user = _currentUserUseCase();
    user == null ? emit(ScreenState.login) : emit(ScreenState.home);
  }
}
