import 'package:zapp/src/features/home/data/models/news_item_model.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';
import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class NewsModel {
  final String status;
  final int total_hits;
  final int page;
  final int total_pages;
  final int page_size;
  final List<NewsItemModel> articles;

  NewsModel(
      {required this.status,
      required this.total_hits,
      required this.page,
      required this.total_pages,
      required this.page_size,
      required this.articles});
  factory NewsModel.fromJson(dynamic json) => _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  static NewsEntity toEntity(NewsModel model) {
    return NewsEntity(
        articles: model.articles.map((e) => NewsItemModel.toEntity(e)).toList(),
        page: model.page,
        page_size: model.page_size,
        status: model.status,
        total_hits: model.total_hits,
        total_pages: model.total_pages);
  }

  static NewsModel toModel(NewsEntity entity) {
    return NewsModel(
        articles: entity.articles.map((e) => NewsItemModel.toModel(e)).toList(),
        page: entity.page,
        page_size: entity.page_size,
        status: entity.status,
        total_hits: entity.total_hits,
        total_pages: entity.total_pages);
  }
}
