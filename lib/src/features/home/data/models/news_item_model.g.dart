// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItemModel _$NewsItemModelFromJson(Map json) => NewsItemModel(
      title: json['title'] as String,
      author: json['author'] as String?,
      published_date: DateTime.parse(json['published_date'] as String),
      link: json['link'] as String?,
      clean_url: json['clean_url'] as String?,
      excerpt: json['excerpt'] as String,
      summary: json['summary'] as String,
      rights: json['rights'] as String?,
      media: json['media'] as String,
    );

Map<String, dynamic> _$NewsItemModelToJson(NewsItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'published_date': instance.published_date.toIso8601String(),
      'link': instance.link,
      'clean_url': instance.clean_url,
      'excerpt': instance.excerpt,
      'summary': instance.summary,
      'rights': instance.rights,
      'media': instance.media,
    };
