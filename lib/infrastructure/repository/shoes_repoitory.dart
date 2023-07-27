import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../core/failures/shoes_Failure.dart';
import '../../domain/Entitys/shoes.dart';
import '../../domain/repository/shoes_repoitory.dart';
import '../models/shoes_model.dart';

class ShoesRepositoryImpl implements ShoesRepository {
  final FirebaseFirestore firestore;

  ShoesRepositoryImpl({required this.firestore});

  @override
  Stream<Either<ShoesFailure, List<Shoes>>> watchAll() async* {
    final shoesCollection = firestore.collection('shoes');

    yield* shoesCollection.snapshots().map((snapshot) {
      return right<ShoesFailure, List<Shoes>>(snapshot.docs
          .map((doc) => ShoesModel.fromFirestore(doc, doc.id).toDomain())
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
  Future<Either<ShoesFailure, Unit>> create(Shoes shoes) async {
    try {
      final shoesCollection = firestore.collection('shoes');
      final shoesModel = ShoesModel.fromDomain(shoes);

      shoesCollection.doc(shoesModel.id).set(shoesModel.toMap());
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
  Future<Either<ShoesFailure, Unit>> delete(Shoes shoes) async {
    try {
      final shoesCollection = firestore.collection('shoes');
      final shoesModel = ShoesModel.fromDomain(shoes);

      shoesCollection.doc(shoesModel.id).delete();
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
  Future<Either<ShoesFailure, Unit>> update(Shoes shoes) async {
    try {
      final shoesCollection = firestore.collection('shoes');
      final newsModel = ShoesModel.fromDomain(shoes);

      shoesCollection.doc(newsModel.id).update(newsModel.toMap());
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
  Future<Either<ShoesFailure, Unit>> updateViews(Shoes shoes) async {
    try {
      final shoesCollection = firestore.collection('shoes');
      final newsModel = ShoesModel.fromDomain(shoes);
      newsModel.views = (newsModel.views! + 1);
      shoesCollection.doc(newsModel.id).update({'views': newsModel.views});
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
