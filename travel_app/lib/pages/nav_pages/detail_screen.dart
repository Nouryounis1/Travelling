import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/cubit.dart';
import 'package:travel_app/cubit/state.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatelessWidget {
  int gottenStars = 4;

  final String? name;
  final String? description;
  final int? price;
  final int? stars;
  final int? selected_people;
  final String? img;
  final String? location;

  DetailPage(
      {Key? key,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.selected_people,
      this.location,
      this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TravelCubit, TravelStates>(listener: (context, state) {
      var cubit = TravelCubit.get(context);
    }, builder: (context, state) {
      return MaterialApp(
        home: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://mark.bslmeiyu.com/uploads/' + img!),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 70,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    top: 330,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: 500.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                  text: name!,
                                  color: Colors.black54.withOpacity(0.8),
                                ),
                                AppLargeText(
                                  text: '\$  $price!',
                                  color: AppColors.textColor1,
                                  size: 25,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              AppText(
                                text: location!,
                                color: AppColors.textColor1,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                      color: index < stars!.toInt()
                                          ? AppColors.starColor
                                          : AppColors.textColor2);
                                }),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              AppText(
                                text: '($stars.0)',
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          AppLargeText(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8),
                            size: 20.0,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          AppText(
                              text: 'Number of people in your group ',
                              color: AppColors.mainTextColor),
                          SizedBox(
                            height: 10.0,
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: () {
                                  TravelCubit.get(context)
                                      .changeButtonsIndex(index);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: AppButtons(
                                      backgroundColor: TravelCubit.get(context)
                                                  .selectedIndex ==
                                              index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: TravelCubit.get(context)
                                                  .selectedIndex ==
                                              index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      color: TravelCubit.get(context)
                                                  .selectedIndex ==
                                              index
                                          ? Colors.white
                                          : Colors.black,
                                      text: (index + 1).toString(),
                                      size: 50.0),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 20.0),
                          AppLargeText(
                              text: 'Description',
                              color: Colors.black.withOpacity(0.8)),
                          SizedBox(
                            height: 5.0,
                          ),
                          AppText(
                            text: description!,
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 5.0,
                ),
                Positioned(
                    left: 20.0,
                    right: 20.0,
                    bottom: 10.0,
                    child: Row(
                      children: [
                        AppButtons(
                          color: AppColors.textColor2,
                          backgroundColor: Colors.white,
                          size: 60.0,
                          borderColor: AppColors.textColor2,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        ResponsaveButton(
                          isResponsive: true,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
