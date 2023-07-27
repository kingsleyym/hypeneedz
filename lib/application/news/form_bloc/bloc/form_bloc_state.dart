part of 'form_bloc_bloc.dart';

class NewsFormState {
  final News news;
  final bool showErrorMessages;
  final bool isSaving;
  final bool isEditing;
  final File? thumb;
  final List<File>? images;
  final Option<Either<NewsFailure, Unit>> failureOrSuccessOption;

  NewsFormState({
    required this.news,
    required this.showErrorMessages,
    required this.isSaving,
    required this.isEditing,
    required this.thumb,
    required this.images,
    required this.failureOrSuccessOption,
  });

  factory NewsFormState.initial() => NewsFormState(
        news: News.empty(),
        thumb: null,
        images: null,
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        failureOrSuccessOption: none(),
      );

  NewsFormState copyWith({
    News? news,
    bool? showErrorMessages,
    bool? isSaving,
    bool? isEditing,
    File? thumb,
    List<File>? images,
    Option<Either<NewsFailure, Unit>>? failureOrSuccessOption,
  }) {
    return NewsFormState(
      news: news ?? this.news,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isSaving: isSaving ?? this.isSaving,
      isEditing: isEditing ?? this.isEditing,
      thumb: thumb ?? this.thumb,
      images: images ?? this.images,
      failureOrSuccessOption:
          failureOrSuccessOption ?? this.failureOrSuccessOption,
    );
  }
}
