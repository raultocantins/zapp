// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map json) => NewsModel(
      available: json['available'] as int,
      offset: json['offset'] as int,
      number: json['number'] as int,
      news: (json['news'] as List<dynamic>)
          .map((e) => NewsItemModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'available': instance.available,
      'offset': instance.offset,
      'number': instance.number,
      'news': instance.news.map((e) => e.toJson()).toList(),
    };
