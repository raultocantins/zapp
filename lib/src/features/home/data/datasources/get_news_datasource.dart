import 'package:zapp/src/features/home/data/models/news_model.dart';

abstract class GetNewsDatasource {
  Future<NewsModel> call({String? tag});
}