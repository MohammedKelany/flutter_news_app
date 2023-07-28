import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/view/screens/web_view.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({Key? key, required this.model}) : super(key: key);
  final NewsModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(WebViewScreen(url: model.url));
      },
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                    image: NetworkImage(
                      model.urlToImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Expanded(
                      child: Text(
                        model.title,
                        style:
                          const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      model.publishedAt,
                      style:const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
