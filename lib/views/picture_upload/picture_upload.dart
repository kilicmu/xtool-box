import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xtool_box/components/scroll_actions_bar/scroll_actions_bar.dart';
import 'package:xtool_box/dao/file_upload_result.dart';
import 'package:xtool_box/views/home/light_app_starter/index.dart';
import 'package:xtool_box/views/picture_upload/picture_upload_service.dart';
import 'package:xtool_box/views/picture_upload/upload-scope/upload_scope.dart';
import 'package:xtool_box/views/picture_upload/upload_result_info/upload_result_info.dart';

class PictureUploadWidget extends StatefulWidget {
  const PictureUploadWidget({Key? key}) : super(key: key);

  @override
  State<PictureUploadWidget> createState() => _PictureUploadWidgetState();
}

class _PictureUploadWidgetState extends State<PictureUploadWidget> {
  List<UploadedFileResult> list = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AppArguments;
    return Scaffold(
        body: PictureUploadService(
      records: list,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  snap: true,
                  leading: null,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                          padding: const EdgeInsets.all(10),
                          child: UploadScope(onFileSelected: (files) {
                            setState(() {
                              files ??= [];
                              list = [...files!, ...list];
                            });
                          }))),
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: ListView.builder(
              itemBuilder: (BuildContext context, int idx) {
                // return ScrollActionsBar(
                //     actions: [
                //       IconButton(
                //           onPressed: () => print("hello"),
                //           icon: const Icon(Icons.delete))
                //     ],
                //     mainWidget: UploadResultInfo(
                //       uploadedRecord: list[idx],
                //     ));
                return UploadResultInfo(
                  uploadedRecord: list[idx],
                );
              },
              itemCount: list.length)),
    ));
  }
}
