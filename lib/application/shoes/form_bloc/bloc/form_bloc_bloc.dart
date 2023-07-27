import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hypeneedz/domain/repository/auth_repository.dart';

import 'package:hypeneedz/domain/repository/storage_repository.dart';
import '../../../../core/errors/errors.dart';

import '../../../../core/failures/shoes_Failure.dart';
import '../../../../domain/Entitys/shoes.dart';

import '../../../../domain/repository/shoes_repoitory.dart';
import '../../../../injection.dart';

part 'form_bloc_event.dart';
part 'form_bloc_state.dart';

class ShoesFormBloc extends Bloc<ShoesFormEvent, ShoesFormState> {
  final ShoesRepository shoesRepository;
  final StorageRepository storageRepository;
  final AuthRepository authRepository;
  ShoesFormBloc({
    required this.authRepository,
    required this.shoesRepository,
    required this.storageRepository,
  }) : super(ShoesFormState.initial()) {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final userbool = userOption.getOrElse(() => throw NotAuthenticatedError());
    final brand = userbool.id.value;
    on<InitializeShoesForm>((event, emit) {
      if (event.shoes != null) {
        emit(state.copyWith(
          shoes: event.shoes,
          isEditing: true,
        ));
      } else {
        emit(state);
      }
    });

    on<ImagesChangedEvent>((event, emit) async {
      emit(state.copyWith(
        images: event.images,
      ));
    });

    on<SafePressedEvent>((event, emit) async {
      Either<ShoesFailure, Unit>? failureOrSuccess;
      emit(state.copyWith(
        isSaving: true,
        failureOrSuccessOption: none(),
      ));
      if (event.modell != null &&
          event.name != null &&
          event.desc != null &&
          event.brand != null &&
          event.sku != null &&
          event.releaseDate != null &&
          event.views != null) {
        Shoes editedShoes = state.shoes.copyWith(
          modell: event.modell,
          name: event.name,
          desc: event.desc,
          sku: event.sku,
          brand: brand,
          releaseDate: event.releaseDate,
          views: event.views,
        );
        // Upload thumbnail image

        // Upload images
        final imagesResult = await storageRepository.uploadNewsImages(
          images: event.images!,
        );
        imagesResult.fold(
          (failure) => print('Error uploading images: $failure'),
          (downloadUrl) {
            final imageUrls =
                downloadUrl; // Replace with the actual download URLs
            final updatedNews = editedShoes.copyWith(
                images:
                    imageUrls); // Create a copy of editedNews and set the image URLs
            editedShoes =
                updatedNews; // Update editedNews with the updated copy
            print('Images uploaded successfully');
          },
        );

        if (state.isEditing) {
          failureOrSuccess = await shoesRepository.update(editedShoes);
        } else {
          failureOrSuccess = await shoesRepository.create(editedShoes);
        }
      }

      emit(state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          failureOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}
