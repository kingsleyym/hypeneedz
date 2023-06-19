part of 'controller_bloc.dart';

abstract class ControllerState extends Equatable {
  const ControllerState();
  
  @override
  List<Object> get props => [];
}


class ControllerInitial extends ControllerState {}
class ControllerInProgress extends ControllerState {}
class ControllerSuccess extends ControllerState {}

