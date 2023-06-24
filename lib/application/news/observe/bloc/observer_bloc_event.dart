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

class NewsUpdatedEvent extends ObserverEvent {
  final Either<NewsFailure, List<News>> failureOrNews;

  NewsUpdatedEvent({required this.failureOrNews});

  @override
  List<Object> get props => [failureOrNews];
}
