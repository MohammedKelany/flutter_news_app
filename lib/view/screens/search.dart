import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/news_controller.dart';
import '../../model/news_model.dart';
import '../widgets/newsbuilder.dart';
import '../widgets/progress_indicator.dart';
import '../widgets/seperator.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchEditing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<NewsController>(
          init: NewsController(),
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchEditing,
                    onChanged: (value) {
                      controller.getSearch(searchData: value);
                    },
                    decoration: const InputDecoration(
                      labelText: "Search",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: controller.search.isNotEmpty,
                    fallback: (context) => const CenterProgressIndicator(),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.separated(
                          itemBuilder: (context, index) => NewsBuilder(
                            model: NewsModel(
                              title:
                                  controller.search[index]['title'].toString(),
                              publishedAt: controller.search[index]
                                      ['publishedAt']
                                  .toString(),
                              urlToImage: controller.search[index]['urlToImage']
                                  .toString(),
                              url: controller.search[index]['url'].toString(),
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const Separator(),
                          itemCount: controller.business.length,
                          physics: const BouncingScrollPhysics(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
