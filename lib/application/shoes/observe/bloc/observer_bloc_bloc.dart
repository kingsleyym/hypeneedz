import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/failures/shoes_Failure.dart';

import '../../../../domain/Entitys/shoes.dart';
import '../../../../domain/repository/shoes_repoitory.dart';

part 'observer_bloc_event.dart';
part 'observer_bloc_state.dart';

class ShoesObserverBloc extends Bloc<ObserverEvent, ShoesObserverState> {
  final ShoesRepository shoesRepository;

  StreamSubscription<Either<ShoesFailure, List<Shoes>>>?
      _shoesStreamSubscription;

  ShoesObserverBloc({required this.shoesRepository})
      : super(ShoesObserverInitial()) {
    on<ObserverEvent>((event, emit) async {
      emit(ShoesObserverLoading());
      await _shoesStreamSubscription?.cancel();

      _shoesStreamSubscription = shoesRepository.watchAll().listen(
          (failureOrShoes) =>
              add(ShoesUpdatedEvent(failureOrShoes: failureOrShoes)));
    });

    on<ShoesUpdatedEvent>((event, emit) async {
      event.failureOrShoes.fold(
          (failures) => emit(ShoesObserverFailure(failures)),
          (shoes) => emit(ShoesObserverSucsses(shoes)));
    });
  }

  @override
  Future<void> close() async {
    _shoesStreamSubscription?.cancel();
    super.close();
  }
}
