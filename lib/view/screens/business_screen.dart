import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/view/widgets/newsbuilder.dart';
import 'package:newsapp/view/widgets/seperator.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
              itemBuilder: (context, index) => NewsBuilder(
                model: NewsModel(
                  title: controller.business[index]['title'].toString(),
                  publishedAt:
                      controller.business[index]['publishedAt'].toString(),
                  urlToImage:
                      controller.business[index]['urlToImage'].toString(),
                  url: controller.business[index]['url'].toString(),
                ),
              ),
              separatorBuilder: (context, index) => const Separator(),
              itemCount: controller.business.length,
              physics: const BouncingScrollPhysics(),
            ),
          );
        });
  }
}
