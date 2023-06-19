import 'package:hypeneedz/domain/Entitys/uuid.dart';

class MyUser {
  final UniqueID id;
  final String username;
  final String email;

  MyUser({
    required this.id,
    required this.username,
    required this.email,
  });
}
