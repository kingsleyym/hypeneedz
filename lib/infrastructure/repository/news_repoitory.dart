import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hypeneedz/core/failures/newsfailure.dart';
import 'package:hypeneedz/domain/repository/news_repoitory.dart';

import '../../domain/Entitys/news.dart';
import '../models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  final FirebaseFirestore firestore;

  NewsRepositoryImpl({required this.firestore});

  @override
  Stream<Either<NewsFailure, List<News>>> watchAll() async* {
    final newsCollection = firestore.collection('news');

    yield* newsCollection.snapshots().map((snapshot) {
      return right<NewsFailure, List<News>>(snapshot.docs
          .map((doc) => NewsModel.fromFirestore(doc, doc.id).toDomain())
          .toList());
    }).handleError((e) {
      if (e is FirebaseException) {
        if (e.message!.contains('PERMISSION_DENIED')) {
          return left(InsufficientPermisssons());
        } else {
          return left(UnexpectedFailure());
        }
      } else {
        return left(UnexpectedFailure());
      }
    });
  }

  @override
  Future<Either<NewsFailure, Unit>> create(News news) async {
    try {
      final newsCollection = firestore.collection('news');
      final newsModel = NewsModel.fromDomain(news);

      newsCollection.doc(newsModel.id).set(newsModel.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return Future.value(left(InsufficientPermisssons()));
      } else {
        return Future.value(left(UnexpectedFailure()));
      }
    } catch (e) {
      return Future.value(left(UnexpectedFailure()));
    }
  }

  @override
  Future<Either<NewsFailure, Unit>> delete(News news) async {
    try {
      final newsCollection = firestore.collection('news');
      final newsModel = NewsModel.fromDomain(news);

      newsCollection.doc(newsModel.id).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return Future.value(left(InsufficientPermisssons()));
      } else {
        return Future.value(left(UnexpectedFailure()));
      }
    } catch (e) {
      return Future.value(left(UnexpectedFailure()));
    }
  }

  @override
  Future<Either<NewsFailure, Unit>> update(News news) async {
    try {
      final newsCollection = firestore.collection('news');
      final newsModel = NewsModel.fromDomain(news);

      newsCollection.doc(newsModel.id).update(newsModel.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return Future.value(left(InsufficientPermisssons()));
      } else {
        return Future.value(left(UnexpectedFailure()));
      }
    } catch (e) {
      return Future.value(left(UnexpectedFailure()));
    }
  }

  @override
  Future<Either<NewsFailure, Unit>> updateViews(News news) async {
    try {
      final newsCollection = firestore.collection('news');
      final newsModel = NewsModel.fromDomain(news);
      newsModel.views = (newsModel.views! + 1);
      newsCollection.doc(newsModel.id).update({'views': newsModel.views});
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return Future.value(left(InsufficientPermisssons()));
      } else {
        return Future.value(left(UnexpectedFailure()));
      }
    } catch (e) {
      return Future.value(left(UnexpectedFailure()));
    }
  }
}
