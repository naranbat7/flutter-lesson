// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      circleImg: json['circleImg'] as String,
      coverImg: json['coverImg'] as String,
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coverImg': instance.coverImg,
      'name': instance.name,
      'circleImg': instance.circleImg,
    };
