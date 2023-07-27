import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static Future<CroppedFile?> pickImageFromGallery({
    required BuildContext context,
    required CropStyle cropStyle,
    required String title,
  }) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageCropper = ImageCropper();
      final croppedFile = await imageCropper.cropImage(
        sourcePath: pickedFile.path,
        cropStyle: cropStyle,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: title,
            // ignore: use_build_context_synchronously
            toolbarColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(),
        ],
        compressQuality: 70, // to save the space in Database
      );
      return croppedFile;
    }
    return null;
  }

  static Future<List<CroppedFile>?> pickImagesFromGallery({
    required BuildContext context,
    required CropStyle cropStyle,
    required String title,
    required Color color,
  }) async {
    final List<XFile> pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      final List<CroppedFile> croppedFiles = [];
      final imageCropper = ImageCropper();

      for (var pickedFile in pickedFiles) {
        final croppedFile = await imageCropper.cropImage(
          sourcePath: pickedFile.path,
          cropStyle: cropStyle,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: title,
              toolbarColor: color,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
            IOSUiSettings(),
          ],
          compressQuality: 70, // to save space in the database
        );

        if (croppedFile != null) {
          croppedFiles.add(croppedFile);
        }
      }

      if (croppedFiles.isNotEmpty) {
        return croppedFiles;
      }
    }

    return null;
  }
}
