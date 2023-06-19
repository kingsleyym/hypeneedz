import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/Entitys/user.dart';
import '../../domain/Entitys/uuid.dart';

extension FirebaseUserMapper on User {
  MyUser toDomain() {
    return MyUser(
        id: UniqueID.fromUniqueString(uid), email: email!, username: '');
  }
}
