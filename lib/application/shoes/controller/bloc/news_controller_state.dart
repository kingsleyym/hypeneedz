part of 'news_controller_bloc.dart';

@immutable
abstract class ShoesControllerState {}

class ControllerInitial extends ShoesControllerState {}

class ControllerInProgress extends ShoesControllerState {}

class ControllerSuccess extends ShoesControllerState {}

class ControllerFailure extends ShoesControllerState {
  final ShoesFailure shoesFailure;

  ControllerFailure({required this.shoesFailure});
}
