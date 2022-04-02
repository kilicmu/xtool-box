// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedFileResult _$UploadedFileResultFromJson(Map<String, dynamic> json) =>
    UploadedFileResult(
      json['md5'] as String,
      json['path'] as String,
      json['ext'] as String,
    );

Map<String, dynamic> _$UploadedFileResultToJson(UploadedFileResult instance) =>
    <String, dynamic>{
      'md5': instance.md5,
      'path': instance.path,
      'ext': instance.ext,
    };
