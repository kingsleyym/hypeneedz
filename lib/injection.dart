import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hypeneedz/application/news/observe/bloc/observer_bloc_bloc.dart';
import 'package:hypeneedz/domain/repository/news_repoitory.dart';
import 'package:hypeneedz/infrastructure/repository/news_repoitory.dart';

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

//? ################ News ##################
  //!state managment
  sl.registerFactory(() => NewsObserverBloc(newsRepository: sl()));

  //! rpose
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(firestore: sl()));

  //! extern

  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}
