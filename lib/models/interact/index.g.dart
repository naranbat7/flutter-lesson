// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InteractModel _$InteractModelFromJson(Map<String, dynamic> json) =>
    InteractModel(
      like: json['like'] as int,
      friends:
          (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
      angry: json['angry'] as int,
      care: json['care'] as int,
      comments: json['comments'] as int,
      haha: json['haha'] as int,
      love: json['love'] as int,
      sad: json['sad'] as int,
      shares: json['shares'] as int,
      wow: json['wow'] as int,
    );

Map<String, dynamic> _$InteractModelToJson(InteractModel instance) =>
    <String, dynamic>{
      'like': instance.like,
      'love': instance.love,
      'haha': instance.haha,
      'care': instance.care,
      'wow': instance.wow,
      'angry': instance.angry,
      'sad': instance.sad,
      'comments': instance.comments,
      'shares': instance.shares,
      'friends': instance.friends,
    };
