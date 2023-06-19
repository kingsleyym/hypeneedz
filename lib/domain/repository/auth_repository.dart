import 'package:dartz/dartz.dart';

import '../../core/failures/auth_failures.dart';
import '../Entitys/user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();

  Option<MyUser> getSignedInUser();
}
