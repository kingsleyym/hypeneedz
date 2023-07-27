import 'package:bloc/bloc.dart';
import 'package:hypeneedz/domain/repository/user_repository.dart';

import '../../../core/errors/errors.dart';

import '../../../domain/Entitys/main_user.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../injection.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({
    required this.userRepository,
  }) : super(ProfileState.initial()) {
    on<ProfileLoadUser>((event, emit) async {
      final auser = await userRepository.getUserWithId(event.userId);

      auser.fold(
        (failure) => emit(state.copyWith(state: ProfileStatus.failure)),
        (user) => add(LoadedProfile(user: user)),
      );
    });

    on<LoadedProfile>((event, emit) async {
      final userOption = sl<AuthRepository>().getSignedInUser();
      final userbool =
          userOption.getOrElse(() => throw NotAuthenticatedError());
      final isCurrentUser = userbool.id.value == event.user.id;

      emit(state.copyWith(
        user: event.user,
        curentUser: isCurrentUser,
        state: ProfileStatus.loaded,
      ));
    });
  }
}
