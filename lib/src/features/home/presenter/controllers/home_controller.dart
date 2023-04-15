import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';
import 'package:zapp/src/features/home/domain/entities/tags_entity.dart';
import 'package:zapp/src/features/home/domain/usecases/get_news_usecase.dart';

import '../../domain/entities/tag_entity.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetNews getNews;
  _HomeControllerBase({required this.getNews});

//IS LOADING
  @observable
  bool isLoading = false;

  @observable
  NewsEntity? news;

  @observable
  TagsEntity tags = TagsEntity([
    TagEntity("sport"),
    TagEntity("guerra"),
    TagEntity("sport"),
    TagEntity("guerra"),
    TagEntity("sport"),
    TagEntity("guerra")
  ]);

//CHANGE LOADING
  @action
  changeIsLoading(bool value) {
    isLoading = value;
  }

  //CHANGE NEWS
  @action
  changeNews(NewsEntity value) {
    news = value;
  }

  fetchNews({TagEntity? tag}) async {
    changeIsLoading(true);
    final result = await getNews(tag: tag?.label ?? tags.tags[0].label);
    result.fold((l) => null, (r) => changeNews(r));
    changeIsLoading(false);
  }

  moreInfoRedirect(String link) {
    launchUrl(Uri.parse(link));
  }

  @action
  dispose() {
    isLoading = false;
  }
}
