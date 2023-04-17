import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';

class NewsEntity {
  final int available;
  final int offset;
  final int number;
  final List<NewsItem> news;

  NewsEntity(
      {required this.available,
      required this.offset,
      required this.number,
      required this.news});
}
