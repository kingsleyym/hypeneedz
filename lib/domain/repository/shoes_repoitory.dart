import 'package:dartz/dartz.dart';
import 'package:hypeneedz/domain/Entitys/shoes.dart';

import '../../core/failures/shoes_Failure.dart';

abstract class ShoesRepository {
  Stream<Either<ShoesFailure, List<Shoes>>> watchAll();

  Future<Either<ShoesFailure, Unit>> create(Shoes shoes);

  Future<Either<ShoesFailure, Unit>> update(Shoes shoes);

  Future<Either<ShoesFailure, Unit>> delete(Shoes shoes);

  Future<Either<ShoesFailure, Unit>> updateViews(Shoes shoes);
}
