import 'package:json_annotation/json_annotation.dart';

part 'file_upload_result.g.dart';

@JsonSerializable()
class UploadedFileResult {
  UploadedFileResult(this.md5, this.path, this.ext);
  String md5;
  String path;
  String ext;

  factory UploadedFileResult.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileResultFromJson(json);

  Map<String, dynamic> toJson() => _$UploadedFileResultToJson(this);
}
