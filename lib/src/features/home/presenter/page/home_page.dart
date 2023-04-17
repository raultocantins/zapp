import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zapp/src/features/home/domain/entities/tag_entity.dart';

import '../controllers/home_controller.dart';
import '../widgets/card_page_custom.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = GetIt.I.get<HomeController>();
  PageController pageController = PageController();
  int tagSelectedIndex = 0;
  int pageIndex = 0;
  List<LanguagesEnum> languages = [LanguagesEnum.EN, LanguagesEnum.PT];
  @override
  void initState() {
    super.initState();
    controller.changeTags(Tags().getTags(controller.language));
    pageController.addListener(() {
      if (pageController.position.pixels >=
              (pageController.position.maxScrollExtent) &&
          !(controller.isLoading) &&
          ((controller.tags?.tags ?? []).isNotEmpty)) {
        controller.fetchNews(tag: controller.tags?.tags[tagSelectedIndex]);
      }
    });

    controller = GetIt.I.get<HomeController>();
    controller.fetchNews(tag: controller.tags?.tags[0]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: DropdownButton(
              icon: const Icon(Icons.language),
              items: languages
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.getLabel()),
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                controller.changeLanguage(v ?? controller.language);
              },
              elevation: 1,
              value: controller.language,
            ),
          )
        ],
      ),
      body: Observer(builder: (context) {
        return SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tags?.tags.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tagSelectedIndex = index;
                            });

                            controller.clearAndFetch(
                                tag: controller.tags?.tags[index]);
                          },
                          child: Chip(
                            backgroundColor: tagSelectedIndex == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            label: Text(
                              controller.tags?.tags[index].label ?? "",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: controller.isLoading &&
                        ((controller.news?.news ?? []).isEmpty)
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : SizedBox(
                        height: 950,
                        width: double.infinity,
                        child: PageView.builder(
                          controller: pageController,
                          onPageChanged: (i) {
                            setState(() {
                              pageIndex = i;
                            });
                          },
                          itemCount: controller.news?.news.length ?? 0,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: PageNews(
                                  title:
                                      controller.news?.news[index].title ?? "",
                                  description:
                                      controller.news?.news[index].text ?? "",
                                  image:
                                      controller.news?.news[index].image ?? "",
                                  link: controller.news?.news[index].url ?? "",
                                  publish_date: controller
                                          .news?.news[index].publish_date ??
                                      DateTime.now(),
                                  moreInfo: (link) =>
                                      controller.moreInfoRedirect(link)),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.jumpToPage(pageIndex + 1);
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
