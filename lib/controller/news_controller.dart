import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/api/dio_helper.dart';
import 'package:newsapp/view/screens/business_screen.dart';
import 'package:newsapp/view/screens/science_screen.dart';
import 'package:newsapp/view/screens/sports_screen.dart';
class NewsController extends GetxController{
  int currentIndex = 0;
  List<dynamic> business=[];
  List<dynamic> science=[];
  List<dynamic> sports=[];
  List<dynamic> search=[];
  bool isLoading=true;
  List<BottomNavigationBarItem> bottomNavBarItems=const [
  BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: "Business"),
  BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
  BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science"),
  ];
  List screens=const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changeIndex(int index){
    currentIndex =index;
    if(currentIndex ==1 &&sports.isEmpty){
      getSports();
    }else if(currentIndex ==2 &&science.isEmpty){
      getScience();
    }
    update();
  }
  void getBusiness(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'e8d0517652d94f789d1e8cf2f4fb02b1',
        }
    ).then((value){
      business=value.data['articles'];
      update();
      isLoading=false;
      print("Get Business Successfully !!!!");
    }).catchError((error){
      print("error while fetching data $error");
    });
  }

  void getSports(){
    DioHelper.getData(url:'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'e8d0517652d94f789d1e8cf2f4fb02b1',
    }
    ).then((value){
      sports=value.data['articles'];
      update();
      print("Get Sports Successfully !!!!");
    }).catchError((error){
      print("error occured $error");
    });
  }
  void getScience(){
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'science',
      'apiKey':'e8d0517652d94f789d1e8cf2f4fb02b1',
    }
    ).then((value){
      science=value.data['articles'];
      update();
      print("Get Science Successfully !!!!");

    }).catchError((error){
      print("error ocured $error");
    });
  }

  void getSearch({required String searchData }){
    search=[];
    DioHelper.getData(url: 'v2/everything', query:{
      'q': searchData,
      'apiKey':'e8d0517652d94f789d1e8cf2f4fb02b1',
    }).then((value){
      search=value.data['articles'];
      update();
      print("Get Search Successfully !!!!");
    }).catchError((error){
      print("error ocured $error");
    });
  }

}

