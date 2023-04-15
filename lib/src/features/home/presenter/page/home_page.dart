import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (pageController.position.pixels >=
              (pageController.position.maxScrollExtent) &&
          !(controller.isLoading) &&
          (controller.tags.tags.isNotEmpty)) {
        controller.fetchNews(tag: controller.tags.tags[tagSelectedIndex]);
      }
    });

    controller = GetIt.I.get<HomeController>();
    controller.fetchNews(tag: controller.tags.tags[0]);
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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_rounded,
                color: Colors.black,
              ))
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
                    itemCount: controller.tags.tags.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tagSelectedIndex = index;
                            });

                            controller.clearAndFetch(
                                tag: controller.tags.tags[index]);
                          },
                          child: Chip(
                            backgroundColor: tagSelectedIndex == index
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            label: Text(
                              controller.tags.tags[index].label,
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
                child: controller.isLoading
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
    );
  }
}
