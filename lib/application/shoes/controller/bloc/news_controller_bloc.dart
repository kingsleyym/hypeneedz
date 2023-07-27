import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import '../../../../core/failures/shoes_Failure.dart';
import '../../../../domain/Entitys/shoes.dart';
import '../../../../domain/repository/shoes_repoitory.dart';

part 'news_controller_event.dart';
part 'news_controller_state.dart';

class ControllerBloc extends Bloc<ShoesControllerEvent, ShoesControllerState> {
  final ShoesRepository shoesRepository;

  ControllerBloc({required this.shoesRepository}) : super(ControllerInitial()) {
    on<DeleteShoesEvent>((event, emit) async {
      emit(ControllerInProgress());
      final failureOrSuccess = await shoesRepository.delete(event.shoes);
      failureOrSuccess.fold(
          (failure) => emit(ControllerFailure(shoesFailure: failure)),
          (r) => emit(ControllerSuccess()));
    });
  }
}
