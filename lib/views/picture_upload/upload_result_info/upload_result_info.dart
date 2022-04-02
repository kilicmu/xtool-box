import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xtool_box/dao/file_upload_result.dart';

class UploadResultInfo extends StatelessWidget {
  UploadResultInfo({Key? key, this.uploadedRecord}) : super(key: key);

  UploadedFileResult? uploadedRecord;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 8),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Flex(direction: Axis.horizontal, children: [
            Expanded(
              child: Container(
                  height: 60,
                  child: Image.network(
                    uploadedRecord?.path ?? "",
                    fit: BoxFit.cover,
                    width: 60.0,
                  )),
              flex: 2,
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ResultInformation(uploadedRecord: uploadedRecord),
                ),
                flex: 9),
            Expanded(
                child: IconButton(
                    iconSize: 16,
                    onPressed: () async {
                      await Clipboard.setData(
                          ClipboardData(text: uploadedRecord?.path ?? ""));
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("复制成功"),
                              actions: [
                                TextButton(
                                    child: const Text("知道了"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.copy)))
          ]),
        ));
  }
}

class ResultInformation extends StatelessWidget {
  ResultInformation({Key? key, this.uploadedRecord}) : super(key: key);
  UploadedFileResult? uploadedRecord;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const Text("文件名：",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Text(
                      uploadedRecord?.md5 ?? "未知文件名",
                      overflow: TextOverflow.ellipsis,
                    )
                  ])),
              const Text(
                "链接：",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(uploadedRecord?.path ?? "未知链接"))
            ]));
  }
}
