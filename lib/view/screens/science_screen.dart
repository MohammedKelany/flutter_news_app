import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/view/widgets/newsbuilder.dart';
import 'package:newsapp/view/widgets/seperator.dart';

import '../widgets/progress_indicator.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          return ConditionalBuilder(
              condition: controller.science.isNotEmpty,
              fallback: (context) => const CenterProgressIndicator(),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => NewsBuilder(
                      model: NewsModel(
                        title: controller.science[index]['title'].toString(),
                        publishedAt:
                            controller.science[index]['publishedAt'].toString(),
                        urlToImage:
                            controller.science[index]['urlToImage'].toString(),
                        url: controller.science[index]['url'].toString(),
                      ),
                    ),
                    separatorBuilder: (context, index) => const Separator(),
                    itemCount: controller.business.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                );
              });
        });
  }
}
