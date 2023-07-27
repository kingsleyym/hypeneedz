import 'package:dartz/dartz.dart';

import '../../core/failures/user_failure.dart';
import '../Entitys/main_user.dart';

abstract class UserRepository {
  Stream<Either<UserFailure, MainUser>> watchUser(String id);
  Future<Either<UserFailure, MainUser>> getUserWithId(String userId);
  Future<Either<UserFailure, Unit>> update(MainUser user);
}
