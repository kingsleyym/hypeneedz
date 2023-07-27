import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hypeneedz/domain/repository/auth_repository.dart';

import 'package:hypeneedz/domain/repository/news_repoitory.dart';
import 'package:hypeneedz/domain/repository/storage_repository.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/failures/newsfailure.dart';
import '../../../../domain/Entitys/news.dart';
import '../../../../injection.dart';

part 'form_bloc_event.dart';
part 'form_bloc_state.dart';

class NewsFormBloc extends Bloc<NewsFormEvent, NewsFormState> {
  final NewsRepository newsRepository;
  final StorageRepository storageRepository;
  final AuthRepository authRepository;
  NewsFormBloc({
    required this.authRepository,
    required this.newsRepository,
    required this.storageRepository,
  }) : super(NewsFormState.initial()) {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final userbool = userOption.getOrElse(() => throw NotAuthenticatedError());
    final author = userbool.id.value;
    on<InitializeNewsForm>((event, emit) {
      if (event.news != null) {
        emit(state.copyWith(
          news: event.news,
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
    on<ThumbChangedEvent>((event, emit) async {
      emit(state.copyWith(thumb: event.thumb));
    });
    on<TitleChangedEvent>((event, emit) async {
      emit(state.copyWith(news: state.news.copyWith(title: event.title)));
    });

    on<SafePressedEvent>((event, emit) async {
      Either<NewsFailure, Unit>? failureOrSuccess;
      emit(state.copyWith(
        isSaving: true,
        failureOrSuccessOption: none(),
      ));
      if (event.title != null &&
          event.body != null &&
          event.desc != null &&
          event.author != null &&
          event.body2 != null &&
          event.shoeId != null &&
          event.views != null &&
          event.category != null) {
        News editedNews = state.news.copyWith(
          title: event.title,
          body: event.body,
          desc: event.desc,
          body2: event.body2,
          author: author,
          shoeId: event.shoeId,
          views: event.views,
          category: event.category,
        );
        // Upload thumbnail image
        final thumbResult = await storageRepository.uploadNewsThumb(
          image: event.thumb!,
        );
        thumbResult.fold(
          (failure) => print('Error uploading thumbnail: $failure'),
          (downloadUrl) {
            // Replace with the actual download URL
            final updatedNews = editedNews.copyWith(
                thumb:
                    downloadUrl); // Create a copy of editedNews and set the thumb URL
            editedNews = updatedNews; // Update editedNews with the updated copy
          },
        );

        // Upload images
        final imagesResult = await storageRepository.uploadNewsImages(
          images: event.images!,
        );
        imagesResult.fold(
          (failure) => print('Error uploading images: $failure'),
          (downloadUrl) {
            final imageUrls =
                downloadUrl; // Replace with the actual download URLs
            final updatedNews = editedNews.copyWith(
                images:
                    imageUrls); // Create a copy of editedNews and set the image URLs
            editedNews = updatedNews; // Update editedNews with the updated copy
          },
        );

        if (state.isEditing) {
          failureOrSuccess = await newsRepository.update(editedNews);
        } else {
          failureOrSuccess = await newsRepository.create(editedNews);
        }
      }

      emit(state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          failureOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}
