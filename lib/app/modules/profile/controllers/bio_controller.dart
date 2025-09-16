import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sentography/app/utils/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class BioController extends GetxController {
  final List<File> medias = <File>[].obs;

  void pickFile() async {
    HapticFeedback.mediumImpact();
    final im = await pickMedia();
    if (im == null) return;
    if (im.path.endsWith(".mp4")) {
      final compressedVideo = await VideoCompress.getFileThumbnail(
        im.path,
        quality: 100,
      );
      addMedia(compressedVideo);
    } else {
      addMedia(im);
    }
  }

  void addMedia(File media) {
    if (medias.length < 5) {
      medias.add(media);
    } else {
      Get.snackbar(
        "Error",
        "You can only upload 5 media",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void removeMedia(int index) {
    medias.removeAt(index);
  }
}
