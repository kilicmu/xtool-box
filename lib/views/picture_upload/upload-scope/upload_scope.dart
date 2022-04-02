import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:xtool_box/config/host.dart';
import 'package:xtool_box/dao/file_upload_result.dart';
import 'package:xtool_box/utils/fetch.dart';
import 'package:xtool_box/views/picture_upload/picture_upload_service.dart';

dynamic noop(dynamic arg) => {};

class UploadScope extends StatefulWidget {
  UploadScope({Key? key, this.onFileSelected = noop}) : super(key: key);
  Function(List<UploadedFileResult>? files) onFileSelected;

  @override
  State<UploadScope> createState() => _UploadScopeState();
}

class _UploadScopeState extends State<UploadScope> {
  Future<List<String>> _pickFile() async {
    final files =
        (await FilePicker.platform.pickFiles(allowMultiple: true))?.files ?? [];
    return files.where((i) => i.path != null).map((e) {
      return e.path!;
    }).toList();
  }

  Future<List<UploadedFileResult>> _uploadFile() async {
    final files = await _pickFile();

    final formData = FormData();
    for (var fp in files) {
      final f = MultipartFile.fromFileSync(fp);
      formData.files.add(MapEntry(f.filename!, f));
    }
    final resp = await fetcher.post("/upload",
        options: Options(contentType: "multipart/form-data"),
        data: formData, onSendProgress: (received, total) {
      if (total != -1) {
        print((received / total * 100).toStringAsFixed(0) + '%');
      }
    });
    print("==========");
    print(resp);
    List<UploadedFileResult> result = [];
    if (resp.statusCode == 200) {
      result = json
          .decode(resp.data)
          .map<UploadedFileResult>((item) => UploadedFileResult.fromJson(item))
          .toList();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final service = PictureUploadService.of(context);
    return ElevatedButton(
        onPressed: () async {
          final list = await _uploadFile();
          widget.onFileSelected(list);
        },
        child: const Icon(Icons.upload));
  }
}
