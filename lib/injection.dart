import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hypeneedz/application/news/observe/bloc/observer_bloc_bloc.dart';
import 'package:hypeneedz/application/profile/bloc/profile_bloc.dart';
import 'package:hypeneedz/application/shoes/controller/bloc/news_controller_bloc.dart';
import 'package:hypeneedz/domain/repository/news_repoitory.dart';
import 'package:hypeneedz/domain/repository/storage_repository.dart';
import 'package:hypeneedz/infrastructure/repository/news_repoitory.dart';

import 'application/auth/SignUpFormBloc/sign_up_form_bloc.dart';
import 'application/auth/auth/auth_bloc.dart';
import 'application/news/form_bloc/bloc/form_bloc_bloc.dart';
import 'application/shoes/form_bloc/bloc/form_bloc_bloc.dart';
import 'application/shoes/observe/bloc/observer_bloc_bloc.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/repository/shoes_repoitory.dart';
import 'domain/repository/user_repository.dart';
import 'infrastructure/repository/auth_repository_imp.dart';
import 'infrastructure/repository/shoes_repoitory.dart';
import 'infrastructure/repository/storage_repository.dart';
import 'infrastructure/repository/user_repository.dart';

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
  sl.registerFactory(() => NewsFormBloc(
      newsRepository: sl(), storageRepository: sl(), authRepository: sl()));

  //! rpose
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(firestore: sl()));

  sl.registerLazySingleton<StorageRepository>(() => StorageRepositoryImpl());

  //! extern

  sl.registerFactory(() => ProfileBloc(userRepository: sl()));
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(firestore: sl()));

  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);

  //? ################ SHoes ##################
  //!state managment
  sl.registerFactory(() => ShoesObserverBloc(shoesRepository: sl()));
  sl.registerFactory(() => ShoesFormBloc(
      shoesRepository: sl(), storageRepository: sl(), authRepository: sl()));

  sl.registerFactory(() => ControllerBloc(shoesRepository: sl()));

  //! rpose
  sl.registerLazySingleton<ShoesRepository>(
      () => ShoesRepositoryImpl(firestore: sl()));
}
