import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/failures/storage_failures.dart';

abstract class StorageRepository {
  Future<Either<StorageFailure, String>> uploadNewsThumb({required File image});

  Future<Either<StorageFailure, List<String>>> uploadNewsImages(
      {required List<File> images});
}
