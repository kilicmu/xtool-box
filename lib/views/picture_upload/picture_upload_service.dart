// import 'package:mobx/mobx.dart';

// part 'picture_upload_service.g.dart';

// class ImageRecord {
//   ImageRecord({required this.url});
//   String url;
// }

import 'package:flutter/material.dart';
import 'package:xtool_box/dao/file_upload_result.dart';

class PictureUploadService extends InheritedWidget {
  List<UploadedFileResult> uploadedPictureRecords = [];

  PictureUploadService(
      {Key? key, required Widget child, this.records = const []})
      : super(key: key, child: child);

  List<UploadedFileResult> records;

  static PictureUploadService? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PictureUploadService>();
  }

  @override
  bool updateShouldNotify(covariant PictureUploadService oldWidget) {
    if (oldWidget.records != records) {
      return true;
    }
    return false;
  }
}
