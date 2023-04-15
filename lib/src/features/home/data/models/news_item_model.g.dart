// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItemModel _$NewsItemModelFromJson(Map json) => NewsItemModel(
      title: json['title'] as String,
      publish_date: DateTime.parse(json['publish_date'] as String),
      url: json['url'] as String?,
      text: json['text'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$NewsItemModelToJson(NewsItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'publish_date': instance.publish_date.toIso8601String(),
      'url': instance.url,
      'text': instance.text,
      'image': instance.image,
    };
