import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapp/src/features/home/domain/entities/news_entity.dart';
import 'package:zapp/src/features/home/domain/entities/news_item_entity.dart';
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

  int pageSize = 10;

  int page = 1;

  @observable
  NewsEntity? news;

  @observable
  LanguagesEnum language = LanguagesEnum.PT;

  @observable
  TagsEntity? tags;

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

  //CHANGE LANGUAGE
  @action
  changeLanguage(LanguagesEnum value) {
    changeTags(Tags().getTags(value));
    language = value;
  }

  //CHANGE PAGE
  @action
  changePage(int value) {
    page = value;
  }

  //CHANGE TAGS
  @action
  changeTags(TagsEntity value) {
    tags = value;
  }

  fetchNews({TagEntity? tag}) async {
    changeIsLoading(true);
    final result = await getNews(
        tag: tag?.label ?? "",
        page: page,
        pageSize: pageSize,
        language: language.getLabel());
    result.fold((l) => null, (r) {
      if (tags?.tags.isEmpty ?? false) {
        changeNews(r);
      } else {
        List<NewsItem> newsData = (news?.news ?? []);
        newsData.addAll(r.news);
        changeNews(
          NewsEntity(
            available: r.available,
            number: r.number,
            offset: r.offset,
            news: newsData,
          ),
        );
      }

      nextPagination(r);
    });
    changeIsLoading(false);
  }

  clearAndFetch({TagEntity? tag}) async {
    changeIsLoading(true);
    final result = await getNews(
        tag: tag?.label ?? "",
        page: page,
        pageSize: pageSize,
        language: language.getLabel());
    result.fold((l) => null, (r) {
      changeNews(r);
      nextPagination(r);
    });
    changeIsLoading(false);
  }

  moreInfoRedirect(String link) {
    launchUrl(Uri.parse(link));
  }

  nextPagination(NewsEntity newsEntity) {
    if (newsEntity.available > (tags?.tags.length ?? 0) &&
        newsEntity.offset <= newsEntity.available) {
      page++;
    }
  }

  @action
  dispose() {
    isLoading = false;
    news = null;
    page = 1;
  }
}

enum LanguagesEnum { PT, EN }

extension LanguagesToString on LanguagesEnum {
  String getLabel() {
    switch (this) {
      case LanguagesEnum.PT:
        return "pt";
      case LanguagesEnum.EN:
        return "en";
      default:
        return "en";
    }
  }
}
