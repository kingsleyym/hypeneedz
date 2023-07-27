import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../core/failures/user_failure.dart';
import '../../domain/Entitys/main_user.dart';

import '../../domain/repository/user_repository.dart';
import '../models/usermodel.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore;
  UserRepositoryImpl({
    required this.firestore,
  });

  @override
  Future<Either<UserFailure, MainUser>> getUserWithId(String userId) async {
    try {
      final doc = await firestore.collection("users").doc(userId).get();

      if (doc.exists) {
        return right<UserFailure, MainUser>(
            UserModel.fromDocument(doc).toDomain());
      }
    } on FirebaseException catch (e) {
      if (e.code.contains('PERMISSION_DENIED')) {
        return left(InsufficientPermisssons());
      } else {
        return left(UnexpectedFailure());
      }
    }
    {
      return left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<UserFailure, Unit>> update(MainUser user) async {
    try {
      final userDoc = firestore.collection("users");
      final userModel = UserModel.fromDomain(user);
      await userDoc.doc(user.id).update(userModel.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains('PERMISSION_DENIED')) {
        return left(InsufficientPermisssons());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Stream<Either<UserFailure, MainUser>> watchUser(String id) {
    // TODO: implement watchUser
    throw UnimplementedError();
  }
}
