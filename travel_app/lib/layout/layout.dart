import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/cubit.dart';
import 'package:travel_app/cubit/state.dart';

class TravelLayout extends StatelessWidget {
  const TravelLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TravelCubit, TravelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TravelCubit.get(context);
          return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black54,
              unselectedItemColor: Colors.grey.withOpacity(0.5),
              unselectedFontSize: 0,
              selectedFontSize: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0.0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart_sharp), label: 'Bar'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Seatch'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me')
              ],
              onTap: (index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.currentIndex,
            ),
          );
        });
  }
}
