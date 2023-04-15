import 'package:zapp/src/features/home/data/models/news_item_model.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';
import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class NewsModel {
  final int available;
  final int page;
  final int offset;
  final int number;
  final List<NewsItemModel> news;

  NewsModel(
      {required this.available,
      required this.page,
      required this.offset,
      required this.number,
      required this.news});
  factory NewsModel.fromJson(dynamic json) => _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  static NewsEntity toEntity(NewsModel model) {
    return NewsEntity(
        news: model.news.map((e) => NewsItemModel.toEntity(e)).toList(),
        page: model.page,
        available: model.available,
        number: model.number,
        offset: model.offset);
  }

  static NewsModel toModel(NewsEntity entity) {
    return NewsModel(
      news: entity.news.map((e) => NewsItemModel.toModel(e)).toList(),
      page: entity.page,
      available: entity.available,
      number: entity.number,
      offset: entity.offset,
    );
  }
}
