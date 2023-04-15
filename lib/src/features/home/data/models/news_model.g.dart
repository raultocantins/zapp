// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map json) => NewsModel(
      status: json['status'] as String,
      total_hits: json['total_hits'] as int,
      page: json['page'] as int,
      total_pages: json['total_pages'] as int,
      page_size: json['page_size'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsItemModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'status': instance.status,
      'total_hits': instance.total_hits,
      'page': instance.page,
      'total_pages': instance.total_pages,
      'page_size': instance.page_size,
      'articles': instance.articles.map((e) => e.toJson()).toList(),
    };
