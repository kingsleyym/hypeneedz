import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hypeneedz/domain/repository/news_repoitory.dart';

import '../../../../core/failures/newsFailure.dart';
import '../../../../domain/Entitys/news.dart';

part 'observer_bloc_event.dart';
part 'observer_bloc_state.dart';

class NewsObserverBloc extends Bloc<ObserverEvent, NewsObserverState> {
  final NewsRepository newsRepository;

  StreamSubscription<Either<NewsFailure, List<News>>>? _newsStreamSubscription;

  NewsObserverBloc({required this.newsRepository})
      : super(NewsObserverInitial()) {
    on<ObserverEvent>((event, emit) async {
      emit(NewsObserverLoading());
      await _newsStreamSubscription?.cancel();

      _newsStreamSubscription = newsRepository.watchAll().listen(
          (failureOrNews) =>
              add(NewsUpdatedEvent(failureOrNews: failureOrNews)));
    });

    on<NewsUpdatedEvent>((event, emit) async {
      event.failureOrNews.fold(
          (failures) => emit(NewsObserverFailure(failures)),
          (news) => emit(NewsObserverSucsses(news)));
    });
  }

  @override
  Future<void> close() async {
    _newsStreamSubscription?.cancel();
    super.close();
  }
}
