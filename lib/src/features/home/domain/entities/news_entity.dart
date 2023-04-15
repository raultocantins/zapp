import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';

class NewsEntity {
  final String status;
  final int total_hits;
  final int page;
  final int total_pages;
  final int page_size;
  final List<NewsItem> articles;

  NewsEntity(
      {required this.status,
      required this.total_hits,
      required this.page,
      required this.total_pages,
      required this.page_size,
      required this.articles});
}
