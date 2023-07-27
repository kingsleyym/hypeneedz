part of 'form_bloc_bloc.dart';

class ShoesFormState {
  final Shoes shoes;
  final bool showErrorMessages;
  final bool isSaving;
  final bool isEditing;

  final List<File>? images;
  final Option<Either<ShoesFailure, Unit>> failureOrSuccessOption;

  ShoesFormState({
    required this.shoes,
    required this.showErrorMessages,
    required this.isSaving,
    required this.isEditing,
    required this.images,
    required this.failureOrSuccessOption,
  });

  factory ShoesFormState.initial() => ShoesFormState(
        shoes: Shoes.empty(),
        images: null,
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        failureOrSuccessOption: none(),
      );

  ShoesFormState copyWith({
    Shoes? shoes,
    bool? showErrorMessages,
    bool? isSaving,
    bool? isEditing,
    List<File>? images,
    Option<Either<ShoesFailure, Unit>>? failureOrSuccessOption,
  }) {
    return ShoesFormState(
      shoes: shoes ?? this.shoes,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isSaving: isSaving ?? this.isSaving,
      isEditing: isEditing ?? this.isEditing,
      images: images ?? this.images,
      failureOrSuccessOption:
          failureOrSuccessOption ?? this.failureOrSuccessOption,
    );
  }
}
