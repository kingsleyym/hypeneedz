part of 'form_bloc_bloc.dart';

@immutable
abstract class ShoesFormEvent extends Equatable {}

class InitializeShoesForm extends ShoesFormEvent {
  final Shoes? shoes;

  InitializeShoesForm({required this.shoes});

  @override
  List<Object> get props => [shoes!];
}

class ImagesChangedEvent extends ShoesFormEvent {
  final List<File> images;

  ImagesChangedEvent({required this.images});

  @override
  List<Object> get props => [images];
}

class TitleChangedEvent extends ShoesFormEvent {
  final String? modell;

  TitleChangedEvent({required this.modell});

  @override
  List<Object?> get props => [modell];
}

class SafePressedEvent extends ShoesFormEvent {
  final String? modell;
  final String? name;
  final String? desc;
  final String? brand;
  final String? sku;
  final String? releaseDate;

  final int? views;

  final List<File>? images;

  SafePressedEvent({
    required this.modell,
    required this.name,
    required this.desc,
    required this.brand,
    required this.sku,
    required this.releaseDate,
    required this.views,
    required this.images,
  });
  @override
  List<Object?> get props => [
        modell,
        name,
        desc,
        brand,
        sku,
        releaseDate,
        views,
        images,
      ];
}
