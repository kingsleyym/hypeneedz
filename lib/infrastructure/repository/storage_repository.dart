import 'package:hypeneedz/core/failures/storage_failures.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:hypeneedz/domain/repository/storage_repository.dart';
import 'package:uuid/uuid.dart';

class StorageRepositoryImpl implements StorageRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> _uploadImage(
      {required File image, required String ref}) async {
    final downloadUrl = await _firebaseStorage
        .ref(ref)
        .putFile(image)
        .then((value) => value.ref.getDownloadURL());
    return downloadUrl;
  }

  Future<List<String>> _uploadImages(
      {required List<File> images, required String ref}) async {
    final downloadUrls = <String>[];
    for (final image in images) {
      final downloadUrl = await _firebaseStorage
          .ref(ref)
          .putFile(image)
          .then((value) => value.ref.getDownloadURL());
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  }

  @override
  Future<Either<StorageFailure, String>> uploadNewsThumb(
      {required File image}) async {
    try {
      final imageId = const Uuid().v4();
      final downloadUrl = await _uploadImage(
          image: image, ref: 'image/news/thumb/$imageId.jpg');

      return right(downloadUrl);
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
  Future<Either<StorageFailure, List<String>>> uploadNewsImages(
      {required List<File> images}) async {
    try {
      final imageId = const Uuid().v4();
      final downloadUrl = await _uploadImages(
          images: images, ref: 'image/news/images/$imageId.jpg');
      return right(downloadUrl);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return Future.value(left(InsufficientPermisssons()));
      } else {
        return Future.value(left(UnexpectedFailure()));
      }
    }
  }
}
