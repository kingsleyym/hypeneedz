part of 'observer_bloc_bloc.dart';

abstract class NewsObserverState extends Equatable {
  const NewsObserverState();

  @override
  List<Object> get props => [];
}

class NewsObserverInitial extends NewsObserverState {}

class NewsObserverLoading extends NewsObserverState {}

class NewsObserverSucsses extends NewsObserverState {
  final List<News> news;
  const NewsObserverSucsses(this.news);
  @override
  List<Object> get props => [news];
}

class NewsObserverFailure extends NewsObserverState {
  final NewsFailure newsFailure;
  const NewsObserverFailure(this.newsFailure);
  @override
  List<Object> get props => [newsFailure];
}
