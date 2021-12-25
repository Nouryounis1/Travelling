import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/cubit.dart';
import 'package:travel_app/layout/layout.dart';
import 'package:travel_app/misc/constants.dart';
import 'package:travel_app/misc/cubit.dart';
import 'package:travel_app/network/cache_helper.dart';
import 'package:travel_app/pages/nav_pages/detail_screen.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/pages/welcome_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  CacheHelper.init();
  Widget? widget;

  if (isSkipped != null) {
    if (isSkipped == true) {
      widget = const TravelLayout();
    } else {
      widget = WelcomeScreen();
    }
  } else {
    widget = WelcomeScreen();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget? startWidget;
  MyApp(
    this.startWidget, {
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TravelCubit()..getPlaces())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Jannah',
        ),
        home: TravelLayout(),
      ),
    );
  }
}
