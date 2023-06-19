import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'application/auth/SignUpFormBloc/sign_up_form_bloc.dart';
import 'application/auth/auth/auth_bloc.dart';
import 'domain/repository/auth_repository.dart';
import 'infrastructure/repository/auth_repository_imp.dart';

final sl = GetIt.I;

Future<void> init() async {
  //? ################ auth ##################
  //!state managment
  sl.registerFactory(() => SignUpFormBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(
        authRepository: sl(),
      ));

  //! rpose
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));

  //! extern

  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}
