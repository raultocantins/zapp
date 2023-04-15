import 'package:json_annotation/json_annotation.dart';
import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';

part 'news_item_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class NewsItemModel {
  final String title;
  final DateTime publish_date;
  final String? url;
  final String text;
  final String image;

  NewsItemModel({
    required this.title,
    required this.publish_date,
    this.url,
    required this.text,
    required this.image,
  });
  factory NewsItemModel.fromJson(dynamic json) => _$NewsItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemModelToJson(this);

  static NewsItem toEntity(NewsItemModel model) {
    return NewsItem(
      title: model.title,
      text: model.text,
      image: model.image,
      publish_date: model.publish_date,
      url: model.url,
    );
  }

  static NewsItemModel toModel(NewsItem entity) {
    return NewsItemModel(
      title: entity.title,
      image: entity.image,
      publish_date: entity.publish_date,
      url: entity.url,
      text: entity.text,
    );
  }
}
