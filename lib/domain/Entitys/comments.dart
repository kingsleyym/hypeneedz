import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'package:hypeneedz/infrastructure/models/usermodel.dart';

class Comments extends Equatable {
  final Uuid id;
  final UserModel user;
  final String comment;
  final DateTime date;
  final int likes;
  final String newsId;

  const Comments({
    required this.id,
    required this.user,
    required this.comment,
    required this.date,
    required this.likes,
    required this.newsId,
  });

  @override
  List<Object> get props {
    return [
      id,
      user,
      comment,
      date,
      likes,
      newsId,
    ];
  }

  Comments copyWith({
    Uuid? id,
    UserModel? user,
    String? comment,
    DateTime? date,
    int? likes,
    String? newsId,
  }) {
    return Comments(
      id: id ?? this.id,
      user: user ?? this.user,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      likes: likes ?? this.likes,
      newsId: newsId ?? this.newsId,
    );
  }
}
