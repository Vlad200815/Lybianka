import 'dart:developer';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  ImageHelper({ImagePicker? imagePicker, ImageCropper? imageCropper})
    : _imagePicker = imagePicker ?? ImagePicker(),
      _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    final file = await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    if (file != null) {
      saveImage(file);
    }
    return file;
  }

  Future<CroppedFile?> crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.circle,
  }) async => await _imageCropper.cropImage(
    sourcePath: file.path,
    compressQuality: 100,
    uiSettings: [IOSUiSettings(), AndroidUiSettings()],
  );

  void saveImage(XFile img) async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    File convertedImg = File(img.path);
    final String fileName = "the_image.jpg";
    final File localImage = await convertedImg.copy("$path/$fileName");
    log(
      "Saved image under: $path/$fileName -Local image path- ${localImage.path}",
    );
  }
}
