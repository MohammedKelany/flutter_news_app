import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/shared/cache_shared.dart';
import 'package:newsapp/view/screens/search.dart';
import 'package:newsapp/view/widgets/progress_indicator.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News APP"),
        actions: [
          IconButton(onPressed: (){
            Get.to(SearchScreen());
          }, icon:const Icon(Icons.search)),
          IconButton(onPressed: (){
            if(Get.isDarkMode){
              Get.changeThemeMode(ThemeMode.light);
              SharedData.setIsDark(key: "isDark",isDark : false ).then((value){
              });
            }else{
              Get.changeThemeMode(ThemeMode.dark);
              SharedData.setIsDark(key: "isDark",isDark:true ).then((value){
              });
            }
          }, icon:const Icon(Icons.brightness_4_outlined)),
        ],
      ),
      body: GetBuilder<NewsController>(
          init: NewsController()
            ..getBusiness(),
          builder: (controller) {
            return ConditionalBuilder(
              builder: (context) => const CenterProgressIndicator(),
              condition: controller.isLoading,
              fallback: (context) => controller.screens[controller.currentIndex],
            );
          }),
      bottomNavigationBar: GetBuilder<NewsController>(
          init: NewsController(),
          builder: (controller) {
            return BottomNavigationBar(
              items: controller.bottomNavBarItems,
              onTap: (int currentIndex) {
                controller.changeIndex(currentIndex);
              },
              currentIndex: controller.currentIndex,
            );
          }),
    );
  }
}
