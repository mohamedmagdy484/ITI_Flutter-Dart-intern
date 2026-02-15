import 'package:flutter_winter_firebase/core/common_use_cases/create_user_profile_use_case.dart';
import 'package:flutter_winter_firebase/core/common_use_cases/get_current_user_use_case.dart';
import 'package:flutter_winter_firebase/core/services/firebase_auth_service.dart';
import 'package:flutter_winter_firebase/core/services/firebase_db_service.dart';
import 'package:flutter_winter_firebase/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:flutter_winter_firebase/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_winter_firebase/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_winter_firebase/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_winter_firebase/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter_winter_firebase/features/auth/presentantion/cubit/auth_cubit.dart';
import 'package:flutter_winter_firebase/features/home/data/data_source/profile_data_source.dart';
import 'package:flutter_winter_firebase/features/home/data/repository_impl/profile_repository_impl.dart';
import 'package:flutter_winter_firebase/features/home/domain/repository/profile_repository.dart';
import 'package:flutter_winter_firebase/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:flutter_winter_firebase/features/home/domain/use_cases/sign_out_use_case.dart';
import 'package:flutter_winter_firebase/features/home/domain/use_cases/update_profile_use_case.dart';
import 'package:flutter_winter_firebase/features/home/presentation/cubits/profile_cubit.dart';
import 'package:flutter_winter_firebase/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt sl = GetIt.instance;

void setupDependencies() {
  // final supBase = Supabase.instance.client;

  //services
  sl.registerLazySingleton<FirebaseAuthService>(
        () => FirebaseAuthService.authService,
  );
  sl.registerLazySingleton<FirebaseDbService>(() => FirebaseDbService.instance);

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl()));

  sl.registerLazySingleton<ProfileDataSource>(
        () => ProfileDataSource(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SignOutUSeCase>(() => SignOutUSeCase(sl()));
  sl.registerLazySingleton<UpdateProfileUseCase>(
        () => UpdateProfileUseCase(sl(), sl()),
  );
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl(), sl(), sl(), sl()));

  //common
  sl.registerFactory<SplashCubit>(() => SplashCubit(sl()));
  sl.registerLazySingleton<GetCurrentUserUseCase>(
        () => GetCurrentUserUseCase(sl()),
  );
  sl.registerLazySingleton<CreateUserProfileUseCase>(
        () => CreateUserProfileUseCase(sl(), sl()),
  );
  sl.registerLazySingleton<GetProfileUseCase>(
        () => GetProfileUseCase(sl(), sl()),
  );
}
