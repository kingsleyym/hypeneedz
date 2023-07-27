part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, loaded, failure }

class ProfileState {
  final MainUser user;
  final bool currentUser;
  final ProfileStatus state;

  ProfileState({
    required this.currentUser,
    required this.user,
    required this.state,
  });

  factory ProfileState.initial() => ProfileState(
        user: MainUser.empty,
        currentUser: false,
        state: ProfileStatus.initial,
      );

  ProfileState copyWith({
    MainUser? user,
    bool? curentUser,
    ProfileStatus? state,
  }) {
    return ProfileState(
      user: user ?? this.user,
      currentUser: curentUser ?? currentUser,
      state: state ?? this.state,
    );
  }
}
