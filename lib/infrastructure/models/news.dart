import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hypeneedz/domain/Entitys/uuid.dart';

import '../../domain/Entitys/news.dart';

class NewsModel extends Equatable {
  final String id;
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

  NewsModel(
      {required this.id,
      required this.title,
      required this.author,
      required this.thumb,
      required this.images,
      required this.desc,
      required this.body,
      required this.body2,
      required this.category,
      required this.shoeId,
      this.views});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'thumb': thumb,
      'images': images,
      'desc': desc,
      'body': body,
      'body2': body2,
      'category': category,
      'shoeId': shoeId,
      'views': views,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: "",
      title: map['title'],
      author: map['author'],
      thumb: map['thumb'],
      images: List<String>.from(map['images']),
      desc: map['desc'],
      body: map['body'],
      body2: map['body2'],
      category: map['category'],
      shoeId: map['shoeId'],
      views: map['views'],
    );
  }

  NewsModel copyWith({
    String? id,
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
    return NewsModel(
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

  factory NewsModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc, String id) {
    return NewsModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  factory NewsModel.fromSnapshot(DocumentSnapshot snapshot) {
    NewsModel newsModel = NewsModel(
      id: snapshot.id,
      title: snapshot['title'],
      author: snapshot['author'],
      thumb: snapshot['thumb'],
      images: List<String>.from(snapshot['images']),
      desc: snapshot['desc'],
      body: snapshot['body'],
      body2: snapshot['body2'],
      category: snapshot['category'],
      shoeId: snapshot['shoeId'],
      views: snapshot['views'],
    );
    return newsModel;
  }

  News toDomain() {
    return News(
      id: UniqueID.fromUniqueString(id),
      title: title,
      author: author,
      thumb: thumb,
      images: images,
      desc: desc,
      body: body,
      body2: body2,
      category: category,
      shoeId: shoeId,
      views: views,
    );
  }

  factory NewsModel.fromDomain(News newsItem) {
    return NewsModel(
      id: newsItem.id.value,
      title: newsItem.title,
      author: newsItem.author,
      thumb: newsItem.thumb,
      images: newsItem.images,
      desc: newsItem.desc,
      body: newsItem.body,
      body2: newsItem.body2,
      category: newsItem.category,
      shoeId: newsItem.shoeId,
      views: newsItem.views,
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
