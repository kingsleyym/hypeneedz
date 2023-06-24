import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hypeneedz/domain/Entitys/uuid.dart';

class News extends Equatable {
  final UniqueID id;
  final String title;
  final String author;
  final String thumb;
  final List<String> images;
  final String desc;
  final String body;
  final String body2;
  final String category;
  final String shoeId;
  int? views;

  News({
    required this.id,
    required this.title,
    required this.author,
    required this.thumb,
    required this.images,
    required this.desc,
    required this.body,
    required this.body2,
    required this.category,
    required this.shoeId,
    this.views,
  });

  factory News.empty() {
    return News(
      id: UniqueID(),
      title: '',
      author: '',
      thumb: '',
      images: [],
      desc: '',
      body: '',
      body2: '',
      category: '',
      shoeId: '',
      views: 0,
    );
  }

  News copyWith({
    UniqueID? id,
    String? title,
    String? author,
    String? thumb,
    List<String>? images,
    String? desc,
    String? body,
    String? body2,
    String? category,
    String? shoeId,
    int? views,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      thumb: thumb ?? this.thumb,
      images: images ?? this.images,
      desc: desc ?? this.desc,
      body: body ?? this.body,
      body2: body2 ?? this.body2,
      category: category ?? this.category,
      shoeId: shoeId ?? this.shoeId,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        thumb,
        images,
        desc,
        body,
        body2,
        category,
        shoeId,
        views,
      ];
}
