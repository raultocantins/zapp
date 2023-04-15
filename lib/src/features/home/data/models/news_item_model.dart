import 'package:json_annotation/json_annotation.dart';
import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';

part 'news_item_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class NewsItemModel {
  final String title;
  final String? author;
  final DateTime published_date;
  final String? link;
  final String? clean_url;
  final String excerpt;
  final String summary;
  final String? rights;
  final String media;

  NewsItemModel({
    required this.title,
    this.author,
    required this.published_date,
    this.link,
    this.clean_url,
    required this.excerpt,
    required this.summary,
    this.rights,
    required this.media,
  });
  factory NewsItemModel.fromJson(dynamic json) => _$NewsItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemModelToJson(this);

  static NewsItem toEntity(NewsItemModel model) {
    return NewsItem(
      excerpt: model.excerpt,
      media: model.media,
      published_date: model.published_date,
      summary: model.summary,
      title: model.title,
      link: model.link,
      clean_url: model.clean_url,
      rights: model.rights,
    );
  }

  static NewsItemModel toModel(NewsItem entity) {
    return NewsItemModel(
      excerpt: entity.excerpt,
      media: entity.media,
      published_date: entity.published_date,
      summary: entity.summary,
      title: entity.title,
      link: entity.link,
      clean_url: entity.clean_url,
      rights: entity.rights,
    );
  }
}
