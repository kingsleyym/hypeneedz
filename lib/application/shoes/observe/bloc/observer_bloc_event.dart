part of 'observer_bloc_bloc.dart';

@immutable
abstract class ObserverEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ObserveAll extends ObserverEvent {
  @override
  List<Object> get props => [];
}

class ShoesUpdatedEvent extends ObserverEvent {
  final Either<ShoesFailure, List<Shoes>> failureOrShoes;

  ShoesUpdatedEvent({required this.failureOrShoes});

  @override
  List<Object> get props => [failureOrShoes];
}
