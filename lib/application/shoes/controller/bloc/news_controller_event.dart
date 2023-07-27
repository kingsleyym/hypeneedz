part of 'news_controller_bloc.dart';

@immutable
abstract class ShoesControllerEvent {}

class DeleteShoesEvent extends ShoesControllerEvent {
  final Shoes shoes;

  DeleteShoesEvent({required this.shoes});
}
