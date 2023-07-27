part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileLoadUser extends ProfileEvent {
  final String userId;
  ProfileLoadUser({required this.userId});
}

class LoadedProfile extends ProfileEvent {
  final MainUser user;
  LoadedProfile({required this.user});
}
