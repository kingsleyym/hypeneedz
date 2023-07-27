part of 'form_bloc_bloc.dart';

@immutable
abstract class NewsFormEvent extends Equatable {}

class InitializeNewsForm extends NewsFormEvent {
  final News? news;

  InitializeNewsForm({required this.news});

  @override
  List<Object> get props => [news!];
}

class ThumbChangedEvent extends NewsFormEvent {
  final File thumb;

  ThumbChangedEvent({required this.thumb});

  @override
  List<Object> get props => [thumb];
}

class ImagesChangedEvent extends NewsFormEvent {
  final List<File> images;

  ImagesChangedEvent({required this.images});

  @override
  List<Object> get props => [images];
}
class TitleChangedEvent extends NewsFormEvent {
  final String? title;

  TitleChangedEvent({required this.title});

  @override
  List<Object?> get props => [title];
}

class SafePressedEvent extends NewsFormEvent {
  final String? title;
  final String? author;
  final String? desc;
  final String? body;
  final String? body2;
  final String? category;
  final String? shoeId;
  final int? views;
  final File? thumb;
  final List<File>? images;

  SafePressedEvent({
    required this.title,
    required this.author,
    required this.desc,
    required this.body,
    required this.body2,
    required this.category,
    required this.shoeId,
    required this.views,
    required this.thumb,
    required this.images,
  });
  @override
  List<Object?> get props => [
        title,
        author,
        desc,
        body,
        body2,
        category,
        shoeId,
        views,
        thumb,
        images,
      ];
}
