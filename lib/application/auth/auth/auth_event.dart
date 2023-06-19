part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignOutPressEvent extends AuthEvent {}

class AuthCheckRequestedEvent extends AuthEvent {}
