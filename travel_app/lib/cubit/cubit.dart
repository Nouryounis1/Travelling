import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/state.dart';
import 'package:travel_app/models/places.dart';
import 'package:travel_app/network/end_points/end_points.dart';
import 'package:travel_app/network/remote/dio_helper.dart';
import 'package:travel_app/network/remote/logging.dart';
import 'package:travel_app/pages/nav_pages/bar_item.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/pages/nav_pages/my_page.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelInitalState());
  static TravelCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int selectedIndex = 1;

  Places? palcesModel;

  List<dynamic> places = [];

  List<Widget> bottomScreens = [
    MainPage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(TravelChangeBottomNavState());
  }

  void changeButtonsIndex(int index) {
    selectedIndex = index;
    emit(TravelChangeButtonsIndexState());
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://mark.bslmeiyu.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<Places?> getPlaces() async {
    Places? place;

    try {
      Response userData = await _dio.get('/getplaces');

      //  print('User Info: ${userData.data}');
      places = userData.data;
      print(places[0]['img']);

      // /  place = Places.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return place;
  }
}
