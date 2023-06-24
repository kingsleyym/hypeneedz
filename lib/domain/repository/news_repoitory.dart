import 'package:dartz/dartz.dart';
import 'package:hypeneedz/core/failures/newsFailure.dart';

import '../Entitys/news.dart';

abstract class NewsRepository {
  Stream<Either<NewsFailure, List<News>>> watchAll();

  Future<Either<NewsFailure, Unit>> create(News news);

  Future<Either<NewsFailure, Unit>> update(News news);

  Future<Either<NewsFailure, Unit>> delete(News news);

  Future<Either<NewsFailure, Unit>> updateViews(News news);
}
