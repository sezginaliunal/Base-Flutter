// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_place_holder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonPlaceHolder _$JsonPlaceHolderFromJson(Map<String, dynamic> json) =>
    JsonPlaceHolder(
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$JsonPlaceHolderToJson(JsonPlaceHolder instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
