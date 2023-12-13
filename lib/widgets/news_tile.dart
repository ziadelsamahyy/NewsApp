import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  void _launchURL() async {
    final url = articleModel.Url;

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {}
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35),
            ),
            child: GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Image.network(
                articleModel.image ??
                    'https://btckstorage.blob.core.windows.net/site10666/News.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 237, 236),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text(
                  articleModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 24, 24, 24),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  articleModel.subTitle ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 57, 57, 57), fontSize: 14),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
