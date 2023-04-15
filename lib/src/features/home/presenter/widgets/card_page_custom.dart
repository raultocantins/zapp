import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PageNews extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String link;
  final Function(String link) moreInfo;
  const PageNews({
    required this.title,
    required this.description,
    required this.image,
    required this.moreInfo,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 350,
            width: double.infinity,
            child: ClipRRect(
                child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                  Icons.electrical_services_rounded,
                  color: Theme.of(context).colorScheme.secondary),
            ))),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      moreInfo(link);
                    },
                    style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 50)),
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.secondary)),
                    child: const Text(
                      "Ver mais",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
