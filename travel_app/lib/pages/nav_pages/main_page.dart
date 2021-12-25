import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/cubit.dart';
import 'package:travel_app/cubit/state.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/misc/global_functions.dart';
import 'package:travel_app/pages/nav_pages/detail_screen.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  var image = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling'
  };
  @override
  Widget build(BuildContext context) {
//
    return BlocConsumer<TravelCubit, TravelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TravelCubit.get(context);
          var model = TravelCubit.get(context).places;
          TabController tabController = TabController(length: 3, vsync: this);

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: AppLargeText(text: 'Discover')),
                const SizedBox(
                  height: 40.0,
                ),

                // tabBar

                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 20, right: 0),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        controller: tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndecator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: const [
                          Tab(
                            text: 'Places',
                          ),
                          Tab(
                            text: 'Inspiration',
                          ),
                          Tab(
                            text: 'Emotions',
                          ),
                        ]),
                  ),
                ),

                BuildCondition(
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  condition: true,
                  builder: (context) => Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    height: 300.0,
                    width: double.maxFinite,
                    child: TabBarView(controller: tabController, children: [
                      ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              navigateTo(
                                  context,
                                  DetailPage(
                                    name: model[index]['name'],
                                    description: model[index]['description'],
                                    location: model[index]['location'],
                                    stars: model[index]['stars'],
                                    price: model[index]['price'],
                                    selected_people: model[index]
                                        ['selected_people'],
                                    img: model[index]['img'],
                                  ));
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 15.0, top: 10.0),
                              width: 200.0,
                              height: 300.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://mark.bslmeiyu.com/uploads/' +
                                              model[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        },
                      ),
                      Text('There'),
                      Text('Bye'),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Explore More',
                        size: 22,
                      ),
                      AppText(
                        text: 'See All',
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 120.0,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30.0),
                          child: Column(
                            children: [
                              Container(
                                //  margin: const EdgeInsets.only(right: 50.0),
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage('img/' +
                                            image.keys.elementAt(index)),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                child: AppText(
                                  text: image.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}

class CircleTabIndecator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndecator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffSet = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffSet, radius, _paint);
  }
}
